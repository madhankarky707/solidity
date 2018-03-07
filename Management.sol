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

dapp for above bank wallet program:

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Bank Wallet</title>
    <script src="web3.min.js"></script>
    
  </head>
  <body>
<h1>Bank Wallet</h1>
<p>Creating account</p>
<input id="index1" placeholder="index value" type="text" />
<input id="cacno" placeholder="accountno" type="text" />
<input id="cacname" placeholder=accountname type="text" />
<input id="cacbal" placeholder="accountbalance" type="text" />
<input type="Button" value="create" id="cre-click"/>
<pre id="hashresult1"></pre>
<br>
<br>
<p>Deposite</p>
<input id="index2" placeholder="index value" type="text" />
<input id="damt" placeholder="deposite amount" type="text" />
<input type="Button" value="deposite" id="dep-click"/>
<pre id="hashresult2"></pre>
<br>
<br>
<p>Transfer</p>
<input id="index3" placeholder="index value" type="text" />
<input id="tamt" placeholder="transfer amount" type="text" />
<input id="index4" placeholder="index value" type="text" />
<input type="Button" value="transfer" id="trans-click"/>
<pre id="hashresult3"></pre>
<br>
<br>
<p>owner transfer</p>
<input id="ownerad" placeholder="owner address" type="text" />
<input type="Button" value="owner transfer" id="ownertrans-click"/>
<pre id="hashresult4"></pre>
</body>
<script>
   
        web3.eth.defaultAccount = web3.eth.accounts[0];
        var ownercon = web3.eth.contract([
	{
		"constant": false,
		"inputs": [
			{
				"name": "a",
				"type": "address"
			},
			{
				"name": "_acno",
				"type": "uint256"
			},
			{
				"name": "_acname",
				"type": "string"
			},
			{
				"name": "_acbal",
				"type": "uint256"
			}
		],
		"name": "creating",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "a",
				"type": "address"
			},
			{
				"name": "_deposite",
				"type": "uint256"
			}
		],
		"name": "deposite",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "owner1",
				"type": "address"
			}
		],
		"name": "ownertransfer",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "a",
				"type": "address"
			},
			{
				"name": "amt1",
				"type": "uint256"
			},
			{
				"name": "_a",
				"type": "address"
			}
		],
		"name": "transfer",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	}
]);
 var owner_address = ownercon.at('0x7b5420e8b764e3f6b812ea2962a00db01850989b');

var index_1=document.getElementById('index1');
var ac_no=document.getElementById('cacno');
var ac_name=document.getElementById('cacname');
var ac_bal=document.getElementById('cacbal');
var cre_bt=document.getElementById('cre-click');
var output_1=document.getElementById('hashresult1');

var index_2=document.getElementById('index2');
var dep_amt=document.getElementById('damt');
var dep_bt=document.getElementById('dep-click');
var output_2=document.getElementById('hashresult2');

var index_3=document.getElementById('index3');
var trans_amt=document.getElementById('tamt');
var index_4=document.getElementById('index4');
var trans_bt=document.getElementById('trans-click');
var output_3=document.getElementById('hashresult3');

var owner_ad=document.getElementById('ownerad');
var ownertrans_bt=document.getElementById('ownertrans-click');
var output_4=document.getElementById('hashresult4');

 if(web3.isConnected()) {
  
        console.log("Ok");
        
      } else {
        console.log("no");
      }
      web3.version.getNetwork((err, netId) => {
            switch (netId) {
              case "1":
                console.log('This is mainnet')
                break
              case "2":
                console.log('This is the deprecated Morden test network.')
                break
              case "3":
                console.log('This is the ropsten test network.')
                break
              case "4":
                console.log('This is the Rinkeby test network.')
                break
              case "42":
                console.log('This is the Kovan test network.')
                break
              default:
                console.log('This is an unknown network.')
            }
        })

cre_bt.addEventListener('click',function()
{
          return owner_address.creating(index_1.value,ac_no.value,ac_name.value,ac_bal.value, function (error,result)
	{
            if (!error) {
              output_1.innerHTML = result;
              console.log(result);
                             
            } else {
              output_1.innerHTML = "Error";
              console.error(error);
            }
        });
});

 dep_bt.addEventListener('click',function(){
 return owner_address.deposite(index_2.value,dep_amt.value, function (error,result){
            if (!error) {
              output_2.innerHTML = result;
              console.log(result);
                             
            } else {
              output_2.innerHTML = "Error";
              console.error(error);
            }
        });
      });


trans_bt.addEventListener('click',function(){
return owner_address.transfer(index_3.value,trans_amt.value,index_4.value, function (error,result){
            if (!error) {
              output_3.innerHTML = result;
              console.log(result);
                             
            } else {
              output_3.innerHTML = "Error";
              console.error(error);
            }
        });
      });
