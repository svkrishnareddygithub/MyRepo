trigger Duplicate_Record on Contact (before insert) {
    for(Contact c: trigger.new){
          List<Contact> li=[select id,lastName,firstName,email,phone from Contact where  title=:c.Title];
          if(li.size()<0){
          Contact co=new Contact();
          co.LastName=c.LastName;
          co.FirstName=c.FirstName;
          co.Email=c.Email;
          co.Phone=c.Phone;
          insert co;
          }
            
   }
}