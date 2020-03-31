{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_EXT_external_memory_host  ( getMemoryHostPointerPropertiesEXT
                                                               , ImportMemoryHostPointerInfoEXT(..)
                                                               , MemoryHostPointerPropertiesEXT(..)
                                                               , PhysicalDeviceExternalMemoryHostPropertiesEXT(..)
                                                               , EXT_EXTERNAL_MEMORY_HOST_SPEC_VERSION
                                                               , pattern EXT_EXTERNAL_MEMORY_HOST_SPEC_VERSION
                                                               , EXT_EXTERNAL_MEMORY_HOST_EXTENSION_NAME
                                                               , pattern EXT_EXTERNAL_MEMORY_HOST_EXTENSION_NAME
                                                               , ExternalMemoryHandleTypeFlagsKHR
                                                               , ExternalMemoryHandleTypeFlagBitsKHR
                                                               ) where

import Foreign.Marshal.Alloc (allocaBytesAligned)
import GHC.Base (when)
import GHC.IO (throwIO)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Data.String (IsString)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import Data.Word (Word32)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Core10.Handles (Device)
import Graphics.Vulkan.Core10.Handles (Device(..))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkGetMemoryHostPointerPropertiesEXT))
import Graphics.Vulkan.Core10.BaseType (DeviceSize)
import Graphics.Vulkan.Core10.Handles (Device_T)
import Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits (ExternalMemoryHandleTypeFlagBits)
import Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits (ExternalMemoryHandleTypeFlagBits(..))
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_IMPORT_MEMORY_HOST_POINTER_INFO_EXT))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_MEMORY_HOST_POINTER_PROPERTIES_EXT))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_HOST_PROPERTIES_EXT))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
import Graphics.Vulkan.Extensions.VK_KHR_external_memory_capabilities (ExternalMemoryHandleTypeFlagBitsKHR)
import Graphics.Vulkan.Extensions.VK_KHR_external_memory_capabilities (ExternalMemoryHandleTypeFlagsKHR)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetMemoryHostPointerPropertiesEXT
  :: FunPtr (Ptr Device_T -> ExternalMemoryHandleTypeFlagBits -> Ptr () -> Ptr MemoryHostPointerPropertiesEXT -> IO Result) -> Ptr Device_T -> ExternalMemoryHandleTypeFlagBits -> Ptr () -> Ptr MemoryHostPointerPropertiesEXT -> IO Result

-- | vkGetMemoryHostPointerPropertiesEXT - Get properties of external memory
-- host pointer
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     will be importing @pHostPointer@.
--
-- -   @handleType@ is the type of the handle @pHostPointer@.
--
-- -   @pHostPointer@ is the host pointer to import from.
--
-- -   @pMemoryHostPointerProperties@ is a pointer to a
--     'MemoryHostPointerPropertiesEXT' structure in which the host pointer
--     properties are returned.
--
-- == Valid Usage
--
-- -   @handleType@ /must/ be
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT'
--     or
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_HOST_MAPPED_FOREIGN_MEMORY_BIT_EXT'
--
-- -   @pHostPointer@ /must/ be a pointer aligned to an integer multiple of
--     'PhysicalDeviceExternalMemoryHostPropertiesEXT'::@minImportedHostPointerAlignment@
--
-- -   If @handleType@ is
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT',
--     @pHostPointer@ /must/ be a pointer to host memory
--
-- -   If @handleType@ is
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_HOST_MAPPED_FOREIGN_MEMORY_BIT_EXT',
--     @pHostPointer@ /must/ be a pointer to host mapped foreign memory
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   @handleType@ /must/ be a valid
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.ExternalMemoryHandleTypeFlagBits'
--     value
--
-- -   @pMemoryHostPointerProperties@ /must/ be a valid pointer to a
--     'MemoryHostPointerPropertiesEXT' structure
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_INVALID_EXTERNAL_HANDLE'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.ExternalMemoryHandleTypeFlagBits',
-- 'MemoryHostPointerPropertiesEXT'
getMemoryHostPointerPropertiesEXT :: Device -> ExternalMemoryHandleTypeFlagBits -> ("hostPointer" ::: Ptr ()) -> IO (MemoryHostPointerPropertiesEXT)
getMemoryHostPointerPropertiesEXT device handleType hostPointer = evalContT $ do
  let vkGetMemoryHostPointerPropertiesEXT' = mkVkGetMemoryHostPointerPropertiesEXT (pVkGetMemoryHostPointerPropertiesEXT (deviceCmds (device :: Device)))
  pPMemoryHostPointerProperties <- ContT (withZeroCStruct @MemoryHostPointerPropertiesEXT)
  r <- lift $ vkGetMemoryHostPointerPropertiesEXT' (deviceHandle (device)) (handleType) (hostPointer) (pPMemoryHostPointerProperties)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pMemoryHostPointerProperties <- lift $ peekCStruct @MemoryHostPointerPropertiesEXT pPMemoryHostPointerProperties
  pure $ (pMemoryHostPointerProperties)


