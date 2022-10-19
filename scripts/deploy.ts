const { ethers, upgrades } = require("hardhat");

async function main() {

  //assign to 'deployer' the signers address
  const [deployer] = await ethers.getSigners();

  //shows the deployer address and its balance
  console.log( "Deploying contracts with the account:", deployer.address );
  console.log("Account balance:", (await deployer.getBalance()).toString());

  //assign to 'BFactory' the compiled contract
  const BFactory = await ethers.getContractFactory("BFactory");

  //deploys the proxy and assigns it to 'contract'
  const contract = await upgrades.deployProxy(BFactory, {
    initializer: "initialize",
  });
  await BFactory.deployed();

  //shows the deployed contract address
  console.log("Contract deployed at:", contract.address);
}


main()
  .then(() => process.exit(0))
  .catch(error => {
	console.error(error);
	process.exit(1);
  });