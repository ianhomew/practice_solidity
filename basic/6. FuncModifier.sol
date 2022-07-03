pragma solidity ^0.5.0;

contract FuncModifier {
    // _; 就是使用 modifer 的 function
    
    address public owner;
    
    constructor () public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(owner == msg.sender, 'Not owner');
        _;
    }
    
    modifier validAddress(address _address) {
        require(_address != address(0), 'Not valid address');
        _;
    }
    
    // modifer 會依照 onlyOwner validAddress 順序執行
    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }
    
    
}