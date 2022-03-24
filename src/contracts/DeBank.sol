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


    /**
     * issue staking rewards
     */
     function issueTokens() public {
         require(msg.sender == owner, "Caller must be the owner");

         for(uint i=0; i<stakers.length; i++) {
             // get staker address
             address recipient = stakers[i]; 

             // get staker balance
             uint balance = stakingBalance[recipient];

            // if the balcne grather the 0
             if(balance > 0) {
                 // issue to staker's equal amount of their balance 
                 // e.g for every staked coin they get one
                 // it can be something like 
                //  balance = balance * 0.1 to give 10% etc
                 rwrd.transfer(recipient, balance); 
             }
         }
     }


 
}
