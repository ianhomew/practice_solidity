pragma solidity ^0.5.0;

//
contract SimpleStorage {
    string public data = 'mydata'; // this will save on blockchain, because it is not in the function
    
    function set(string memory _data) public {
        data = _data;
    }
    
    // view: read data
    function get() view public returns(string memory) {
        return data;
    }

    // 很重要！！！ 這邊 unit[] 輸入的方式是  """[44,55,66]"""
    // "EGG", [44,55,66], 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    function set(string memory _name, uint[] memory _ids, address _addr) public {
        name = _name;
        ids = _ids;
        addr = _addr;
    }

}