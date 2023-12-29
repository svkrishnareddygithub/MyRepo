public without sharing class MetadataClass {
 
    @AuraEnabled(cacheable=true)
    public static List<ApexClass> MetadataMethod() {
        return [SELECT Id, Name, Status, ApiVersion, CreatedDate FROM ApexClass];
    }
 
    @AuraEnabled(cacheable=true)
    public static List<CustomLabel> performQuery() {
        // Salesforce instance URL
        //String instanceUrl = System.URL.getSalesforceBaseURL().toExternalForm();
        String instanceUrl = 'https://cloudfulcrum-dev-ed.develop.my.salesforce.com';
		System.debug(instanceUrl); 
        // Tooling API query URL
        String toolingApiUrl = instanceUrl + '/services/data/v55.0/tooling/query/?q=Select+id,Name,Value+from+CustomLabel';
        //System.debug(toolingApiUrl);
 
        // Create HTTP request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(toolingApiUrl);
        request.setMethod('GET');
 
        // Set the session header to authenticate
        String sessionId = UserInfo.getSessionId().SubString(15);
        //System.debug(sessionId);
        request.setHeader('Authorization', 'Bearer ' + sessionId);
 
        // Create HTTP client
        Http http = new Http();
        HttpResponse response = http.send(request);
 
        // Check the response
        List<CustomLabel> customLabels = new List<CustomLabel>();
        if (response.getStatusCode() == 200) {
            Map<String, Object> jsonResponse = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            System.debug('No records found in the response: ' + response.getBody());
            if (jsonResponse.containsKey('records')) {
                List<Object> records = (List<Object>)jsonResponse.get('records');
                for (Object record : records) {
                    Map<String, Object> recordMap = (Map<String, Object>)record;
                    customLabels.add(new CustomLabel(
                        (String)recordMap.get('Id'),
                        (String)recordMap.get('Name'),
                        (String)recordMap.get('Value')
                    ));
                }
            } else {
                System.debug('No records found in the response: ' + response.getBody());
            }
        } else {
            System.debug('Error making HTTP request. Status Code: ' + response.getStatusCode());
            System.debug('Response Body: ' + response.getBody());
        }
        for(CustomLabel c: customLabels){
            system.debug(c.Name);
        }
        return customLabels;    
    }
 
    public class CustomLabel {
        public String Id;
        public String Name;
        public String Value;
 
        public CustomLabel(String Id, String Name, String Value) {
            this.Id = Id;
            this.Name = Name;
            this.Value = Value;
        }
    }
}