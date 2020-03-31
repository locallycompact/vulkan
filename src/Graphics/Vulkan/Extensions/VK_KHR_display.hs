{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_KHR_display  ( getPhysicalDeviceDisplayPropertiesKHR
                                                  , getPhysicalDeviceDisplayPlanePropertiesKHR
                                                  , getDisplayPlaneSupportedDisplaysKHR
                                                  , getDisplayModePropertiesKHR
                                                  , createDisplayModeKHR
                                                  , getDisplayPlaneCapabilitiesKHR
                                                  , createDisplayPlaneSurfaceKHR
                                                  , DisplayPropertiesKHR(..)
                                                  , DisplayPlanePropertiesKHR(..)
                                                  , DisplayModeParametersKHR(..)
                                                  , DisplayModePropertiesKHR(..)
                                                  , DisplayModeCreateInfoKHR(..)
                                                  , DisplayPlaneCapabilitiesKHR(..)
                                                  , DisplaySurfaceCreateInfoKHR(..)
                                                  , DisplayModeCreateFlagsKHR(..)
                                                  , DisplaySurfaceCreateFlagsKHR(..)
                                                  , DisplayPlaneAlphaFlagBitsKHR( DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR
                                                                                , DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR
                                                                                , DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR
                                                                                , DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR
                                                                                , ..
                                                                                )
                                                  , DisplayPlaneAlphaFlagsKHR
                                                  , SurfaceTransformFlagBitsKHR( SURFACE_TRANSFORM_IDENTITY_BIT_KHR
                                                                               , SURFACE_TRANSFORM_ROTATE_90_BIT_KHR
                                                                               , SURFACE_TRANSFORM_ROTATE_180_BIT_KHR
                                                                               , SURFACE_TRANSFORM_ROTATE_270_BIT_KHR
                                                                               , SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR
                                                                               , SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR
                                                                               , SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR
                                                                               , SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR
                                                                               , SURFACE_TRANSFORM_INHERIT_BIT_KHR
                                                                               , ..
                                                                               )
                                                  , SurfaceTransformFlagsKHR
                                                  , KHR_DISPLAY_SPEC_VERSION
                                                  , pattern KHR_DISPLAY_SPEC_VERSION
                                                  , KHR_DISPLAY_EXTENSION_NAME
                                                  , pattern KHR_DISPLAY_EXTENSION_NAME
                                                  , DisplayKHR(..)
                                                  , DisplayModeKHR(..)
                                                  , SurfaceKHR(..)
                                                  ) where

import Control.Exception.Base (bracket)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Marshal.Alloc (callocBytes)
import Foreign.Marshal.Alloc (free)
import GHC.Base (when)
import GHC.IO (throwIO)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import GHC.Read (choose)
import GHC.Read (expectP)
import GHC.Read (parens)
import GHC.Show (showParen)
import GHC.Show (showString)
import Numeric (showHex)
import Text.ParserCombinators.ReadPrec ((+++))
import Text.ParserCombinators.ReadPrec (prec)
import Text.ParserCombinators.ReadPrec (step)
import Data.ByteString (packCString)
import Data.ByteString (useAsCString)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Data.Vector (generateM)
import Data.Bits (Bits)
import Data.String (IsString)
import Data.Typeable (Typeable)
import Foreign.C.Types (CChar)
import Foreign.C.Types (CFloat)
import Foreign.C.Types (CFloat(CFloat))
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import GHC.Read (Read(readPrec))
import Data.Word (Word32)
import Text.Read.Lex (Lexeme(Ident))
import Data.ByteString (ByteString)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Data.Vector (Vector)
import Graphics.Vulkan.CStruct.Utils (advancePtrBytes)
import Graphics.Vulkan.Core10.BaseType (bool32ToBool)
import Graphics.Vulkan.Core10.BaseType (boolToBool32)
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Core10.AllocationCallbacks (AllocationCallbacks)
import Graphics.Vulkan.Core10.BaseType (Bool32)
import Graphics.Vulkan.Extensions.Handles (DisplayKHR)
import Graphics.Vulkan.Extensions.Handles (DisplayKHR(..))
import Graphics.Vulkan.Extensions.Handles (DisplayModeKHR)
import Graphics.Vulkan.Extensions.Handles (DisplayModeKHR(..))
import Graphics.Vulkan.Core10.SharedTypes (Extent2D)
import Graphics.Vulkan.Core10.BaseType (Flags)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Core10.Handles (Instance)
import Graphics.Vulkan.Core10.Handles (Instance(..))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkCreateDisplayModeKHR))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkCreateDisplayPlaneSurfaceKHR))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetDisplayModePropertiesKHR))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetDisplayPlaneCapabilitiesKHR))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetDisplayPlaneSupportedDisplaysKHR))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceDisplayPlanePropertiesKHR))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceDisplayPropertiesKHR))
import Graphics.Vulkan.Core10.Handles (Instance_T)
import Graphics.Vulkan.Core10.SharedTypes (Offset2D)
import Graphics.Vulkan.Core10.Handles (PhysicalDevice)
import Graphics.Vulkan.Core10.Handles (PhysicalDevice(..))
import Graphics.Vulkan.Core10.Handles (PhysicalDevice_T)
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.Extensions.Handles (SurfaceKHR)
import Graphics.Vulkan.Extensions.Handles (SurfaceKHR(..))
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero)
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_DISPLAY_MODE_CREATE_INFO_KHR))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
import Graphics.Vulkan.Extensions.Handles (DisplayKHR(..))
import Graphics.Vulkan.Extensions.Handles (DisplayModeKHR(..))
import Graphics.Vulkan.Extensions.Handles (SurfaceKHR(..))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceDisplayPropertiesKHR
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr DisplayPropertiesKHR -> IO Result) -> Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr DisplayPropertiesKHR -> IO Result

-- | vkGetPhysicalDeviceDisplayPropertiesKHR - Query information about the
-- available displays
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' is a physical
--     device.
--
-- -   @pPropertyCount@ is a pointer to an integer related to the number of
--     display devices available or queried, as described below.
--
-- -   @pProperties@ is either @NULL@ or a pointer to an array of
--     'DisplayPropertiesKHR' structures.
--
-- = Description
--
-- If @pProperties@ is @NULL@, then the number of display devices available
-- for 'Graphics.Vulkan.Core10.Handles.PhysicalDevice' is returned in
-- @pPropertyCount@. Otherwise, @pPropertyCount@ /must/ point to a variable
-- set by the user to the number of elements in the @pProperties@ array,
-- and on return the variable is overwritten with the number of structures
-- actually written to @pProperties@. If the value of @pPropertyCount@ is
-- less than the number of display devices for
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice', at most
-- @pPropertyCount@ structures will be written. If @pPropertyCount@ is
-- smaller than the number of display devices available for
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice',
-- 'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE' will be returned
-- instead of 'Graphics.Vulkan.Core10.Enums.Result.SUCCESS' to indicate
-- that not all the available values were returned.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   @pPropertyCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pPropertyCount@ is not @0@, and
--     @pProperties@ is not @NULL@, @pProperties@ /must/ be a valid pointer
--     to an array of @pPropertyCount@ 'DisplayPropertiesKHR' structures
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'DisplayPropertiesKHR', 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
getPhysicalDeviceDisplayPropertiesKHR :: PhysicalDevice -> IO (Result, ("properties" ::: Vector DisplayPropertiesKHR))
getPhysicalDeviceDisplayPropertiesKHR physicalDevice = evalContT $ do
  let vkGetPhysicalDeviceDisplayPropertiesKHR' = mkVkGetPhysicalDeviceDisplayPropertiesKHR (pVkGetPhysicalDeviceDisplayPropertiesKHR (instanceCmds (physicalDevice :: PhysicalDevice)))
  let physicalDevice' = physicalDeviceHandle (physicalDevice)
  pPPropertyCount <- ContT $ bracket (callocBytes @Word32 4) free
  r <- lift $ vkGetPhysicalDeviceDisplayPropertiesKHR' physicalDevice' (pPPropertyCount) (nullPtr)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pPropertyCount <- lift $ peek @Word32 pPPropertyCount
  pPProperties <- ContT $ bracket (callocBytes @DisplayPropertiesKHR ((fromIntegral (pPropertyCount)) * 48)) free
  _ <- traverse (\i -> ContT $ pokeZeroCStruct (pPProperties `advancePtrBytes` (i * 48) :: Ptr DisplayPropertiesKHR) . ($ ())) [0..(fromIntegral (pPropertyCount)) - 1]
  r' <- lift $ vkGetPhysicalDeviceDisplayPropertiesKHR' physicalDevice' (pPPropertyCount) ((pPProperties))
  lift $ when (r' < SUCCESS) (throwIO (VulkanException r'))
  pPropertyCount' <- lift $ peek @Word32 pPPropertyCount
  pProperties' <- lift $ generateM (fromIntegral (pPropertyCount')) (\i -> peekCStruct @DisplayPropertiesKHR (((pPProperties) `advancePtrBytes` (48 * (i)) :: Ptr DisplayPropertiesKHR)))
  pure $ ((r'), pProperties')


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceDisplayPlanePropertiesKHR
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr DisplayPlanePropertiesKHR -> IO Result) -> Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr DisplayPlanePropertiesKHR -> IO Result

