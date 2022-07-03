pragma solidity ^0.5.0;
// 開啟 ABI V2 編碼器
pragma experimental ABIEncoderV2;

contract Crud {
    // out side of functions, it's called state variable
    struct User {
        uint id;
        string name;
    }
    
    // view: do not modify state
    // pure: do not modify state and do not read the state variable
    
    User[] public users;
    
    // store the max id
    uint public nextId = 1;
    
    function create(string memory name) public {
        users.push(User(nextId, name));
        nextId++;
    }
    
    function read(uint id) view public returns(uint, string memory) {
        uint i = find(id);
        return (users[i].id, users[i].name);
    }
    
    function update(uint id, string memory name) public {
        uint i = find(id);
        users[i].name = name;
    }
    
    function destory(uint id) public {
        uint i = find(id);
        delete users[i];
    }
    
    function find(uint id) view internal returns(uint) {
        for(uint i = 0; i < users.length; i++) {
            if(users[i].id == id) {
                return i;
            }
        }
        
        revert('User does not exist');
    }

    // 如果要根據 name 來搜尋的話
    function getByName(string memory _name) view public returns (User memory) {
        for (uint i = 0; i < users.length; i++) {
            string memory name = users[i].name;
            if (keccak256(bytes(name)) == keccak256(bytes(_name))) {
                return users[i];
            }
        }

        revert('User does not exist');
    }
    
}