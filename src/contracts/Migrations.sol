pragma solidity ^0.5.0;

/**
 * migration contract
 */
contract Migration {
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
    function set_completed(uint256 completed) public restricted {
        last_completed_migration = completed;
    }

    /**
     * upgrade migration
     */
    function upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.set_completed(last_completed_migration);
    }
}
