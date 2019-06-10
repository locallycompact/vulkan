{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_EXT_calibrated_timestamps
  ( VkCalibratedTimestampInfoEXT(..)
  , VkTimeDomainEXT(..)
  , pattern VK_TIME_DOMAIN_DEVICE_EXT
  , pattern VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT
  , pattern VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT
  , pattern VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT
  , FN_vkGetCalibratedTimestampsEXT
  , PFN_vkGetCalibratedTimestampsEXT
  , vkGetCalibratedTimestampsEXT
  , FN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT
  , PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT
  , vkGetPhysicalDeviceCalibrateableTimeDomainsEXT
  , pattern VK_EXT_CALIBRATED_TIMESTAMPS_EXTENSION_NAME
  , pattern VK_EXT_CALIBRATED_TIMESTAMPS_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_EXT
  ) where

import Data.Int
  ( Int32
  )
import Data.String
  ( IsString
  )
import Data.Word
  ( Word32
  , Word64
  )
import Foreign.Ptr
  ( FunPtr
  , Ptr
  , plusPtr
  )
import Foreign.Storable
  ( Storable
  , Storable(..)
  )
import GHC.Read
  ( choose
  , expectP
  )
import Text.ParserCombinators.ReadPrec
  ( (+++)
  , prec
  , step
  )
import Text.Read
  ( Read(..)
  , parens
  )
import Text.Read.Lex
  ( Lexeme(Ident)
  )


import Graphics.Vulkan.C.Core10.Core
  ( VkResult(..)
  , VkStructureType(..)
  , Zero(..)
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkDevice
  , VkPhysicalDevice
  )
import Graphics.Vulkan.C.Dynamic
  ( DeviceCmds(..)
  , InstanceCmds(..)
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- No documentation found for TopLevel "VkCalibratedTimestampInfoEXT"
data VkCalibratedTimestampInfoEXT = VkCalibratedTimestampInfoEXT
  { -- No documentation found for Nested "VkCalibratedTimestampInfoEXT" "sType"
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkCalibratedTimestampInfoEXT" "pNext"
  vkPNext :: Ptr ()
  , -- No documentation found for Nested "VkCalibratedTimestampInfoEXT" "timeDomain"
  vkTimeDomain :: VkTimeDomainEXT
  }
  deriving (Eq, Show)

instance Storable VkCalibratedTimestampInfoEXT where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkCalibratedTimestampInfoEXT <$> peek (ptr `plusPtr` 0)
                                          <*> peek (ptr `plusPtr` 8)
                                          <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkCalibratedTimestampInfoEXT))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkCalibratedTimestampInfoEXT))
                *> poke (ptr `plusPtr` 16) (vkTimeDomain (poked :: VkCalibratedTimestampInfoEXT))

instance Zero VkCalibratedTimestampInfoEXT where
  zero = VkCalibratedTimestampInfoEXT VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_EXT
                                      zero
                                      zero

-- ** VkTimeDomainEXT

-- No documentation found for TopLevel "VkTimeDomainEXT"
newtype VkTimeDomainEXT = VkTimeDomainEXT Int32
  deriving (Eq, Ord, Storable, Zero)

instance Show VkTimeDomainEXT where
  showsPrec _ VK_TIME_DOMAIN_DEVICE_EXT = showString "VK_TIME_DOMAIN_DEVICE_EXT"
  showsPrec _ VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT = showString "VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT"
  showsPrec _ VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT = showString "VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT"
  showsPrec _ VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT = showString "VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT"
  showsPrec p (VkTimeDomainEXT x) = showParen (p >= 11) (showString "VkTimeDomainEXT " . showsPrec 11 x)

