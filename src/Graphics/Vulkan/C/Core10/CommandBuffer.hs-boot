{-# language Strict #-}
{-# language CPP #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}

module Graphics.Vulkan.C.Core10.CommandBuffer
  ( VkCommandBufferAllocateInfo
  , VkCommandBufferBeginInfo
  , VkCommandBufferInheritanceInfo
  , VkCommandBufferLevel
  , VkCommandBufferResetFlagBits
  , VkCommandBufferResetFlags
  , VkCommandBufferUsageFlagBits
  , VkCommandBufferUsageFlags
  , VkQueryControlFlagBits
  , VkQueryControlFlags
  , FN_vkAllocateCommandBuffers
  , PFN_vkAllocateCommandBuffers
  , FN_vkBeginCommandBuffer
  , PFN_vkBeginCommandBuffer
  , FN_vkEndCommandBuffer
  , PFN_vkEndCommandBuffer
  , FN_vkFreeCommandBuffers
  , PFN_vkFreeCommandBuffers
  , FN_vkResetCommandBuffer
  , PFN_vkResetCommandBuffer
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
import {-# source #-} Graphics.Vulkan.C.Core10.CommandPool
  ( VkCommandPool
  )
import {-# source #-} Graphics.Vulkan.C.Core10.Core
  ( VkResult
  )
import {-# source #-} Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkDevice
  )
import {-# source #-} Graphics.Vulkan.C.Core10.Queue
  ( VkCommandBuffer
  )


data VkCommandBufferAllocateInfo

data VkCommandBufferBeginInfo

data VkCommandBufferInheritanceInfo

data VkCommandBufferLevel

data VkCommandBufferResetFlagBits

-- No documentation found for TopLevel "VkCommandBufferResetFlags"
type VkCommandBufferResetFlags = VkCommandBufferResetFlagBits

data VkCommandBufferUsageFlagBits

-- No documentation found for TopLevel "VkCommandBufferUsageFlags"
type VkCommandBufferUsageFlags = VkCommandBufferUsageFlagBits

data VkQueryControlFlagBits

-- No documentation found for TopLevel "VkQueryControlFlags"
type VkQueryControlFlags = VkQueryControlFlagBits

type FN_vkAllocateCommandBuffers = ("device" ::: VkDevice) -> ("pAllocateInfo" ::: Ptr VkCommandBufferAllocateInfo) -> ("pCommandBuffers" ::: Ptr VkCommandBuffer) -> IO VkResult
type PFN_vkAllocateCommandBuffers = FunPtr FN_vkAllocateCommandBuffers

type FN_vkBeginCommandBuffer = ("commandBuffer" ::: VkCommandBuffer) -> ("pBeginInfo" ::: Ptr VkCommandBufferBeginInfo) -> IO VkResult
type PFN_vkBeginCommandBuffer = FunPtr FN_vkBeginCommandBuffer

type FN_vkEndCommandBuffer = ("commandBuffer" ::: VkCommandBuffer) -> IO VkResult
type PFN_vkEndCommandBuffer = FunPtr FN_vkEndCommandBuffer

type FN_vkFreeCommandBuffers = ("device" ::: VkDevice) -> ("commandPool" ::: VkCommandPool) -> ("commandBufferCount" ::: Word32) -> ("pCommandBuffers" ::: Ptr VkCommandBuffer) -> IO ()
type PFN_vkFreeCommandBuffers = FunPtr FN_vkFreeCommandBuffers

type FN_vkResetCommandBuffer = ("commandBuffer" ::: VkCommandBuffer) -> ("flags" ::: VkCommandBufferResetFlags) -> IO VkResult
type PFN_vkResetCommandBuffer = FunPtr FN_vkResetCommandBuffer
