pragma solidity ^0.5.0;

// 繼承: is, 可以多重繼承


contract A {
    function getContractName() public pure returns (string memory) {
        return "Contract A";
    }
}



contract B is A {
    function getContractName() public pure returns (string memory) {
        return "Contract B";
    }
}