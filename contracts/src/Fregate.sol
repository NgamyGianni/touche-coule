// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./Ship.sol";

contract Fregate is Ship{

    uint public i;
    uint public j;
    uint private w;
    uint private h;
    uint private acc_x;
    uint private acc_y;

    function update(uint x, uint y) public override{
        i = x;
        j = y;
    }
    function fire(uint x, uint y) public override returns (uint, uint){
        if(acc_y % 3 == 0)  acc_x += 1;
        if(acc_x % 3 == 0){
            acc_x++;
            x = random();
            y = random_2();
        }
        return ((x + acc_x) % w, (y + (acc_y++%3)) % h);
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