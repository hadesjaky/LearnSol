// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that revert on error
 */
library SafeMath {

    /**  
    * @dev Multiplies two numbers, reverts on overflow.
    */   
    function mul(uint256 _a, uint256 _b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (_a == 0) { 
            return 0;
        }    

        uint256 c = _a * _b;
        require(c / _a == _b); 

        return c;
    }    

    /**  
    * @dev Integer division of two numbers truncating the quotient, reverts on division by zero.
    */   
    function div(uint256 _a, uint256 _b) internal pure returns (uint256) {
        require(_b > 0); // Solidity only automatically asserts when dividing by 0 
        uint256 c = _a / _b;
        // assert(_a == _b * c + _a % _b); // There is no case in which this doesn't hold 

        return c;
    }    

    /**  
    * @dev Subtracts two numbers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */   
    function sub(uint256 _a, uint256 _b) internal pure returns (uint256) {
        require(_b <= _a); 
        uint256 c = _a - _b;

        return c;
    }    

    /**  
    * @dev Adds two numbers, reverts on overflow.
    */   
    function add(uint256 _a, uint256 _b) internal pure returns (uint256) {
        uint256 c = _a + _b;
        require(c >= _a); 

        return c;
    }    

    /**  
    * @dev Divides two numbers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */   
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b; 
    }    
}

contract Ownable {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }    

    modifier onlyOwner(){
        if(msg.sender != owner){
            revert("only owner can do this.");
        }    
        _;   
    }    
    modifier notOwner(){
        if(msg.sender == owner){
            revert("owner could not call this.");
        }    
        _;   
    }
    function transferOwnership(address payable newOwner) public onlyOwner{
        if (newOwner != address(0)){
            owner = newOwner;
        }
    }
    
}

contract Bank is Ownable{
    using SafeMath for uint256;
    mapping(address => uint256 ) addrMoney;
    string public BankName;
    constructor(string memory _BankName) payable {
        BankName = _BankName;
    }

    function bankruptcy() public onlyOwner{ // 跑路
        uint256 b = address(this).balance;
        owner.transfer(b);
    }

    function deposit() payable public {
        if(msg.value <= 0)
            return;
        uint256 value = addrMoney[msg.sender];
        addrMoney[msg.sender] = value.add(msg.value);
    }

    function withdraw() payable public {
        uint256 value = addrMoney[msg.sender];
        require(value > 0, "No money in your account");
        payable(msg.sender).transfer(value);
        addrMoney[msg.sender] = 0;
    }

    function balance(address a) public view returns (uint256){
        return addrMoney[a];
    }

    fallback() external payable {
        if(msg.value <= 0)
            return;
        uint256 value = addrMoney[msg.sender];
        addrMoney[msg.sender] = value.add(msg.value);
    }

    receive() external payable {
    }

}

