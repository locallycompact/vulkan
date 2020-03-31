{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_EXT_validation_cache  ( createValidationCacheEXT
                                                           , withValidationCacheEXT
                                                           , destroyValidationCacheEXT
                                                           , getValidationCacheDataEXT
                                                           , mergeValidationCachesEXT
                                                           , ValidationCacheCreateInfoEXT(..)
                                                           , ShaderModuleValidationCacheCreateInfoEXT(..)
                                                           , ValidationCacheCreateFlagsEXT(..)
                                                           , ValidationCacheHeaderVersionEXT( VALIDATION_CACHE_HEADER_VERSION_ONE_EXT
                                                                                            , ..
                                                                                            )
                                                           , EXT_VALIDATION_CACHE_SPEC_VERSION
                                                           , pattern EXT_VALIDATION_CACHE_SPEC_VERSION
                                                           , EXT_VALIDATION_CACHE_EXTENSION_NAME
                                                           , pattern EXT_VALIDATION_CACHE_EXTENSION_NAME
                                                           , ValidationCacheEXT(..)
                                                           ) where

import Control.Exception.Base (bracket)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Marshal.Alloc (callocBytes)
import Foreign.Marshal.Alloc (free)
import GHC.Base (when)
import GHC.IO (throwIO)
import GHC.Ptr (castPtr)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import GHC.Read (choose)
import GHC.Read (expectP)
import GHC.Read (parens)
import GHC.Show (showParen)
import GHC.Show (showString)
import GHC.Show (showsPrec)
import Numeric (showHex)
import Text.ParserCombinators.ReadPrec ((+++))
import Text.ParserCombinators.ReadPrec (prec)
import Text.ParserCombinators.ReadPrec (step)
import Data.ByteString (packCStringLen)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import qualified Data.Vector (imapM_)
import qualified Data.Vector (length)
import Data.Bits (Bits)
import Data.String (IsString)
import Data.Typeable (Typeable)
import Foreign.C.Types (CChar)
import Foreign.C.Types (CSize)
import Foreign.C.Types (CSize(..))
import Foreign.C.Types (CSize(CSize))
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Data.Int (Int32)
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import GHC.Read (Read(readPrec))
import Data.Word (Word32)
import Data.Word (Word64)
import Text.Read.Lex (Lexeme(Ident))
import Data.ByteString (ByteString)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Data.Vector (Vector)
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Core10.AllocationCallbacks (AllocationCallbacks)
import Graphics.Vulkan.Core10.Handles (Device)
import Graphics.Vulkan.Core10.Handles (Device(..))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkCreateValidationCacheEXT))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkDestroyValidationCacheEXT))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkGetValidationCacheDataEXT))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkMergeValidationCachesEXT))
import Graphics.Vulkan.Core10.Handles (Device_T)
import Graphics.Vulkan.Core10.BaseType (Flags)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Extensions.Handles (ValidationCacheEXT)
import Graphics.Vulkan.Extensions.Handles (ValidationCacheEXT(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero)
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_SHADER_MODULE_VALIDATION_CACHE_CREATE_INFO_EXT))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
import Graphics.Vulkan.Extensions.Handles (ValidationCacheEXT(..))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateValidationCacheEXT
  :: FunPtr (Ptr Device_T -> Ptr ValidationCacheCreateInfoEXT -> Ptr AllocationCallbacks -> Ptr ValidationCacheEXT -> IO Result) -> Ptr Device_T -> Ptr ValidationCacheCreateInfoEXT -> Ptr AllocationCallbacks -> Ptr ValidationCacheEXT -> IO Result

