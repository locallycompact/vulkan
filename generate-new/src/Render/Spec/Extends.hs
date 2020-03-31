{-# language QuasiQuotes #-}
module Render.Spec.Extends
  ( structExtends
  ) where

import           Relude                  hiding ( Reader
                                                , Enum
                                                , ask
                                                , Text
                                                )
import           Polysemy
import           Polysemy.Reader
import           Data.Text.Prettyprint.Doc
import           Text.InterpolatedString.Perl6.Unindented
import qualified Data.Vector.Extra             as V

import           Control.Monad.Trans.Cont       ( ContT
                                                , evalContT
                                                )
import           Foreign.Ptr
import           Foreign.Storable
import           GHC.TypeLits
import           GHC.IO.Exception
import           Control.Exception              ( throwIO )
import           Type.Reflection

import           Error
import           CType
import           Render.Element
import           Spec.Types
import           Render.SpecInfo
import           Haskell

structExtends
  :: forall r
   . (HasErr r, HasRenderParams r, HasSpecInfo r)
  => Spec
  -> Sem r RenderElement
structExtends spec = genRe "Extends type family" $ do
  tellExplicitModule (ModName "Graphics.Vulkan.CStruct.Extends")
  tellNotReexportable
  typeFamily spec
  classes spec

typeFamily
  :: forall r
   . (HasErr r, HasRenderParams r, HasSpecInfo r, HasRenderElem r)
  => Spec
  -> Sem r ()
typeFamily Spec {..} = do
  RenderParams {..} <- ask
  tellExport (EType (TyConName "Extends"))
  tellImport ''Relude.Type
  tellImport ''TypeError
  tellImport ''Constraint
  tellImportWithAll ''ErrorMessage
  cases <-
    fmap (fmap snd . sortOn fst . concat)
    $ forV (toList specStructs)
    $ \child -> do
        let cName = mkTyName (sName child)
        cTyDoc <- if V.null (sExtendedBy child)
          then renderTypeHighPrecSource (ConT (typeName cName))
          else renderTypeHighPrecSource (ConT (typeName cName) :@ PromotedNilT)
        forV (toList (sExtends child)) $ \parent -> do
          let pName = mkTyName parent
          tellSourceImport pName
          pTyDoc <- renderTypeHighPrecSource (ConT (typeName pName))
          pure (parent, "Extends" <+> pTyDoc <+> cTyDoc <+> "= ()")
  tellDoc
    $ "type family Extends (a :: [Type] -> Type) (b :: Type) :: Constraint where"
    <> line
    <> indent
         2
         (vsep
           (cases
           <> [ "Extends a b = TypeError (ShowType a :<>: Text \" is not extended by \" :<>: ShowType b)"
              ]
           )
         )

classes
  :: forall r
   . (HasErr r, HasRenderParams r, HasSpecInfo r, HasRenderElem r)
  => Spec
  -> Sem r ()
classes Spec {..} = do
  RenderParams {..} <- ask
  tellExport (EClass (TyConName "PeekChain"))
  tellExport (EClass (TyConName "PokeChain"))
  tellExport (EType (TyConName "Chain"))
  tellExport (EType (TyConName "Extendss"))
  tellExport (EData (TyConName "SomeStruct"))
  tellExport (ETerm (TermName "withSomeCStruct"))
  tellExport (ETerm (TermName "peekSomeCStruct"))
  tellExport (ETerm (TermName "pokeSomeCStruct"))
  tellExport (ETerm (TermName "forgetExtensions"))
  tellExport (EClass (TyConName "Extensible"))
  tellImport (TyConName "Extends")
  tellImportWithAll (TyConName "ToCStruct")
  tellImportWithAll (TyConName "FromCStruct")
  tellImportWithAll (TyConName "Zero")
  tellImport ''Relude.Type
  tellImportWith ''Proxy 'Proxy
  tellImport ''Constraint
  tellImport ''Ptr
  tellImport 'nullPtr
  tellImport 'castPtr
  tellImport 'plusPtr
  tellImport 'evalContT
  tellImport 'lift
  tellImport 'join
  tellImportWithAll ''ContT
  tellImportWith ''Storable 'peek
  tellImportWith ''Storable 'poke
  tellImport 'throwIO
  tellImportWithAll ''IOException
  tellImportWithAll ''IOErrorType
  tellImport 'typeRep
  tellImport 'fromMaybe
  peekChainCases <- fmap (V.mapMaybe id) . forV specStructs $ \Struct {..} ->
    if V.null sExtends
      then pure Nothing
      else Just <$> case sMembers V.!? 0 of
        Just (StructMember "sType" (TypeName "VkStructureType") vals _ _ _) ->
          -- GHC complains if this match is inline...
          case vals of
            V.Singleton typeEnum -> do
              let n = mkTyName sName
              tDoc <- renderTypeHighPrecSource $ if V.null sExtendedBy
                then ConT (typeName n)
                else ConT (typeName n) :@ PromotedNilT
              tellImportWithAll (mkTyName "VkStructureType")
              tellSourceImport n
              pure
                $   pretty (mkConName "VkStructureType" (CName typeEnum))
                <+> "-> go @"
                <>  tDoc
            _ -> throw "Multiple values for sType"
        _ -> throw $ "Unable to find sType member in " <> show sName
  tellBoot $ do
    tellExport (EType (TyConName "PeekChain"))
    tellExport (EType (TyConName "PokeChain"))
    tellExport (EType (TyConName "Chain"))
    tellImport ''Relude.Type
    tellDoc [qqi|
      class PeekChain (xs :: [Type])
      class PokeChain (xs :: [Type])
      type family Chain (xs :: [a]) = (r :: a) | r -> xs where
        Chain '[]    = ()
        Chain (x:xs) = (x, Chain xs)
    |]
  tellDoc [qqi|
    data SomeStruct (a :: [Type] -> Type) where
      SomeStruct
        :: forall a es
         . (Extendss a es, PokeChain es, Show (Chain es))
        => a es
        -> SomeStruct a

    deriving instance (forall es. Show (Chain es) => Show (a es)) => Show (SomeStruct a)

    instance Zero (a '[]) => Zero (SomeStruct a) where
      zero = SomeStruct (zero :: a '[])

    forgetExtensions :: Ptr (a es) -> Ptr (SomeStruct a)
    forgetExtensions = castPtr

    withSomeCStruct
      :: forall a b
       . (forall es . PokeChain es => ToCStruct (a es))
      => SomeStruct a
      -> (forall es . (Extendss a es, PokeChain es) => Ptr (a es) -> IO b)
      -> IO b
    withSomeCStruct (SomeStruct s) f = withCStruct s f

    pokeSomeCStruct
      :: (forall es . PokeChain es => ToCStruct (a es))
      => Ptr (SomeStruct a)
      -> SomeStruct a
      -> IO b
      -> IO b
    pokeSomeCStruct p (SomeStruct s) = pokeCStruct (castPtr p) s

    peekSomeCStruct
      :: forall a
       . (Extensible a, forall es . (Extendss a es, PeekChain es) => FromCStruct (a es))
      => Ptr (SomeStruct a)
      -> IO (SomeStruct a)
    peekSomeCStruct p = do
      head'  <- peekCStruct (castPtr @_ @(a '[]) p)
      pNext <- peek @(Ptr BaseOutStructure) (p `plusPtr` 8)
      peekSomeChain @a pNext $ \\tail' -> SomeStruct (setNext head' tail')

    peekSomeChain
      :: forall
           a
           b
       . (Extensible a)
      => Ptr BaseOutStructure
      -> (  forall es
          . (Extendss a es, PokeChain es, Show (Chain es))
         => Chain es
         -> b
         )
      -> IO b
    peekSomeChain p c = if p == nullPtr
      then pure (c ())
      else do
        baseOut <- peek p
        join
          $ peekChainHead @a (sType (baseOut :: BaseOutStructure))
                             (castPtr @BaseOutStructure @() p)
          $ \\head' -> peekSomeChain @a (next (baseOut :: BaseOutStructure))
                                      (\\tail' -> c (head', tail'))


    peekChainHead
      :: forall a b
       . Extensible a
      => StructureType
      -> Ptr ()
      -> (forall e . (Extends a e, ToCStruct e, Show e) => e -> b)
      -> IO b
    peekChainHead ty p c = case ty of
    {indent 2 (vsep (toList peekChainCases))}
      t -> throwIO $ IOError Nothing InvalidArgument "peekChainHead" ("Unrecognized struct type: " <> show t) Nothing Nothing
     where
      go :: forall e . (Typeable e, FromCStruct e, ToCStruct e, Show e) => IO b
      go =
        let r = extends @a @e Proxy $ do
              head' <- peekCStruct @e (castPtr p)
              pure $ c head'
        in  fromMaybe
              (throwIO $ IOError
                Nothing
                InvalidArgument
                "peekChainHead"
                (  "Illegal struct extension of "
                <> show (extensibleType @a)
                <> " with "
                <> show ty
                )
                Nothing
                Nothing
              )
              r

    class Extensible (a :: [Type] -> Type) where
      extensibleType :: StructureType
      getNext :: a es -> Chain es
      setNext :: a ds -> Chain es -> a es
      extends :: forall e b proxy. Typeable e => proxy e -> (Extends a e => b) -> Maybe b

    type family Chain (xs :: [a]) = (r :: a) | r -> xs where
      Chain '[]    = ()
      Chain (x:xs) = (x, Chain xs)

    type family Extendss (p :: [Type] -> Type) (xs :: [Type]) :: Constraint where
      Extendss p '[]      = ()
      Extendss p (x : xs) = (Extends p x, Extendss p xs)

    class PokeChain es where
      withChain :: Chain es -> (Ptr (Chain es) -> IO a) -> IO a
      withZeroChain :: (Ptr (Chain es) -> IO a) -> IO a

    instance PokeChain '[] where
      withChain () f = f nullPtr
      withZeroChain f = f nullPtr

    instance (ToCStruct e, PokeChain es) => PokeChain (e:es) where
      withChain (e, es) f = evalContT $ do
        t <- ContT $ withChain es
        h <- ContT $ withCStruct e
        lift $ linkChain h t
        lift $ f (castPtr h)
      withZeroChain f = evalContT $ do
        t <- ContT $ withZeroChain @es
        h <- ContT $ withZeroCStruct @e
        lift $ linkChain h t
        lift $ f (castPtr h)

    class PeekChain es where
      peekChain :: Ptr (Chain es) -> IO (Chain es)

    instance PeekChain '[] where
      peekChain _ = pure ()

    instance (FromCStruct e, PeekChain es) => PeekChain (e:es) where
      peekChain p = do
        h <- peekCStruct @e (castPtr p)
        tPtr <- peek (p `plusPtr` 8)
        t <- peekChain tPtr
        pure (h, t)

    linkChain :: Ptr a -> Ptr b -> IO ()
    linkChain head' tail' = poke (head' `plusPtr` 8) tail'
  |]