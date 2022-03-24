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

    TetherMock public stablecoin;
    RewardToken public rwrd;

    constructor(RewardToken _rwrd, TetherMock _tether) public {
        rwrd = _rwrd;
        stablecoin = _tether;
    }
}
