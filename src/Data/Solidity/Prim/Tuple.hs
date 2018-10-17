{-# LANGUAGE DeriveGeneric       #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving  #-}
{-# LANGUAGE TemplateHaskell     #-}

-- |
-- Module      :  Data.Solidity.Prim.Tuple
-- Copyright   :  Alexander Krupenkin 2018
-- License     :  BSD3
--
-- Maintainer  :  mail@akru.me
-- Stability   :  experimental
-- Portability :  noportable
--
-- Tuple type abi encoding instances.
--

module Data.Solidity.Prim.Tuple where

import           Data.Proxy                  (Proxy (..))
import           Data.Tuple.OneTuple         (OneTuple (..))
import           Generics.SOP                (Generic)
import qualified GHC.Generics                as GHC (Generic)

import           Data.Solidity.Abi           (AbiGet, AbiPut, AbiType (..))
import           Data.Solidity.Abi.Generic   ()
import           Data.Solidity.Prim.Tuple.TH (tupleDecs)

deriving instance GHC.Generic (OneTuple a)
instance Generic (OneTuple a)

instance AbiType a => AbiType (OneTuple a) where
    isDynamic _ = isDynamic (Proxy :: Proxy a)

instance AbiGet a => AbiGet (OneTuple a)
instance AbiPut a => AbiPut (OneTuple a)

$(fmap concat $ sequence $ map tupleDecs [2..20])