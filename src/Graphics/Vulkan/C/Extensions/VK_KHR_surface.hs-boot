{-# language Strict #-}
{-# language CPP #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}

module Graphics.Vulkan.C.Extensions.VK_KHR_surface
  ( VkColorSpaceKHR
  , VkCompositeAlphaFlagBitsKHR
  , VkCompositeAlphaFlagsKHR
  , VkPresentModeKHR
  , VkSurfaceCapabilitiesKHR
  , VkSurfaceFormatKHR
  , VkSurfaceKHR
  , VkSurfaceTransformFlagBitsKHR
  , VkSurfaceTransformFlagsKHR
  , FN_vkDestroySurfaceKHR
  , PFN_vkDestroySurfaceKHR
  , FN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR
  , PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR
  , FN_vkGetPhysicalDeviceSurfaceFormatsKHR
  , PFN_vkGetPhysicalDeviceSurfaceFormatsKHR
  , FN_vkGetPhysicalDeviceSurfacePresentModesKHR
  , PFN_vkGetPhysicalDeviceSurfacePresentModesKHR
  , FN_vkGetPhysicalDeviceSurfaceSupportKHR
  , PFN_vkGetPhysicalDeviceSurfaceSupportKHR
  ) where

import Data.Word
  ( Word32
  )
import Foreign.Ptr
  ( FunPtr
  , Ptr
  )


import Graphics.Vulkan.NamedType
  ( (:::)
  )
import {-# source #-} Graphics.Vulkan.C.Core10.Core
  ( VkBool32
  , VkResult
  )
import {-# source #-} Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkAllocationCallbacks
  , VkInstance
  , VkPhysicalDevice
  )


data VkColorSpaceKHR

data VkCompositeAlphaFlagBitsKHR

-- No documentation found for TopLevel "VkCompositeAlphaFlagsKHR"
type VkCompositeAlphaFlagsKHR = VkCompositeAlphaFlagBitsKHR

data VkPresentModeKHR

data VkSurfaceCapabilitiesKHR

data VkSurfaceFormatKHR

-- | Dummy data to tag the 'Ptr' with
data VkSurfaceKHR_T
-- No documentation found for TopLevel "VkSurfaceKHR"
type VkSurfaceKHR = Ptr VkSurfaceKHR_T

data VkSurfaceTransformFlagBitsKHR

-- No documentation found for TopLevel "VkSurfaceTransformFlagsKHR"
type VkSurfaceTransformFlagsKHR = VkSurfaceTransformFlagBitsKHR

type FN_vkDestroySurfaceKHR = ("instance" ::: VkInstance) -> ("surface" ::: VkSurfaceKHR) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
type PFN_vkDestroySurfaceKHR = FunPtr FN_vkDestroySurfaceKHR

type FN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilitiesKHR) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR = FunPtr FN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR

type FN_vkGetPhysicalDeviceSurfaceFormatsKHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormatKHR) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfaceFormatsKHR = FunPtr FN_vkGetPhysicalDeviceSurfaceFormatsKHR

type FN_vkGetPhysicalDeviceSurfacePresentModesKHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("surface" ::: VkSurfaceKHR) -> ("pPresentModeCount" ::: Ptr Word32) -> ("pPresentModes" ::: Ptr VkPresentModeKHR) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfacePresentModesKHR = FunPtr FN_vkGetPhysicalDeviceSurfacePresentModesKHR

type FN_vkGetPhysicalDeviceSurfaceSupportKHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("queueFamilyIndex" ::: Word32) -> ("surface" ::: VkSurfaceKHR) -> ("pSupported" ::: Ptr VkBool32) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfaceSupportKHR = FunPtr FN_vkGetPhysicalDeviceSurfaceSupportKHR
