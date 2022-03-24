const DeBank = artifacts.require('DeBank');


module.exports = async function issueReward(callback) {
    let deBank = await DeBank.deployed();
    await deBank.issueTokens();
    console.log("Tokens have been issues successfully");
    callback();
}