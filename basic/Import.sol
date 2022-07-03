pragma solidity ^0.5.0;

import "./Foo.sol";

contract ImportFoo {
    Foo foo = new Foo();

    function go() view public returns (string memory) {
        
        return foo.getName();
    }
    
    // 不能這樣寫
    // function go1() public returns (string memory) {
    //     return foo.name;
    // }
}


// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
// import "github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol"; // master 上的版本不對
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol"; // 版本正確

contract MyToken is ERC20 {

}