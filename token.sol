contract erc20
{
     function initialization(string _name,string _symbol)public /*constant returns(bool success)*/;
     function transfer(address to,uint256 value)public  returns(bool success);
     function transferfrom(address from,address to ,uint256 value)public returns(bool success);
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
       require(to!=0x0);
        require(balanceOf[msg.sender]>=value);
       balanceOf[msg.sender]-=value;
       balanceOf[to]+=value;
   Transfer(msg.sender,to,value);
       return true;
   }
   function transferfrom(address from,address to ,uint256 value)public returns(bool success)
   {
       if(allowed[from][msg.sender]>=value && balanceOf[msg.sender]>=value)
       {
           balanceOf[msg.sender]-=value;
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
        return allowed[spender][msg.sender];
  
    }
    function balance1(address spender)public constant  returns (uint256 balance) {
     return allowed[spender][msg.sender];
}
}