-- | vkGetPhysicalDeviceDisplayPlanePropertiesKHR - Query the plane
-- properties
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' is a physical
--     device.
--
-- -   @pPropertyCount@ is a pointer to an integer related to the number of
--     display planes available or queried, as described below.
--
-- -   @pProperties@ is either @NULL@ or a pointer to an array of
--     'DisplayPlanePropertiesKHR' structures.
--
-- = Description
--
-- If @pProperties@ is @NULL@, then the number of display planes available
-- for 'Graphics.Vulkan.Core10.Handles.PhysicalDevice' is returned in
-- @pPropertyCount@. Otherwise, @pPropertyCount@ /must/ point to a variable
-- set by the user to the number of elements in the @pProperties@ array,
-- and on return the variable is overwritten with the number of structures
-- actually written to @pProperties@. If the value of @pPropertyCount@ is
-- less than the number of display planes for
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice', at most
-- @pPropertyCount@ structures will be written.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   @pPropertyCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pPropertyCount@ is not @0@, and
--     @pProperties@ is not @NULL@, @pProperties@ /must/ be a valid pointer
--     to an array of @pPropertyCount@ 'DisplayPlanePropertiesKHR'
--     structures
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'DisplayPlanePropertiesKHR',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
getPhysicalDeviceDisplayPlanePropertiesKHR :: PhysicalDevice -> IO (Result, ("properties" ::: Vector DisplayPlanePropertiesKHR))
getPhysicalDeviceDisplayPlanePropertiesKHR physicalDevice = evalContT $ do
  let vkGetPhysicalDeviceDisplayPlanePropertiesKHR' = mkVkGetPhysicalDeviceDisplayPlanePropertiesKHR (pVkGetPhysicalDeviceDisplayPlanePropertiesKHR (instanceCmds (physicalDevice :: PhysicalDevice)))
  let physicalDevice' = physicalDeviceHandle (physicalDevice)
  pPPropertyCount <- ContT $ bracket (callocBytes @Word32 4) free
  r <- lift $ vkGetPhysicalDeviceDisplayPlanePropertiesKHR' physicalDevice' (pPPropertyCount) (nullPtr)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pPropertyCount <- lift $ peek @Word32 pPPropertyCount
  pPProperties <- ContT $ bracket (callocBytes @DisplayPlanePropertiesKHR ((fromIntegral (pPropertyCount)) * 16)) free
  _ <- traverse (\i -> ContT $ pokeZeroCStruct (pPProperties `advancePtrBytes` (i * 16) :: Ptr DisplayPlanePropertiesKHR) . ($ ())) [0..(fromIntegral (pPropertyCount)) - 1]
  r' <- lift $ vkGetPhysicalDeviceDisplayPlanePropertiesKHR' physicalDevice' (pPPropertyCount) ((pPProperties))
  lift $ when (r' < SUCCESS) (throwIO (VulkanException r'))
  pPropertyCount' <- lift $ peek @Word32 pPPropertyCount
  pProperties' <- lift $ generateM (fromIntegral (pPropertyCount')) (\i -> peekCStruct @DisplayPlanePropertiesKHR (((pPProperties) `advancePtrBytes` (16 * (i)) :: Ptr DisplayPlanePropertiesKHR)))
  pure $ ((r'), pProperties')


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetDisplayPlaneSupportedDisplaysKHR
  :: FunPtr (Ptr PhysicalDevice_T -> Word32 -> Ptr Word32 -> Ptr DisplayKHR -> IO Result) -> Ptr PhysicalDevice_T -> Word32 -> Ptr Word32 -> Ptr DisplayKHR -> IO Result

-- | vkGetDisplayPlaneSupportedDisplaysKHR - Query the list of displays a
-- plane supports
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' is a physical
--     device.
--
-- -   @planeIndex@ is the plane which the application wishes to use, and
--     /must/ be in the range [0, physical device plane count - 1].
--
-- -   @pDisplayCount@ is a pointer to an integer related to the number of
--     displays available or queried, as described below.
--
-- -   @pDisplays@ is either @NULL@ or a pointer to an array of
--     'Graphics.Vulkan.Extensions.Handles.DisplayKHR' handles.
--
-- = Description
--
-- If @pDisplays@ is @NULL@, then the number of displays usable with the
-- specified @planeIndex@ for
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice' is returned in
-- @pDisplayCount@. Otherwise, @pDisplayCount@ /must/ point to a variable
-- set by the user to the number of elements in the @pDisplays@ array, and
-- on return the variable is overwritten with the number of handles
-- actually written to @pDisplays@. If the value of @pDisplayCount@ is less
-- than the number of display planes for
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice', at most @pDisplayCount@
-- handles will be written. If @pDisplayCount@ is smaller than the number
-- of displays usable with the specified @planeIndex@ for
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice',
-- 'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE' will be returned
-- instead of 'Graphics.Vulkan.Core10.Enums.Result.SUCCESS' to indicate
-- that not all the available values were returned.
--
-- == Valid Usage
--
-- -   @planeIndex@ /must/ be less than the number of display planes
--     supported by the device as determined by calling
--     'getPhysicalDeviceDisplayPlanePropertiesKHR'
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   @pDisplayCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pDisplayCount@ is not @0@, and
--     @pDisplays@ is not @NULL@, @pDisplays@ /must/ be a valid pointer to
--     an array of @pDisplayCount@
--     'Graphics.Vulkan.Extensions.Handles.DisplayKHR' handles
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.Handles.DisplayKHR',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
getDisplayPlaneSupportedDisplaysKHR :: PhysicalDevice -> ("planeIndex" ::: Word32) -> IO (Result, ("displays" ::: Vector DisplayKHR))
getDisplayPlaneSupportedDisplaysKHR physicalDevice planeIndex = evalContT $ do
  let vkGetDisplayPlaneSupportedDisplaysKHR' = mkVkGetDisplayPlaneSupportedDisplaysKHR (pVkGetDisplayPlaneSupportedDisplaysKHR (instanceCmds (physicalDevice :: PhysicalDevice)))
  let physicalDevice' = physicalDeviceHandle (physicalDevice)
  pPDisplayCount <- ContT $ bracket (callocBytes @Word32 4) free
  r <- lift $ vkGetDisplayPlaneSupportedDisplaysKHR' physicalDevice' (planeIndex) (pPDisplayCount) (nullPtr)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pDisplayCount <- lift $ peek @Word32 pPDisplayCount
  pPDisplays <- ContT $ bracket (callocBytes @DisplayKHR ((fromIntegral (pDisplayCount)) * 8)) free
  r' <- lift $ vkGetDisplayPlaneSupportedDisplaysKHR' physicalDevice' (planeIndex) (pPDisplayCount) (pPDisplays)
  lift $ when (r' < SUCCESS) (throwIO (VulkanException r'))
  pDisplayCount' <- lift $ peek @Word32 pPDisplayCount
  pDisplays' <- lift $ generateM (fromIntegral (pDisplayCount')) (\i -> peek @DisplayKHR ((pPDisplays `advancePtrBytes` (8 * (i)) :: Ptr DisplayKHR)))
  pure $ ((r'), pDisplays')


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetDisplayModePropertiesKHR
  :: FunPtr (Ptr PhysicalDevice_T -> DisplayKHR -> Ptr Word32 -> Ptr DisplayModePropertiesKHR -> IO Result) -> Ptr PhysicalDevice_T -> DisplayKHR -> Ptr Word32 -> Ptr DisplayModePropertiesKHR -> IO Result

-- | vkGetDisplayModePropertiesKHR - Query the set of mode properties
-- supported by the display
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' is the physical
--     device associated with
--     'Graphics.Vulkan.Extensions.WSITypes.Display'.
--
-- -   'Graphics.Vulkan.Extensions.WSITypes.Display' is the display to
--     query.
--
-- -   @pPropertyCount@ is a pointer to an integer related to the number of
--     display modes available or queried, as described below.
--
-- -   @pProperties@ is either @NULL@ or a pointer to an array of
--     'DisplayModePropertiesKHR' structures.
--
-- = Description
--
-- If @pProperties@ is @NULL@, then the number of display modes available
-- on the specified 'Graphics.Vulkan.Extensions.WSITypes.Display' for
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice' is returned in
-- @pPropertyCount@. Otherwise, @pPropertyCount@ /must/ point to a variable
-- set by the user to the number of elements in the @pProperties@ array,
-- and on return the variable is overwritten with the number of structures
-- actually written to @pProperties@. If the value of @pPropertyCount@ is
-- less than the number of display modes for
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice', at most
-- @pPropertyCount@ structures will be written. If @pPropertyCount@ is
-- smaller than the number of display modes available on the specified
-- 'Graphics.Vulkan.Extensions.WSITypes.Display' for
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice',
-- 'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE' will be returned
-- instead of 'Graphics.Vulkan.Core10.Enums.Result.SUCCESS' to indicate
-- that not all the available values were returned.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   'Graphics.Vulkan.Extensions.WSITypes.Display' /must/ be a valid
--     'Graphics.Vulkan.Extensions.Handles.DisplayKHR' handle
--
-- -   @pPropertyCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pPropertyCount@ is not @0@, and
--     @pProperties@ is not @NULL@, @pProperties@ /must/ be a valid pointer
--     to an array of @pPropertyCount@ 'DisplayModePropertiesKHR'
--     structures
--
-- -   'Graphics.Vulkan.Extensions.WSITypes.Display' /must/ have been
--     created, allocated, or retrieved from
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.Handles.DisplayKHR',
-- 'DisplayModePropertiesKHR',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
getDisplayModePropertiesKHR :: PhysicalDevice -> DisplayKHR -> IO (Result, ("properties" ::: Vector DisplayModePropertiesKHR))
getDisplayModePropertiesKHR physicalDevice display = evalContT $ do
  let vkGetDisplayModePropertiesKHR' = mkVkGetDisplayModePropertiesKHR (pVkGetDisplayModePropertiesKHR (instanceCmds (physicalDevice :: PhysicalDevice)))
  let physicalDevice' = physicalDeviceHandle (physicalDevice)
  pPPropertyCount <- ContT $ bracket (callocBytes @Word32 4) free
  r <- lift $ vkGetDisplayModePropertiesKHR' physicalDevice' (display) (pPPropertyCount) (nullPtr)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pPropertyCount <- lift $ peek @Word32 pPPropertyCount
  pPProperties <- ContT $ bracket (callocBytes @DisplayModePropertiesKHR ((fromIntegral (pPropertyCount)) * 24)) free
  _ <- traverse (\i -> ContT $ pokeZeroCStruct (pPProperties `advancePtrBytes` (i * 24) :: Ptr DisplayModePropertiesKHR) . ($ ())) [0..(fromIntegral (pPropertyCount)) - 1]
  r' <- lift $ vkGetDisplayModePropertiesKHR' physicalDevice' (display) (pPPropertyCount) ((pPProperties))
  lift $ when (r' < SUCCESS) (throwIO (VulkanException r'))
  pPropertyCount' <- lift $ peek @Word32 pPPropertyCount
  pProperties' <- lift $ generateM (fromIntegral (pPropertyCount')) (\i -> peekCStruct @DisplayModePropertiesKHR (((pPProperties) `advancePtrBytes` (24 * (i)) :: Ptr DisplayModePropertiesKHR)))
  pure $ ((r'), pProperties')


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateDisplayModeKHR
  :: FunPtr (Ptr PhysicalDevice_T -> DisplayKHR -> Ptr DisplayModeCreateInfoKHR -> Ptr AllocationCallbacks -> Ptr DisplayModeKHR -> IO Result) -> Ptr PhysicalDevice_T -> DisplayKHR -> Ptr DisplayModeCreateInfoKHR -> Ptr AllocationCallbacks -> Ptr DisplayModeKHR -> IO Result

-- | vkCreateDisplayModeKHR - Create a display mode
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' is the physical
--     device associated with
--     'Graphics.Vulkan.Extensions.WSITypes.Display'.
--
-- -   'Graphics.Vulkan.Extensions.WSITypes.Display' is the display to
--     create an additional mode for.
--
-- -   @pCreateInfo@ is a 'DisplayModeCreateInfoKHR' structure describing
--     the new mode to create.
--
-- -   @pAllocator@ is the allocator used for host memory allocated for the
--     display mode object when there is no more specific allocator
--     available (see
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>).
--
-- -   @pMode@ returns the handle of the mode created.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   'Graphics.Vulkan.Extensions.WSITypes.Display' /must/ be a valid
--     'Graphics.Vulkan.Extensions.Handles.DisplayKHR' handle
--
-- -   @pCreateInfo@ /must/ be a valid pointer to a valid
--     'DisplayModeCreateInfoKHR' structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   @pMode@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.Extensions.Handles.DisplayModeKHR' handle
--
-- -   'Graphics.Vulkan.Extensions.WSITypes.Display' /must/ have been
--     created, allocated, or retrieved from
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
--
-- == Host Synchronization
--
-- -   Host access to 'Graphics.Vulkan.Extensions.WSITypes.Display' /must/
--     be externally synchronized
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_INITIALIZATION_FAILED'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks',
-- 'Graphics.Vulkan.Extensions.Handles.DisplayKHR',
-- 'DisplayModeCreateInfoKHR',
-- 'Graphics.Vulkan.Extensions.Handles.DisplayModeKHR',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
createDisplayModeKHR :: PhysicalDevice -> DisplayKHR -> DisplayModeCreateInfoKHR -> ("allocator" ::: Maybe AllocationCallbacks) -> IO (DisplayModeKHR)
createDisplayModeKHR physicalDevice display createInfo allocator = evalContT $ do
  let vkCreateDisplayModeKHR' = mkVkCreateDisplayModeKHR (pVkCreateDisplayModeKHR (instanceCmds (physicalDevice :: PhysicalDevice)))
  pCreateInfo <- ContT $ withCStruct (createInfo)
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  pPMode <- ContT $ bracket (callocBytes @DisplayModeKHR 8) free
  r <- lift $ vkCreateDisplayModeKHR' (physicalDeviceHandle (physicalDevice)) (display) pCreateInfo pAllocator (pPMode)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pMode <- lift $ peek @DisplayModeKHR pPMode
  pure $ (pMode)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetDisplayPlaneCapabilitiesKHR
  :: FunPtr (Ptr PhysicalDevice_T -> DisplayModeKHR -> Word32 -> Ptr DisplayPlaneCapabilitiesKHR -> IO Result) -> Ptr PhysicalDevice_T -> DisplayModeKHR -> Word32 -> Ptr DisplayPlaneCapabilitiesKHR -> IO Result

-- | vkGetDisplayPlaneCapabilitiesKHR - Query capabilities of a mode and
-- plane combination
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' is the physical
--     device associated with 'Graphics.Vulkan.Extensions.WSITypes.Display'
--
-- -   @mode@ is the display mode the application intends to program when
--     using the specified plane. Note this parameter also implicitly
--     specifies a display.
--
-- -   @planeIndex@ is the plane which the application intends to use with
--     the display, and is less than the number of display planes supported
--     by the device.
--
-- -   @pCapabilities@ is a pointer to a 'DisplayPlaneCapabilitiesKHR'
--     structure in which the capabilities are returned.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   @mode@ /must/ be a valid
--     'Graphics.Vulkan.Extensions.Handles.DisplayModeKHR' handle
--
-- -   @pCapabilities@ /must/ be a valid pointer to a
--     'DisplayPlaneCapabilitiesKHR' structure
--
-- == Host Synchronization
--
-- -   Host access to @mode@ /must/ be externally synchronized
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.Handles.DisplayModeKHR',
-- 'DisplayPlaneCapabilitiesKHR',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
getDisplayPlaneCapabilitiesKHR :: PhysicalDevice -> DisplayModeKHR -> ("planeIndex" ::: Word32) -> IO (DisplayPlaneCapabilitiesKHR)
getDisplayPlaneCapabilitiesKHR physicalDevice mode planeIndex = evalContT $ do
  let vkGetDisplayPlaneCapabilitiesKHR' = mkVkGetDisplayPlaneCapabilitiesKHR (pVkGetDisplayPlaneCapabilitiesKHR (instanceCmds (physicalDevice :: PhysicalDevice)))
  pPCapabilities <- ContT (withZeroCStruct @DisplayPlaneCapabilitiesKHR)
  r <- lift $ vkGetDisplayPlaneCapabilitiesKHR' (physicalDeviceHandle (physicalDevice)) (mode) (planeIndex) (pPCapabilities)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pCapabilities <- lift $ peekCStruct @DisplayPlaneCapabilitiesKHR pPCapabilities
  pure $ (pCapabilities)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateDisplayPlaneSurfaceKHR
  :: FunPtr (Ptr Instance_T -> Ptr DisplaySurfaceCreateInfoKHR -> Ptr AllocationCallbacks -> Ptr SurfaceKHR -> IO Result) -> Ptr Instance_T -> Ptr DisplaySurfaceCreateInfoKHR -> Ptr AllocationCallbacks -> Ptr SurfaceKHR -> IO Result

-- | vkCreateDisplayPlaneSurfaceKHR - Create a
-- 'Graphics.Vulkan.Extensions.Handles.SurfaceKHR' structure representing a
-- display plane and mode
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Instance' is the instance
--     corresponding to the physical device the targeted display is on.
--
-- -   @pCreateInfo@ is a pointer to a 'DisplaySurfaceCreateInfoKHR'
--     structure specifying which mode, plane, and other parameters to use,
--     as described below.
--
-- -   @pAllocator@ is the allocator used for host memory allocated for the
--     surface object when there is no more specific allocator available
--     (see
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>).
--
-- -   @pSurface@ is a pointer to a
--     'Graphics.Vulkan.Extensions.Handles.SurfaceKHR' handle in which the
--     created surface is returned.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Instance' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Instance' handle
--
-- -   @pCreateInfo@ /must/ be a valid pointer to a valid
--     'DisplaySurfaceCreateInfoKHR' structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   @pSurface@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.Extensions.Handles.SurfaceKHR' handle
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks',
-- 'DisplaySurfaceCreateInfoKHR',
-- 'Graphics.Vulkan.Core10.Handles.Instance',
-- 'Graphics.Vulkan.Extensions.Handles.SurfaceKHR'
createDisplayPlaneSurfaceKHR :: Instance -> DisplaySurfaceCreateInfoKHR -> ("allocator" ::: Maybe AllocationCallbacks) -> IO (SurfaceKHR)
createDisplayPlaneSurfaceKHR instance' createInfo allocator = evalContT $ do
  let vkCreateDisplayPlaneSurfaceKHR' = mkVkCreateDisplayPlaneSurfaceKHR (pVkCreateDisplayPlaneSurfaceKHR (instanceCmds (instance' :: Instance)))
  pCreateInfo <- ContT $ withCStruct (createInfo)
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  pPSurface <- ContT $ bracket (callocBytes @SurfaceKHR 8) free
  r <- lift $ vkCreateDisplayPlaneSurfaceKHR' (instanceHandle (instance')) pCreateInfo pAllocator (pPSurface)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pSurface <- lift $ peek @SurfaceKHR pPSurface
  pure $ (pSurface)


