library program:1

pragma solidity^0.4.0;
library sample
{
    function add(uint256 a,uint256 b)returns (uint256)
    {
        return a+b;
    }
}
import "./sample.sol";//if the library is in another file or if library is used in same file import doesnot need.
contract test
{
    using sample for uint; //This is to declare that we r getting as uint256 frm library.
    function addition(uint256 a,uint256 b)public constant returns(uint256)
    {
        return a.add(b);// add is an library function name.
    }
}


library program:2

//filename=sample2.sol
pragma solidity^0.4.0;
library sample
{
    function add(uint256 a,uint256 b)public constant returns(uint256 x,uint256 y,uint256 z)
    {
        x=a+b;
         y=a-b;
        z=a*b;
    }
}

pragma solidity ^0.4.0;

import "./sample2.sol";
contract str
{
    using sample for uint256;
    function sum(uint256 a,uint256 b)public constant returns(uint256)
    {
        a.add(b);
    }
}

output:    
0: uint256: x 7
1: uint256: y 1
2: uint256: z 12
