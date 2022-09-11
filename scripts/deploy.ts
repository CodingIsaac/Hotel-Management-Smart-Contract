import { ethers } from "hardhat";

const main = async () => {
    const Hotelcontract = await ethers.getContractFactory("RadissonFlu");

    const deployHotelContract = await Hotelcontract.deploy();

    await deployHotelContract.deployed();

    // const deployedReceipt = await deployHotelContract.wait()

    console.log("Receipt: ", deployHotelContract )

    // 0x8F475Eab561be1f13dCaF73E6C4C0Fc315b84EC8 Deployed Address
    // 0x2dd8a6334dd0fd9b69f3036f5591b8bc0bcb88b3c15e95e1a508cfc3531c013d Tx Hash
}


main().catch((error) => {
    console.error(error);
    process.exitCode = 1;


  });

