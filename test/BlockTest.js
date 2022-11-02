const { expect } = require("chai");
const { ethers } = require("hardhat");

const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");


describe("Base", () => {
    
    beforeEach(async () => {
        [owner, addr1, addr2] = await ethers.getSigners();
    
        const TestFactory = await ethers.getContractFactory("BFactory");
        const TestToken = await ethers.getContractFactory("BToken");
        //Deploying contracts
        const factory = await TestFactory.deploy();
        const token = await TestToken.deploy();

        await factory.deployed();
        await token.deployed();
        
        return{factory, token, owner, addr1, addr2}
    })
    it("Creating a token", async function () {
    });
});
