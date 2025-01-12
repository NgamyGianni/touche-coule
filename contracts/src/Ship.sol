// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import 'hardhat/console.sol';

abstract contract Ship {
  function update(uint x, uint y) public virtual;
  function fire(uint x, uint y) public virtual returns (uint, uint);
  function place(uint pos, uint width, uint height) public virtual returns (uint, uint);
}

