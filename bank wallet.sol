pragma solidity^0.4.0;
contract bank
{
    struct user{
        uint256 acno;
        string acname;
        uint256 acbal;
    }
    address owner;
    string rt;
    mapping(address=>user)ac;
    modifier check(address _owner)
    {
        require(_owner==msg.sender);
        _;
    }
    function creating(address _owner,address a,uint256 _acno,string _acname,uint256 _acbal)check(_owner)public
    {
        ac[a].acno=_acno;
        ac[a].acname=_acname;
        ac[a].acbal=_acbal;
        
    }
    function deposite(address a,uint256 _deposite)public returns(uint256)
    {
        ac[a].acbal=ac[a].acbal+_deposite;
        return ac[a].acbal;
    }
    function transfer(address a,uint256 amt1,address _a)public returns(uint256,uint256)
    {
        ac[a].acbal=ac[a].acbal-amt1;
        ac[_a].acbal=ac[_a].acbal+amt1;
         return (ac[a].acbal, ac[_a].acbal);
    }
    function ownerchecking(address _owner)check(_owner)public constant returns(string)
    {
        rt="owner verified";
        return rt;
    }
    function ownertransfer(address owner1)public
    {
        owner1=msg.sender;
    }
}