ownertrans_bt.addEventListener('click',function(){
return owner_address.ownertransfer(owner_ad.value, function (error,result){
            if (!error) {
              output_4.innerHTML = result;
              console.log(result);
                             
            } else {
              output_4.innerHTML = "Error";
              console.error(error);
            }
        });
      });
</script>
</html>


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

dapp for above voting program:

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>voting</title>
<script src="web3.min.js"></script>
</head>
<body bgcolor="green">
<h1>voting program</h1>
<br>
<p>NOMINATION</p>
<br>
<input type="text" placeholder="index value" id="ind1" />
<input type="text" placeholder="nameofcandidate" id="can" />
<input type="text" placeholder="candidate id" id="id1" />
<input type="button" value="nomination" id="bt1" />
<pre id="hashresult1"></pre>
<br>
<br>
<p>VOTING</p>
<br>
<input type="text" placeholder="voter" id="vot" />
<input type="text" placeholder="voter id" id="ind2" />
<input type="button" value="vote" id="bt2" />
<pre id="hashresult2"></pre>
<br>
<br>
<p>RESULT</p>
<br>
<input type="button" value="result" id="bt3" />
<pre id="hashresult3"></pre>
<br>
<br>
<p>DISPLY1</p>
<br>
<input type="button" value="diaply1" id="bt4" />
<pre id="hashresult4"></pre>
<br>
<br>
<p>DISPLAY2</p>
<br>
<input type="text" placeholder="candidate index" id="ind3" />
<input type="button" value="display" id="bt5" />
<pre id="hashresult5"></pre>
<br>
<br>
</body>
<script>

 web3.eth.defaultAccount = web3.eth.accounts[0];
        var ownercon = web3.eth.contract([
	{
		"constant": true,
		"inputs": [],
		"name": "disply1",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "a",
				"type": "uint256"
			}
		],
		"name": "display2",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "o",
				"type": "uint256"
			},
			{
				"name": "a",
				"type": "uint256"
			}
		],
		"name": "eligibility",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "a",
				"type": "uint256"
			},
			{
				"name": "name",
				"type": "string"
			},
			{
				"name": "id",
				"type": "uint256"
			}
		],
		"name": "nomination",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "result",
		"outputs": [
			{
				"name": "",
				"type": "uint256[]"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	}
]);
 var owner_address = ownercon.at('0xee49db06674ee5538f99b46031812eb74e10e643');

<input type="text" placeholder="index value" id="ind1" />
<input type="text" placeholder="nameofcandidate" id="can" />
<input type="text" placeholder="candidate id" id="id1" />
<input type="button" value="nomination" id="bt1" />
<pre id="hashresult1"></pre>

var ind_1=document.getElementById('ind1');
var can_name=document.getElementById('can');
var can_id=document.getElementById('id1');
var bt_1=document.getElementById('bt1');
var output_1=document.getElementById('hashresult1');

var v_id=document.getElementById('vot');
var can_id1=document.getElementById('ind2');
var bt_2=document.getElementById('bt2');
var output_2=document.getElementById('hashresult2');

var bt_3=document.getElementById('bt3');
var output_3=document.getElementById('hashresult3');

var bt_4=document.getElementById('bt4');
var output_4=document.getElementById('hashresult4');

var can_idb=document.getElementById('ind3');
var bt_5=document.getElementById('bt5');
var output_5=document.getElementById('hashresult5');

 if(web3.isConnected()) {
  
        console.log("Ok");
        
      } else {
        console.log("no");
      }
      web3.version.getNetwork((err, netId) => {
            switch (netId) {
              case "1":
                console.log('This is mainnet')
                break
              case "2":
                console.log('This is the deprecated Morden test network.')
                break
              case "3":
                console.log('This is the ropsten test network.')
                break
              case "4":
                console.log('This is the Rinkeby test network.')
                break
              case "42":
                console.log('This is the Kovan test network.')
                break
              default:
                console.log('This is an unknown network.')
            }
        })
bt_1.addEventListener('click',function()
{
	return owner_address.nomination(ind_1.value,can_name.value,can_id.value, function(error,result){
	if (!error) {
              output_1.innerHTML = result;
              console.log(result);
                             
            } else {
              output_1.innerHTML = "Error";
              console.error(error);
            }
	 });
      });
bt_2.addEventListener('click',function()
{
	return owner_address.eligibility(v_id.value,can_id1.value, function(error,result){
	if (!error) {
              output_2.innerHTML = result;
              console.log(result);
                             
            } else {
              output_2.innerHTML = "Error";
              console.error(error);
            }
	 });
      });

