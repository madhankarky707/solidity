contract add{
    uint256 []a;
    uint256 b=a.length;
    uint256 l;
   // uint256 []c;
   function limit(uint256 s)public 
   {
       l=s;
      
   }
    function enter(uint256 d)public{
        a.push(d);
    }
    
    function odev()public
    {
        for(uint256 i=0;i<6;i++)
        {
            if(a[i]%2==0)
            {
                a.push(a[i]);
            }
           
        }
        for(uint256 u=0;u<6;u++)
        {
            if(a[u]%2>0)
            {
               a.push(a[u]); 
            }
        }
       for(uint256 o=0;o<6;o++)
       {
           for(uint256 p=o+6;p<o+7;p++)
           {
               delete a[o];
               a[o]=a[p];
               delete a[p];
           }
       }
    }
    function output()public view returns(uint256[])
    {
        return a;
    }
    
}
