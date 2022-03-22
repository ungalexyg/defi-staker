pragma solidity ^0.5.0;

/**
 * Tether contract
 */
contract Tether {
    /**
     * define props
     */
    string public name = "Tether";
    string public symbol = "mUSDT";
    uint256 public totalSupply = 1000000000000000000; // 18 dec, 1 million tokens
    uint8 public decimals = 18;
    mapping(address => uint256) public balanceOf;

    /**
     * assign the supply to the owner
     */
    constructor() public {
        balanceOf[msg.sender] = totalSupply;
    }

    /**
     * prep events
     */
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approve(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    /**
     * transfer logic
     */
    function transfer(address payable _to, uint256 _value)
        public
        returns (bool sucess)
    {
        // check balance
        require(balanceOf[msg.sender] >= _value, "Insufficient Balance");

        // calc balances
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        // trigger event
        emit Transfer(msg.sender, _to, _value);

        return true;
    }
}
