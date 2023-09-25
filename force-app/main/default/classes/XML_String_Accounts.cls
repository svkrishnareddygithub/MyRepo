public class XML_String_Accounts {
    public void callMe()
    {
        List<Account> accList=[select id,name,rating,phone,(select id,lastName from Contacts) from Account where rating!=NULL limit 2];
        dom.Document doc=new dom.Document();
        dom.XmlNode root=doc.createRootElement('Account',null,null);
        for(Account a:accList)
        {
            dom.XmlNode br1=root.addChildElement('Account',null,null);
            dom.XmlNode name=br1.addChildElement('Name',null,null);
            dom.XmlNode rating=br1.addChildElement('Rating',null,null);
            name.addTextNode(a.Name);
            rating.addTextNode(a.Rating);
            if(a.contacts.size()>0)
            {
               dom.xmlNode subroot=root.addChildElement('Contact',null,null);
               for(Contact c:a.contacts)
               {
                   dom.XmlNode subbr=subroot.addChildElement('Contact',null,null);
                   dom.xmlNode lName=subbr.addChildElement('Lastname', null, null);
                   lName.addTextNode(c.LastName);
               }
            }
        }
        String s=doc.toXmlString();
        System.debug(s);
    }
}