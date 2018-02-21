program:1
BANK WALLET

pragma solidity^0.4.0;
contract bank
{
 address public owner;
    function bank()
    {
        owner=msg.sender;
    }
    struct user{
        uint256 acno;
        string acname;
        uint256 acbal;
    }
   
    string rt;
    mapping(address=>user)ac;
    modifier check1()
    {
        require(owner==msg.sender);
        _;
    }
     modifier check2(address a,uint256 amt1)
    {
        require(ac[a].acbal>amt1);
        _;
    }
    
    function creating(address a,uint256 _acno,string _acname,uint256 _acbal)check1()public
    {
        ac[a].acno=_acno;
        ac[a].acname=_acname;
        ac[a].acbal=_acbal;
        
    }
    function deposite(address a,uint256 _deposite)check1()public returns(uint256)
    {
        ac[a].acbal+=_deposite;
        return ac[a].acbal;
    }
   
    function transfer(address a,uint256 amt1,address _a)check1()check2(a,amt1)public returns(uint256,uint256)
    {
        ac[a].acbal-=amt1;
        ac[_a].acbal+=amt1;
         return (ac[a].acbal, ac[_a].acbal);
    }
   
    function ownertransfer(address owner1)public check1()
    {
        owner=owner1;
    }
}


PROGRAM:2
STUDENT INTERVIEW APLLY

contract student
{
     struct student
     {
     string name;
     uint256 age;
     uint256 id;
     }
     mapping(address => student)student1;
     mapping(address => student)student2;
   
     function olddata(string _name,uint256 _age,uint256 _id,address key1)public 
     {
         student1[key1].name=_name;
         student1[key1].age=_age;
         student1[key1].id=_id;
     }
     function newdata(string _name,uint256 _age,uint256 _id,address key2)public 
     {
         student2[key2].name=_name;
         student2[key2].age=_age;
         student2[key2].id=_id;
         
     }
     function output()public view returns(string)
     {
         for(uint256 i=0;i<3;i++)
         {
             if(student1[i].id=_id==student2[key2].id=_id)
             {
                 return valid;
             }
             else
             {
                 return invalid;
             }
         }
     }
}


PROGRAM:3
HOTEL

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
