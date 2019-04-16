{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_NV_corner_sampled_image
  ( VkPhysicalDeviceCornerSampledImageFeaturesNV(..)
  , pattern VK_IMAGE_CREATE_CORNER_SAMPLED_BIT_NV
  , pattern VK_NV_CORNER_SAMPLED_IMAGE_EXTENSION_NAME
  , pattern VK_NV_CORNER_SAMPLED_IMAGE_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV
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
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkImageCreateFlagBits(..)
  )


-- No documentation found for TopLevel "VkPhysicalDeviceCornerSampledImageFeaturesNV"
data VkPhysicalDeviceCornerSampledImageFeaturesNV = VkPhysicalDeviceCornerSampledImageFeaturesNV
  { -- No documentation found for Nested "VkPhysicalDeviceCornerSampledImageFeaturesNV" "sType"
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkPhysicalDeviceCornerSampledImageFeaturesNV" "pNext"
  vkPNext :: Ptr ()
  , -- No documentation found for Nested "VkPhysicalDeviceCornerSampledImageFeaturesNV" "cornerSampledImage"
  vkCornerSampledImage :: VkBool32
  }
  deriving (Eq, Show)

instance Storable VkPhysicalDeviceCornerSampledImageFeaturesNV where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkPhysicalDeviceCornerSampledImageFeaturesNV <$> peek (ptr `plusPtr` 0)
                                                          <*> peek (ptr `plusPtr` 8)
                                                          <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkPhysicalDeviceCornerSampledImageFeaturesNV))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkPhysicalDeviceCornerSampledImageFeaturesNV))
                *> poke (ptr `plusPtr` 16) (vkCornerSampledImage (poked :: VkPhysicalDeviceCornerSampledImageFeaturesNV))
-- No documentation found for Nested "VkImageCreateFlagBits" "VK_IMAGE_CREATE_CORNER_SAMPLED_BIT_NV"
pattern VK_IMAGE_CREATE_CORNER_SAMPLED_BIT_NV :: VkImageCreateFlagBits
pattern VK_IMAGE_CREATE_CORNER_SAMPLED_BIT_NV = VkImageCreateFlagBits 0x00002000
-- No documentation found for TopLevel "VK_NV_CORNER_SAMPLED_IMAGE_EXTENSION_NAME"
pattern VK_NV_CORNER_SAMPLED_IMAGE_EXTENSION_NAME :: (Eq a ,IsString a) => a
pattern VK_NV_CORNER_SAMPLED_IMAGE_EXTENSION_NAME = "VK_NV_corner_sampled_image"
-- No documentation found for TopLevel "VK_NV_CORNER_SAMPLED_IMAGE_SPEC_VERSION"
pattern VK_NV_CORNER_SAMPLED_IMAGE_SPEC_VERSION :: Integral a => a
pattern VK_NV_CORNER_SAMPLED_IMAGE_SPEC_VERSION = 2
-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV"
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV :: VkStructureType
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV = VkStructureType 1000050000