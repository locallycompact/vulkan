{-# language Strict #-}
{-# language CPP #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language DuplicateRecordFields #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_KHR_win32_surface
  ( HINSTANCE
  , HWND
  , VkWin32SurfaceCreateFlagsKHR(..)
  , VkWin32SurfaceCreateInfoKHR(..)
  , FN_vkCreateWin32SurfaceKHR
  , PFN_vkCreateWin32SurfaceKHR
  , vkCreateWin32SurfaceKHR
  , FN_vkGetPhysicalDeviceWin32PresentationSupportKHR
  , PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR
  , vkGetPhysicalDeviceWin32PresentationSupportKHR
  , pattern VK_KHR_WIN32_SURFACE_EXTENSION_NAME
  , pattern VK_KHR_WIN32_SURFACE_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR
  ) where

import Data.Bits
  ( Bits
  , FiniteBits
  )
import Data.String
  ( IsString
  )
import Data.Word
  ( Word32
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
  ( VkBool32(..)
  , VkResult(..)
  , VkStructureType(..)
  , Zero(..)
  , VkFlags
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkAllocationCallbacks(..)
  , VkInstance
  , VkPhysicalDevice
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


-- No documentation found for TopLevel "HINSTANCE"
type HINSTANCE = Ptr ()
  

-- No documentation found for TopLevel "HWND"
type HWND = Ptr ()
  

-- ** VkWin32SurfaceCreateFlagsKHR

-- No documentation found for TopLevel "VkWin32SurfaceCreateFlagsKHR"
newtype VkWin32SurfaceCreateFlagsKHR = VkWin32SurfaceCreateFlagsKHR VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkWin32SurfaceCreateFlagsKHR where
  
  showsPrec p (VkWin32SurfaceCreateFlagsKHR x) = showParen (p >= 11) (showString "VkWin32SurfaceCreateFlagsKHR " . showsPrec 11 x)

instance Read VkWin32SurfaceCreateFlagsKHR where
  readPrec = parens ( choose [ 
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkWin32SurfaceCreateFlagsKHR")
                        v <- step readPrec
                        pure (VkWin32SurfaceCreateFlagsKHR v)
                        )
                    )



-- No documentation found for TopLevel "VkWin32SurfaceCreateInfoKHR"
data VkWin32SurfaceCreateInfoKHR = VkWin32SurfaceCreateInfoKHR
  { -- No documentation found for Nested "VkWin32SurfaceCreateInfoKHR" "sType"
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkWin32SurfaceCreateInfoKHR" "pNext"
  vkPNext :: Ptr ()
  , -- No documentation found for Nested "VkWin32SurfaceCreateInfoKHR" "flags"
  vkFlags :: VkWin32SurfaceCreateFlagsKHR
  , -- No documentation found for Nested "VkWin32SurfaceCreateInfoKHR" "hinstance"
  vkHinstance :: HINSTANCE
  , -- No documentation found for Nested "VkWin32SurfaceCreateInfoKHR" "hwnd"
  vkHwnd :: HWND
  }
  deriving (Eq, Show)

instance Storable VkWin32SurfaceCreateInfoKHR where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek ptr = VkWin32SurfaceCreateInfoKHR <$> peek (ptr `plusPtr` 0)
                                         <*> peek (ptr `plusPtr` 8)
                                         <*> peek (ptr `plusPtr` 16)
                                         <*> peek (ptr `plusPtr` 24)
                                         <*> peek (ptr `plusPtr` 32)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkWin32SurfaceCreateInfoKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkWin32SurfaceCreateInfoKHR))
                *> poke (ptr `plusPtr` 16) (vkFlags (poked :: VkWin32SurfaceCreateInfoKHR))
                *> poke (ptr `plusPtr` 24) (vkHinstance (poked :: VkWin32SurfaceCreateInfoKHR))
                *> poke (ptr `plusPtr` 32) (vkHwnd (poked :: VkWin32SurfaceCreateInfoKHR))

instance Zero VkWin32SurfaceCreateInfoKHR where
  zero = VkWin32SurfaceCreateInfoKHR VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR
                                     zero
                                     zero
                                     zero
                                     zero

-- No documentation found for TopLevel "vkCreateWin32SurfaceKHR"
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCreateWin32SurfaceKHR" vkCreateWin32SurfaceKHR :: ("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkWin32SurfaceCreateInfoKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSurface" ::: Ptr VkSurfaceKHR) -> IO VkResult
#else
vkCreateWin32SurfaceKHR :: InstanceCmds -> ("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkWin32SurfaceCreateInfoKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSurface" ::: Ptr VkSurfaceKHR) -> IO VkResult
vkCreateWin32SurfaceKHR deviceCmds = mkVkCreateWin32SurfaceKHR (pVkCreateWin32SurfaceKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateWin32SurfaceKHR
  :: FunPtr (("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkWin32SurfaceCreateInfoKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSurface" ::: Ptr VkSurfaceKHR) -> IO VkResult) -> (("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkWin32SurfaceCreateInfoKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSurface" ::: Ptr VkSurfaceKHR) -> IO VkResult)
#endif

type FN_vkCreateWin32SurfaceKHR = ("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkWin32SurfaceCreateInfoKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pSurface" ::: Ptr VkSurfaceKHR) -> IO VkResult
type PFN_vkCreateWin32SurfaceKHR = FunPtr FN_vkCreateWin32SurfaceKHR

-- No documentation found for TopLevel "vkGetPhysicalDeviceWin32PresentationSupportKHR"
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDeviceWin32PresentationSupportKHR" vkGetPhysicalDeviceWin32PresentationSupportKHR :: ("physicalDevice" ::: VkPhysicalDevice) -> ("queueFamilyIndex" ::: Word32) -> IO VkBool32
#else
vkGetPhysicalDeviceWin32PresentationSupportKHR :: InstanceCmds -> ("physicalDevice" ::: VkPhysicalDevice) -> ("queueFamilyIndex" ::: Word32) -> IO VkBool32
vkGetPhysicalDeviceWin32PresentationSupportKHR deviceCmds = mkVkGetPhysicalDeviceWin32PresentationSupportKHR (pVkGetPhysicalDeviceWin32PresentationSupportKHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceWin32PresentationSupportKHR
  :: FunPtr (("physicalDevice" ::: VkPhysicalDevice) -> ("queueFamilyIndex" ::: Word32) -> IO VkBool32) -> (("physicalDevice" ::: VkPhysicalDevice) -> ("queueFamilyIndex" ::: Word32) -> IO VkBool32)
#endif

type FN_vkGetPhysicalDeviceWin32PresentationSupportKHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("queueFamilyIndex" ::: Word32) -> IO VkBool32
type PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR = FunPtr FN_vkGetPhysicalDeviceWin32PresentationSupportKHR

-- No documentation found for TopLevel "VK_KHR_WIN32_SURFACE_EXTENSION_NAME"
pattern VK_KHR_WIN32_SURFACE_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern VK_KHR_WIN32_SURFACE_EXTENSION_NAME = "VK_KHR_win32_surface"

-- No documentation found for TopLevel "VK_KHR_WIN32_SURFACE_SPEC_VERSION"
pattern VK_KHR_WIN32_SURFACE_SPEC_VERSION :: Integral a => a
pattern VK_KHR_WIN32_SURFACE_SPEC_VERSION = 6

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR"
pattern VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR = VkStructureType 1000009000
