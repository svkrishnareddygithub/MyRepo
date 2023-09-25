public class Rajesh3 {
   /* public void call(){
        List<Integer> li=new List<Integer>{13,12,6,3,1,7};
        List<Integer> even=new List<Integer>();
        List<Integer> odd=new List<Integer>();
        for(Integer i: li){
            if(Math.mod(i, 2)==0){
                even.add(i);
            }else{
                odd.add(i);
            }
        }
        for(Integer k=0 ; k<even.size()-1; k++){
                if(even[k]>even[k+1]){
                    even[k]=even[k+1];
            }
        }
        for(Integer j=0 ; j<even.size()-1; j++){
            System.debug(even[j]);
        }
    }

    public static List<String> getTechnology(String service) {
        String s;
         List<OppTechnology__c> techList=[select Id,App__c,Technologies__C from OppTechnology__c];
         for(OppTechnology__c c: techList){
            if(c.App__c=='Java'){
                  s=c.Technologies__C;
            }
         }
         system.debug(s);
        List<String> ss=s.split(';');
        for(String l: ss){
            system.debug(l);
        }
         return ss; 
    }

    @AuraEnabled
    public static String uploadFiles(String recordId, String filedata) {
      try {
          if(String.isNotBlank(FileData)) {
              List<FileDataWP> files = (List<FileDataWP>) JSON.deserialize(filedata, List<FileDataWP>.class);
              System.debug(files);

              List<ContentVersion> cvList = new List<ContentVersion>();
              for(FileDataWP file : files) {
                  ContentVersion conVer = new ContentVersion();
                  conVer.ContentLocation = 'S'; // S = Salesforce, E = External Files
                  conVer.VersionData = EncodingUtil.base64Decode(file.fileContent);
                  conVer.Title = file.fileName;
                  conVer.PathOnClient = file.fileName;
                  cvList.add(conVer);
              }
              Insert cvList;

              List<ContentDocumentLink> cdList = new List<ContentDocumentLink>();
              for(ContentVersion cv : [SELECT ContentDocumentId FROM ContentVersion WHERE Id =: cvList]) {
                  ContentDocumentLink conDocLink = New ContentDocumentLink();
                  conDocLink.LinkedEntityId = recordId;
                  conDocLink.ContentDocumentId = cv.ContentDocumentId;
                  conDocLink.Visibility = 'AllUsers';
                  conDocLink.shareType = 'V'; // V = Viewer, C = Collaborator, I = Inferred
                  cdList.add(conDocLink);
              }
              Insert cdList;        
          } else {
              return 'record Id is Blank';
          }
          return 'success';
      } catch (Exception ex) {
          System.debug(ex.getMessage() + ' -> ' + ex.getStackTraceString());
          throw new AuraHandledException(ex.getMessage());
      }
  }

  public class FileDataWP {
      public String fileName;
      public String fileContent;
  }
*/
}