-- | VkDisplayPropertiesKHR - Structure describing an available display
-- device
--
-- = Description
--
-- Note
--
-- For devices which have no natural value to return here, implementations
-- /should/ return the maximum resolution supported.
--
-- Note
--
-- Persistent presents /may/ have higher latency, and /may/ use less power
-- when the screen content is updated infrequently, or when only a portion
-- of the screen needs to be updated in most frames.
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.BaseType.Bool32',
-- 'Graphics.Vulkan.Extensions.Handles.DisplayKHR',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_display_properties2.DisplayProperties2KHR',
-- 'Graphics.Vulkan.Core10.SharedTypes.Extent2D',
-- 'SurfaceTransformFlagsKHR', 'getPhysicalDeviceDisplayPropertiesKHR'
data DisplayPropertiesKHR = DisplayPropertiesKHR
  { -- | 'Graphics.Vulkan.Extensions.WSITypes.Display' is a handle that is used
    -- to refer to the display described here. This handle will be valid for
    -- the lifetime of the Vulkan instance.
    display :: DisplayKHR
  , -- | @displayName@ is a pointer to a null-terminated UTF-8 string containing
    -- the name of the display. Generally, this will be the name provided by
    -- the display’s EDID. It /can/ be @NULL@ if no suitable name is available.
    -- If not @NULL@, the memory it points to /must/ remain accessible as long
    -- as 'Graphics.Vulkan.Extensions.WSITypes.Display' is valid.
    displayName :: ByteString
  , -- | @physicalDimensions@ describes the physical width and height of the
    -- visible portion of the display, in millimeters.
    physicalDimensions :: Extent2D
  , -- | @physicalResolution@ describes the physical, native, or preferred
    -- resolution of the display.
    physicalResolution :: Extent2D
  , -- | @supportedTransforms@ is a bitmask of 'SurfaceTransformFlagBitsKHR'
    -- describing which transforms are supported by this display.
    supportedTransforms :: SurfaceTransformFlagsKHR
  , -- | @planeReorderPossible@ tells whether the planes on this display /can/
    -- have their z order changed. If this is
    -- 'Graphics.Vulkan.Core10.BaseType.TRUE', the application /can/ re-arrange
    -- the planes on this display in any order relative to each other.
    planeReorderPossible :: Bool
  , -- | @persistentContent@ tells whether the display supports
    -- self-refresh\/internal buffering. If this is true, the application /can/
    -- submit persistent present operations on swapchains created against this
    -- display.
    persistentContent :: Bool
  }
  deriving (Typeable)
