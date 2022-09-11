import { ethers } from "hardhat";

const main = async () => {
    const Hotelcontract = await ethers.getContractFactory("RadissonFlu");

    const deployHotelContract = await Hotelcontract.deploy();

    await deployHotelContract.deployed();

    // const deployedReceipt = await deployHotelContract.wait()

    console.log("Receipt: ", deployHotelContract )

    // 0x8F475Eab561be1f13dCaF73E6C4C0Fc315b84EC8 Deployed Address
}


main().catch((error) => {
    console.error(error);
    process.exitCode = 1;


  });

