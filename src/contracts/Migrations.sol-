pragma solidity ^0.5.0;

/**
 * migration contract
 */
contract Migrations {
    /**
     * define props
     */
    address public owner;
    uint256 public last_completed_migration;

    /**
     * set the owner
     */
    constructor() public {
        owner = msg.sender;
    }

    /**
     * restricted gate, only owner can take the modified function
     */
    modifier restricted() {
        if (msg.sender == owner) {
            _;
        }
    }

    /**
     * set the migration as completed
     */
    function setCompleted(uint256 completed) public restricted {
        last_completed_migration = completed;
    }

    /**
     * upgrade migration
     */
    function upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address); // define upgraded var from type Migrations
        upgraded.setCompleted(last_completed_migration);
    }
}
