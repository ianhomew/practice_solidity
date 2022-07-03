pragma solidity ^0.6.0;

pragma experimental ABIEncoderV2;

contract User111 {
    
    struct User {
        string name;
        uint age;
    }
    
    struct Player {
        User user;
        uint money;
        bool is_win;
    }
    
    // User[] public users;
    Player[] players; // nested struct 怎麼不能用 public
    
    function addPlayer(string memory _name, uint _money, uint _age) public {
        players.push(
            Player(
                User(_name, _age), 
                _money, 
                false
            )
        );
    }
    
    function getPlayer(uint _index) view public returns(string memory name, uint money, bool is_win) {
        Player memory player = players[_index];
        return (player.user.name, player.money, player.is_win);
    }
    
    function detail(uint _index) view public returns(Player memory) {
        return players[_index];
    }
    
    
    
}