deriving instance Show DisplayPropertiesKHR

instance ToCStruct DisplayPropertiesKHR where
  withCStruct x f = allocaBytesAligned 48 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplayPropertiesKHR{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr DisplayKHR)) (display)
    displayName'' <- ContT $ useAsCString (displayName)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr CChar))) displayName''
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr Extent2D)) (physicalDimensions) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 24 :: Ptr Extent2D)) (physicalResolution) . ($ ())
    lift $ poke ((p `plusPtr` 32 :: Ptr SurfaceTransformFlagsKHR)) (supportedTransforms)
    lift $ poke ((p `plusPtr` 36 :: Ptr Bool32)) (boolToBool32 (planeReorderPossible))
    lift $ poke ((p `plusPtr` 40 :: Ptr Bool32)) (boolToBool32 (persistentContent))
    lift $ f
  cStructSize = 48
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr DisplayKHR)) (zero)
    displayName'' <- ContT $ useAsCString (mempty)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr CChar))) displayName''
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr Extent2D)) (zero) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 24 :: Ptr Extent2D)) (zero) . ($ ())
    lift $ poke ((p `plusPtr` 36 :: Ptr Bool32)) (boolToBool32 (zero))
    lift $ poke ((p `plusPtr` 40 :: Ptr Bool32)) (boolToBool32 (zero))
    lift $ f

instance FromCStruct DisplayPropertiesKHR where
  peekCStruct p = do
    display <- peek @DisplayKHR ((p `plusPtr` 0 :: Ptr DisplayKHR))
    displayName <- packCString =<< peek ((p `plusPtr` 8 :: Ptr (Ptr CChar)))
    physicalDimensions <- peekCStruct @Extent2D ((p `plusPtr` 16 :: Ptr Extent2D))
    physicalResolution <- peekCStruct @Extent2D ((p `plusPtr` 24 :: Ptr Extent2D))
    supportedTransforms <- peek @SurfaceTransformFlagsKHR ((p `plusPtr` 32 :: Ptr SurfaceTransformFlagsKHR))
    planeReorderPossible <- peek @Bool32 ((p `plusPtr` 36 :: Ptr Bool32))
    persistentContent <- peek @Bool32 ((p `plusPtr` 40 :: Ptr Bool32))
    pure $ DisplayPropertiesKHR
             display displayName physicalDimensions physicalResolution supportedTransforms (bool32ToBool planeReorderPossible) (bool32ToBool persistentContent)

instance Zero DisplayPropertiesKHR where
  zero = DisplayPropertiesKHR
           zero
           mempty
           zero
           zero
           zero
           zero
           zero


