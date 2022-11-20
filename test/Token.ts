const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Token contract", function () {

  async function deployTokenFixture() {
    const [owner, addr1, addr2, addr3] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("BToken");

    const hardhatToken = await Token.deploy("title", "description", 777, 365, "url");
    const blockNumBefore = await ethers.provider.getBlockNumber();
    return { Token, hardhatToken, owner, addr1, addr2, addr3, blockNumBefore };
  }

  it("Function mint should mint to an address", async function () {
    const { hardhatToken, owner } = await loadFixture(deployTokenFixture);
    await hardhatToken.mint(owner.address, "METADATA");
    expect(await hardhatToken.isOwner(owner.address)).to.equal(true);
  });

  it("Function mintBatch should mint to more than one address", async function () {
    const { hardhatToken, addr1, addr2 } = await loadFixture(deployTokenFixture);
    await hardhatToken.mintBatch([addr1.address,addr2.address], ["METADATA1", "METADATA2"]);
    expect(await hardhatToken.isOwner(addr1.address)).to.equal(true);
    expect(await hardhatToken.isOwner(addr2.address)).to.equal(true);
  });

  it("Function isOwner returns false if the address is not owner", async function () {
    const { hardhatToken, addr3 } = await loadFixture(deployTokenFixture);
    expect(await hardhatToken.isOwner(addr3.address)).to.equal(false);
  });

  it("All the constructor parameters are correctly assigned", async function () {
    const { hardhatToken, blockNumBefore } = await loadFixture(deployTokenFixture);
    const blockBefore = await ethers.provider.getBlock(blockNumBefore);
    expect(await hardhatToken.title()).to.equal("title");
    expect(await hardhatToken.description()).to.equal("description");
    expect(await hardhatToken.tokenURl()).to.equal("url");
    expect(await hardhatToken.startDate()).to.equal(ethers.utils.parseUnits('777', 0));
    expect(await hardhatToken.duration()).to.equal(ethers.utils.parseUnits('365', 0));
    expect(await hardhatToken.creationDate()).to.equal(blockBefore.timestamp);
  });

});