-- | vkCreateValidationCacheEXT - Creates a new validation cache
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     creates the validation cache object.
--
-- -   @pCreateInfo@ is a pointer to a 'ValidationCacheCreateInfoEXT'
--     structure containing the initial parameters for the validation cache
--     object.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- -   @pValidationCache@ is a pointer to a
--     'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT' handle in
--     which the resulting validation cache object is returned.
--
-- = Description
--
-- Note
--
-- Applications /can/ track and manage the total host memory size of a
-- validation cache object using the @pAllocator@. Applications /can/ limit
-- the amount of data retrieved from a validation cache object in
-- 'getValidationCacheDataEXT'. Implementations /should/ not internally
-- limit the total number of entries added to a validation cache object or
-- the total host memory consumed.
--
-- Once created, a validation cache /can/ be passed to the
-- 'Graphics.Vulkan.Core10.Shader.createShaderModule' command by adding
-- this object to the
-- 'Graphics.Vulkan.Core10.Shader.ShaderModuleCreateInfo' structure’s
-- @pNext@ chain. If a 'ShaderModuleValidationCacheCreateInfoEXT' object is
-- included in the
-- 'Graphics.Vulkan.Core10.Shader.ShaderModuleCreateInfo'::@pNext@ chain,
-- and its @validationCache@ field is not
-- 'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE', the implementation
-- will query it for possible reuse opportunities and update it with new
-- content. The use of the validation cache object in these commands is
-- internally synchronized, and the same validation cache object /can/ be
-- used in multiple threads simultaneously.
--
-- Note
--
-- Implementations /should/ make every effort to limit any critical
-- sections to the actual accesses to the cache, which is expected to be
-- significantly shorter than the duration of the
-- 'Graphics.Vulkan.Core10.Shader.createShaderModule' command.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   @pCreateInfo@ /must/ be a valid pointer to a valid
--     'ValidationCacheCreateInfoEXT' structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   @pValidationCache@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT' handle
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks',
-- 'Graphics.Vulkan.Core10.Handles.Device', 'ValidationCacheCreateInfoEXT',
-- 'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT'
createValidationCacheEXT :: Device -> ValidationCacheCreateInfoEXT -> ("allocator" ::: Maybe AllocationCallbacks) -> IO (ValidationCacheEXT)
createValidationCacheEXT device createInfo allocator = evalContT $ do
  let vkCreateValidationCacheEXT' = mkVkCreateValidationCacheEXT (pVkCreateValidationCacheEXT (deviceCmds (device :: Device)))
  pCreateInfo <- ContT $ withCStruct (createInfo)
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  pPValidationCache <- ContT $ bracket (callocBytes @ValidationCacheEXT 8) free
  r <- lift $ vkCreateValidationCacheEXT' (deviceHandle (device)) pCreateInfo pAllocator (pPValidationCache)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pValidationCache <- lift $ peek @ValidationCacheEXT pPValidationCache
  pure $ (pValidationCache)

-- | A safe wrapper for 'createValidationCacheEXT' and
-- 'destroyValidationCacheEXT' using 'bracket'
--
-- The allocated value must not be returned from the provided computation
withValidationCacheEXT :: Device -> ValidationCacheCreateInfoEXT -> Maybe AllocationCallbacks -> (ValidationCacheEXT -> IO r) -> IO r
withValidationCacheEXT device validationCacheCreateInfoEXT allocationCallbacks =
  bracket
    (createValidationCacheEXT device validationCacheCreateInfoEXT allocationCallbacks)
    (\o -> destroyValidationCacheEXT device o allocationCallbacks)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkDestroyValidationCacheEXT
  :: FunPtr (Ptr Device_T -> ValidationCacheEXT -> Ptr AllocationCallbacks -> IO ()) -> Ptr Device_T -> ValidationCacheEXT -> Ptr AllocationCallbacks -> IO ()

-- | vkDestroyValidationCacheEXT - Destroy a validation cache object
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     destroys the validation cache object.
--
-- -   @validationCache@ is the handle of the validation cache to destroy.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- == Valid Usage
--
-- -   If 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     were provided when @validationCache@ was created, a compatible set
--     of callbacks /must/ be provided here
--
-- -   If no
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     were provided when @validationCache@ was created, @pAllocator@
--     /must/ be @NULL@
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   If @validationCache@ is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE', @validationCache@
--     /must/ be a valid
--     'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT' handle
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   If @validationCache@ is a valid handle, it /must/ have been created,
--     allocated, or retrieved from 'Graphics.Vulkan.Core10.Handles.Device'
--
-- == Host Synchronization
--
-- -   Host access to @validationCache@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks',
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT'
destroyValidationCacheEXT :: Device -> ValidationCacheEXT -> ("allocator" ::: Maybe AllocationCallbacks) -> IO ()
destroyValidationCacheEXT device validationCache allocator = evalContT $ do
  let vkDestroyValidationCacheEXT' = mkVkDestroyValidationCacheEXT (pVkDestroyValidationCacheEXT (deviceCmds (device :: Device)))
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  lift $ vkDestroyValidationCacheEXT' (deviceHandle (device)) (validationCache) pAllocator
  pure $ ()


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetValidationCacheDataEXT
  :: FunPtr (Ptr Device_T -> ValidationCacheEXT -> Ptr CSize -> Ptr () -> IO Result) -> Ptr Device_T -> ValidationCacheEXT -> Ptr CSize -> Ptr () -> IO Result

