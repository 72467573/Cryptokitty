// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importamos desde OpenZeppelin
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/access/Ownable.sol";

/// @title CryptoKittie NFT Contract
/// @notice Este contrato permite a los usuarios crear y comerciar CryptoKitties como NFTs
contract CryptoKittie is ERC721URIStorage, Ownable {

    uint256 public nextTokenId;

    event NewCryptoKittie(address indexed owner, uint256 tokenId, string tokenURI);

    constructor() ERC721("CryptoKittie", "KITTY") {}

    function mint(address to, string memory tokenURI) external onlyOwner {
        uint256 tokenId = nextTokenId;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        nextTokenId++;

        emit NewCryptoKittie(to, tokenId, tokenURI);
    }

    function transferKittie(address from, address to, uint256 tokenId) external {
        transferFrom(from, to, tokenId);
    }
}
