     PROGRAM:1
     ONE SPENDER:-
     
     pragma solidity^0.4.0;
contract token
{
    string  name;
    string symbol;
    uint256  decimal=18;
    mapping(address=>uint256)balanceOff;
    mapping (address => mapping (address => uint256)) allowed;
    function totalsupply(uint256 _totalsupply)public 
    {
         balanceOff[msg.sender]=_totalsupply;
       
    }
   function transfer(address to,uint256 value)public returns(bool success)
   {
        require(balanceOff[msg.sender]>=value);
        balanceOff[msg.sender]-=value;
        balanceOff[to]+=value;
  
       return true;
   }
   function transferfrom(address from,address to ,uint256 value)public returns(bool success)
   {
     require(allowed[msg.sender][from]>=value);
       {
        allowed[msg.sender][from]-=value;
        balanceOff[msg.sender]-=value;
        balanceOff[to]+=value;
       }
          return true;
   }
   function approval(address spender,uint256 value)public returns(uint256)
    {
        allowed[msg.sender][spender]=value;
        return allowed[spender][msg.sender];
    }
    function allowance(address spender)public constant  returns (uint256 balance) 
    {
     return allowed[msg.sender][spender];
    }
 function balanceOf(address _owner) public constant returns (uint256 balance)
    {
     return balanceOff[_owner];
    }
    
}




     
     
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Bank tokken</title>
<style>
	h1{
		font-family:Cooper;
		color:white;
	}
	
	p{
		font-family:Cooper;
	}
</style>
  </head>
  <body bgcolor="sky blue">
<h1>BANK WALLET</h1>
<p>TOTALSUPPLY</p>

<input id="a" placeholder="total supply" type="text" />
<button id="bt" onclick="deposit()">supply</button>

<br>
<br>
<p>TRANSFER</p>
<input id="to_ad" placeholder="to address" type="text" />
<input id="transamt" placeholder="transfer amount" type="text" />
<input type="Button" value="transfer" id="trans_bt" />

<br>
<br>
<p>TRANSFER FROM</p>
<input id="from_ad" placeholder="from address" type="text" />
<input id="to_ad" placeholder="to address" type="text" />
<input id="trans_amt" placeholder="transfer from amount" type="text" />
<input type="Button" value="transferfrom" id="transfr_bt"/>

<br>
<br>
<p>APPROVAL</p>
<input id="sp_ad" placeholder="spender address" type="text" />
<input id="ap_amt" placeholder="approval amount" type="text" />
<input type="Button" value="approval" id="app_bt"/>

<br>
<br>
<p>ALLOWANCE</p>
<input id="sp1_ad" placeholder="spender address" type="text" />
<input type="Button" value="allowance" id="all_bt"/>

<br>
<br>
<p>BALANCEOF</p>
<input id="sp2_ad" placeholder="spender address" type="text" />
<input type="Button" value="balanceof" id="balance_bt"/>

<br>
<br>
</body>
<script>
   
        web3.eth.defaultAccount = web3.eth.accounts[0];
        var ownercon = web3.eth.contract([
	{
		"constant": true,
		"inputs": [
			{
				"name": "_owner",
				"type": "address"
			}
		],
		"name": "balanceOf",
		"outputs": [
			{
				"name": "balance",
				"type": "uint256"
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
				"name": "spender",
				"type": "address"
			}
		],
		"name": "allowance",
		"outputs": [
			{
				"name": "balance",
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
				"name": "spender",
				"type": "address"
			},
			{
				"name": "value",
				"type": "uint256"
			}
		],
		"name": "approval",
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
				"name": "_totalsupply",
				"type": "uint256"
			}
		],
		"name": "totalsupply",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "to",
				"type": "address"
			},
			{
				"name": "value",
				"type": "uint256"
			}
		],
		"name": "transfer",
		"outputs": [
			{
				"name": "success",
				"type": "bool"
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
				"name": "from",
				"type": "address"
			},
			{
				"name": "to",
				"type": "address"
			},
			{
				"name": "value",
				"type": "uint256"
			}
		],
		"name": "transferfrom",
		"outputs": [
			{
				"name": "success",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	}
]);
 var owner_address = ownercon.at('0x892424aea9a6f08641acc7126d6282e288ea86d8');


var damt=document.getElementById("a").value;


var to_1=document.getElementById('to_ad');
var tamt_1=document.getElementById('transamt');
var t_bt=document.getElementById('trans_bt');


var frmad=document.getElementById('from_ad');
var to_2=document.getElementById('to_ad');
var tamt_2=document.getElementById('trans_amt');
var transfrm_bt=document.getElementById('transfr_bt');


var sp_1=document.getElementById('sp_ad');
var appamt=document.getElementById('ap_amt');
var apprl_bt=document.getElementById('app_bt');


var sp_2=document.getElementById('sp1_ad');
var allow_bt=document.getElementById('all_bt');


var sp_3=document.getElementById('sp2_ad');
var bal_bt=document.getElementById('balance_bt');



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

function deposit()
{
 
 
	return  owner_address.totalsupply(damt,function(error,result){
		if(!error){
			alert(result);
		}
		else{
			 alert(error);
		}
	});
	
	
}

 t_bt.addEventListener('click',function(){
 return owner_address.transfer(to_1.value,tamt_1.value, function (error,result){
            if (!error) {
             
              alert(result);
                             
            } else {
             
              alert(error);
            }
        });
      });

transfrm_bt.addEventListener('click',function(){
return owner_address.transferfrom(frmad.value,to_2.value,tamt_2.value, function (error,result){
            if (!error) {
              
             alert(result);
                             
            } else {
            
             alert(error);
            }
        });
      });

 apprl_bt.addEventListener('click',function(){
return owner_address.approval(sp_1.value,appamt.value, function (error,result){
            if (!error) {
              
              alert(result);
                             
            } else {
            
              alert(error);
            }
        });
      });

 allow_bt.addEventListener('click',function(){
return owner_address.allowance(sp_2.value, function (error,result){
            if (!error) {
              
              alert(result);
                             
            } else {
             
              alert(error);
            }
        });
      });

bal_bt.addEventListener('click',function(){
return owner_address.balanceOf(sp_3.value, function (error,result){
            if (!error) {
              alert(result);
                             
            } else {
               alert(error);
            }
        });
      });

</script>
</html>
