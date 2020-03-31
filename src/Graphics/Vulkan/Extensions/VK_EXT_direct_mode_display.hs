{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_EXT_direct_mode_display  ( releaseDisplayEXT
                                                              , EXT_DIRECT_MODE_DISPLAY_SPEC_VERSION
                                                              , pattern EXT_DIRECT_MODE_DISPLAY_SPEC_VERSION
                                                              , EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME
                                                              , pattern EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME
                                                              , DisplayKHR(..)
                                                              ) where

import Data.String (IsString)
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import Graphics.Vulkan.Extensions.Handles (DisplayKHR)
import Graphics.Vulkan.Extensions.Handles (DisplayKHR(..))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkReleaseDisplayEXT))
import Graphics.Vulkan.Core10.Handles (PhysicalDevice)
import Graphics.Vulkan.Core10.Handles (PhysicalDevice(..))
import Graphics.Vulkan.Core10.Handles (PhysicalDevice_T)
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Extensions.Handles (DisplayKHR(..))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkReleaseDisplayEXT
  :: FunPtr (Ptr PhysicalDevice_T -> DisplayKHR -> IO Result) -> Ptr PhysicalDevice_T -> DisplayKHR -> IO Result

-- | vkReleaseDisplayEXT - Release access to an acquired VkDisplayKHR
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' The physical device
--     the display is on.
--
-- -   'Graphics.Vulkan.Extensions.WSITypes.Display' The display to release
--     control of.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.Handles.DisplayKHR',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
releaseDisplayEXT :: PhysicalDevice -> DisplayKHR -> IO ()
releaseDisplayEXT physicalDevice display = do
  let vkReleaseDisplayEXT' = mkVkReleaseDisplayEXT (pVkReleaseDisplayEXT (instanceCmds (physicalDevice :: PhysicalDevice)))
  _ <- vkReleaseDisplayEXT' (physicalDeviceHandle (physicalDevice)) (display)
  pure $ ()


type EXT_DIRECT_MODE_DISPLAY_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_EXT_DIRECT_MODE_DISPLAY_SPEC_VERSION"
pattern EXT_DIRECT_MODE_DISPLAY_SPEC_VERSION :: forall a . Integral a => a
pattern EXT_DIRECT_MODE_DISPLAY_SPEC_VERSION = 1


type EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME = "VK_EXT_direct_mode_display"

-- No documentation found for TopLevel "VK_EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME"
pattern EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME = "VK_EXT_direct_mode_display"