-- | VkDisplayPlanePropertiesKHR - Structure describing display plane
-- properties
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.Handles.DisplayKHR',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_display_properties2.DisplayPlaneProperties2KHR',
-- 'getPhysicalDeviceDisplayPlanePropertiesKHR'
data DisplayPlanePropertiesKHR = DisplayPlanePropertiesKHR
  { -- | @currentDisplay@ is the handle of the display the plane is currently
    -- associated with. If the plane is not currently attached to any displays,
    -- this will be 'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE'.
    currentDisplay :: DisplayKHR
  , -- | @currentStackIndex@ is the current z-order of the plane. This will be
    -- between 0 and the value returned by
    -- 'getPhysicalDeviceDisplayPlanePropertiesKHR' in @pPropertyCount@.
    currentStackIndex :: Word32
  }
  deriving (Typeable)
deriving instance Show DisplayPlanePropertiesKHR

instance ToCStruct DisplayPlanePropertiesKHR where
  withCStruct x f = allocaBytesAligned 16 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplayPlanePropertiesKHR{..} f = do
    poke ((p `plusPtr` 0 :: Ptr DisplayKHR)) (currentDisplay)
    poke ((p `plusPtr` 8 :: Ptr Word32)) (currentStackIndex)
    f
  cStructSize = 16
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr DisplayKHR)) (zero)
    poke ((p `plusPtr` 8 :: Ptr Word32)) (zero)
    f

instance FromCStruct DisplayPlanePropertiesKHR where
  peekCStruct p = do
    currentDisplay <- peek @DisplayKHR ((p `plusPtr` 0 :: Ptr DisplayKHR))
    currentStackIndex <- peek @Word32 ((p `plusPtr` 8 :: Ptr Word32))
    pure $ DisplayPlanePropertiesKHR
             currentDisplay currentStackIndex

instance Storable DisplayPlanePropertiesKHR where
  sizeOf ~_ = 16
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero DisplayPlanePropertiesKHR where
  zero = DisplayPlanePropertiesKHR
           zero
           zero


-- | VkDisplayModeParametersKHR - Structure describing display parameters
-- associated with a display mode
--
-- = Description
--
-- Note
--
-- For example, a 60Hz display mode would report a @refreshRate@ of 60,000.
--
-- == Valid Usage
--
-- -   The @width@ member of @visibleRegion@ /must/ be greater than @0@
--
-- -   The @height@ member of @visibleRegion@ /must/ be greater than @0@
--
-- -   @refreshRate@ /must/ be greater than @0@
--
-- = See Also
--
-- 'DisplayModeCreateInfoKHR', 'DisplayModePropertiesKHR',
-- 'Graphics.Vulkan.Core10.SharedTypes.Extent2D'
data DisplayModeParametersKHR = DisplayModeParametersKHR
  { -- | @visibleRegion@ is the 2D extents of the visible region.
    visibleRegion :: Extent2D
  , -- | @refreshRate@ is a @uint32_t@ that is the number of times the display is
    -- refreshed each second multiplied by 1000.
    refreshRate :: Word32
  }
  deriving (Typeable)
deriving instance Show DisplayModeParametersKHR

instance ToCStruct DisplayModeParametersKHR where
  withCStruct x f = allocaBytesAligned 12 4 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplayModeParametersKHR{..} f = evalContT $ do
    ContT $ pokeCStruct ((p `plusPtr` 0 :: Ptr Extent2D)) (visibleRegion) . ($ ())
    lift $ poke ((p `plusPtr` 8 :: Ptr Word32)) (refreshRate)
    lift $ f
  cStructSize = 12
  cStructAlignment = 4
  pokeZeroCStruct p f = evalContT $ do
    ContT $ pokeCStruct ((p `plusPtr` 0 :: Ptr Extent2D)) (zero) . ($ ())
    lift $ poke ((p `plusPtr` 8 :: Ptr Word32)) (zero)
    lift $ f

instance FromCStruct DisplayModeParametersKHR where
  peekCStruct p = do
    visibleRegion <- peekCStruct @Extent2D ((p `plusPtr` 0 :: Ptr Extent2D))
    refreshRate <- peek @Word32 ((p `plusPtr` 8 :: Ptr Word32))
    pure $ DisplayModeParametersKHR
             visibleRegion refreshRate

instance Zero DisplayModeParametersKHR where
  zero = DisplayModeParametersKHR
           zero
           zero


-- | VkDisplayModePropertiesKHR - Structure describing display mode
-- properties
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.Handles.DisplayModeKHR',
-- 'DisplayModeParametersKHR',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_display_properties2.DisplayModeProperties2KHR',
-- 'getDisplayModePropertiesKHR'
data DisplayModePropertiesKHR = DisplayModePropertiesKHR
  { -- | @displayMode@ is a handle to the display mode described in this
    -- structure. This handle will be valid for the lifetime of the Vulkan
    -- instance.
    displayMode :: DisplayModeKHR
  , -- | @parameters@ is a 'DisplayModeParametersKHR' structure describing the
    -- display parameters associated with @displayMode@.
    parameters :: DisplayModeParametersKHR
  }
  deriving (Typeable)
deriving instance Show DisplayModePropertiesKHR

instance ToCStruct DisplayModePropertiesKHR where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplayModePropertiesKHR{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr DisplayModeKHR)) (displayMode)
    ContT $ pokeCStruct ((p `plusPtr` 8 :: Ptr DisplayModeParametersKHR)) (parameters) . ($ ())
    lift $ f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr DisplayModeKHR)) (zero)
    ContT $ pokeCStruct ((p `plusPtr` 8 :: Ptr DisplayModeParametersKHR)) (zero) . ($ ())
    lift $ f

instance FromCStruct DisplayModePropertiesKHR where
  peekCStruct p = do
    displayMode <- peek @DisplayModeKHR ((p `plusPtr` 0 :: Ptr DisplayModeKHR))
    parameters <- peekCStruct @DisplayModeParametersKHR ((p `plusPtr` 8 :: Ptr DisplayModeParametersKHR))
    pure $ DisplayModePropertiesKHR
             displayMode parameters

instance Zero DisplayModePropertiesKHR where
  zero = DisplayModePropertiesKHR
           zero
           zero


-- | VkDisplayModeCreateInfoKHR - Structure specifying parameters of a newly
-- created display mode object
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'DisplayModeCreateFlagsKHR', 'DisplayModeParametersKHR',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'createDisplayModeKHR'
data DisplayModeCreateInfoKHR = DisplayModeCreateInfoKHR
  { -- | 'Graphics.Vulkan.Core10.BaseType.Flags' /must/ be @0@
    flags :: DisplayModeCreateFlagsKHR
  , -- | @parameters@ /must/ be a valid 'DisplayModeParametersKHR' structure
    parameters :: DisplayModeParametersKHR
  }
  deriving (Typeable)
deriving instance Show DisplayModeCreateInfoKHR

