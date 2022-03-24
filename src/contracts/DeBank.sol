pragma solidity ^0.5.0;

// imports can be used as in js, the .sol is required
import "./RewardToken.sol";
import "./TetherMock.sol";

/**
 * DeBank contract
 */
contract DeBank {
    string public name = "DeBank1...";
    address public owner;
    TetherMock public tether;
    RewardToken public rwrd;
    address[] payable stakers;
    mapping(address => uint256) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaked;

    constructor(RewardToken _rwrd, TetherMock _tether) public {
        rwrd = _rwrd;
        tether = _tether;
        // owner = msg.sender;
    }

    /**
     * Staking function
     */
    function depositTokens(uint256 _amount) public {
        // gate - require amount
        require(_amount > 0, "ammount cannot be 0");

        // address(this), returns contract's address
        // since we trasfer to contract's address it is handled as staking
        tether.transferFrom(msg.sender, address(this), _amount);

        // update staking balance
        stakingBalance[msg.sender] += _amount;

        // empty maapping return false
        if(!hasStaked) {
            stakers.push(msg.sender);
        }

        // update staking flags
        isStaking[msg.sender] = true;
        hasStaking[msg.sender] = true;
    }

    

}
