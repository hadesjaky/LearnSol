require("@nomiclabs/hardhat-waffle");
//require("nomiclabs/hardhat-etherscan");
require('hardhat-abi-exporter');

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html


const fs = require('fs');
const mnemonic = fs.readFileSync("../../.secret").toString().trim();

module.exports = {
  defaultNetwork: "OKT",
  networks: {
    hardhat:{
    },
    OKT: {
      url: "https://exchaintestrpc.okex.org",
      chainId: 65,
      accounts:[mnemonic]
    }
  },
  solidity: {                                                               
        version: "0.6.12",
        settings: {
        optimizer: {
            enabled: true,
            runs: 200
          }
    }
  },
  mocha: {
      timeout: 20000
    }
};