bt_3.addEventListener('click',function()
{
	return owner_address.result( function(error,result){
	if (!error) {
              output_3.innerHTML = result;
              console.log(result);
                             
            } else {
              output_3.innerHTML = "Error";
              console.error(error);
            }
	 });
      });

bt_4.addEventListener('click',function()
{
	return owner_address.disply1( function(error,result){
	if (!error) {
              output_4.innerHTML = result;
              console.log(result);
                             
            } else {
              output_4.innerHTML = "Error";
              console.error(error);
            }
	 });
      });

bt_5.addEventListener('click',function()
{
	return owner_address.display2(can_idb.value, function(error,result){
	if (!error) {
              output_5.innerHTML = result;
              console.log(result);
                             
            } else {
              output_5.innerHTML = "Error";
              console.error(error);
            }
	 });
      });
</script>
</html>



PROGRAM:5

LIBRARY BOOK MANAGEMENT


pragma solidity^0.4.0;
contract librarymanagement
{
    uint256[] c;
    struct book{
        uint256 id;
       // string name;
        uint256 available;
    }
    uint256[] sd;
    mapping(uint256=>book)b;
 function booksinlibrary(uint256 a,uint256 id/*,string name*/,uint256 available)public
    {
        b[a].id=id;
        //b[a].name=name;
         b[a].available=available;
            c.push(b[a].available);
    }
    function studentdetails(uint256 studentid)public returns(string)
    {
        sd.push(studentid);
        for(uint256 i=0;i<sd.length;i++)
        {
            for(uint256 j=i+1;j<sd.length;j++)
            {
                require(sd[i]!=sd[j]);
            }
        }
        return "saved";
    }
    function booktaking(uint256 studentid,uint256 a,uint256 id)public returns(uint256,uint256,uint256)
    {
        for(uint256 i=0;i<sd.length;i++)
        {
        if(studentid==sd[i])
        {
            require(id==b[a].id);
           b[a].available--;
        }
        }
        
        return (studentid,b[a].id,b[a].available);
    }
    function bookreturning(uint256 studentid,uint256 a)public returns(uint256,uint256)
    {
         for(uint256 i=0;i<sd.length;i++)
        {
        if(studentid==sd[i])
        {
         require(b[a].available<c[a]);
         b[a].available++;
        }
        }
        return (studentid,b[a].available);
    }
    function totalavailablebooks(uint256 a)public constant returns(uint256,/*string,*/uint256)
    {
        return (b[a].id, /*b[a].name,*/b[a].available);
    }
}

"OR"


pragma solidity^0.4.0;
contract librarymanagement
{
    uint256[] c;
    struct book{
        uint256 id;
        uint256 available;
    }
    mapping(address=>book)b;
    mapping(address=>mapping(address=>book))d;
 function booksinlibrary(address a,uint256 id,uint256 available)public
    {
        b[a].id=id;
         b[a].available=available;
    }
    function studentdetails(address studentid,address _id,address a)public
    {
       d[studentid][_id].id= b[a].id;
     b[a].available--;
    }
    function retaking(address studentid,address _id,address a)public
    {
        require(d[studentid][_id].id!= b[a].id);
         d[studentid][_id].id= b[a].id;
         b[a].available--;
    }
      function bookreturning(address studentid,address _id,address a,uint256 n)public returns(address,uint256)
    {
         d[studentid][_id].id=0;
         b[a].available++;
    
        return (studentid,b[a].available);
    }
     function studentdetailyhets(address studentid,address _id,address a)public constant returns(uint256,uint256,uint256)
    {
      return (d[studentid][_id].id,b[a].id,b[a].available);
    }
}



PROGRAM:6
BUS TRANSPORT



pragma solidity^0.4.0;
contract bustransport
{
    struct ticket
    {
       uint256 id;
        uint256 price;
        uint256 count;
    }
    uint256[] a;
    uint256 tc=0;
    uint256 tp=0;
    mapping(address=>ticket)t;
    mapping(address=>mapping(address=>ticket))pass;
    function destinations(address index,uint256 id,uint256 price)public
    {
        t[index].id=id;
        t[index].price=price;
        t[index].count=0;
    }
    function fromsource(address pindex,address dindex,address index,uint256 price)public
    {
        require(price==t[index].price);
        pass[pindex][dindex].id=t[index].id;
        t[index].count++;
          tc++;
          tp+=price;
    }
    function display(address index)public constant returns(uint256,uint256,uint256 tp)
    {
        return  (t[index].count,tc,tp);
    }
}



PROGRAM:7
ONLINE SHOPPIMG

