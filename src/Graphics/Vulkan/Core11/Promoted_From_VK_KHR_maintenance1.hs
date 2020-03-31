{-# language CPP #-}
module Graphics.Vulkan.Core11.Promoted_From_VK_KHR_maintenance1  ( trimCommandPool
                                                                 , CommandPoolTrimFlags(..)
                                                                 , Result(..)
                                                                 , ImageCreateFlagBits(..)
                                                                 , ImageCreateFlags
                                                                 , FormatFeatureFlagBits(..)
                                                                 , FormatFeatureFlags
                                                                 ) where

import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import Graphics.Vulkan.Core10.Handles (CommandPool)
import Graphics.Vulkan.Core10.Handles (CommandPool(..))
import Graphics.Vulkan.Core11.Enums.CommandPoolTrimFlags (CommandPoolTrimFlags)
import Graphics.Vulkan.Core11.Enums.CommandPoolTrimFlags (CommandPoolTrimFlags(..))
import Graphics.Vulkan.Core10.Handles (Device)
import Graphics.Vulkan.Core10.Handles (Device(..))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkTrimCommandPool))
import Graphics.Vulkan.Core10.Handles (Device_T)
import Graphics.Vulkan.Core11.Enums.CommandPoolTrimFlags (CommandPoolTrimFlags(..))
import Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits (FormatFeatureFlagBits(..))
import Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits (FormatFeatureFlags)
import Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits (ImageCreateFlagBits(..))
import Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits (ImageCreateFlags)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkTrimCommandPool
  :: FunPtr (Ptr Device_T -> CommandPool -> CommandPoolTrimFlags -> IO ()) -> Ptr Device_T -> CommandPool -> CommandPoolTrimFlags -> IO ()

-- | vkTrimCommandPool - Trim a command pool
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     owns the command pool.
--
-- -   'Graphics.Vulkan.Core10.Handles.CommandPool' is the command pool to
--     trim.
--
-- -   'Graphics.Vulkan.Core10.BaseType.Flags' is reserved for future use.
--
-- = Description
--
-- Trimming a command pool recycles unused memory from the command pool
-- back to the system. Command buffers allocated from the pool are not
-- affected by the command.
--
-- Note
--
-- This command provides applications with some control over the internal
-- memory allocations used by command pools.
--
-- Unused memory normally arises from command buffers that have been
-- recorded and later reset, such that they are no longer using the memory.
-- On reset, a command buffer can return memory to its command pool, but
-- the only way to release memory from a command pool to the system
-- requires calling 'Graphics.Vulkan.Core10.CommandPool.resetCommandPool',
-- which cannot be executed while any command buffers from that pool are
-- still in use. Subsequent recording operations into command buffers will
-- re-use this memory but since total memory requirements fluctuate over
-- time, unused memory can accumulate.
--
-- In this situation, trimming a command pool /may/ be useful to return
-- unused memory back to the system, returning the total outstanding memory
-- allocated by the pool back to a more “average” value.
--
-- Implementations utilize many internal allocation strategies that make it
-- impossible to guarantee that all unused memory is released back to the
-- system. For instance, an implementation of a command pool /may/ involve
-- allocating memory in bulk from the system and sub-allocating from that
-- memory. In such an implementation any live command buffer that holds a
-- reference to a bulk allocation would prevent that allocation from being
-- freed, even if only a small proportion of the bulk allocation is in use.
--
-- In most cases trimming will result in a reduction in allocated but
-- unused memory, but it does not guarantee the “ideal” behavior.
--
-- Trimming /may/ be an expensive operation, and /should/ not be called
-- frequently. Trimming /should/ be treated as a way to relieve memory
-- pressure after application-known points when there exists enough unused
-- memory that the cost of trimming is “worth” it.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   'Graphics.Vulkan.Core10.Handles.CommandPool' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.CommandPool' handle
--
-- -   'Graphics.Vulkan.Core10.BaseType.Flags' /must/ be @0@
--
-- -   'Graphics.Vulkan.Core10.Handles.CommandPool' /must/ have been
--     created, allocated, or retrieved from
--     'Graphics.Vulkan.Core10.Handles.Device'
--
-- == Host Synchronization
--
-- -   Host access to 'Graphics.Vulkan.Core10.Handles.CommandPool' /must/
--     be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.CommandPool',
-- 'Graphics.Vulkan.Core11.Enums.CommandPoolTrimFlags.CommandPoolTrimFlags',
-- 'Graphics.Vulkan.Core10.Handles.Device'
trimCommandPool :: Device -> CommandPool -> CommandPoolTrimFlags -> IO ()
trimCommandPool device commandPool flags = do
  let vkTrimCommandPool' = mkVkTrimCommandPool (pVkTrimCommandPool (deviceCmds (device :: Device)))
  vkTrimCommandPool' (deviceHandle (device)) (commandPool) (flags)
  pure $ ()
