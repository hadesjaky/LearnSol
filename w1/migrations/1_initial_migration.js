const Migrations = artifacts.require("VBTC");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
