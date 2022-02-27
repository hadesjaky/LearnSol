const { artifacts } = require("hardhat");
const hre = require("hardhat");

async function main(){
    //await hre.run('compile');
    const Greeter = await hre.ethers.getContractFactory("Greeter");
    const greeter = await Greeter.deploy("Hello, Hardhat!!!");

    await greeter.deployed();
    console.log("Greeter deployed to:  ", greeter.address);

    let Artifact = await artifacts.readArtifact("Greeter");
    //await writeAbiAddr(Artifact, greeter.address, "Greeter", network.name);

}

main()