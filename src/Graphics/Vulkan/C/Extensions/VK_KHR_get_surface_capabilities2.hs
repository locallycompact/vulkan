{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_KHR_get_surface_capabilities2
  ( VkPhysicalDeviceSurfaceInfo2KHR(..)
  , VkSurfaceCapabilities2KHR(..)
  , VkSurfaceFormat2KHR(..)
  , FN_vkGetPhysicalDeviceSurfaceCapabilities2KHR
  , PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR
  , vkGetPhysicalDeviceSurfaceCapabilities2KHR
  , FN_vkGetPhysicalDeviceSurfaceFormats2KHR
  , PFN_vkGetPhysicalDeviceSurfaceFormats2KHR
  , vkGetPhysicalDeviceSurfaceFormats2KHR
  , pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME
  , pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR
  , pattern VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR
  , pattern VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR
  ) where

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


import Graphics.Vulkan.C.Core10.Core
  ( VkResult(..)
  , VkStructureType(..)
  , Zero(..)
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkPhysicalDevice
  )
import Graphics.Vulkan.C.Dynamic
  ( InstanceCmds(..)
  )
import Graphics.Vulkan.C.Extensions.VK_KHR_surface
  ( VkSurfaceCapabilitiesKHR(..)
  , VkSurfaceFormatKHR(..)
  , VkSurfaceKHR
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- No documentation found for TopLevel "VkPhysicalDeviceSurfaceInfo2KHR"
data VkPhysicalDeviceSurfaceInfo2KHR = VkPhysicalDeviceSurfaceInfo2KHR
  { -- No documentation found for Nested "VkPhysicalDeviceSurfaceInfo2KHR" "sType"
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkPhysicalDeviceSurfaceInfo2KHR" "pNext"
  vkPNext :: Ptr ()
  , -- No documentation found for Nested "VkPhysicalDeviceSurfaceInfo2KHR" "surface"
  vkSurface :: VkSurfaceKHR
  }
  deriving (Eq, Show)

instance Storable VkPhysicalDeviceSurfaceInfo2KHR where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkPhysicalDeviceSurfaceInfo2KHR <$> peek (ptr `plusPtr` 0)
                                             <*> peek (ptr `plusPtr` 8)
                                             <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkPhysicalDeviceSurfaceInfo2KHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkPhysicalDeviceSurfaceInfo2KHR))
                *> poke (ptr `plusPtr` 16) (vkSurface (poked :: VkPhysicalDeviceSurfaceInfo2KHR))

instance Zero VkPhysicalDeviceSurfaceInfo2KHR where
  zero = VkPhysicalDeviceSurfaceInfo2KHR VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR
                                         zero
                                         zero

-- No documentation found for TopLevel "VkSurfaceCapabilities2KHR"
data VkSurfaceCapabilities2KHR = VkSurfaceCapabilities2KHR
  { -- No documentation found for Nested "VkSurfaceCapabilities2KHR" "sType"
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkSurfaceCapabilities2KHR" "pNext"
  vkPNext :: Ptr ()
  , -- No documentation found for Nested "VkSurfaceCapabilities2KHR" "surfaceCapabilities"
  vkSurfaceCapabilities :: VkSurfaceCapabilitiesKHR
  }
  deriving (Eq, Show)

instance Storable VkSurfaceCapabilities2KHR where
  sizeOf ~_ = 72
  alignment ~_ = 8
  peek ptr = VkSurfaceCapabilities2KHR <$> peek (ptr `plusPtr` 0)
                                       <*> peek (ptr `plusPtr` 8)
                                       <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkSurfaceCapabilities2KHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkSurfaceCapabilities2KHR))
                *> poke (ptr `plusPtr` 16) (vkSurfaceCapabilities (poked :: VkSurfaceCapabilities2KHR))

instance Zero VkSurfaceCapabilities2KHR where
  zero = VkSurfaceCapabilities2KHR VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR
                                   zero
                                   zero

-- No documentation found for TopLevel "VkSurfaceFormat2KHR"
data VkSurfaceFormat2KHR = VkSurfaceFormat2KHR
  { -- No documentation found for Nested "VkSurfaceFormat2KHR" "sType"
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkSurfaceFormat2KHR" "pNext"
  vkPNext :: Ptr ()
  , -- No documentation found for Nested "VkSurfaceFormat2KHR" "surfaceFormat"
  vkSurfaceFormat :: VkSurfaceFormatKHR
  }
  deriving (Eq, Show)

instance Storable VkSurfaceFormat2KHR where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkSurfaceFormat2KHR <$> peek (ptr `plusPtr` 0)
                                 <*> peek (ptr `plusPtr` 8)
                                 <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkSurfaceFormat2KHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkSurfaceFormat2KHR))
                *> poke (ptr `plusPtr` 16) (vkSurfaceFormat (poked :: VkSurfaceFormat2KHR))

instance Zero VkSurfaceFormat2KHR where
  zero = VkSurfaceFormat2KHR VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR
                             zero
                             zero

-- No documentation found for TopLevel "vkGetPhysicalDeviceSurfaceCapabilities2KHR"
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDeviceSurfaceCapabilities2KHR" vkGetPhysicalDeviceSurfaceCapabilities2KHR :: ("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilities2KHR) -> IO VkResult
#else
vkGetPhysicalDeviceSurfaceCapabilities2KHR :: InstanceCmds -> ("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilities2KHR) -> IO VkResult
vkGetPhysicalDeviceSurfaceCapabilities2KHR deviceCmds = mkVkGetPhysicalDeviceSurfaceCapabilities2KHR (pVkGetPhysicalDeviceSurfaceCapabilities2KHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceSurfaceCapabilities2KHR
  :: FunPtr (("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilities2KHR) -> IO VkResult) -> (("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilities2KHR) -> IO VkResult)
#endif

type FN_vkGetPhysicalDeviceSurfaceCapabilities2KHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilities2KHR) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR = FunPtr FN_vkGetPhysicalDeviceSurfaceCapabilities2KHR

-- No documentation found for TopLevel "vkGetPhysicalDeviceSurfaceFormats2KHR"
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDeviceSurfaceFormats2KHR" vkGetPhysicalDeviceSurfaceFormats2KHR :: ("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormat2KHR) -> IO VkResult
#else
vkGetPhysicalDeviceSurfaceFormats2KHR :: InstanceCmds -> ("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormat2KHR) -> IO VkResult
vkGetPhysicalDeviceSurfaceFormats2KHR deviceCmds = mkVkGetPhysicalDeviceSurfaceFormats2KHR (pVkGetPhysicalDeviceSurfaceFormats2KHR deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceSurfaceFormats2KHR
  :: FunPtr (("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormat2KHR) -> IO VkResult) -> (("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormat2KHR) -> IO VkResult)
#endif

type FN_vkGetPhysicalDeviceSurfaceFormats2KHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormat2KHR) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfaceFormats2KHR = FunPtr FN_vkGetPhysicalDeviceSurfaceFormats2KHR

-- No documentation found for TopLevel "VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME"
pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME = "VK_KHR_get_surface_capabilities2"

-- No documentation found for TopLevel "VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION"
pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION :: Integral a => a
pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION = 1

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR"
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR = VkStructureType 1000119000

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR"
pattern VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR = VkStructureType 1000119001

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR"
pattern VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR = VkStructureType 1000119002
