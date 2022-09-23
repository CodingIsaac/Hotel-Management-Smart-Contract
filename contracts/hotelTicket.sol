// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract RadissonFlu is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    using Strings for uint256;

    string _baseNFTURI;

    uint256 public bookingPrice = 0.2 ether;

    uint256 public maxNFTids = 50;

    uint256 public NFTids;

    // Counters.Counter private _tokenIdCounter;
    // uint256 MAX_SUPPLY = 100;

    constructor(string memory baseURI) ERC721("RadissonFlu", "RFLU") {
        _baseNFTURI = baseURI;
    }

    function safeMint() public payable {
        // uint256 tokenId = _tokenIdCounter.current();
        require(NFTids < maxNFTids, "Premium Rooms Rxceeded");
        require(msg.value >= bookingPrice, "Check the Booking Price");
        // require(tokenId >= MAX_SUPPLY, "Premium Rooms Unavailable" );
        // _tokenIdCounter.increment();
        NFTids += 1;
        _safeMint(msg.sender, NFTids);
        // _setTokenURI(tokenId, uri);
    }

    // 

    function _baseURI() internal view virtual override returns (string memory) {
            return _baseNFTURI;
        }

    // 


    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        require(_exists(tokenId), "ERC721Metadata: URI query nonexistent token");
        string memory baseURI = _baseURI();

        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString(), ".json")) : "";
        }


    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal onlyOwner override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
