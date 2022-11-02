const { expect } = require("chai");
const { ethers } = require("hardhat");
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");

describe("Test contract", function () {
    async function deployFixture(){
        [owner, addr1, addr2] = await ethers.getSigners();
        const BToken = await ethers.getContractFactory("BToken");
        const Bfactory = await ethers.getContractFactory("Bfactory");

        //Deploying contracts
        Bfactory = await Bfactory.deploy();
        contract = await BToken.deploy();

        await Bfactory.deployed();
        return {Bfactory, contract, themarRewards, owner, addr1, addr2 }
    }

    it('works before and after upgrading', async function () {
        const Box = await ethers.getContractFactory("BFactory");

        // deploy the beacon and implementation
        const beacon = await upgrades.deployBeacon(Box);
        await beacon.deployed();
        console.log("Beacon deployed to:", beacon.address);

        // change implementation to new version
        const BoxV2 = await ethers.getContractFactory("BFactory");
        await upgrades.upgradeBeacon(beacon.address, BoxV2);
      });
   
});