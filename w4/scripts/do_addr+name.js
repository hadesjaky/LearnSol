
const hre = require("hardhat");
const { writeAddr } = require('./artifact_log.js');

//const ERC2612Addr = require(`../deployments/dev/GBCToken.json`)



async function main() {
    await writeAddr("0xee21aD0FA3bb697462D2B1e40DE572cDd70A6813", "GBCToken", "dev")

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