-- | VkImportMemoryHostPointerInfoEXT - import memory from a host pointer
--
-- = Description
--
-- Importing memory from a host pointer shares ownership of the memory
-- between the host and the Vulkan implementation. The application /can/
-- continue to access the memory through the host pointer but it is the
-- application’s responsibility to synchronize device and non-device access
-- to the underlying memory as defined in
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-device-hostaccess Host Access to Device Memory Objects>.
--
-- Applications /can/ import the same underlying memory into multiple
-- instances of Vulkan and multiple times into a given Vulkan instance.
-- However, implementations /may/ fail to import the same underlying memory
-- multiple times into a given physical device due to platform constraints.
--
-- Importing memory from a particular host pointer /may/ not be possible
-- due to additional platform-specific restrictions beyond the scope of
-- this specification in which case the implementation /must/ fail the
-- memory import operation with the error code
-- 'Graphics.Vulkan.Extensions.VK_KHR_external_memory.ERROR_INVALID_EXTERNAL_HANDLE_KHR'.
--
-- The application /must/ ensure that the imported memory range remains
-- valid and accessible for the lifetime of the imported memory object.
--
-- == Valid Usage
--
-- -   If @handleType@ is not @0@, it /must/ be supported for import, as
--     reported in
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.ExternalMemoryProperties'
--
-- -   If @handleType@ is not @0@, it /must/ be
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT'
--     or
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_HOST_MAPPED_FOREIGN_MEMORY_BIT_EXT'
--
-- -   @pHostPointer@ /must/ be a pointer aligned to an integer multiple of
--     'PhysicalDeviceExternalMemoryHostPropertiesEXT'::@minImportedHostPointerAlignment@
--
-- -   If @handleType@ is
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT',
--     @pHostPointer@ /must/ be a pointer to @allocationSize@ number of
--     bytes of host memory, where @allocationSize@ is the member of the
--     'Graphics.Vulkan.Core10.Memory.MemoryAllocateInfo' structure this
--     structure is chained to
--
-- -   If @handleType@ is
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_HOST_MAPPED_FOREIGN_MEMORY_BIT_EXT',
--     @pHostPointer@ /must/ be a pointer to @allocationSize@ number of
--     bytes of host mapped foreign memory, where @allocationSize@ is the
--     member of the 'Graphics.Vulkan.Core10.Memory.MemoryAllocateInfo'
--     structure this structure is chained to
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_IMPORT_MEMORY_HOST_POINTER_INFO_EXT'
--
-- -   @handleType@ /must/ be a valid
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.ExternalMemoryHandleTypeFlagBits'
--     value
--
-- = See Also
--
-- 'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.ExternalMemoryHandleTypeFlagBits',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data ImportMemoryHostPointerInfoEXT = ImportMemoryHostPointerInfoEXT
  { -- | @handleType@ specifies the handle type.
    handleType :: ExternalMemoryHandleTypeFlagBits
  , -- | @pHostPointer@ is the host pointer to import from.
    hostPointer :: Ptr ()
  }
  deriving (Typeable)
deriving instance Show ImportMemoryHostPointerInfoEXT

instance ToCStruct ImportMemoryHostPointerInfoEXT where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p ImportMemoryHostPointerInfoEXT{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_IMPORT_MEMORY_HOST_POINTER_INFO_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr ExternalMemoryHandleTypeFlagBits)) (handleType)
    poke ((p `plusPtr` 24 :: Ptr (Ptr ()))) (hostPointer)
    f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_IMPORT_MEMORY_HOST_POINTER_INFO_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr ExternalMemoryHandleTypeFlagBits)) (zero)
    poke ((p `plusPtr` 24 :: Ptr (Ptr ()))) (zero)
    f

instance FromCStruct ImportMemoryHostPointerInfoEXT where
  peekCStruct p = do
    handleType <- peek @ExternalMemoryHandleTypeFlagBits ((p `plusPtr` 16 :: Ptr ExternalMemoryHandleTypeFlagBits))
    pHostPointer <- peek @(Ptr ()) ((p `plusPtr` 24 :: Ptr (Ptr ())))
    pure $ ImportMemoryHostPointerInfoEXT
             handleType pHostPointer

