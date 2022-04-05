const hre = require("hardhat");
const { writeAddr } = require('./artifact_log.js');


async function main() {
  const SushiToken = await hre.ethers.getContractFactory("SushiToken");
  const sushi = await SushiToken.deploy();

  await sushi.deployed();

  console.log("SushiToken deployed to:", sushi.address);
  await writeAddr(gbc.address, "sUSHIToken", "Sushi")

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
