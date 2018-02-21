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