instance Storable ImportMemoryHostPointerInfoEXT where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero ImportMemoryHostPointerInfoEXT where
  zero = ImportMemoryHostPointerInfoEXT
           zero
           zero


-- | VkMemoryHostPointerPropertiesEXT - Properties of external memory host
-- pointer
--
-- = Description
--
-- The value returned by @memoryTypeBits@ /must/ only include bits that
-- identify memory types which are host visible.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getMemoryHostPointerPropertiesEXT'
data MemoryHostPointerPropertiesEXT = MemoryHostPointerPropertiesEXT
  { -- | @memoryTypeBits@ is a bitmask containing one bit set for every memory
    -- type which the specified host pointer /can/ be imported as.
    memoryTypeBits :: Word32 }
  deriving (Typeable)
deriving instance Show MemoryHostPointerPropertiesEXT

instance ToCStruct MemoryHostPointerPropertiesEXT where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p MemoryHostPointerPropertiesEXT{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MEMORY_HOST_POINTER_PROPERTIES_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word32)) (memoryTypeBits)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MEMORY_HOST_POINTER_PROPERTIES_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word32)) (zero)
    f

instance FromCStruct MemoryHostPointerPropertiesEXT where
  peekCStruct p = do
    memoryTypeBits <- peek @Word32 ((p `plusPtr` 16 :: Ptr Word32))
    pure $ MemoryHostPointerPropertiesEXT
             memoryTypeBits

instance Storable MemoryHostPointerPropertiesEXT where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero MemoryHostPointerPropertiesEXT where
  zero = MemoryHostPointerPropertiesEXT
           zero


-- | VkPhysicalDeviceExternalMemoryHostPropertiesEXT - Structure describing
-- external memory host pointer limits that can be supported by an
-- implementation
--
-- = Members
--
-- The members of the 'PhysicalDeviceExternalMemoryHostPropertiesEXT'
-- structure describe the following implementation-dependent limits:
--
-- = Description
--
-- If the 'PhysicalDeviceExternalMemoryHostPropertiesEXT' structure is
-- included in the @pNext@ chain of
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.PhysicalDeviceProperties2',
-- it is filled with the implementation-dependent limits.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.BaseType.DeviceSize',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data PhysicalDeviceExternalMemoryHostPropertiesEXT = PhysicalDeviceExternalMemoryHostPropertiesEXT
  { -- | @minImportedHostPointerAlignment@ is the minimum /required/ alignment,
    -- in bytes, for the base address and size of host pointers that /can/ be
    -- imported to a Vulkan memory object.
    minImportedHostPointerAlignment :: DeviceSize }
  deriving (Typeable)
deriving instance Show PhysicalDeviceExternalMemoryHostPropertiesEXT

instance ToCStruct PhysicalDeviceExternalMemoryHostPropertiesEXT where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PhysicalDeviceExternalMemoryHostPropertiesEXT{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_HOST_PROPERTIES_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr DeviceSize)) (minImportedHostPointerAlignment)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_HOST_PROPERTIES_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr DeviceSize)) (zero)
    f

instance FromCStruct PhysicalDeviceExternalMemoryHostPropertiesEXT where
  peekCStruct p = do
    minImportedHostPointerAlignment <- peek @DeviceSize ((p `plusPtr` 16 :: Ptr DeviceSize))
    pure $ PhysicalDeviceExternalMemoryHostPropertiesEXT
             minImportedHostPointerAlignment

instance Storable PhysicalDeviceExternalMemoryHostPropertiesEXT where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PhysicalDeviceExternalMemoryHostPropertiesEXT where
  zero = PhysicalDeviceExternalMemoryHostPropertiesEXT
           zero


type EXT_EXTERNAL_MEMORY_HOST_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_EXT_EXTERNAL_MEMORY_HOST_SPEC_VERSION"
pattern EXT_EXTERNAL_MEMORY_HOST_SPEC_VERSION :: forall a . Integral a => a
pattern EXT_EXTERNAL_MEMORY_HOST_SPEC_VERSION = 1


type EXT_EXTERNAL_MEMORY_HOST_EXTENSION_NAME = "VK_EXT_external_memory_host"

-- No documentation found for TopLevel "VK_EXT_EXTERNAL_MEMORY_HOST_EXTENSION_NAME"
pattern EXT_EXTERNAL_MEMORY_HOST_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern EXT_EXTERNAL_MEMORY_HOST_EXTENSION_NAME = "VK_EXT_external_memory_host"
