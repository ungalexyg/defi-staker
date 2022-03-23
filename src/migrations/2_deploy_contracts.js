const TetherMock = artifacts.require('TetherMock');
const RewardToken = artifacts.require('RewardToken');
const DeBank = artifacts.require('DeBank');

module.exports = async function (deployer) {
    await deployer.deploy(TetherMock);
    await deployer.deploy(RewardToken);
    await deployer.deploy(DeBank);
}