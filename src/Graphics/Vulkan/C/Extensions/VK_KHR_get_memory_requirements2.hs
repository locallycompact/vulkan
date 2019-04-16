{-# language Strict #-}
{-# language CPP #-}
{-# language PatternSynonyms #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_KHR_get_memory_requirements2
  ( VkBufferMemoryRequirementsInfo2KHR
  , pattern VkBufferMemoryRequirementsInfo2KHR
  , VkImageMemoryRequirementsInfo2KHR
  , pattern VkImageMemoryRequirementsInfo2KHR
  , VkImageSparseMemoryRequirementsInfo2KHR
  , pattern VkImageSparseMemoryRequirementsInfo2KHR
  , VkSparseImageMemoryRequirements2KHR
  , pattern VkSparseImageMemoryRequirements2KHR
#if defined(EXPOSE_CORE11_COMMANDS)
  , vkGetBufferMemoryRequirements2KHR
  , vkGetImageMemoryRequirements2KHR
  , vkGetImageSparseMemoryRequirements2KHR
#endif
  , pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME
  , pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2_KHR
  , pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2_KHR
  , pattern VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2_KHR
  , pattern VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2_KHR
  , pattern VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2_KHR
  , pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2
  , pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2
  , pattern VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2
  , pattern VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
  , pattern VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2
  , VkMemoryRequirements2KHR
  ) where

import Data.String
  ( IsString
  )

#if defined(EXPOSE_CORE11_COMMANDS)
import Data.Word
  ( Word32
  )
#endif
import Foreign.Ptr
  ( Ptr
  )


import Graphics.Vulkan.C.Core10.Core
  ( VkStructureType(..)
  )

#if defined(EXPOSE_CORE11_COMMANDS)
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkDevice
  )
#endif
import Graphics.Vulkan.C.Core10.MemoryManagement
  ( VkBuffer
  , VkImage
  )
import Graphics.Vulkan.C.Core10.SparseResourceMemoryManagement
  ( VkSparseImageMemoryRequirements(..)
  )
import Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_get_memory_requirements2
  ( VkBufferMemoryRequirementsInfo2(..)
  , VkImageMemoryRequirementsInfo2(..)
  , VkImageSparseMemoryRequirementsInfo2(..)
  , VkSparseImageMemoryRequirements2(..)
  , pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2
  , pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2
  , pattern VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2
  , pattern VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
  , pattern VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2
  )

#if defined(EXPOSE_CORE11_COMMANDS)
import Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_get_memory_requirements2
  ( vkGetBufferMemoryRequirements2
  , vkGetImageMemoryRequirements2
  , vkGetImageSparseMemoryRequirements2
  , VkMemoryRequirements2(..)
  )
#endif
import Graphics.Vulkan.NamedType
  ( (:::)
  )
import Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_get_memory_requirements2
  ( VkMemoryRequirements2KHR
  )


-- No documentation found for TopLevel "VkBufferMemoryRequirementsInfo2KHR"
type VkBufferMemoryRequirementsInfo2KHR = VkBufferMemoryRequirementsInfo2


-- No documentation found for TopLevel "VkBufferMemoryRequirementsInfo2KHR"
pattern VkBufferMemoryRequirementsInfo2KHR :: ("sType" ::: VkStructureType) -> ("pNext" ::: Ptr ()) -> ("buffer" ::: VkBuffer) -> VkBufferMemoryRequirementsInfo2KHR
pattern VkBufferMemoryRequirementsInfo2KHR vkSType vkPNext vkBuffer = VkBufferMemoryRequirementsInfo2 vkSType vkPNext vkBuffer
-- No documentation found for TopLevel "VkImageMemoryRequirementsInfo2KHR"
type VkImageMemoryRequirementsInfo2KHR = VkImageMemoryRequirementsInfo2


-- No documentation found for TopLevel "VkImageMemoryRequirementsInfo2KHR"
pattern VkImageMemoryRequirementsInfo2KHR :: ("sType" ::: VkStructureType) -> ("pNext" ::: Ptr ()) -> ("image" ::: VkImage) -> VkImageMemoryRequirementsInfo2KHR
pattern VkImageMemoryRequirementsInfo2KHR vkSType vkPNext vkImage = VkImageMemoryRequirementsInfo2 vkSType vkPNext vkImage
-- No documentation found for TopLevel "VkImageSparseMemoryRequirementsInfo2KHR"
type VkImageSparseMemoryRequirementsInfo2KHR = VkImageSparseMemoryRequirementsInfo2


-- No documentation found for TopLevel "VkImageSparseMemoryRequirementsInfo2KHR"
pattern VkImageSparseMemoryRequirementsInfo2KHR :: ("sType" ::: VkStructureType) -> ("pNext" ::: Ptr ()) -> ("image" ::: VkImage) -> VkImageSparseMemoryRequirementsInfo2KHR
pattern VkImageSparseMemoryRequirementsInfo2KHR vkSType vkPNext vkImage = VkImageSparseMemoryRequirementsInfo2 vkSType vkPNext vkImage
-- No documentation found for TopLevel "VkSparseImageMemoryRequirements2KHR"
type VkSparseImageMemoryRequirements2KHR = VkSparseImageMemoryRequirements2


-- No documentation found for TopLevel "VkSparseImageMemoryRequirements2KHR"
pattern VkSparseImageMemoryRequirements2KHR :: ("sType" ::: VkStructureType) -> ("pNext" ::: Ptr ()) -> ("memoryRequirements" ::: VkSparseImageMemoryRequirements) -> VkSparseImageMemoryRequirements2KHR
pattern VkSparseImageMemoryRequirements2KHR vkSType vkPNext vkMemoryRequirements = VkSparseImageMemoryRequirements2 vkSType vkPNext vkMemoryRequirements

#if defined(EXPOSE_CORE11_COMMANDS)
-- No documentation found for TopLevel "vkGetBufferMemoryRequirements2KHR"
vkGetBufferMemoryRequirements2KHR :: ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkBufferMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ()
vkGetBufferMemoryRequirements2KHR = vkGetBufferMemoryRequirements2
#endif

#if defined(EXPOSE_CORE11_COMMANDS)
-- No documentation found for TopLevel "vkGetImageMemoryRequirements2KHR"
vkGetImageMemoryRequirements2KHR :: ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageMemoryRequirementsInfo2) -> ("pMemoryRequirements" ::: Ptr VkMemoryRequirements2) -> IO ()
vkGetImageMemoryRequirements2KHR = vkGetImageMemoryRequirements2
#endif

#if defined(EXPOSE_CORE11_COMMANDS)
-- No documentation found for TopLevel "vkGetImageSparseMemoryRequirements2KHR"
vkGetImageSparseMemoryRequirements2KHR :: ("device" ::: VkDevice) -> ("pInfo" ::: Ptr VkImageSparseMemoryRequirementsInfo2) -> ("pSparseMemoryRequirementCount" ::: Ptr Word32) -> ("pSparseMemoryRequirements" ::: Ptr VkSparseImageMemoryRequirements2) -> IO ()
vkGetImageSparseMemoryRequirements2KHR = vkGetImageSparseMemoryRequirements2
#endif
-- No documentation found for TopLevel "VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME"
pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME :: (Eq a ,IsString a) => a
pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME = "VK_KHR_get_memory_requirements2"
-- No documentation found for TopLevel "VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION"
pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION :: Integral a => a
pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION = 1
-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2_KHR"
pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2_KHR = VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2
-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2_KHR"
pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2_KHR = VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2
-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2_KHR"
pattern VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2_KHR = VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2
-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2_KHR"
pattern VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2_KHR = VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2
-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2_KHR"
pattern VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2_KHR = VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2