
const hre = require("hardhat");
const { writeAddr } = require('./artifact_log.js');

const GBCTokenAddr = require(`../deployments/dev/GBCToken.json`)

async function main() {
  const VaultF = await hre.ethers.getContractFactory("Vault");
  const vault = await VaultF.deploy(GBCTokenAddr.address);

  await vault.deployed();

  console.log("Vault deployed to:", vault.address);
  await writeAddr(vault.address, "Vault", "dev")

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
