import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
// hardhat.config.ts
import '@openzeppelin/hardhat-upgrades';
import '@nomicfoundation/hardhat-network-helpers'
const config: HardhatUserConfig = {
  solidity: "0.8.17",
};

export default config;
