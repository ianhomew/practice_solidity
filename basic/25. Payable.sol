pragma solidity ^0.5.0;

contract Wallet {

    // payable functions and constructor can send ether
    // payable addresses can send ether
    
    event Deposit(address sender, uint amount, uint balance);
    event Withdraw(uint amount, uint balance);
    event Transfer(address to, uint amount, uint balance);
    
    address payable public owner;
    
    constructor() public payable {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(owner == msg.sender, "Not owner");
        _;
    }
    
    function ttt() public payable {
        // 帶有關鍵字 payable 的 function 本身就有交易功能
        // 交易的對象: from 調用發起人 to 合約地址
        // addr.transfer(1 ether)、addr.send(1 ether)、addr.call.value(1 ether)
        // 以上三種方式 都是轉幣到 addr 這個地址上, 也就是 接收方是 addr
        
        // https://solidity-by-example.org/payable/
    }
    
    function deposit() public payable {
        // msg.value: transaction 的金額
        // address(this).balance: 合約地址的金額
        emit Deposit(msg.sender, msg.value, address(this).balance);

        // 不能也不需要這樣寫
        // By default eth sent through payable function will be stored in the contract itself, 
        // so no need of using address(this).transfer(msg.value)
    }
    
    function withdraw(uint _amount) public onlyOwner {
        owner.transfer(_amount);
        // address(msg.sender).transfer(_amount);
        emit Withdraw(_amount, address(this).balance);
    }
    
    function transfer(address payable _to, uint _amount) public  {
        _to.transfer(_amount);
        emit Transfer(_to, _amount, address(this).balance);


        // 實際上的過程是 發送方(from)是將ETH轉到合約(contract Wallet)內, 然後再由合約轉到指定的地址(_to)
        // 
        // emit Log('before tansfer =', address(this).balance);
        // _to.transfer(msg.value);
        // emit Log('after transfer =', address(this).balance);
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    
}