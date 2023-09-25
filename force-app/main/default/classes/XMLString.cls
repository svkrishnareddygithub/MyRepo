public class XMLString {
  /*  public void invoke()
    {
        String input = 'Hello World! 你好 世界！';
        // Get the UTF-8 byte array
        Blob utf8Bytes = Blob.valueOf(input);
        byte[] utf8Array =utf8Bytes.toByteArray();
        // Split the byte array based on the UTF-8 encoding of the space character
        List<byte[]> splitArray = new List<byte[]>();
        Integer start = 0;	
        for (Integer i = 0; i < utf8Array.size(); i++) {
            if (utf8Array[i] == 0x20) { // 0x20 is the UTF-8 encoding of the space character
                splitArray.add(utf8Array.subList(start, i).toArray());
                start = i + 1;
            }
        }
        splitArray.add(utf8Array.subList(start, utf8Array.size()).toArray());
        // Convert each byte array back to a string
        List<String> splitStrings = new List<String>();
        for (byte[] bytes : splitArray) {
            splitStrings.add(Blob.valueOf(bytes).toString());
        }
        // Output the result
        System.debug(splitStrings); // Output: DEBUG|(Hello, World!, 你好, 世界！)
    }
    
    public void call(){
        dom.Document doc=new dom.Document();		
        dom.XmlNode root=doc.createRootElement('Employee',null,null);
        dom.XmlNode tr1=root.addChildElement('Main',null,null);
        dom.XmlNode tr2=root.addChildElement('constructor',null,null);
        dom.XmlNode br1=tr1.addChildElement('Name',null,null);
        dom.XmlNode br2=tr2.addChildElement('Name',null,null);
        br1.addTextNode('Krishnareddy');
        br2.addTextNode('Singampalli');
        String s=doc.toXmlString();
        System.debug(s);
    }
*/
}