-- | vkGetValidationCacheDataEXT - Get the data store from a validation cache
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     owns the validation cache.
--
-- -   @validationCache@ is the validation cache to retrieve data from.
--
-- -   @pDataSize@ is a pointer to a value related to the amount of data in
--     the validation cache, as described below.
--
-- -   @pData@ is either @NULL@ or a pointer to a buffer.
--
-- = Description
--
-- If @pData@ is @NULL@, then the maximum size of the data that /can/ be
-- retrieved from the validation cache, in bytes, is returned in
-- @pDataSize@. Otherwise, @pDataSize@ /must/ point to a variable set by
-- the user to the size of the buffer, in bytes, pointed to by @pData@, and
-- on return the variable is overwritten with the amount of data actually
-- written to @pData@.
--
-- If @pDataSize@ is less than the maximum size that /can/ be retrieved by
-- the validation cache, at most @pDataSize@ bytes will be written to
-- @pData@, and 'getValidationCacheDataEXT' will return
-- 'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE'. Any data written to
-- @pData@ is valid and /can/ be provided as the @pInitialData@ member of
-- the 'ValidationCacheCreateInfoEXT' structure passed to
-- 'createValidationCacheEXT'.
--
-- Two calls to 'getValidationCacheDataEXT' with the same parameters /must/
-- retrieve the same data unless a command that modifies the contents of
-- the cache is called between them.
--
-- Applications /can/ store the data retrieved from the validation cache,
-- and use these data, possibly in a future run of the application, to
-- populate new validation cache objects. The results of validation,
-- however, /may/ depend on the vendor ID, device ID, driver version, and
-- other details of the device. To enable applications to detect when
-- previously retrieved data is incompatible with the device, the initial
-- bytes written to @pData@ /must/ be a header consisting of the following
-- members:
--
-- +--------+-------------------------------------------------+--------------------------------------------------+
-- | Offset | Size                                            | Meaning                                          |
-- +========+=================================================+==================================================+
-- | 0      | 4                                               | length in bytes of the entire validation cache   |
-- |        |                                                 | header written as a stream of bytes, with the    |
-- |        |                                                 | least significant byte first                     |
-- +--------+-------------------------------------------------+--------------------------------------------------+
-- | 4      | 4                                               | a 'ValidationCacheHeaderVersionEXT' value        |
-- |        |                                                 | written as a stream of bytes, with the least     |
-- |        |                                                 | significant byte first                           |
-- +--------+-------------------------------------------------+--------------------------------------------------+
-- | 8      | 'Graphics.Vulkan.Core10.APIConstants.UUID_SIZE' | a layer commit ID expressed as a UUID, which     |
-- |        |                                                 | uniquely identifies the version of the           |
-- |        |                                                 | validation layers used to generate these         |
-- |        |                                                 | validation results                               |
-- +--------+-------------------------------------------------+--------------------------------------------------+
--
-- Layout for validation cache header version
-- 'VALIDATION_CACHE_HEADER_VERSION_ONE_EXT'
--
-- The first four bytes encode the length of the entire validation cache
-- header, in bytes. This value includes all fields in the header including
-- the validation cache version field and the size of the length field.
--
-- The next four bytes encode the validation cache version, as described
-- for 'ValidationCacheHeaderVersionEXT'. A consumer of the validation
-- cache /should/ use the cache version to interpret the remainder of the
-- cache header.
--
-- If @pDataSize@ is less than what is necessary to store this header,
-- nothing will be written to @pData@ and zero will be written to
-- @pDataSize@.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   @validationCache@ /must/ be a valid
--     'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT' handle
--
-- -   @pDataSize@ /must/ be a valid pointer to a @size_t@ value
--
-- -   If the value referenced by @pDataSize@ is not @0@, and @pData@ is
--     not @NULL@, @pData@ /must/ be a valid pointer to an array of
--     @pDataSize@ bytes
--
-- -   @validationCache@ /must/ have been created, allocated, or retrieved
--     from 'Graphics.Vulkan.Core10.Handles.Device'
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT'
getValidationCacheDataEXT :: Device -> ValidationCacheEXT -> IO (Result, ("data" ::: ByteString))
getValidationCacheDataEXT device validationCache = evalContT $ do
  let vkGetValidationCacheDataEXT' = mkVkGetValidationCacheDataEXT (pVkGetValidationCacheDataEXT (deviceCmds (device :: Device)))
  let device' = deviceHandle (device)
  pPDataSize <- ContT $ bracket (callocBytes @CSize 8) free
  r <- lift $ vkGetValidationCacheDataEXT' device' (validationCache) (pPDataSize) (nullPtr)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pDataSize <- lift $ peek @CSize pPDataSize
  pPData <- ContT $ bracket (callocBytes @(()) (fromIntegral (((\(CSize a) -> a) pDataSize)))) free
  r' <- lift $ vkGetValidationCacheDataEXT' device' (validationCache) (pPDataSize) (pPData)
  lift $ when (r' < SUCCESS) (throwIO (VulkanException r'))
  pDataSize'' <- lift $ peek @CSize pPDataSize
  pData' <- lift $ packCStringLen  (castPtr @() @CChar pPData, (fromIntegral (((\(CSize a) -> a) pDataSize''))))
  pure $ ((r'), pData')


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkMergeValidationCachesEXT
  :: FunPtr (Ptr Device_T -> ValidationCacheEXT -> Word32 -> Ptr ValidationCacheEXT -> IO Result) -> Ptr Device_T -> ValidationCacheEXT -> Word32 -> Ptr ValidationCacheEXT -> IO Result

-- | vkMergeValidationCachesEXT - Combine the data stores of validation
-- caches
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     owns the validation cache objects.
--
-- -   @dstCache@ is the handle of the validation cache to merge results
--     into.
--
-- -   @srcCacheCount@ is the length of the @pSrcCaches@ array.
--
-- -   @pSrcCaches@ is a pointer to an array of validation cache handles,
--     which will be merged into @dstCache@. The previous contents of
--     @dstCache@ are included after the merge.
--
-- = Description
--
-- Note
--
-- The details of the merge operation are implementation dependent, but
-- implementations /should/ merge the contents of the specified validation
-- caches and prune duplicate entries.
--
-- == Valid Usage
--
-- -   @dstCache@ /must/ not appear in the list of source caches
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   @dstCache@ /must/ be a valid
--     'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT' handle
--
-- -   @pSrcCaches@ /must/ be a valid pointer to an array of
--     @srcCacheCount@ valid
--     'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT' handles
--
-- -   @srcCacheCount@ /must/ be greater than @0@
--
-- -   @dstCache@ /must/ have been created, allocated, or retrieved from
--     'Graphics.Vulkan.Core10.Handles.Device'
--
-- -   Each element of @pSrcCaches@ /must/ have been created, allocated, or
--     retrieved from 'Graphics.Vulkan.Core10.Handles.Device'
--
-- == Host Synchronization
--
-- -   Host access to @dstCache@ /must/ be externally synchronized
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT'
mergeValidationCachesEXT :: Device -> ("dstCache" ::: ValidationCacheEXT) -> ("srcCaches" ::: Vector ValidationCacheEXT) -> IO ()
mergeValidationCachesEXT device dstCache srcCaches = evalContT $ do
  let vkMergeValidationCachesEXT' = mkVkMergeValidationCachesEXT (pVkMergeValidationCachesEXT (deviceCmds (device :: Device)))
  pPSrcCaches <- ContT $ allocaBytesAligned @ValidationCacheEXT ((Data.Vector.length (srcCaches)) * 8) 8
  lift $ Data.Vector.imapM_ (\i e -> poke (pPSrcCaches `plusPtr` (8 * (i)) :: Ptr ValidationCacheEXT) (e)) (srcCaches)
  r <- lift $ vkMergeValidationCachesEXT' (deviceHandle (device)) (dstCache) ((fromIntegral (Data.Vector.length $ (srcCaches)) :: Word32)) (pPSrcCaches)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))


-- | VkValidationCacheCreateInfoEXT - Structure specifying parameters of a
-- newly created validation cache
--
-- == Valid Usage
--
-- -   If @initialDataSize@ is not @0@, it /must/ be equal to the size of
--     @pInitialData@, as returned by 'getValidationCacheDataEXT' when
--     @pInitialData@ was originally retrieved
--
-- -   If @initialDataSize@ is not @0@, @pInitialData@ /must/ have been
--     retrieved from a previous call to 'getValidationCacheDataEXT'
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT'
--
-- -   @pNext@ /must/ be @NULL@
--
-- -   'Graphics.Vulkan.Core10.BaseType.Flags' /must/ be @0@
--
-- -   If @initialDataSize@ is not @0@, @pInitialData@ /must/ be a valid
--     pointer to an array of @initialDataSize@ bytes
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'ValidationCacheCreateFlagsEXT', 'createValidationCacheEXT'
data ValidationCacheCreateInfoEXT = ValidationCacheCreateInfoEXT
  { -- | 'Graphics.Vulkan.Core10.BaseType.Flags' is reserved for future use.
    flags :: ValidationCacheCreateFlagsEXT
  , -- | @initialDataSize@ is the number of bytes in @pInitialData@. If
    -- @initialDataSize@ is zero, the validation cache will initially be empty.
    initialDataSize :: Word64
  , -- | @pInitialData@ is a pointer to previously retrieved validation cache
    -- data. If the validation cache data is incompatible (as defined below)
    -- with the device, the validation cache will be initially empty. If
    -- @initialDataSize@ is zero, @pInitialData@ is ignored.
    initialData :: Ptr ()
  }
  deriving (Typeable)
deriving instance Show ValidationCacheCreateInfoEXT

instance ToCStruct ValidationCacheCreateInfoEXT where
  withCStruct x f = allocaBytesAligned 40 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p ValidationCacheCreateInfoEXT{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr ValidationCacheCreateFlagsEXT)) (flags)
    poke ((p `plusPtr` 24 :: Ptr CSize)) (CSize (initialDataSize))
    poke ((p `plusPtr` 32 :: Ptr (Ptr ()))) (initialData)
    f
  cStructSize = 40
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_VALIDATION_CACHE_CREATE_INFO_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 32 :: Ptr (Ptr ()))) (zero)
    f

