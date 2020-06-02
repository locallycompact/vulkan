{-# language CPP #-}
module Vulkan.Core10.ImageView  ( ComponentMapping
                                , ImageSubresourceRange
                                , ImageViewCreateInfo
                                ) where

import Data.Kind (Type)
import {-# SOURCE #-} Vulkan.CStruct.Extends (Chain)
import {-# SOURCE #-} Vulkan.CStruct.Extends (Extendss)
import Vulkan.CStruct (FromCStruct)
import {-# SOURCE #-} Vulkan.CStruct.Extends (PeekChain)
import {-# SOURCE #-} Vulkan.CStruct.Extends (PokeChain)
import Vulkan.CStruct (ToCStruct)
data ComponentMapping

instance ToCStruct ComponentMapping
instance Show ComponentMapping

instance FromCStruct ComponentMapping


data ImageSubresourceRange

instance ToCStruct ImageSubresourceRange
instance Show ImageSubresourceRange

instance FromCStruct ImageSubresourceRange


type role ImageViewCreateInfo nominal
data ImageViewCreateInfo (es :: [Type])

instance (Extendss ImageViewCreateInfo es, PokeChain es) => ToCStruct (ImageViewCreateInfo es)
instance Show (Chain es) => Show (ImageViewCreateInfo es)

instance (Extendss ImageViewCreateInfo es, PeekChain es) => FromCStruct (ImageViewCreateInfo es)