pragma solidity^0.4.0;
contract onlineshopping
{
        struct product{
        string name;
        uint256 available;
        uint256 price;
    }
    uint256 start;
    uint256 end;
    mapping(address=>product)p;
    mapping(address=>mapping(address=>product))b;
    function products(address a,string name,uint256 available,uint256 price)public
    {
        p[a].name=name;
        p[a].available=available;
        p[a].price=price;
        
    }
    function ordering(address buyer,address a,uint256 n)public returns(string,string,uint256)
{
    if(n<=p[a].available)
    {
    b[buyer][a].name=p[a].name;
    b[buyer][a].available=n;
    start=now;
    return ("product available", b[buyer][a].name,b[buyer][a].available);
    }
    else
    {
        return ("product not available", b[buyer][a].name,b[buyer][a].available);
    }
}
    function processing(address a,uint256 n,uint256 price)public returns(string)
    {
       end=now;
        require(end<start+20 seconds);
       uint256 r= p[a].price/p[a].available;
       uint q=r*n;
         if(price==q)
         {
          p[a].available-=n;
          p[a].price-=q;
         return "product will be delivered within 2 days";
         }
         else
         {
             return "insufficiant balance";
         }
             
         }
         function display(address a)public constant returns(string,uint256)
         {
             return (p[a].name,p[a].available);
         }
}

(OR)

pragma solidity^0.4.0;
contract onlineshopping
{
        
    struct product{
                    string name;
                    uint256 available;
                    uint256 price;
                    uint256 start;
                    uint256 end;
                    bool pa;
                  }
    struct buyers{
                    uint256 buyerid;
                    uint256 purchase;
                    uint256 cart;
                    uint256 voucher;
                    bool reg;
                 }
    uint q;
    mapping(address=>product)p;
    mapping(uint256=>buyers)b;
    modifier check(uint256 buyerid,address a)
    {
        require(b[buyerid].reg==true);
        require(p[a].pa=true);
        _;
    }
    function products(address a,string name,uint256 available,uint256 price)public
    {
        require(p[a].pa!=true);
        p[a].name=name;
        p[a].available=available;
        p[a].price=price;
        p[a].pa=true;
    }
    function signup(uint256 buyerid)public returns(string,string,uint256)
    {
        if(b[buyerid].reg==true)
        {
            return ("start","shopping",b[buyerid].buyerid);
        }        
        else{
            b[buyerid].buyerid=buyerid;
            b[buyerid].reg=true;
            return ("successfully logedin","enjoy shopping",b[buyerid].buyerid);
            }
    }
    function ordering(uint256 buyerid,address a,uint256 n)check(buyerid,a) public returns(string,uint256)
    {
         if(b[buyerid].reg==true)
        {
            require(p[a].available!=0);
            require(n<=p[a].available);
            b[buyerid].cart+=n;
            return ("product available",b[buyerid].cart);
        }
    else
        {
            return ("please signin",b[buyerid].buyerid);
        }
    }
    function processing(address a,uint256 buyerid,uint256 n,uint256 price,uint256 usingvoucher)check(buyerid,a) public returns(string,uint256)
    {
          if((b[buyerid].purchase)==5)
             {
               b[buyerid].voucher=500;
             }
        if(usingvoucher==0)
        {
             r= p[a].price/p[a].available;
             q=r*b[buyerid].cart;
         if(price==q)
         {
             b[buyerid].cart-=n;
             return ("product will be delivered within 1 hour",b[buyerid].cart);
         }
         else
         {
           return ("insufficiant balance",b[buyerid].cart);
         }
        
        }else
        {
        require(b[buyerid].voucher!=0);
         uint256 r= p[a].price/p[a].available;
         q=r*b[buyerid].cart;
         if(price==q)
         {
             b[buyerid].voucher-=price;
             b[buyerid].cart-=n;
             return ("with voucher product will be delivered within 1 hour",b[buyerid].cart);
         }
         else
         {
             return ("with vaucher insufficiant balance",b[buyerid].cart);
         }
            
             
        }
    }
         function delivery(address a,uint256 buyerid,uint256 n)check(buyerid,a) public
         {
             b[buyerid].purchase+=n;
             p[a].available-=n;
             p[a].price-=q;
         }
         
             function returning(address a,uint256 buyerid,uint256 n)check(buyerid,a) public
         {
             b[buyerid].purchase-=n;
             uint256 r= p[a].price/p[a].available;
             q=r*n;
             p[a].price+=q;
             p[a].available+=n;
         }   
         function buyerdetailes(uint256 buyerid)public constant returns(uint256 buyersid,uint256 purchase,uint256 voucher)
         {
             return( b[buyerid].buyerid,b[buyerid].purchase,b[buyerid].voucher);
         }
         
         function display(address a)public constant returns(string productname,uint256 totalavailable,uint256 totalproductprice)
         {
             if(p[a].available!=0)
             {
                 return (p[a].name,p[a].available,p[a].price);
             }
             else
             {
                 return ("products has been sold",p[a].available,p[a].price);
             }
         }
}
