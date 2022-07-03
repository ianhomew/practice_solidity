pragma solidity ^0.5.0;

contract Enum {
    enum Status {
        Pending, // first variable is the default value; 0
        Shipped, // 1 已運送
        Accepted, // 2
        Rejected, // 3
        Canceled // 4
    }
    
    Status public status;
    
    function shipped() public {
        require(status == Status.Pending);
        status = Status.Shipped;
    }
    
    function acceptDelivery() public {
        require(status == Status.Shipped);
        status = Status.Accepted;
    }
    
    function rejectDelivery() public {
        require(status == Status.Shipped);
        status = Status.Rejected;
    }
    
    function canceled() public {
        require(status == Status.Pending);
        status = Status.Canceled;
    }
}