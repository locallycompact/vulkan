{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternGuards     #-}
{-# LANGUAGE PatternSynonyms   #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TupleSections     #-}

module Write.Marshal.Util
  ( isPassAsPointerType
  , writePokes
  , isPassByValue
  , isPassByConstPointer
  , intercalateArrows
  , funName
  , funGetLengthName
  , ptrName
  , dropVk
  , dropPointer
  , unKeyword
  , simpleTypeName
  , isSimpleType
  ) where

import           Control.Arrow                            ((&&&))
import           Control.Bool
import           Control.Category                         ((>>>))
import           Control.Monad
import           Control.Monad.Except
import           Control.Monad.Writer.Strict              hiding ((<>))
import           Data.Bifunctor
import           Data.Foldable
import           Data.Function
import           Data.Functor
import qualified Data.Map                                 as Map
import           Data.Maybe
import           Data.Monoid                              (Endo (..))
import qualified Data.MultiMap                            as MultiMap
import           Data.Text                                (Text)
import qualified Data.Text.Extra                          as T
import           Data.Text.Prettyprint.Doc
import           Prelude                                  hiding (Enum)
import           Text.InterpolatedString.Perl6.Unindented

import           Spec.Savvy.Command
import           Spec.Savvy.Error
import           Spec.Savvy.Type
import qualified Spec.Savvy.Type.Haskell                  as H

import           Write.Element                            hiding (TypeName)
import qualified Write.Element                            as WE
import           Write.Marshal.Monad
import           Write.Struct
import           Write.Util

-- | Is this a type we don't want to marshal
isPassAsPointerType :: Type -> Bool
isPassAsPointerType = \case
  TypeName n
    | n
      `elem` [ "MirConnection"
             , "wl_display"
             , "xcb_connection_t"
             , "AHardwareBuffer"
             , "ANativeWindow"
             ]
    -> True
  _ -> False

writePokes :: Doc () -> [Doc ()] -> WrapM (Doc ())
writePokes ptr ds = do
  let writePoke n d = [qci|pokeElemOff {ptr} {n} {d}|]
  tellImport "Foreign.Storable" "pokeElemOff"
  pure . hsep $ punctuate "*>" (zipWith writePoke [0..] ds)


isPassByValue :: Parameter -> Bool
isPassByValue = pType >>> \case
  Float      -> True
  Void       -> True
  Char       -> True
  Int        -> True
  Ptr _ _    -> False
  Array{}    -> False
  TypeName _ -> True
  Proto _ _  -> False

isPassByConstPointer :: Parameter -> Bool
isPassByConstPointer = \case
  Parameter _ (Ptr Const _) Nothing Nothing -> True
  _ -> False

intercalateArrows :: [Doc ()] -> Doc ()
intercalateArrows = hsep . punctuate (space <> "->" <> space)

funName :: Text -> Text
funName = T.lowerCaseFirst . dropVk

funGetLengthName :: Text -> Text
funGetLengthName =
  ("getNum" <>) . T.dropPrefix' "Get" . dropVk

ptrName :: Text -> Text
ptrName = ("p" <>) . T.upperCaseFirst

dropVk :: Text -> Text
dropVk = T.lowerCaseFirst . T.dropPrefix' "vk"

dropPointer :: Text -> Text
dropPointer = T.lowerCaseFirst . T.dropPrefix' "p"

unKeyword :: Text -> Text
unKeyword t = if t `elem` keywords then t <> "'" else t
  where
    keywords =
      [ "as"
      , "case"
      , "class"
      , "data family"
      , "data instance"
      , "data"
      , "default"
      , "deriving"
      , "do"
      , "else"
      , "family"
      , "forall"
      , "foreign"
      , "hiding"
      , "if"
      , "import"
      , "in"
      , "infix"
      , "infixl"
      , "infixr"
      , "instance"
      , "let"
      , "mdo"
      , "module"
      , "newtype"
      , "of"
      , "proc"
      , "qualified"
      , "rec"
      , "then"
      , "type"
      , "where"
      ]

simpleTypeName :: Type -> Maybe Text
simpleTypeName = \case
  Float      -> pure "Float"
  Void       -> Nothing
  Char       -> pure "CChar"
  Int        -> pure "CInt"
  Ptr _ _    -> Nothing
  Array{}    -> Nothing
  TypeName n -> pure n
  Proto _ _  -> Nothing

isSimpleType :: Type -> Bool
isSimpleType = \case
  Float      -> True
  Void       -> False
  Char       -> True
  Int        -> True
  Ptr _ _    -> False
  Array{}    -> False
  TypeName n -> True
  Proto _ _  -> False
