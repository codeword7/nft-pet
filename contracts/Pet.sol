// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Pet is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Pet", "PET") {}

    event PetNFTCreated (
        uint tokenId,
        string imageURL,
        uint date,
        address from
    );

    function mintPetNFT(address person, string memory tokenURI)
        external 
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(person, newItemId);
        _setTokenURI(newItemId, tokenURI);
        emit PetNFTCreated(newItemId, tokenURI, block.timestamp, person);
    }
}