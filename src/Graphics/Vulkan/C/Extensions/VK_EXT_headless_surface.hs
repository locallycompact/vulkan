{-# language Strict #-}
{-# language CPP #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language DuplicateRecordFields #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_EXT_headless_surface
  ( VkHeadlessSurfaceCreateFlagsEXT(..)
  , VkHeadlessSurfaceCreateInfoEXT(..)
  , FN_vkCreateHeadlessSurfaceEXT
  , PFN_vkCreateHeadlessSurfaceEXT
  , vkCreateHeadlessSurfaceEXT
  , pattern VK_EXT_HEADLESS_SURFACE_EXTENSION_NAME
  , pattern VK_EXT_HEADLESS_SURFACE_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT
  ) where

import Data.Bits
  ( Bits
  , FiniteBits
  )
import Data.String
  ( IsString
  )
import Foreign.Ptr
  ( FunPtr
  , Ptr
  , plusPtr
  )
import Foreign.Storable
  ( Storable
  , Storable(..)
  )
import GHC.Read
  ( choose
  , expectP
  )
import Text.ParserCombinators.ReadPrec
  ( (+++)
  , prec
  , step
  )
import Text.Read
  ( Read(..)
  , parens
  )
import Text.Read.Lex
  ( Lexeme(Ident)
  )


import Graphics.Vulkan.C.Core10.Core
  ( VkResult(..)
  , VkStructureType(..)
  , Zero(..)
  , VkFlags
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkAllocationCallbacks(..)
  , VkInstance
  )
import Graphics.Vulkan.C.Dynamic
  ( InstanceCmds(..)
  )
import Graphics.Vulkan.C.Extensions.VK_KHR_surface
  ( VkSurfaceKHR
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- ** VkHeadlessSurfaceCreateFlagsEXT

-- No documentation found for TopLevel "VkHeadlessSurfaceCreateFlagsEXT"
newtype VkHeadlessSurfaceCreateFlagsEXT = VkHeadlessSurfaceCreateFlagsEXT VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkHeadlessSurfaceCreateFlagsEXT where
  
  showsPrec p (VkHeadlessSurfaceCreateFlagsEXT x) = showParen (p >= 11) (showString "VkHeadlessSurfaceCreateFlagsEXT " . showsPrec 11 x)

instance Read VkHeadlessSurfaceCreateFlagsEXT where
  readPrec = parens ( choose [ 
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkHeadlessSurfaceCreateFlagsEXT")
                        v <- step readPrec
                        pure (VkHeadlessSurfaceCreateFlagsEXT v)
                        )
                    )



-- No documentation found for TopLevel "VkHeadlessSurfaceCreateInfoEXT"
data VkHeadlessSurfaceCreateInfoEXT = VkHeadlessSurfaceCreateInfoEXT
  { -- No documentation found for Nested "VkHeadlessSurfaceCreateInfoEXT" "sType"
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkHeadlessSurfaceCreateInfoEXT" "pNext"
  vkPNext :: Ptr ()
  , -- No documentation found for Nested "VkHeadlessSurfaceCreateInfoEXT" "flags"
  vkFlags :: VkHeadlessSurfaceCreateFlagsEXT
  }
  deriving (Eq, Show)

instance Storable VkHeadlessSurfaceCreateInfoEXT where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkHeadlessSurfaceCreateInfoEXT <$> peek (ptr `plusPtr` 0)
                                            <*> peek (ptr `plusPtr` 8)
                                            <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkHeadlessSurfaceCreateInfoEXT))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkHeadlessSurfaceCreateInfoEXT))
                *> poke (ptr `plusPtr` 16) (vkFlags (poked :: VkHeadlessSurfaceCreateInfoEXT))

instance Zero VkHeadlessSurfaceCreateInfoEXT where
  zero = VkHeadlessSurfaceCreateInfoEXT VK_STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT
                                        zero
                                        zero

-- No documentation found for TopLevel "vkCreateHeadlessSurfaceEXT"
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCreateHeadlessSurfaceEXT" vkCreateHeadlessSurfaceEXT :: ("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkHeadlessSurfaceCreateInfoEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSurface" ::: Ptr VkSurfaceKHR) -> IO VkResult
#else
vkCreateHeadlessSurfaceEXT :: InstanceCmds -> ("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkHeadlessSurfaceCreateInfoEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSurface" ::: Ptr VkSurfaceKHR) -> IO VkResult
vkCreateHeadlessSurfaceEXT deviceCmds = mkVkCreateHeadlessSurfaceEXT (pVkCreateHeadlessSurfaceEXT deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateHeadlessSurfaceEXT
  :: FunPtr (("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkHeadlessSurfaceCreateInfoEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSurface" ::: Ptr VkSurfaceKHR) -> IO VkResult) -> (("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkHeadlessSurfaceCreateInfoEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSurface" ::: Ptr VkSurfaceKHR) -> IO VkResult)
#endif

type FN_vkCreateHeadlessSurfaceEXT = ("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkHeadlessSurfaceCreateInfoEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSurface" ::: Ptr VkSurfaceKHR) -> IO VkResult
type PFN_vkCreateHeadlessSurfaceEXT = FunPtr FN_vkCreateHeadlessSurfaceEXT

-- No documentation found for TopLevel "VK_EXT_HEADLESS_SURFACE_EXTENSION_NAME"
pattern VK_EXT_HEADLESS_SURFACE_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern VK_EXT_HEADLESS_SURFACE_EXTENSION_NAME = "VK_EXT_headless_surface"

-- No documentation found for TopLevel "VK_EXT_HEADLESS_SURFACE_SPEC_VERSION"
pattern VK_EXT_HEADLESS_SURFACE_SPEC_VERSION :: Integral a => a
pattern VK_EXT_HEADLESS_SURFACE_SPEC_VERSION = 0

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT"
pattern VK_STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT :: VkStructureType
pattern VK_STRUCTURE_TYPE_HEADLESS_SURFACE_CREATE_INFO_EXT = VkStructureType 1000256000