instance FromCStruct ValidationCacheCreateInfoEXT where
  peekCStruct p = do
    flags <- peek @ValidationCacheCreateFlagsEXT ((p `plusPtr` 16 :: Ptr ValidationCacheCreateFlagsEXT))
    initialDataSize <- peek @CSize ((p `plusPtr` 24 :: Ptr CSize))
    pInitialData <- peek @(Ptr ()) ((p `plusPtr` 32 :: Ptr (Ptr ())))
    pure $ ValidationCacheCreateInfoEXT
             flags ((\(CSize a) -> a) initialDataSize) pInitialData

instance Storable ValidationCacheCreateInfoEXT where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero ValidationCacheCreateInfoEXT where
  zero = ValidationCacheCreateInfoEXT
           zero
           zero
           zero


-- | VkShaderModuleValidationCacheCreateInfoEXT - Specify validation cache to
-- use during shader module creation
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT'
data ShaderModuleValidationCacheCreateInfoEXT = ShaderModuleValidationCacheCreateInfoEXT
  { -- | @validationCache@ /must/ be a valid
    -- 'Graphics.Vulkan.Extensions.Handles.ValidationCacheEXT' handle
    validationCache :: ValidationCacheEXT }
  deriving (Typeable)
deriving instance Show ShaderModuleValidationCacheCreateInfoEXT

