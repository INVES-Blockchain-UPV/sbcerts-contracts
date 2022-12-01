const { ethers, upgrades } = require("hardhat");

async function main() {
  // Deploying
  const Box = await ethers.getContractFactory("BFactory");
  const instance = await upgrades.deployProxy(Box,{
    initializer: "initialize", //Nombre de la función initialize en BFactory.sol
  });

  await instance.deployed();

  console.log("Contract deployed at: " + instance.address);

}

main();