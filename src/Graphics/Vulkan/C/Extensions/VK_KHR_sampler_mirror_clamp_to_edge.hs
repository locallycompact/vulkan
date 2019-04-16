{-# language Strict #-}
{-# language CPP #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_KHR_sampler_mirror_clamp_to_edge
  ( pattern VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_EXTENSION_NAME
  , pattern VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_SPEC_VERSION
  , pattern VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE
  ) where

import Data.String
  ( IsString
  )


import Graphics.Vulkan.C.Core10.Sampler
  ( VkSamplerAddressMode(..)
  )


-- No documentation found for TopLevel "VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_EXTENSION_NAME"
pattern VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_EXTENSION_NAME :: (Eq a ,IsString a) => a
pattern VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_EXTENSION_NAME = "VK_KHR_sampler_mirror_clamp_to_edge"
-- No documentation found for TopLevel "VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_SPEC_VERSION"
pattern VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_SPEC_VERSION :: Integral a => a
pattern VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_SPEC_VERSION = 1
-- No documentation found for Nested "VkSamplerAddressMode" "VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE"
pattern VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE :: VkSamplerAddressMode
pattern VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE = VkSamplerAddressMode 4