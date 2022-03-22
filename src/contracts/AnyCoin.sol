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
    uint256 public totalSupply = 1000000000000000000; // 18 dec, 1 million tokens
    uint8 public decimals = 18;
}
