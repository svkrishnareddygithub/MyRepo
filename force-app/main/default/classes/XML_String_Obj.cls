public class XML_String_Obj {
     public static void callMe()
     {
       String xmlString='<Account><Account><Name>krishna</Name><Rating>Hot</Rating></Account>'+
                '<Contact><Contact><Lastname>test</Lastname></Contact></Contact><Account>'+
           		'<Name>farheen</Name><Rating>Hot</Rating></Account></Account>';
       dom.Document doc=new dom.document();
       doc.load(xmlString);
       dom.XmlNode root=doc.getRootElement();
       String parseData=root.getName();
       List<dom.XmlNode> listNode=root.getChildElements();
       for(dom.XmlNode n:listNode)
       {
           parseData=parseData+n.getName();
           parseData+=n.getText();
       }
         system.debug(parseData);
     }
}