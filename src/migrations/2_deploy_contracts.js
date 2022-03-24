const TetherMock = artifacts.require('TetherMock');
const RewardToken = artifacts.require('RewardToken');
const DeBank = artifacts.require('DeBank');

// functions get deployer, network & accounts
// in dev , accounts = these are the accounts that listed in ganache as well
// They can also be accessed via truffle console 
// > accouts = web3.eth.getAccounts() 
module.exports = async function (deployer, network, accounts) {
    // deploy the stable coin
    await deployer.deploy(TetherMock);
    const stablecoin = TetherMock.deployed();

    // deploy the reward coin
    await deployer.deploy(RewardToken);
    const rwrd = RewardToken.deployed();

    // deploy the bank 
    await deployer.deploy(DeBank, rwrd.address, stablecoin.address);
    const deBank = DeBank.deployed();

    // transfer rewards supply to the bank
    await rwrd.transfer(deBank.address, '1000000000000000000000000'); // 1 million tokens

    // transfer to investors RWRD (RewardToken) 
    let results = [];
    results[1] = await stablecoin.transfer(accounts[1], '100000000000000000000'); // 100 tokens
    results[2] = await stablecoin.transfer(accounts[2], '100000000000000000000'); // 100 tokens

    console.log(results);
}