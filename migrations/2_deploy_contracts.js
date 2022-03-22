const Tether = artifacts.require('Tether');
const AnyCoin = artifacts.require('AnyCoin');

module.exports = async function (deployer) {
    await deployer.deploy(Tether);
    await deployer.deploy(AnyCoin);
}