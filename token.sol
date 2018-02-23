     PROGRAM:1
     ONE SPENDER:-

contract erc20
{
     function initialization(string _name,string _symbol)public /*constant returns(bool success)*/;
     function transfer(address to,uint256 value)public  returns(bool success);
     function transferfrom(address from,address to ,uint256 value)public returns(bool success);
     function balance(address _owner) constant returns (uint256 balance);
       function approval(address spender,uint256 value)public returns(uint256);
        function balance1(address spender)public constant  returns (uint256 balance);
        event Transfer(address from, address to, uint256 value);
    //event Approval(address owner, address indexed _spender, uint256 _value);
}
contract token is erc20
{
    string public name;
    string public symbol;
    uint256 public decimal=18;
    uint256 public totalsupply=1000;
    
    mapping(address=>uint256)balanceOf;
     mapping (address => mapping (address => uint256)) allowed;
  
    function initialization(string _name,string _symbol)public //constant returns(bool success)
{
    balanceOf[msg.sender]=totalsupply;
    name=_name;
    symbol=_symbol;
}
   function transfer(address to,uint256 value)public returns(bool success)
   {
        require(balanceOf[msg.sender]>=value);
       balanceOf[msg.sender]-=value;
       balanceOf[to]+=value;
   Transfer(msg.sender,to,value);
       return true;
   }
   function transferfrom(address from,address to ,uint256 value)public returns(bool success)
   {
     require(allowed[from][msg.sender]>=value);
       {
        allowed[from][msg.sender]-=value;
       balanceOf[to]+=value;
       }
        Transfer(from,to,value);
          return true;
   }
   function balance(address _owner) constant returns (uint256 balance) {
     return balanceOf[_owner];
      
  }
    
   function approval(address spender,uint256 value)public returns(uint256)
    {
        allowed[spender][msg.sender]=value;
        balanceOf[msg.sender]-=value;
        return allowed[spender][msg.sender];
  
    }
    function balance1(address spender)public constant  returns (uint256 balance) {
     return allowed[spender][msg.sender];
}
}



PROGRAM:2
     TWO SPENDER:-
     
     contract erc20
{
     function initialization(string _name,string _symbol)public;
     function transfer(address to,uint256 value)public  returns(bool success);
     function transferspender(address from,address to ,uint256 value)public returns(bool success);
     function transferspdr(address spdr,address _spender,address to ,uint256 value)public returns(bool success);
     function approvalspender(address spender,uint256 value)public returns(uint256);
     function approvalspdr(address spender,address spdr,uint256 value)public;
     function balance(address _owner) constant returns (uint256 balance);
     function balancespender(address spender)public constant  returns (uint256 balance);
     function balancespdr(address spdr,address n)public constant  returns (uint256 );
     event Transfer(address from, address to, uint256 value);
}
contract token is erc20
{
    string public name;
    string public symbol;
    uint256 public decimal=18;
    uint256 public totalsupply=1000;
    
     mapping(address=>uint256)balanceOf;
     mapping (address => mapping (address => uint256)) allowed;
     mapping(address=>mapping(address => uint256))allow;
    function initialization(string _name,string _symbol)public //constant returns(bool success)
{
    balanceOf[msg.sender]=totalsupply;
    name=_name;
    symbol=_symbol;
}
   function transfer(address to,uint256 value)public returns(bool success)
   {
        require(balanceOf[msg.sender]>=value);
       balanceOf[msg.sender]-=value;
       balanceOf[to]+=value;
   Transfer(msg.sender,to,value);
       return true;
   }
   function transferspender(address from,address to ,uint256 value)public returns(bool success)
   {
     require(allowed[from][msg.sender]>=value);
       {
        allowed[from][msg.sender]-=value;
       balanceOf[to]+=value;
       }
        Transfer(from,to,value);
          return true;
   }
    function transferspdr(address spdr,address _spender,address to ,uint256 value)public returns(bool success)
   {
     require(allow[spdr][_spender]>=value);
       {
        allow[spdr][_spender]-=value;
       balanceOf[to]+=value;
       }
        Transfer(spdr,to,value);
          return true;
   }
   function balance(address _owner) constant returns (uint256 ) {
     return balanceOf[_owner];
      
  }
    
   function approvalspender(address spender,uint256 value)public returns(uint256)
    {
        allowed[spender][msg.sender]=value;
        balanceOf[msg.sender]-=value;
        return allowed[spender][msg.sender];
  
    }
    function approvalspdr(address spender,address spdr,uint256 value)public
  {
       allow[spdr][spender]=value;
       allowed[spender][msg.sender]-=value;
   }
    function balancespender(address spender)public constant  returns (uint256 ) {
     return allowed[spender][msg.sender];
}
function balancespdr(address spdr,address _spender)public constant  returns (uint256 ) {
     return allow[spdr][_spender];
}
}


