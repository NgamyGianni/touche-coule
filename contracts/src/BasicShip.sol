// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./Ship.sol";

contract BasicShip is Ship{

    uint public i;
    uint public j;
    uint private w;
    uint private h;

    function update(uint x, uint y) public override{
        i = x;
        j = y;
    }
    function fire(uint x, uint y) public override view returns (uint, uint){
        return ((random() + x + y) % w, (random_2() + x + y) % h);
    }

    function place(uint pos, uint width, uint height) public override returns (uint, uint){
        i = pos % width;
        j = uint(pos / height);

        w = width;
        h = height;
        return (i, j);
    }

    function random() public view returns(uint){
        return uint(blockhash(block.number-1));
    }

    function random_2() public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,  
        msg.sender)));
    }
}