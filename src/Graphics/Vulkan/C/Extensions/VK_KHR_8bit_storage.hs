{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_KHR_8bit_storage
  ( VkPhysicalDevice8BitStorageFeaturesKHR(..)
  , pattern VK_KHR_8BIT_STORAGE_EXTENSION_NAME
  , pattern VK_KHR_8BIT_STORAGE_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES_KHR
  ) where

import Data.String
  ( IsString
  )
import Foreign.Ptr
  ( Ptr
  , plusPtr
  )
import Foreign.Storable
  ( Storable
  , Storable(..)
  )


import Graphics.Vulkan.C.Core10.Core
  ( VkBool32(..)
  , VkStructureType(..)
  )


-- No documentation found for TopLevel "VkPhysicalDevice8BitStorageFeaturesKHR"
data VkPhysicalDevice8BitStorageFeaturesKHR = VkPhysicalDevice8BitStorageFeaturesKHR
  { -- No documentation found for Nested "VkPhysicalDevice8BitStorageFeaturesKHR" "sType"
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkPhysicalDevice8BitStorageFeaturesKHR" "pNext"
  vkPNext :: Ptr ()
  , -- No documentation found for Nested "VkPhysicalDevice8BitStorageFeaturesKHR" "storageBuffer8BitAccess"
  vkStorageBuffer8BitAccess :: VkBool32
  , -- No documentation found for Nested "VkPhysicalDevice8BitStorageFeaturesKHR" "uniformAndStorageBuffer8BitAccess"
  vkUniformAndStorageBuffer8BitAccess :: VkBool32
  , -- No documentation found for Nested "VkPhysicalDevice8BitStorageFeaturesKHR" "storagePushConstant8"
  vkStoragePushConstant8 :: VkBool32
  }
  deriving (Eq, Show)

instance Storable VkPhysicalDevice8BitStorageFeaturesKHR where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek ptr = VkPhysicalDevice8BitStorageFeaturesKHR <$> peek (ptr `plusPtr` 0)
                                                    <*> peek (ptr `plusPtr` 8)
                                                    <*> peek (ptr `plusPtr` 16)
                                                    <*> peek (ptr `plusPtr` 20)
                                                    <*> peek (ptr `plusPtr` 24)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkPhysicalDevice8BitStorageFeaturesKHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkPhysicalDevice8BitStorageFeaturesKHR))
                *> poke (ptr `plusPtr` 16) (vkStorageBuffer8BitAccess (poked :: VkPhysicalDevice8BitStorageFeaturesKHR))
                *> poke (ptr `plusPtr` 20) (vkUniformAndStorageBuffer8BitAccess (poked :: VkPhysicalDevice8BitStorageFeaturesKHR))
                *> poke (ptr `plusPtr` 24) (vkStoragePushConstant8 (poked :: VkPhysicalDevice8BitStorageFeaturesKHR))
-- No documentation found for TopLevel "VK_KHR_8BIT_STORAGE_EXTENSION_NAME"
pattern VK_KHR_8BIT_STORAGE_EXTENSION_NAME :: (Eq a ,IsString a) => a
pattern VK_KHR_8BIT_STORAGE_EXTENSION_NAME = "VK_KHR_8bit_storage"
-- No documentation found for TopLevel "VK_KHR_8BIT_STORAGE_SPEC_VERSION"
pattern VK_KHR_8BIT_STORAGE_SPEC_VERSION :: Integral a => a
pattern VK_KHR_8BIT_STORAGE_SPEC_VERSION = 1
-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES_KHR"
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES_KHR = VkStructureType 1000177000