instance ToCStruct ShaderModuleValidationCacheCreateInfoEXT where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p ShaderModuleValidationCacheCreateInfoEXT{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SHADER_MODULE_VALIDATION_CACHE_CREATE_INFO_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr ValidationCacheEXT)) (validationCache)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SHADER_MODULE_VALIDATION_CACHE_CREATE_INFO_EXT)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr ValidationCacheEXT)) (zero)
    f

instance FromCStruct ShaderModuleValidationCacheCreateInfoEXT where
  peekCStruct p = do
    validationCache <- peek @ValidationCacheEXT ((p `plusPtr` 16 :: Ptr ValidationCacheEXT))
    pure $ ShaderModuleValidationCacheCreateInfoEXT
             validationCache

instance Storable ShaderModuleValidationCacheCreateInfoEXT where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero ShaderModuleValidationCacheCreateInfoEXT where
  zero = ShaderModuleValidationCacheCreateInfoEXT
           zero


-- | VkValidationCacheCreateFlagsEXT - Reserved for future use
--
-- = Description
--
-- 'ValidationCacheCreateFlagsEXT' is a bitmask type for setting a mask,
-- but is currently reserved for future use.
--
-- = See Also
--
-- 'ValidationCacheCreateInfoEXT'
newtype ValidationCacheCreateFlagsEXT = ValidationCacheCreateFlagsEXT Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits)



