{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language PatternSynonyms #-}
{-# language TypeFamilies #-}

module Graphics.Vulkan.Extensions.VK_EXT_debug_report
  ( 
#if defined(VK_USE_PLATFORM_GGP)
  DebugReportCallbackCreateInfoEXT(..)
  , 
#endif
  DebugReportCallbackEXT
  , DebugReportFlagBitsEXT
  , pattern DEBUG_REPORT_INFORMATION_BIT_EXT
  , pattern DEBUG_REPORT_WARNING_BIT_EXT
  , pattern DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT
  , pattern DEBUG_REPORT_ERROR_BIT_EXT
  , pattern DEBUG_REPORT_DEBUG_BIT_EXT
  , DebugReportFlagsEXT
  , DebugReportObjectTypeEXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT
  , pattern DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT
  , createDebugReportCallbackEXT
  , debugReportMessageEXT
  , destroyDebugReportCallbackEXT
  , withDebugReportCallbackEXT
  , pattern EXT_DEBUG_REPORT_EXTENSION_NAME
  , pattern EXT_DEBUG_REPORT_SPEC_VERSION
  , pattern STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
  , pattern STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT
  , pattern ERROR_VALIDATION_FAILED_EXT
  , pattern OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT
  ) where

import Control.Exception
  ( bracket
  )
import Data.ByteString
  ( ByteString
  , useAsCString
  )
import Data.Int
  ( Int32
  )
import Data.String
  ( IsString
  )
import Data.Word
  ( Word64
  )
import Foreign.C.Types
  ( CSize(..)
  )
import Foreign.Marshal.Alloc
  ( alloca
  )
import Foreign.Marshal.Utils
  ( maybeWith
  , with
  )

#if defined(VK_USE_PLATFORM_GGP)
import Foreign.Ptr
  ( Ptr
  , nullPtr
  )
#endif
import Foreign.Storable
  ( peek
  )


import Graphics.Vulkan.C.Core10.Core
  ( VkStructureType(..)
  )

#if defined(VK_USE_PLATFORM_GGP)
import Graphics.Vulkan.C.Core10.Core
  ( Zero(..)
  )
#endif
import Graphics.Vulkan.C.Extensions.VK_EXT_debug_report
  ( VkDebugReportFlagBitsEXT(..)
  , VkDebugReportObjectTypeEXT(..)
  , VkDebugReportCallbackEXT
  , vkCreateDebugReportCallbackEXT
  , vkDebugReportMessageEXT
  , vkDestroyDebugReportCallbackEXT
  , pattern VK_DEBUG_REPORT_DEBUG_BIT_EXT
  , pattern VK_DEBUG_REPORT_ERROR_BIT_EXT
  , pattern VK_DEBUG_REPORT_INFORMATION_BIT_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT
  , pattern VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT
  , pattern VK_DEBUG_REPORT_WARNING_BIT_EXT
  , pattern VK_EXT_DEBUG_REPORT_EXTENSION_NAME
  , pattern VK_EXT_DEBUG_REPORT_SPEC_VERSION
  )

#if defined(VK_USE_PLATFORM_GGP)
import Graphics.Vulkan.C.Extensions.VK_EXT_debug_report
  ( PFN_vkDebugReportCallbackEXT
  )
#endif
import Graphics.Vulkan.C.Extensions.VK_NV_ray_tracing
  ( pattern VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT
  )
import Graphics.Vulkan.Core10.Core
  ( pattern STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT
  )
import Graphics.Vulkan.Core10.DeviceInitialization
  ( AllocationCallbacks(..)
  , Instance(..)
  )

#if defined(VK_USE_PLATFORM_GGP)
import {-# source #-} Graphics.Vulkan.Marshal.SomeVkStruct
  ( SomeVkStruct
  )
#endif
import Graphics.Vulkan.Core10.Core
  ( pattern ERROR_VALIDATION_FAILED_EXT
  , pattern OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT
  )



#if defined(VK_USE_PLATFORM_GGP)

-- No documentation found for TopLevel "VkDebugReportCallbackCreateInfoEXT"
data DebugReportCallbackCreateInfoEXT = DebugReportCallbackCreateInfoEXT
  { -- No documentation found for Nested "DebugReportCallbackCreateInfoEXT" "pNext"
  next :: Maybe SomeVkStruct
  , -- No documentation found for Nested "DebugReportCallbackCreateInfoEXT" "flags"
  flags :: DebugReportFlagsEXT
  , -- No documentation found for Nested "DebugReportCallbackCreateInfoEXT" "pfnCallback"
  pfnCallback :: PFN_vkDebugReportCallbackEXT
  , -- No documentation found for Nested "DebugReportCallbackCreateInfoEXT" "pUserData"
  userData :: Ptr ()
  }
  deriving (Show, Eq)

instance Zero DebugReportCallbackCreateInfoEXT where
  zero = DebugReportCallbackCreateInfoEXT Nothing
                                          zero
                                          zero
                                          nullPtr

#endif

-- No documentation found for TopLevel "DebugReportCallbackEXT"
type DebugReportCallbackEXT = VkDebugReportCallbackEXT

-- No documentation found for TopLevel "DebugReportFlagBitsEXT"
type DebugReportFlagBitsEXT = VkDebugReportFlagBitsEXT


{-# complete DEBUG_REPORT_INFORMATION_BIT_EXT, DEBUG_REPORT_WARNING_BIT_EXT, DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT, DEBUG_REPORT_ERROR_BIT_EXT, DEBUG_REPORT_DEBUG_BIT_EXT :: DebugReportFlagBitsEXT #-}


-- No documentation found for Nested "DebugReportFlagBitsEXT" "DEBUG_REPORT_INFORMATION_BIT_EXT"
pattern DEBUG_REPORT_INFORMATION_BIT_EXT :: (a ~ DebugReportFlagBitsEXT) => a
pattern DEBUG_REPORT_INFORMATION_BIT_EXT = VK_DEBUG_REPORT_INFORMATION_BIT_EXT


-- No documentation found for Nested "DebugReportFlagBitsEXT" "DEBUG_REPORT_WARNING_BIT_EXT"
pattern DEBUG_REPORT_WARNING_BIT_EXT :: (a ~ DebugReportFlagBitsEXT) => a
pattern DEBUG_REPORT_WARNING_BIT_EXT = VK_DEBUG_REPORT_WARNING_BIT_EXT


-- No documentation found for Nested "DebugReportFlagBitsEXT" "DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT"
pattern DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT :: (a ~ DebugReportFlagBitsEXT) => a
pattern DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT = VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT


-- No documentation found for Nested "DebugReportFlagBitsEXT" "DEBUG_REPORT_ERROR_BIT_EXT"
pattern DEBUG_REPORT_ERROR_BIT_EXT :: (a ~ DebugReportFlagBitsEXT) => a
pattern DEBUG_REPORT_ERROR_BIT_EXT = VK_DEBUG_REPORT_ERROR_BIT_EXT


-- No documentation found for Nested "DebugReportFlagBitsEXT" "DEBUG_REPORT_DEBUG_BIT_EXT"
pattern DEBUG_REPORT_DEBUG_BIT_EXT :: (a ~ DebugReportFlagBitsEXT) => a
pattern DEBUG_REPORT_DEBUG_BIT_EXT = VK_DEBUG_REPORT_DEBUG_BIT_EXT

-- No documentation found for TopLevel "DebugReportFlagsEXT"
type DebugReportFlagsEXT = DebugReportFlagBitsEXT

-- No documentation found for TopLevel "DebugReportObjectTypeEXT"
type DebugReportObjectTypeEXT = VkDebugReportObjectTypeEXT


{-# complete DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT, DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT, DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT, DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT, DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT, DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT, DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT, DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT, DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT, DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT, DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT, DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT, DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT, DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT, DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT, DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT, DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT, DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT, DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT, DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT, DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT, DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT, DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT, DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT, DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT, DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT, DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT, DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT, DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT, DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT, DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT, DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT, DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT, DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT, DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT, DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT, DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT, DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT :: DebugReportObjectTypeEXT #-}


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT


-- No documentation found for Nested "DebugReportObjectTypeEXT" "DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT"
pattern DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT :: (a ~ DebugReportObjectTypeEXT) => a
pattern DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT = VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT


-- No documentation found for TopLevel "vkCreateDebugReportCallbackEXT"
createDebugReportCallbackEXT :: Instance ->  DebugReportCallbackCreateInfoEXT ->  Maybe AllocationCallbacks ->  IO (DebugReportCallbackEXT)
createDebugReportCallbackEXT = undefined {- {wrapped (pretty cName) :: Doc ()} -}


-- No documentation found for TopLevel "vkDebugReportMessageEXT"
debugReportMessageEXT :: Instance ->  DebugReportFlagsEXT ->  DebugReportObjectTypeEXT ->  Word64 ->  CSize ->  Int32 ->  ByteString ->  ByteString ->  IO ()
debugReportMessageEXT = undefined {- {wrapped (pretty cName) :: Doc ()} -}


-- No documentation found for TopLevel "vkDestroyDebugReportCallbackEXT"
destroyDebugReportCallbackEXT :: Instance ->  DebugReportCallbackEXT ->  Maybe AllocationCallbacks ->  IO ()
destroyDebugReportCallbackEXT = undefined {- {wrapped (pretty cName) :: Doc ()} -}

-- | A safe wrapper for 'createDebugReportCallbackEXT' and 'destroyDebugReportCallbackEXT' using 'bracket'
--
-- The allocated value must not be returned from the provided computation
withDebugReportCallbackEXT
  :: Instance -> DebugReportCallbackCreateInfoEXT -> Maybe AllocationCallbacks -> (DebugReportCallbackEXT -> IO a) -> IO a
withDebugReportCallbackEXT instance' debugReportCallbackCreateInfoEXT allocationCallbacks = bracket
  (createDebugReportCallbackEXT instance' debugReportCallbackCreateInfoEXT allocationCallbacks)
  (\o -> destroyDebugReportCallbackEXT instance' o allocationCallbacks)

-- No documentation found for TopLevel "VK_EXT_DEBUG_REPORT_EXTENSION_NAME"
pattern EXT_DEBUG_REPORT_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern EXT_DEBUG_REPORT_EXTENSION_NAME = VK_EXT_DEBUG_REPORT_EXTENSION_NAME

-- No documentation found for TopLevel "VK_EXT_DEBUG_REPORT_SPEC_VERSION"
pattern EXT_DEBUG_REPORT_SPEC_VERSION :: Integral a => a
pattern EXT_DEBUG_REPORT_SPEC_VERSION = VK_EXT_DEBUG_REPORT_SPEC_VERSION

-- No documentation found for TopLevel "STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT"
pattern STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT :: VkStructureType
pattern STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT = STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT
