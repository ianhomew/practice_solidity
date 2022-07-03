pragma solidity ^0.5.0;

contract Base {
    // private: 合約(self)內部可見
    // internal: 合約與 child contract 內部可見
    // public: 
    // external: 只有外部可以呼叫
    
    function privateFunc() pure private returns(string memory) {
        // deploy 後會發現外面看不到
        return "private function called";
    }
    
    function internalFunc() pure internal returns(string memory) {
        return "internal function called";
    }
    
    function externalFunc() pure external returns(string memory) {
        return "external function called";
    }
    
    function publicFunc() pure public returns(string memory) {
        return "public function called";
    }
    
}


contract ExtendBase is Base {
    function callInternalFunc() pure public returns(string memory) {
        return Base.internalFunc();
    }
    
    // 會錯
    // function callExternalFunc() pure public returns(string memory) {
    //     return Base.externalFunc();
    // }
}

contract A {
    // 這邊不懂 (這邊是 Base.externalFunc 是 external 只有外部合約可以呼叫)
    function callExternalFunc() pure public returns(string memory) {
        return Base.externalFunc();
    }
    
    function callPublicFunc() pure public returns(string memory) {
        return Base.publicFunc();
    }
}



