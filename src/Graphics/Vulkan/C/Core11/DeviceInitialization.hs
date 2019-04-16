{-# language Strict #-}
{-# language CPP #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}

module Graphics.Vulkan.C.Core11.DeviceInitialization
  ( 
#if defined(EXPOSE_CORE11_COMMANDS)
  vkEnumerateInstanceVersion
  , 
#endif
  FN_vkEnumerateInstanceVersion
  , PFN_vkEnumerateInstanceVersion
  ) where

import Data.Word
  ( Word32
  )
import Foreign.Ptr
  ( FunPtr
  , Ptr
  )


import Graphics.Vulkan.C.Core10.Core
  ( VkResult(..)
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


#if defined(EXPOSE_CORE11_COMMANDS)
-- No documentation found for TopLevel "vkEnumerateInstanceVersion"
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkEnumerateInstanceVersion" vkEnumerateInstanceVersion :: ("pApiVersion" ::: Ptr Word32) -> IO VkResult

#endif
type FN_vkEnumerateInstanceVersion = ("pApiVersion" ::: Ptr Word32) -> IO VkResult
type PFN_vkEnumerateInstanceVersion = FunPtr FN_vkEnumerateInstanceVersion