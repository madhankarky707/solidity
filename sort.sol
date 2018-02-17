contract sort
{
    uint256 []a;
    uint256 []b;
    uint256 temp;
    function enter(uint256 c)public
    {
        a.push(c);
    }
    function order()public
    {
        for(uint256 i=0;i<a.length-1;i++)
        {
            for(uint256 j=i+1;j<a.length;j++)
            {
                if(a[i]>a[j])
                {
                    temp=a[i];
                    a[i]=a[j];
                    a[j]=temp;
                }
            }
        }
    }
    function result()public view returns(uint256[])
    {
        return a;
    }
}
