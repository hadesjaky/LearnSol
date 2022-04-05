//SPDX-License-Identifier: Unlicense
pragma solidity  >= 0.6.12;

interface IMasterChef{
    function  deposit(uint256 _pid, uint256 _amount)  external;
    function withdraw(uint256 _pid, uint256 _amount)  external;
}