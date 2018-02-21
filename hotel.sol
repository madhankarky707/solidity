pragma solidity ^0.4.0;
contract hotelmanagement
{
    struct dish1{
        string dishname;
        uint256 dishprice;
    }
    mapping(address=>dish1)dish;
   // mapping(address=>dish1)customer1;
    function todayspl(address a,string _name,uint256 _price)public
    {
        dish[a].dishname=_name;
        dish[a].dishprice=_price;
    }
    modifier check(address a,uint256 price)
    {
        require(dish[a].dishprice==price);
        _;
    }
    function customer(address a,string name,uint256 price)check(a,price)public constant returns(string)
    {
       
          return "token";
    }
    
}
