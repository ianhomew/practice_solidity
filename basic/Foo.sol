pragma solidity ^0.5.0;

contract Foo {
    string public name = 'Fool';
    
    function getName() view public returns (string memory) {
        return name;
    }
}