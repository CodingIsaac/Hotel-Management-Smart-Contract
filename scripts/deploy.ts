import { ethers } from "hardhat";

const main = async () => {

    const metadataURL = "ipfs://QmQBHarz2WFczTjz5GnhjHrbUPDnB48W5BM2v2h6HbE1rZ";
    const Hotelcontract = await ethers.getContractFactory("RadissonFlu");

    const deployHotelContract = await Hotelcontract.deploy(metadataURL);

    await deployHotelContract.deployed();

    // const deployedReceipt = await deployHotelContract.wait()

    console.log("Receipt: ", deployHotelContract )

    // 0x8F475Eab561be1f13dCaF73E6C4C0Fc315b84EC8 Deployed Address 
    // This is for the first smart contract.
    // 0x3D489566ae00DCd1ADb9e5e5Df4110DF4b442199 NOW DEPLOYED

    // 0x15dBaEA2b722DF10B9a483e8Ac8f43e33c7D1979 updated address
    
    // 0x2dd8a6334dd0fd9b69f3036f5591b8bc0bcb88b3c15e95e1a508cfc3531c013d Tx Hash
}


main().catch((error) => {
    console.error(error);
    process.exitCode = 1;


  });

