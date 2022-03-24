pragma solidity ^0.5.0;

/**
 * RewardToken contract
 */
contract RewardToken {
    /**
     * define props
     */
    string public name = "RewardToken";
    string public symbol = "RWRD";
    // Wei, 1 token = 18 dec, 1 million tokens = 24 dec
    uint256 public totalSupply = 1000000000000000000000000; // 1 million tokens
    uint8 public decimals = 18;
    mapping(address => uint256) public balanceOf; // balnces storage
    mapping(address => mapping(address => uint256)) public allowance;

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

    event Approval(
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
        // gate - check balance
        require(balanceOf[msg.sender] >= _value, "Insufficient Balance");

        // calc balances
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        // trigger transfer event
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    /**
     * transafer from to address
     */
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        // gate - check from balance
        require(balanceOf[_from] >= _value, "Insufficient Balance");
        // require(allowance[_from][msg.sender] >= _value, "Insufficient Balance");

        // substract the value amount from the sender's balance
        balanceOf[_from] -= _value;

        // add the value amount to the receiver's balance
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        // trigger transfer event
        emit Transfer(_from, _to, _value);

        return true;
    }

    /**
     * transafer approval
     */
    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        // mark allowance
        allowance[msg.sender][_spender] = _value;

        // trigger approval event
        emit Approval(msg.sender, _spender, _value);

        return true;
    }
}
