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
   uint256[] token;
   uint256[] tableno;
   uint256 tokken;
    uint256 tablenoo=123;
    mapping(address=>dish1)dish;
    function todayspl(address a,string _name,uint256 _price)public
    {
        dish[a].dishname=_name;
        dish[a].dishprice=_price;
    }
    function customer1(address a,string name,uint256 price)public  returns(uint256[])
    {
         require(dish[a].dishprice==price);
         tokken++;
         token.push(tokken);
         return token;
    }
   function tokencounter(uint256 tokken)public returns(uint256)
   {
       uint256 m=tokken;
         while(m<500)
      {
          for(uint256 n=0;n<token.length;n++)
          {
              if(m==token[n])
              {
                  tablenoo++;
                  tableno.push(tablenoo); 
                  return tableno[n];
              }
             
          }
      }
   }
      function serving(string dish,uint256 tabbleno)public constant returns(string)
  {
      uint256 i=tabbleno;
      while(i<500)
      {
          for(uint256 j=0;j<tableno.length;j++)
          {
              if(i==tableno[j])
              {
                  return "Enjoy your dish";
              }
            
          }
      }
  }
    
}

PROGRAM:3
VOTING 3 CANDIDATE in 10 VOTERS


pragma solidity^0.4.0;
contract election
{
    struct candidate
    {
        string name;
        uint256 id;
        uint256 nov;
    }
    uint256[] voter;
    uint256[] candy;
    mapping(uint256=>candidate)candi;
   
    function nomination(uint256 a,string name,uint256 id)public
    {
        require(a<3);
        candi[a].name=name;
        candi[a].id=id;
        candi[a].nov=0;
        /* for(uint256 i=0;i<3;i++)
       {
           for(uint256 j=i+1;j<3;j++)
           {
               require(candi[i].id!= candi[j].id);
           }
       }*/
        
    }
    function eligibility(uint256 o,uint256 a)public
   {
      require(o<10);
       voter.push(o);
       for(uint256 i=0;i<voter.length;i++)
       {
           for(uint256 j=i+1;j<voter.length;j++)
           {
               require(voter[i]!=voter[j]);
           }
       }
        //require(candi[a].id==_id);
        candi[a].nov++;
   }
   function result()public returns(uint256[])
   {
       for(uint256 q=0;q<3;q++)
       {
           candy.push(candi[q].nov);
       }
     uint256 temp;
       for(uint256 i=0;i<3;i++)
       {
           for(uint256 j=i+1;j<3;j++)
           {
               if(candy[i]<candy[j])
               {
                  temp=candy[i];
                 candy[i]=candy[j];
                  candy[j]=temp;
                  
               }
           }
       }
     
       return candy;
   }
   function disply()public constant returns(uint256,string,uint256,string)
   {
       for(uint i=0;i<3;i++)
       {
             if(candy[0]==candi[i].nov)
       {
           uint256 a=candy[0]-candy[1];
           return (candi[i].id,"is a winner and won by",a,"votes than candidate 2") ;
       }
       }
        /*for( h=0;h<3;h++)
       {
       if(candy[1]==candi[h].nov)
       {
           return (candi[h].id,"is a runner") ;
       }
       }
       for( h=0;h<3;h++)
       {
       if(candy[2]==candi[h].nov)
       {
           return (candi[h].id,"is a looser") ;
       }
   }*/
   }
   
   function display(uint256 a)public constant returns(uint256,uint256)
   {
       return (candi[a].id,candi[a].nov);
   }
}
