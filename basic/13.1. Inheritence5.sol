pragma solidity ^0.5.0;

contract Base1 {
    function bar () public pure returns(string memory) {
        return "1";
    }
}
contract Base2 {
    function bar () public pure returns(string memory) {
        return "2";
    }
}


// 根據 most derived 最遠繼承原則 會先呼叫 Base2 然後才呼叫 Base1
contract MostDerived1 is Base1, Base2 {
    
}

// 根據 most derived 最遠繼承原則 會先呼叫 Base1 然後才呼叫 Base2
contract MostDerived2 is Base2, Base1 {
    
}