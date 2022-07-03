值類型：
布爾類型（bool）、整型（int）、地址類型（address）、定長位元組數組（bytes）、枚舉類型（enums）、函數類型（function）；

如果一個變量是值類型，給它賦值時永遠是值傳遞！

引用類型：
字元串（string）、數組（array）、結構體（structs）、字典（mapping）、不定長位元組數組（bytes）

如果一個變量是引用類型，給它賦值時可以是值，也可以是引用，這決定於該變量是Storage類型還是Memory類型。







關鍵字：Storage 和 Memory
Storage 是把變量永久儲存在區塊鏈中，Memory 則是把變量臨時放在內存中，當外部函數對某合約調用完成時，內存型變量即被移除。 
你可以把它想象成存儲在你電腦的硬盤或是RAM中數據的關系。

大多數時候你都用不到這些關鍵字，默認情況下 Solidity 會自動處理它們。

狀態變量（在函數之外聲明的變量）默認為“存儲”形式，並永久寫入區塊鏈；而在函數內部聲明的變量是“內存”型的，它們函數調用結束後消失。

通過指定引用類型變量的關鍵字，可以人為設置變量為storage或memory。

函數的引用類型參數是storage時，是引用傳遞；函數的引用類型參數是Memory時，是值傳遞；函數值類型參數永遠是值傳遞。




```
pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract SandwichFactory {

    struct Sandwich {
        string name;
        string status;
    }
    

    Sandwich[] public sandwiches;

    constructor () public {
        sandwiches.push(Sandwich('S1', ''));
        sandwiches.push(Sandwich('S2', ''));
        sandwiches.push(Sandwich('S3', ''));
    }


    function eatSandwich (uint _index) public {
    
        // storage is call by reference
        Sandwich storage sandwich1 = sandwiches[_index];
        sandwich1.status = 'Eaten!';
    
        // memory is call by value
        Sandwich memory sandwich2 = sandwiches[_index + 1];
        sandwich2.status = 'Eaten!';

    
    }

    function getSandwich (uint _index) view public returns(Sandwich memory) {
        return sandwiches[_index];
    }




}
```


