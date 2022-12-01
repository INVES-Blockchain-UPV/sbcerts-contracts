const { expect } = require("chai");
const { ethers } = require("hardhat");

const { loadFixture, time } = require("@nomicfoundation/hardhat-network-helpers");
const { BigNumber } = require("ethers");


describe("Base", () => {
    
    async function beforeEach(){
        [owner, addr1, addr2] = await ethers.getSigners();
    
        const TestFactory = await ethers.getContractFactory("BFactory");
        //Deploying contracts
        const factory = await TestFactory.deploy();
        //const token = await TestToken.deploy("Test1");

        await factory.deployed();
        await factory.initialize();
        
        return{factory, owner, addr1, addr2}
    }
    it("Creating a token", async function () {
        // Create the smart contract object to test from
        const {factory, owner, addr1, addr2} = await loadFixture(beforeEach);
        const ONE_DAY_IN_SECS = 24 * 60 * 60;
        const startDate = (await time.latest()) + ONE_DAY_IN_SECS
        //Approvig address
        await expect(factory.connect(owner).createEvent(
            startDate,
            24 * 60 * 60,
            "Test First Event", 
            "Description which past the test created, the minimum caracters abled are 40",
            "url.test.com")).to.
            emit(factory, "EventCreation");

    });
    it("Removing Event", async function () {
        // Create the smart contract object to test from
        const {factory, owner, addr1, addr2} = await loadFixture(beforeEach);
        const ONE_DAY_IN_SECS = 24 * 60 * 60;
        const startDate = (await time.latest()) + ONE_DAY_IN_SECS
        //Approvig address
        await expect(factory.connect(owner).createEvent(
            startDate,
            24 * 60 * 60,
            "Test First Event", 
            "Description which past the test created, the minimum caracters abled are 40",
            "url.test.com")).to.
            emit(factory, "EventCreation");
        
        const TestToken = await ethers.getContractFactory("BToken");
        const token = await TestToken.deploy(           
            "Test First Event",
            "Description which past the test created, the minimum caracters abled are 40",
            startDate,
            24 * 60 * 60,
            "url.test.com",);

        await token.deployed();
        // const id = factory.currentEvent
        await expect(factory.connect(owner).removeCharla(
            1
            )).to.
            emit(factory, "EventCancelation");

    });
    
});