instance Read VkTimeDomainEXT where
  readPrec = parens ( choose [ ("VK_TIME_DOMAIN_DEVICE_EXT",                    pure VK_TIME_DOMAIN_DEVICE_EXT)
                             , ("VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT",           pure VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT)
                             , ("VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT",       pure VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT)
                             , ("VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT", pure VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkTimeDomainEXT")
                        v <- step readPrec
                        pure (VkTimeDomainEXT v)
                        )
                    )

-- No documentation found for Nested "VkTimeDomainEXT" "VK_TIME_DOMAIN_DEVICE_EXT"
pattern VK_TIME_DOMAIN_DEVICE_EXT :: VkTimeDomainEXT
pattern VK_TIME_DOMAIN_DEVICE_EXT = VkTimeDomainEXT 0

-- No documentation found for Nested "VkTimeDomainEXT" "VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT"
pattern VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT :: VkTimeDomainEXT
pattern VK_TIME_DOMAIN_CLOCK_MONOTONIC_EXT = VkTimeDomainEXT 1

-- No documentation found for Nested "VkTimeDomainEXT" "VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT"
pattern VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT :: VkTimeDomainEXT
pattern VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW_EXT = VkTimeDomainEXT 2

-- No documentation found for Nested "VkTimeDomainEXT" "VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT"
pattern VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT :: VkTimeDomainEXT
pattern VK_TIME_DOMAIN_QUERY_PERFORMANCE_COUNTER_EXT = VkTimeDomainEXT 3

-- No documentation found for TopLevel "vkGetCalibratedTimestampsEXT"
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetCalibratedTimestampsEXT" vkGetCalibratedTimestampsEXT :: ("device" ::: VkDevice) -> ("timestampCount" ::: Word32) -> ("pTimestampInfos" ::: Ptr VkCalibratedTimestampInfoEXT) -> ("pTimestamps" ::: Ptr Word64) -> ("pMaxDeviation" ::: Ptr Word64) -> IO VkResult
#else
vkGetCalibratedTimestampsEXT :: DeviceCmds -> ("device" ::: VkDevice) -> ("timestampCount" ::: Word32) -> ("pTimestampInfos" ::: Ptr VkCalibratedTimestampInfoEXT) -> ("pTimestamps" ::: Ptr Word64) -> ("pMaxDeviation" ::: Ptr Word64) -> IO VkResult
vkGetCalibratedTimestampsEXT deviceCmds = mkVkGetCalibratedTimestampsEXT (pVkGetCalibratedTimestampsEXT deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetCalibratedTimestampsEXT
  :: FunPtr (("device" ::: VkDevice) -> ("timestampCount" ::: Word32) -> ("pTimestampInfos" ::: Ptr VkCalibratedTimestampInfoEXT) -> ("pTimestamps" ::: Ptr Word64) -> ("pMaxDeviation" ::: Ptr Word64) -> IO VkResult) -> (("device" ::: VkDevice) -> ("timestampCount" ::: Word32) -> ("pTimestampInfos" ::: Ptr VkCalibratedTimestampInfoEXT) -> ("pTimestamps" ::: Ptr Word64) -> ("pMaxDeviation" ::: Ptr Word64) -> IO VkResult)
#endif

type FN_vkGetCalibratedTimestampsEXT = ("device" ::: VkDevice) -> ("timestampCount" ::: Word32) -> ("pTimestampInfos" ::: Ptr VkCalibratedTimestampInfoEXT) -> ("pTimestamps" ::: Ptr Word64) -> ("pMaxDeviation" ::: Ptr Word64) -> IO VkResult
type PFN_vkGetCalibratedTimestampsEXT = FunPtr FN_vkGetCalibratedTimestampsEXT

-- No documentation found for TopLevel "vkGetPhysicalDeviceCalibrateableTimeDomainsEXT"
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDeviceCalibrateableTimeDomainsEXT" vkGetPhysicalDeviceCalibrateableTimeDomainsEXT :: ("physicalDevice" ::: VkPhysicalDevice) -> ("pTimeDomainCount" ::: Ptr Word32) -> ("pTimeDomains" ::: Ptr VkTimeDomainEXT) -> IO VkResult
#else
vkGetPhysicalDeviceCalibrateableTimeDomainsEXT :: InstanceCmds -> ("physicalDevice" ::: VkPhysicalDevice) -> ("pTimeDomainCount" ::: Ptr Word32) -> ("pTimeDomains" ::: Ptr VkTimeDomainEXT) -> IO VkResult
vkGetPhysicalDeviceCalibrateableTimeDomainsEXT deviceCmds = mkVkGetPhysicalDeviceCalibrateableTimeDomainsEXT (pVkGetPhysicalDeviceCalibrateableTimeDomainsEXT deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceCalibrateableTimeDomainsEXT
  :: FunPtr (("physicalDevice" ::: VkPhysicalDevice) -> ("pTimeDomainCount" ::: Ptr Word32) -> ("pTimeDomains" ::: Ptr VkTimeDomainEXT) -> IO VkResult) -> (("physicalDevice" ::: VkPhysicalDevice) -> ("pTimeDomainCount" ::: Ptr Word32) -> ("pTimeDomains" ::: Ptr VkTimeDomainEXT) -> IO VkResult)
#endif

type FN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT = ("physicalDevice" ::: VkPhysicalDevice) -> ("pTimeDomainCount" ::: Ptr Word32) -> ("pTimeDomains" ::: Ptr VkTimeDomainEXT) -> IO VkResult
type PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT = FunPtr FN_vkGetPhysicalDeviceCalibrateableTimeDomainsEXT

-- No documentation found for TopLevel "VK_EXT_CALIBRATED_TIMESTAMPS_EXTENSION_NAME"
pattern VK_EXT_CALIBRATED_TIMESTAMPS_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern VK_EXT_CALIBRATED_TIMESTAMPS_EXTENSION_NAME = "VK_EXT_calibrated_timestamps"

-- No documentation found for TopLevel "VK_EXT_CALIBRATED_TIMESTAMPS_SPEC_VERSION"
pattern VK_EXT_CALIBRATED_TIMESTAMPS_SPEC_VERSION :: Integral a => a
pattern VK_EXT_CALIBRATED_TIMESTAMPS_SPEC_VERSION = 1

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_EXT"
pattern VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_EXT :: VkStructureType
pattern VK_STRUCTURE_TYPE_CALIBRATED_TIMESTAMP_INFO_EXT = VkStructureType 1000184000
