pragma solidity ^0.5.0;

/**
 * AnyCoin contract
 */
contract AnyCoin {
    /**
     * define props
     */
    string public name = "AnyCoin";
    string public symbol = "mANY";
    uint256 public totalSupply = 1000000000000000000000000; // 18 dec, 1 million tokens
    uint8 public decimals = 18;
    // mapping(address => uint256) public balanceOf;
    // mapping(address => mapping(address => uint256)) public allowance;

    // /**
    //  * set events
    //  */
    // event Transfer(address indexed _from, address indexed _to, uint256 _value);
    // event Approval(
    //     address indexed _owner,
    //     address indexed _spender,
    //     uint256 _value
    // );

    // /**
    //  * assign the supply to the owner
    //  */
    // constructor() public {
    //     balanceOf[msg.sender] = totalSupply;
    // }

    // /**
    //  * transfer tokens from sneder's supply to to given address
    //  */
    // function transfer(address payable _to, uint256 _value)
    //     public
    //     returns (bool success)
    // {
    //     // gate - check balance
    //     require(balanceOf[msg.sender] >= _value, "Insufficient supply balance");

    //     // adjust balances
    //     balanceOf[msg.sender] -= _value;
    //     balanceOf[_to] += _value;

    //     // trigger trasfer event event
    //     emit Transfer(msg.sender, _to, _value);

    //     return true;
    // }

    // /**
    //  * transfer _from address _to address
    //  */
    // function transferFrom(
    //     address _from,
    //     address payable _to,
    //     uint256 _value
    // ) public returns (bool success) {
    //     // get - check from balance
    //     require(balanceOf[_from] >= _value, "Insufficient balance");

    //     // adjust balances
    //     balanceOf[_from] -= _value;
    //     balanceOf[_to] += _value;

    //     // trigger trasfer event event
    //     emit Transfer(_from, _to, _value);

    //     return true;
    // }

    // /**
    //  * transfer approval
    //  */
    // function approve(address _spender, uint256 _value)
    //     public
    //     returns (bool success)
    // {
    //     // mark allowance
    //     allowance[msg.sender][_spender] = _value;

    //     // trigger approval event
    //     emit Approval(msg.sender, _spender, _value);

    //     return true;
    // }
}
