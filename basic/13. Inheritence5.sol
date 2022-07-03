pragma solidity ^0.5.0;

// 在 solidity 內所謂的繼承 實現的方式 就是把繼承的合約代碼複製然後貼上到我們的合約之上
// Q: 那如果繼承的函數有重複名稱的時候 會如何執行？
// A: 從最遠的函數開始呼叫
// super: 呼叫父類別內的全部指定的方法 例如呼叫 super.bar() 會把所有繼承鏈上的 super.bar() 都執行一次, 可以用來清理一些東西
// 繼承需要 most base-like 到 most derived(最遠繼承原則), 意思就是 'is' 後面的繼承要從最base的開始繼承

contract A {
    
    event Log(string message);
    
    function foo() public {
        emit Log("A.foo was called");
    }
    
    function bar() public {
        emit Log("A.bar was called");
    }
    
}

contract B is A {
    function foo() public {
        emit Log("B.foo called");
        A.foo();
    }
    
    function bar() public {
        emit Log("B.bar was called");
        super.bar();
    }
}

contract C is A {
    function foo() public {
        emit Log("C.foo called");
        A.foo();
    }
    function bar() public {
        emit Log("C.bar was called");
        super.bar();
    }
}

contract D is A, B, C {
    // 這裡搞不太懂

    // 這邊執行bar 會先跑 C -> B -> A
    // 這邊執行foo C -> A
}



