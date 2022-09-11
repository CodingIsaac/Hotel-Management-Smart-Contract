import { ethers } from "hardhat";

const main = async() => {
    const Book = await ethers.getContractFactory("RadissonFlu");

    const bookHotel = Book.attach("0x8F475Eab561be1f13dCaF73E6C4C0Fc315b84EC8");

    const setBook = await bookHotel.book(0.25);

    const setBookReceipt = setBook.wait();

    console.log("Recipt: ", setBookReceipt)

}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
