pragma solidity ^0.5.0;

contract Car {
    string public model;
    address public owner;

    constructor (string memory _model, address _owner) public payable {
        model = _model;
        owner = _owner;
    }

}


contract CarFactory {

    Car[] public cars;

    function create(string memory _model) public {
        // 這邊會得到合約地址 可以在 remix 左邊選 Car 這個合約 有個 'At address' 輸入 Car 合約地址可以取得該合約
        // 因為已經 new 出來 Car 所以不需要做 deploy
        Car car = new Car(_model, address(this));
        cars.push(car);
    }

    function createCarAndSendEther(string memory _model, address _owner) public payable {
        Car car = (new Car).value(msg.value)(_model, _owner);
    }
}