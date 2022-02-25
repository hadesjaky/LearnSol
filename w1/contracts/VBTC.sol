// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


///address -> uint256 mapping.
library IterableMapping
{
    struct IndexValue { uint keyIndex; uint value; }
    struct KeyFlag { address key; bool deleted; }
    struct itmap
    {
        mapping(address => IndexValue) data;
        KeyFlag[] keys;
        uint size;
    }

    function insert(itmap storage self, address key, uint value) internal returns (bool replaced)
    {
        uint keyIndex = self.data[key].keyIndex;
        self.data[key].value = value;
        if (keyIndex > 0)
            return true;
        else
        {
            keyIndex = self.keys.length + 1;
            self.data[key].keyIndex = keyIndex + 1;
            self.keys[keyIndex].key = key;
            self.size++;
            return false;
        }
    }
    function remove(itmap storage self, address key) internal returns (bool success)
    {
        uint keyIndex = self.data[key].keyIndex;
        if (keyIndex == 0)
            return false;
        delete self.data[key];
        self.keys[keyIndex - 1].deleted = true;
        self.size --;
    }
    function contains(itmap storage self, address key) internal view returns (bool)
    {
        return self.data[key].keyIndex > 0;
    }
    function iterate_start(itmap storage self) internal view returns (uint keyIndex)
    {
        //uint(-1) not work
        return iterate_next(self, uint(-1));
    }
    function iterate_valid(itmap storage self, uint keyIndex) internal view returns (bool)
    {
        return keyIndex < self.keys.length;
    }
    function iterate_next(itmap storage self, uint keyIndex) internal view returns (uint r_keyIndex)
    {
        keyIndex++;
        while (keyIndex < self.keys.length && self.keys[keyIndex].deleted)
            keyIndex++;
        return keyIndex;
    }
    function iterate_get(itmap storage self, uint keyIndex) internal view returns (address key, uint value)
    {
        key = self.keys[keyIndex].key;
        value = self.data[key].value;
    }
}

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


/**
 * title ERC20 Basic
 * dev Simpler version of ERC20 interface
 * dev see https://github.com/ethereum/EIPs/issues/20
 *
 */
contract ERC20Basic{
    function balanceOf(address who) constant public returns (uint);
    function transfer(address to, uint value) public;
    event Transfer(address indexed from, address indexed to, uint value);
}


// /**
//  * title Basic token
//  * dev Basic version of StandardToken, eith no allowances.
//  */
// contract BasicToken is ERC20Basic {
//     using SafeMath for uint;
//     /**
//     * dev Fix for eht ERC20 short address attack.
//     */
//     modifier onlyPayloadSize(uint size) {
//         if(msg.data.length < size + 4){
//             throw;
//         }
//         _;
//     }
// }


/**
* title ERC20 interface
* dev see https://github.com/ethereum/EIPs/issues/20
*/
contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) constant public returns (uint);
    function transferFrom(address from, address to, uint value) public;
    function approve(address spender, uint value) public;
    event Approval(address indexed owner, address indexed spender, uint value);
}


/**
* title Standard ERC20 token
*
* dev Implemantation of the basic standart token.
* dev https://github.com/ethereum/EIPs/issues/20
* dev Based on code by FirstBlood:http://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
**/
contract StandardToken is ERC20{
    mapping (address => mapping (address => uint256)) allowed;
    event TransShare(address from, address to, uint value);
    event TransferFrom(address from, uint value);
    event Dividends(address from, address to, uint value);

    /**
    * dev Aprove the passed address to spend the specified amount of tokens on beahlf of msg.sender.
    * param _spender The address which will spend the funds.
    * param _value The amount of tokens to be spent.
    */
    function approve(address _spender, uint _value) public {
        //To change the approve amount you first have to reduce the addresses
        // allowance to zero by calling approve(_spender, 0) if if it not
        // already 0 to mitigate the race condition described here:
        // https://github.com/ethereum/EIPs/issues/20#issuscomment-263524729
        if ((_value != 0) && (allowed[msg.sender][_spender] != 0)) {
            revert("The address allowed value is not 0!");
        }

        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
    }

    /**
    * dev Function to check the amount of token rhan an owner allowed to a spender.
    * param _owner address Thr address whivh owns the funds.
    * param _spender address The address which will spend the funds.
    * return A uint specifing the amount of tokrns still avaible for the spender.
    **/
    function allowance(address _owner, address _spender) constant public returns (uint remaining) {
        return allowed[_owner][_spender];
    }
}