instance Show ValidationCacheCreateFlagsEXT where
  showsPrec p = \case
    ValidationCacheCreateFlagsEXT x -> showParen (p >= 11) (showString "ValidationCacheCreateFlagsEXT 0x" . showHex x)

instance Read ValidationCacheCreateFlagsEXT where
  readPrec = parens (choose []
                     +++
                     prec 10 (do
                       expectP (Ident "ValidationCacheCreateFlagsEXT")
                       v <- step readPrec
                       pure (ValidationCacheCreateFlagsEXT v)))


-- | VkValidationCacheHeaderVersionEXT - Encode validation cache version
--
-- = See Also
--
-- 'createValidationCacheEXT', 'getValidationCacheDataEXT'
newtype ValidationCacheHeaderVersionEXT = ValidationCacheHeaderVersionEXT Int32
  deriving newtype (Eq, Ord, Storable, Zero)
-- Note that the zero instance does not produce a valid value, passing 'zero' to Vulkan will result in an error

-- | 'VALIDATION_CACHE_HEADER_VERSION_ONE_EXT' specifies version one of the
-- validation cache.
pattern VALIDATION_CACHE_HEADER_VERSION_ONE_EXT = ValidationCacheHeaderVersionEXT 1
{-# complete VALIDATION_CACHE_HEADER_VERSION_ONE_EXT :: ValidationCacheHeaderVersionEXT #-}

instance Show ValidationCacheHeaderVersionEXT where
  showsPrec p = \case
    VALIDATION_CACHE_HEADER_VERSION_ONE_EXT -> showString "VALIDATION_CACHE_HEADER_VERSION_ONE_EXT"
    ValidationCacheHeaderVersionEXT x -> showParen (p >= 11) (showString "ValidationCacheHeaderVersionEXT " . showsPrec 11 x)

instance Read ValidationCacheHeaderVersionEXT where
  readPrec = parens (choose [("VALIDATION_CACHE_HEADER_VERSION_ONE_EXT", pure VALIDATION_CACHE_HEADER_VERSION_ONE_EXT)]
                     +++
                     prec 10 (do
                       expectP (Ident "ValidationCacheHeaderVersionEXT")
                       v <- step readPrec
                       pure (ValidationCacheHeaderVersionEXT v)))


type EXT_VALIDATION_CACHE_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_EXT_VALIDATION_CACHE_SPEC_VERSION"
pattern EXT_VALIDATION_CACHE_SPEC_VERSION :: forall a . Integral a => a
pattern EXT_VALIDATION_CACHE_SPEC_VERSION = 1


type EXT_VALIDATION_CACHE_EXTENSION_NAME = "VK_EXT_validation_cache"

-- No documentation found for TopLevel "VK_EXT_VALIDATION_CACHE_EXTENSION_NAME"
pattern EXT_VALIDATION_CACHE_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern EXT_VALIDATION_CACHE_EXTENSION_NAME = "VK_EXT_validation_cache"