instance ToCStruct DisplayModeCreateInfoKHR where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplayModeCreateInfoKHR{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_MODE_CREATE_INFO_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    lift $ poke ((p `plusPtr` 16 :: Ptr DisplayModeCreateFlagsKHR)) (flags)
    ContT $ pokeCStruct ((p `plusPtr` 20 :: Ptr DisplayModeParametersKHR)) (parameters) . ($ ())
    lift $ f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_MODE_CREATE_INFO_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    ContT $ pokeCStruct ((p `plusPtr` 20 :: Ptr DisplayModeParametersKHR)) (zero) . ($ ())
    lift $ f

instance FromCStruct DisplayModeCreateInfoKHR where
  peekCStruct p = do
    flags <- peek @DisplayModeCreateFlagsKHR ((p `plusPtr` 16 :: Ptr DisplayModeCreateFlagsKHR))
    parameters <- peekCStruct @DisplayModeParametersKHR ((p `plusPtr` 20 :: Ptr DisplayModeParametersKHR))
    pure $ DisplayModeCreateInfoKHR
             flags parameters

instance Zero DisplayModeCreateInfoKHR where
  zero = DisplayModeCreateInfoKHR
           zero
           zero


-- | VkDisplayPlaneCapabilitiesKHR - Structure describing capabilities of a
-- mode and plane combination
--
-- = Description
--
-- The minimum and maximum position and extent fields describe the
-- implementation limits, if any, as they apply to the specified display
-- mode and plane. Vendors /may/ support displaying a subset of a
-- swapchain’s presentable images on the specified display plane. This is
-- expressed by returning @minSrcPosition@, @maxSrcPosition@,
-- @minSrcExtent@, and @maxSrcExtent@ values that indicate a range of
-- possible positions and sizes /may/ be used to specify the region within
-- the presentable images that source pixels will be read from when
-- creating a swapchain on the specified display mode and plane.
--
-- Vendors /may/ also support mapping the presentable images’ content to a
-- subset or superset of the visible region in the specified display mode.
-- This is expressed by returning @minDstPosition@, @maxDstPosition@,
-- @minDstExtent@ and @maxDstExtent@ values that indicate a range of
-- possible positions and sizes /may/ be used to describe the region within
-- the display mode that the source pixels will be mapped to.
--
-- Other vendors /may/ support only a 1-1 mapping between pixels in the
-- presentable images and the display mode. This /may/ be indicated by
-- returning (0,0) for @minSrcPosition@, @maxSrcPosition@,
-- @minDstPosition@, and @maxDstPosition@, and (display mode width, display
-- mode height) for @minSrcExtent@, @maxSrcExtent@, @minDstExtent@, and
-- @maxDstExtent@.
--
-- These values indicate the limits of the implementation’s individual
-- fields. Not all combinations of values within the offset and extent
-- ranges returned in 'DisplayPlaneCapabilitiesKHR' are guaranteed to be
-- supported. Presentation requests specifying unsupported combinations
-- /may/ fail.
--
-- = See Also
--
-- 'DisplayPlaneAlphaFlagsKHR',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_display_properties2.DisplayPlaneCapabilities2KHR',
-- 'Graphics.Vulkan.Core10.SharedTypes.Extent2D',
-- 'Graphics.Vulkan.Core10.SharedTypes.Offset2D',
-- 'getDisplayPlaneCapabilitiesKHR'
data DisplayPlaneCapabilitiesKHR = DisplayPlaneCapabilitiesKHR
  { -- | @supportedAlpha@ is a bitmask of 'DisplayPlaneAlphaFlagBitsKHR'
    -- describing the supported alpha blending modes.
    supportedAlpha :: DisplayPlaneAlphaFlagsKHR
  , -- | @minSrcPosition@ is the minimum source rectangle offset supported by
    -- this plane using the specified mode.
    minSrcPosition :: Offset2D
  , -- | @maxSrcPosition@ is the maximum source rectangle offset supported by
    -- this plane using the specified mode. The @x@ and @y@ components of
    -- @maxSrcPosition@ /must/ each be greater than or equal to the @x@ and @y@
    -- components of @minSrcPosition@, respectively.
    maxSrcPosition :: Offset2D
  , -- | @minSrcExtent@ is the minimum source rectangle size supported by this
    -- plane using the specified mode.
    minSrcExtent :: Extent2D
  , -- | @maxSrcExtent@ is the maximum source rectangle size supported by this
    -- plane using the specified mode.
    maxSrcExtent :: Extent2D
  , -- | @minDstPosition@, @maxDstPosition@, @minDstExtent@, @maxDstExtent@ all
    -- have similar semantics to their corresponding @*Src*@ equivalents, but
    -- apply to the output region within the mode rather than the input region
    -- within the source image. Unlike the @*Src*@ offsets, @minDstPosition@
    -- and @maxDstPosition@ /may/ contain negative values.
    minDstPosition :: Offset2D
  , -- No documentation found for Nested "VkDisplayPlaneCapabilitiesKHR" "maxDstPosition"
    maxDstPosition :: Offset2D
  , -- No documentation found for Nested "VkDisplayPlaneCapabilitiesKHR" "minDstExtent"
    minDstExtent :: Extent2D
  , -- No documentation found for Nested "VkDisplayPlaneCapabilitiesKHR" "maxDstExtent"
    maxDstExtent :: Extent2D
  }
  deriving (Typeable)
deriving instance Show DisplayPlaneCapabilitiesKHR

instance ToCStruct DisplayPlaneCapabilitiesKHR where
  withCStruct x f = allocaBytesAligned 68 4 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplayPlaneCapabilitiesKHR{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr DisplayPlaneAlphaFlagsKHR)) (supportedAlpha)
    ContT $ pokeCStruct ((p `plusPtr` 4 :: Ptr Offset2D)) (minSrcPosition) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 12 :: Ptr Offset2D)) (maxSrcPosition) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 20 :: Ptr Extent2D)) (minSrcExtent) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 28 :: Ptr Extent2D)) (maxSrcExtent) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 36 :: Ptr Offset2D)) (minDstPosition) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 44 :: Ptr Offset2D)) (maxDstPosition) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 52 :: Ptr Extent2D)) (minDstExtent) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 60 :: Ptr Extent2D)) (maxDstExtent) . ($ ())
    lift $ f
  cStructSize = 68
  cStructAlignment = 4
  pokeZeroCStruct p f = evalContT $ do
    ContT $ pokeCStruct ((p `plusPtr` 4 :: Ptr Offset2D)) (zero) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 12 :: Ptr Offset2D)) (zero) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 20 :: Ptr Extent2D)) (zero) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 28 :: Ptr Extent2D)) (zero) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 36 :: Ptr Offset2D)) (zero) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 44 :: Ptr Offset2D)) (zero) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 52 :: Ptr Extent2D)) (zero) . ($ ())
    ContT $ pokeCStruct ((p `plusPtr` 60 :: Ptr Extent2D)) (zero) . ($ ())
    lift $ f

instance FromCStruct DisplayPlaneCapabilitiesKHR where
  peekCStruct p = do
    supportedAlpha <- peek @DisplayPlaneAlphaFlagsKHR ((p `plusPtr` 0 :: Ptr DisplayPlaneAlphaFlagsKHR))
    minSrcPosition <- peekCStruct @Offset2D ((p `plusPtr` 4 :: Ptr Offset2D))
    maxSrcPosition <- peekCStruct @Offset2D ((p `plusPtr` 12 :: Ptr Offset2D))
    minSrcExtent <- peekCStruct @Extent2D ((p `plusPtr` 20 :: Ptr Extent2D))
    maxSrcExtent <- peekCStruct @Extent2D ((p `plusPtr` 28 :: Ptr Extent2D))
    minDstPosition <- peekCStruct @Offset2D ((p `plusPtr` 36 :: Ptr Offset2D))
    maxDstPosition <- peekCStruct @Offset2D ((p `plusPtr` 44 :: Ptr Offset2D))
    minDstExtent <- peekCStruct @Extent2D ((p `plusPtr` 52 :: Ptr Extent2D))
    maxDstExtent <- peekCStruct @Extent2D ((p `plusPtr` 60 :: Ptr Extent2D))
    pure $ DisplayPlaneCapabilitiesKHR
             supportedAlpha minSrcPosition maxSrcPosition minSrcExtent maxSrcExtent minDstPosition maxDstPosition minDstExtent maxDstExtent

instance Zero DisplayPlaneCapabilitiesKHR where
  zero = DisplayPlaneCapabilitiesKHR
           zero
           zero
           zero
           zero
           zero
           zero
           zero
           zero
           zero


