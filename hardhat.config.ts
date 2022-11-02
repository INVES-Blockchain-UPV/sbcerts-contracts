import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
// hardhat.config.ts
import '@openzeppelin/hardhat-upgrades';
const config: HardhatUserConfig = {
  solidity: "0.8.17",
};

export default config;
