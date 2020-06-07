{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}

-- |
-- Module      :  Network.Polkadot.Api.Childstate
-- Copyright   :  Alexander Krupenkin 2016
-- License     :  BSD3
--
-- Maintainer  :  mail@akru.me
-- Stability   :  experimental
-- Portability :  portable
--
-- Polkadot RPC methods with `childstate` prefix.
--

module Network.Polkadot.Api.Childstate where

import           Data.ByteArray.HexString   (HexString)
import           Network.JsonRpc.TinyClient (JsonRpc (..))

-- | Returns the keys with prefix from a child storage, leave empty to get all the keys.
getKeys :: JsonRpc m
        => HexString
        -- ^ Prefixed storage key
        -> HexString
        -- ^ Storage key
        -> Maybe HexString
        -- ^ Block hash
        -> m [HexString]
{-# INLINE getKeys #-}
getKeys = remote "childstate_getKeys"

-- | Returns a child storage entry at a specific block state.
getStorage :: JsonRpc m
           => HexString
           -- ^ Prefixed storage key
           -> HexString
           -- ^ Storage key
           -> Maybe HexString
           -- ^ Block hash
           -> m (Maybe HexString)
{-# INLINE getStorage #-}
getStorage = remote "childstate_getStorage"

-- | Returns the hash of a child storage entry at a block state
getStorageHash :: JsonRpc m
               => HexString
               -- ^ Prefixed storage key
               -> HexString
               -- ^ Storage key
               -> Maybe HexString
               -- ^ Block hash
               -> m (Maybe HexString)
{-# INLINE getStorageHash #-}
getStorageHash = remote "childstate_getStorageHash"

-- | Returns the size of a child storage entry at a block state.
getStorageSize :: JsonRpc m
               => HexString
               -- ^ Prefixed storage key
               -> HexString
               -- ^ Storage key
               -> Maybe HexString
               -- ^ Block hash
               -> m (Maybe Int)
{-# INLINE getStorageSize #-}
getStorageSize = remote "childstate_getStorageSize"