-- | VkDisplaySurfaceCreateInfoKHR - Structure specifying parameters of a
-- newly created display plane surface object
--
-- = Description
--
-- Note
--
-- Creating a display surface /must/ not modify the state of the displays,
-- planes, or other resources it names. For example, it /must/ not apply
-- the specified mode to be set on the associated display. Application of
-- display configuration occurs as a side effect of presenting to a display
-- surface.
--
-- == Valid Usage
--
-- -   @planeIndex@ /must/ be less than the number of display planes
--     supported by the device as determined by calling
--     'getPhysicalDeviceDisplayPlanePropertiesKHR'
--
-- -   If the @planeReorderPossible@ member of the 'DisplayPropertiesKHR'
--     structure returned by 'getPhysicalDeviceDisplayPropertiesKHR' for
--     the display corresponding to @displayMode@ is
--     'Graphics.Vulkan.Core10.BaseType.TRUE' then @planeStackIndex@ /must/
--     be less than the number of display planes supported by the device as
--     determined by calling 'getPhysicalDeviceDisplayPlanePropertiesKHR';
--     otherwise @planeStackIndex@ /must/ equal the @currentStackIndex@
--     member of 'DisplayPlanePropertiesKHR' returned by
--     'getPhysicalDeviceDisplayPlanePropertiesKHR' for the display plane
--     corresponding to @displayMode@
--
-- -   If @alphaMode@ is 'DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR' then
--     @globalAlpha@ /must/ be between @0@ and @1@, inclusive
--
-- -   @alphaMode@ /must/ be @0@ or one of the bits present in the
--     @supportedAlpha@ member of 'DisplayPlaneCapabilitiesKHR' returned by
--     'getDisplayPlaneCapabilitiesKHR' for the display plane corresponding
--     to @displayMode@
--
-- -   The @width@ and @height@ members of @imageExtent@ /must/ be less
--     than the @maxImageDimensions2D@ member of
--     'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR'
--
-- -   @pNext@ /must/ be @NULL@
--
-- -   'Graphics.Vulkan.Core10.BaseType.Flags' /must/ be @0@
--
-- -   @displayMode@ /must/ be a valid
--     'Graphics.Vulkan.Extensions.Handles.DisplayModeKHR' handle
--
-- -   @transform@ /must/ be a valid 'SurfaceTransformFlagBitsKHR' value
--
-- -   @alphaMode@ /must/ be a valid 'DisplayPlaneAlphaFlagBitsKHR' value
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.Handles.DisplayModeKHR',
-- 'DisplayPlaneAlphaFlagBitsKHR', 'DisplaySurfaceCreateFlagsKHR',
-- 'Graphics.Vulkan.Core10.SharedTypes.Extent2D',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'SurfaceTransformFlagBitsKHR', 'createDisplayPlaneSurfaceKHR'
data DisplaySurfaceCreateInfoKHR = DisplaySurfaceCreateInfoKHR
  { -- | 'Graphics.Vulkan.Core10.BaseType.Flags' is reserved for future use, and
    -- /must/ be zero.
    flags :: DisplaySurfaceCreateFlagsKHR
  , -- | @displayMode@ is a 'Graphics.Vulkan.Extensions.Handles.DisplayModeKHR'
    -- handle specifying the mode to use when displaying this surface.
    displayMode :: DisplayModeKHR
  , -- | @planeIndex@ is the plane on which this surface appears.
    planeIndex :: Word32
  , -- | @planeStackIndex@ is the z-order of the plane.
    planeStackIndex :: Word32
  , -- | @transform@ is a 'SurfaceTransformFlagBitsKHR' value specifying the
    -- transformation to apply to images as part of the scanout operation.
    transform :: SurfaceTransformFlagBitsKHR
  , -- | @globalAlpha@ is the global alpha value. This value is ignored if
    -- @alphaMode@ is not 'DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR'.
    globalAlpha :: Float
  , -- | @alphaMode@ is a 'DisplayPlaneAlphaFlagBitsKHR' value specifying the
    -- type of alpha blending to use.
    alphaMode :: DisplayPlaneAlphaFlagBitsKHR
  , -- | @imageExtent@ The size of the presentable images to use with the
    -- surface.
    imageExtent :: Extent2D
  }
  deriving (Typeable)
deriving instance Show DisplaySurfaceCreateInfoKHR

instance ToCStruct DisplaySurfaceCreateInfoKHR where
  withCStruct x f = allocaBytesAligned 64 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplaySurfaceCreateInfoKHR{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    lift $ poke ((p `plusPtr` 16 :: Ptr DisplaySurfaceCreateFlagsKHR)) (flags)
    lift $ poke ((p `plusPtr` 24 :: Ptr DisplayModeKHR)) (displayMode)
    lift $ poke ((p `plusPtr` 32 :: Ptr Word32)) (planeIndex)
    lift $ poke ((p `plusPtr` 36 :: Ptr Word32)) (planeStackIndex)
    lift $ poke ((p `plusPtr` 40 :: Ptr SurfaceTransformFlagBitsKHR)) (transform)
    lift $ poke ((p `plusPtr` 44 :: Ptr CFloat)) (CFloat (globalAlpha))
    lift $ poke ((p `plusPtr` 48 :: Ptr DisplayPlaneAlphaFlagBitsKHR)) (alphaMode)
    ContT $ pokeCStruct ((p `plusPtr` 52 :: Ptr Extent2D)) (imageExtent) . ($ ())
    lift $ f
  cStructSize = 64
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    lift $ poke ((p `plusPtr` 24 :: Ptr DisplayModeKHR)) (zero)
    lift $ poke ((p `plusPtr` 32 :: Ptr Word32)) (zero)
    lift $ poke ((p `plusPtr` 36 :: Ptr Word32)) (zero)
    lift $ poke ((p `plusPtr` 40 :: Ptr SurfaceTransformFlagBitsKHR)) (zero)
    lift $ poke ((p `plusPtr` 44 :: Ptr CFloat)) (CFloat (zero))
    lift $ poke ((p `plusPtr` 48 :: Ptr DisplayPlaneAlphaFlagBitsKHR)) (zero)
    ContT $ pokeCStruct ((p `plusPtr` 52 :: Ptr Extent2D)) (zero) . ($ ())
    lift $ f

instance FromCStruct DisplaySurfaceCreateInfoKHR where
  peekCStruct p = do
    flags <- peek @DisplaySurfaceCreateFlagsKHR ((p `plusPtr` 16 :: Ptr DisplaySurfaceCreateFlagsKHR))
    displayMode <- peek @DisplayModeKHR ((p `plusPtr` 24 :: Ptr DisplayModeKHR))
    planeIndex <- peek @Word32 ((p `plusPtr` 32 :: Ptr Word32))
    planeStackIndex <- peek @Word32 ((p `plusPtr` 36 :: Ptr Word32))
    transform <- peek @SurfaceTransformFlagBitsKHR ((p `plusPtr` 40 :: Ptr SurfaceTransformFlagBitsKHR))
    globalAlpha <- peek @CFloat ((p `plusPtr` 44 :: Ptr CFloat))
    alphaMode <- peek @DisplayPlaneAlphaFlagBitsKHR ((p `plusPtr` 48 :: Ptr DisplayPlaneAlphaFlagBitsKHR))
    imageExtent <- peekCStruct @Extent2D ((p `plusPtr` 52 :: Ptr Extent2D))
    pure $ DisplaySurfaceCreateInfoKHR
             flags displayMode planeIndex planeStackIndex transform ((\(CFloat a) -> a) globalAlpha) alphaMode imageExtent

instance Zero DisplaySurfaceCreateInfoKHR where
  zero = DisplaySurfaceCreateInfoKHR
           zero
           zero
           zero
           zero
           zero
           zero
           zero
           zero


-- | VkDisplayModeCreateFlagsKHR - Reserved for future use
--
-- = Description
--
-- 'DisplayModeCreateFlagsKHR' is a bitmask type for setting a mask, but is
-- currently reserved for future use.
--
-- = See Also
--
-- 'DisplayModeCreateInfoKHR'
newtype DisplayModeCreateFlagsKHR = DisplayModeCreateFlagsKHR Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits)



instance Show DisplayModeCreateFlagsKHR where
  showsPrec p = \case
    DisplayModeCreateFlagsKHR x -> showParen (p >= 11) (showString "DisplayModeCreateFlagsKHR 0x" . showHex x)

instance Read DisplayModeCreateFlagsKHR where
  readPrec = parens (choose []
                     +++
                     prec 10 (do
                       expectP (Ident "DisplayModeCreateFlagsKHR")
                       v <- step readPrec
                       pure (DisplayModeCreateFlagsKHR v)))


-- | VkDisplaySurfaceCreateFlagsKHR - Reserved for future use
--
-- = Description
--
-- 'DisplaySurfaceCreateFlagsKHR' is a bitmask type for setting a mask, but
-- is currently reserved for future use.
--
-- = See Also
--
-- 'DisplaySurfaceCreateInfoKHR'
newtype DisplaySurfaceCreateFlagsKHR = DisplaySurfaceCreateFlagsKHR Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits)



instance Show DisplaySurfaceCreateFlagsKHR where
  showsPrec p = \case
    DisplaySurfaceCreateFlagsKHR x -> showParen (p >= 11) (showString "DisplaySurfaceCreateFlagsKHR 0x" . showHex x)

instance Read DisplaySurfaceCreateFlagsKHR where
  readPrec = parens (choose []
                     +++
                     prec 10 (do
                       expectP (Ident "DisplaySurfaceCreateFlagsKHR")
                       v <- step readPrec
                       pure (DisplaySurfaceCreateFlagsKHR v)))


