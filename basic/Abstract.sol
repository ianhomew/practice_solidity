pragma solidity ^0.5.0;


/**
    抽象類別: 建構子可視範圍是 internal
 */
contract Car {

    address owner;
    string brand;
    uint price;

    constructor (string memory _brand, uint _price) internal {
        owner = msg.sender;
        brand = _brand;
        price = _price;
    }

    modifier onlyOwner {
        require(isOwner(), 'Do not own this car');
        _;
    }

    function isOwner() view public returns (bool) {
        return owner == msg.sender;
    }

    function getPice() public;
    function setPrice(uint _price) public;

}


contract Toyota is Car {
    constructor (string memory _brand, uint _price) Car(_brand, _price) public {
    }

    function getPrice() view public returns(uint) {
        return price;
    }
    function setPrice(uint _price) public onlyOwner {
        price = _price;
    }

}
