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
