pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract Bank {
    using SafeMath for uint;

    address owner;

    struct User {
        uint balance;
        string name;
        uint lastUpdated;
    }


    mapping (address => User) public users;

    event Deposit(address sender, uint amount);
    event Withdraw(address sender, uint amount);

    constructor () public {
        owner = msg.sender;
        users[owner].name = 'EGG';
        users[owner].balance = 1;
    }

    modifier checkAmount (uint _amount) {
        require(_amount >= 0, 'amount must great than 0');
        _;
    }

    function getUser(address _addr) view public returns (User memory) {
        return users[_addr];
    }

    function deposit (address _addr, uint _amount) public checkAmount(_amount) {

        uint balance = users[_addr].balance;
        // balance += _amount;
        balance = _amount.add(balance);
        if (balance < users[_addr].balance) {
            revert("balance was wrong");
        }

        users[_addr].balance = balance;
        users[_addr].lastUpdated = block.timestamp;
        emit Deposit(_addr, _amount);
    }

    function withdraw (address _addr, uint _amount) public checkAmount(_amount) {

        uint balance = users[_addr].balance;
        // balance -= _amount;
        balance = _amount.sub(balance);
        if (balance > users[_addr].balance) {
            revert("balance was wrong");
        }

        users[_addr].balance = balance;
        users[_addr].lastUpdated = block.timestamp;
        emit Withdraw(_addr, _amount);
    }

}