pragma solidity ^0.4.0;
contract student
{
     struct student
     {
     string name;
     uint256 age;
     uint256 id;
         uint256 c;
     }
     mapping(uint256 => student)student1;
     mapping(uint256 => student)student2;

    uint256 []d;
   
     function olddata(string _name,uint256 _age,uint256 _id,uint256 key1)public 
     {
         student1[key1].name=_name;
         student1[key1].age=_age;
         student1[key1].id=_id;
         d.push(student1[key1].id);
         }
     function newdata(string _name,uint256 _age,uint256 _id,uint256 key2)public 
     {
         student2[key2].name=_name;
         student2[key2].age=_age;
         student2[key2].id=_id;
         d.push(student1[key2].id);
     }
     function output(uint256 key2)public 
     {
         for(uint256 i=0;i<d.length;i++)
         {
             if(student1[i].id==student2[key2].id)
             {
                student1[key2].c=1;
             }
        }
         if(student1[key2].c==0)
         {
               student1[key2].c=0;
         }
}
function valid(uint256 key1)public view returns(string)
{
 if(student1[key1].c==1)
 {
     return "invalid";
 }
 else
 {
     return "valid";
 }
}
function old(uint256 key1)public view returns(string,uint256,uint256,uint256[])
{
return (student1[key1].name,student1[key1].age,student1[key1].id,d);
}
function few(uint256 key2)public view returns(string,uint256,uint256)
{
    return (student2[key2].name,student2[key2].age,student2[key2].id);
}
function reviseddata(uint256 i) public 
{
    require(student1[i].c==0);
    student1[i].name=student2[i].name;
    student1[i].age=student2[i].age;
    student1[i].id=student2[i].id;
}
}