-- | VkDisplayPlaneAlphaFlagBitsKHR - Alpha blending type
--
-- = See Also
--
-- 'DisplayPlaneAlphaFlagsKHR', 'DisplaySurfaceCreateInfoKHR'
newtype DisplayPlaneAlphaFlagBitsKHR = DisplayPlaneAlphaFlagBitsKHR Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits)

-- | 'DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR' specifies that the source image
-- will be treated as opaque.
pattern DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR = DisplayPlaneAlphaFlagBitsKHR 0x00000001
-- | 'DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR' specifies that a global alpha value
-- /must/ be specified that will be applied to all pixels in the source
-- image.
pattern DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR = DisplayPlaneAlphaFlagBitsKHR 0x00000002
-- | 'DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR' specifies that the alpha value
-- will be determined by the alpha channel of the source image’s pixels. If
-- the source format contains no alpha values, no blending will be applied.
-- The source alpha values are not premultiplied into the source image’s
-- other color channels.
pattern DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR = DisplayPlaneAlphaFlagBitsKHR 0x00000004
-- | 'DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR' is equivalent to
-- 'DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR', except the source alpha values
-- are assumed to be premultiplied into the source image’s other color
-- channels.
pattern DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR = DisplayPlaneAlphaFlagBitsKHR 0x00000008

type DisplayPlaneAlphaFlagsKHR = DisplayPlaneAlphaFlagBitsKHR

instance Show DisplayPlaneAlphaFlagBitsKHR where
  showsPrec p = \case
    DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR -> showString "DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR"
    DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR -> showString "DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR"
    DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR -> showString "DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR"
    DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR -> showString "DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR"
    DisplayPlaneAlphaFlagBitsKHR x -> showParen (p >= 11) (showString "DisplayPlaneAlphaFlagBitsKHR 0x" . showHex x)

instance Read DisplayPlaneAlphaFlagBitsKHR where
  readPrec = parens (choose [("DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR", pure DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR)
                            , ("DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR", pure DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR)
                            , ("DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR", pure DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR)
                            , ("DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR", pure DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR)]
                     +++
                     prec 10 (do
                       expectP (Ident "DisplayPlaneAlphaFlagBitsKHR")
                       v <- step readPrec
                       pure (DisplayPlaneAlphaFlagBitsKHR v)))


-- | VkSurfaceTransformFlagBitsKHR - presentation transforms supported on a
-- device
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.VK_QCOM_render_pass_transform.CommandBufferInheritanceRenderPassTransformInfoQCOM',
-- 'DisplaySurfaceCreateInfoKHR',
-- 'Graphics.Vulkan.Extensions.VK_QCOM_render_pass_transform.RenderPassTransformBeginInfoQCOM',
-- 'Graphics.Vulkan.Extensions.VK_EXT_display_surface_counter.SurfaceCapabilities2EXT',
-- 'Graphics.Vulkan.Extensions.VK_KHR_surface.SurfaceCapabilitiesKHR',
-- 'SurfaceTransformFlagsKHR',
-- 'Graphics.Vulkan.Extensions.VK_KHR_swapchain.SwapchainCreateInfoKHR'
newtype SurfaceTransformFlagBitsKHR = SurfaceTransformFlagBitsKHR Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits)

-- | 'SURFACE_TRANSFORM_IDENTITY_BIT_KHR' specifies that image content is
-- presented without being transformed.
pattern SURFACE_TRANSFORM_IDENTITY_BIT_KHR = SurfaceTransformFlagBitsKHR 0x00000001
-- | 'SURFACE_TRANSFORM_ROTATE_90_BIT_KHR' specifies that image content is
-- rotated 90 degrees clockwise.
pattern SURFACE_TRANSFORM_ROTATE_90_BIT_KHR = SurfaceTransformFlagBitsKHR 0x00000002
-- | 'SURFACE_TRANSFORM_ROTATE_180_BIT_KHR' specifies that image content is
-- rotated 180 degrees clockwise.
pattern SURFACE_TRANSFORM_ROTATE_180_BIT_KHR = SurfaceTransformFlagBitsKHR 0x00000004
-- | 'SURFACE_TRANSFORM_ROTATE_270_BIT_KHR' specifies that image content is
-- rotated 270 degrees clockwise.
pattern SURFACE_TRANSFORM_ROTATE_270_BIT_KHR = SurfaceTransformFlagBitsKHR 0x00000008
-- | 'SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR' specifies that image
-- content is mirrored horizontally.
pattern SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR = SurfaceTransformFlagBitsKHR 0x00000010
-- | 'SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR' specifies that
-- image content is mirrored horizontally, then rotated 90 degrees
-- clockwise.
pattern SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR = SurfaceTransformFlagBitsKHR 0x00000020
-- | 'SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR' specifies that
-- image content is mirrored horizontally, then rotated 180 degrees
-- clockwise.
pattern SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR = SurfaceTransformFlagBitsKHR 0x00000040
-- | 'SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR' specifies that
-- image content is mirrored horizontally, then rotated 270 degrees
-- clockwise.
pattern SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR = SurfaceTransformFlagBitsKHR 0x00000080
-- | 'SURFACE_TRANSFORM_INHERIT_BIT_KHR' specifies that the presentation
-- transform is not specified, and is instead determined by
-- platform-specific considerations and mechanisms outside Vulkan.
pattern SURFACE_TRANSFORM_INHERIT_BIT_KHR = SurfaceTransformFlagBitsKHR 0x00000100

type SurfaceTransformFlagsKHR = SurfaceTransformFlagBitsKHR

instance Show SurfaceTransformFlagBitsKHR where
  showsPrec p = \case
    SURFACE_TRANSFORM_IDENTITY_BIT_KHR -> showString "SURFACE_TRANSFORM_IDENTITY_BIT_KHR"
    SURFACE_TRANSFORM_ROTATE_90_BIT_KHR -> showString "SURFACE_TRANSFORM_ROTATE_90_BIT_KHR"
    SURFACE_TRANSFORM_ROTATE_180_BIT_KHR -> showString "SURFACE_TRANSFORM_ROTATE_180_BIT_KHR"
    SURFACE_TRANSFORM_ROTATE_270_BIT_KHR -> showString "SURFACE_TRANSFORM_ROTATE_270_BIT_KHR"
    SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR -> showString "SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR"
    SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR -> showString "SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR"
    SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR -> showString "SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR"
    SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR -> showString "SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR"
    SURFACE_TRANSFORM_INHERIT_BIT_KHR -> showString "SURFACE_TRANSFORM_INHERIT_BIT_KHR"
    SurfaceTransformFlagBitsKHR x -> showParen (p >= 11) (showString "SurfaceTransformFlagBitsKHR 0x" . showHex x)

instance Read SurfaceTransformFlagBitsKHR where
  readPrec = parens (choose [("SURFACE_TRANSFORM_IDENTITY_BIT_KHR", pure SURFACE_TRANSFORM_IDENTITY_BIT_KHR)
                            , ("SURFACE_TRANSFORM_ROTATE_90_BIT_KHR", pure SURFACE_TRANSFORM_ROTATE_90_BIT_KHR)
                            , ("SURFACE_TRANSFORM_ROTATE_180_BIT_KHR", pure SURFACE_TRANSFORM_ROTATE_180_BIT_KHR)
                            , ("SURFACE_TRANSFORM_ROTATE_270_BIT_KHR", pure SURFACE_TRANSFORM_ROTATE_270_BIT_KHR)
                            , ("SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR", pure SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR)
                            , ("SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR", pure SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR)
                            , ("SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR", pure SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR)
                            , ("SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR", pure SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR)
                            , ("SURFACE_TRANSFORM_INHERIT_BIT_KHR", pure SURFACE_TRANSFORM_INHERIT_BIT_KHR)]
                     +++
                     prec 10 (do
                       expectP (Ident "SurfaceTransformFlagBitsKHR")
                       v <- step readPrec
                       pure (SurfaceTransformFlagBitsKHR v)))


type KHR_DISPLAY_SPEC_VERSION = 23

-- No documentation found for TopLevel "VK_KHR_DISPLAY_SPEC_VERSION"
pattern KHR_DISPLAY_SPEC_VERSION :: forall a . Integral a => a
pattern KHR_DISPLAY_SPEC_VERSION = 23


type KHR_DISPLAY_EXTENSION_NAME = "VK_KHR_display"

-- No documentation found for TopLevel "VK_KHR_DISPLAY_EXTENSION_NAME"
pattern KHR_DISPLAY_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern KHR_DISPLAY_EXTENSION_NAME = "VK_KHR_display"
