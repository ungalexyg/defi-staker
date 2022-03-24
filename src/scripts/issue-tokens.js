const deBank = artifacts.require('DeBank');


module.exports = async function issueReward(callback) {
    let deBank = await deBank.deployed();
    await deBank.issueTokens();
    console.log("Tokens have been issues successfully");
    callback();
}