contract Ownable {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        if(msg.sender != owner){
            revert("not owner!!!");
        }
        _;
    }
    function transferOwnership(address newOwner) public onlyOwner{
        if (newOwner != address(0)){
            owner = newOwner;
        }
    }
}

contract VBTC is Ownable, StandardToken{
    uint256 public decimals = 8;
    string public name = "VBTCCoin";
    string public symbol = "VBTC";
    uint256 public totalSupply = 1000000000000000;//decimals is 8, so total 1000,0000 e8
    address public burnAddress = 0x0000000000000000000000000000000000000000; //destory address
    uint256 public globalShares = 0;
    mapping (address => uint256) private balances;
    uint256 public btcValue = 10 * 100000000;
    // mapping (address => uint256) private vips;
    uint256 public vValue = 6000 * 100000000;
    using SafeMath for uint256;
    event AddMortgage(address addr, uint256 value);

    modifier noVds() {
        if (msg.value < 0) {
            revert("no vds");
        }
        _;
    }
    function() payable public{
        if (msg.value > 100000000){
            globalShares = globalShares.add(msg.value);
            emit AddMortgage(msg.sender, msg.value);
        }
    }

    function balanceOf(address addr) constant public returns (uint balance) {
        return balances[addr];
    }

    function transfer(address to, uint256 amount) public
    {
        //SafeMath.assert(msg.sender != burnAddress);
        if (to == burnAddress) {
            return burn(amount);
        }
        balances[msg.sender] = balances[msg.sender].sub(amount);
        balances[to] = balances[to].add(amount);
        emit Transfer(msg.sender, to, amount);
    }
    function transferFrom(address _from, address _to, uint _value) public {
        uint256 _allowance = allowed[_from][msg.sender];
        balances[_to] = balances[_to].add(_value);
        balances[_from] = balances[_from].sub(_value);
        allowed[_from][msg.sender] = _allowance.sub(_value);
        emit Transfer(_from, _to, _value);
    }
    
    //internal func
    function burn (uint256 amount) internal
    {
        balances[msg.sender] = balances[msg.sender].sub(amount);
        balances[burnAddress] = balances[burnAddress].add(amount);
        emit Transfer(msg.sender, burnAddress, amount);
    }
    
    function setChangehangeRatio(uint256 _btc, uint256 _v) public onlyOwner{
        btcValue = _btc;
        vValue = _v;
    }
    
    function btcChangeV(uint256 _btc) payable public {
        uint256 v = _btc.mul(vValue);
        uint256 value = v.div(btcValue);
        if(value > globalShares || globalShares == 0)
            revert("vds value is not enough!!!");
        balances[msg.sender] = balances[msg.sender].sub(_btc);
        balances[owner] = balances[owner].add(_btc);
        globalShares = globalShares.sub(value);
        msg.sender.transfer(value);
        
    }
    function vChangeBtc() payable public{
        if(msg.value < 100000000)
            revert("The minimum value is 1v!");
        uint256 foo = msg.value.mul(btcValue);
        uint256 btc = foo.div(vValue);
        globalShares = globalShares.add(msg.value);
        balances[msg.sender] = balances[msg.sender].add(btc);
        emit AddMortgage(msg.sender, msg.value);
    }

    constructor() payable public {
        balances[owner] = totalSupply;
    }
}
