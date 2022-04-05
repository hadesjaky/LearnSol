const hre = require("hardhat");
const { writeAddr } = require('../../scripts/artifact_log.js');

const SushiTokenAddr = require(`../../deployments/Sushi/SushiToken.json`)

async function main() {
  let toAddr = "0xA36eBFF50ecf1f6af96C1159FCaB01C92d7Ac7b3";
  let [owner, ] = await ethers.getSigners();
  console.log("toAddr:", toAddr);

  const MasterChef = await hre.ethers.getContractFactory("MasterChef");
  const masterchef = await MasterChef.deploy(SushiTokenAddr.address,  toAddr, 10 **3,  10626680 ,20626680);

  await masterchef.deployed()

  console.log("MasterChef deployed to:", masterchef.address);
  await writeAddr(masterchef.address, "MasterChef", "Sushi")

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
