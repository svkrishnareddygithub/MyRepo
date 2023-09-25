public class Schema_Picklist {
   @AuraEnabled
    public static List<String> getData(String objName, String fldName){
        List<String> options=new List<String>();
        Map<String, Schema.SObjectType> objMap=Schema.getGlobalDescribe();
        Schema.SObjectType obj=objMap.get(objName);
        Schema.DescribeSObjectResult result=obj.getDescribe();
        Map<String, Schema.SObjectField> fld=result.fields.getMap();
        Schema.SObjectField flds=fld.get(fldName);
        Schema.describeFieldResult fldres=flds.getDescribe();
        if(fldres.getType()==Schema.DisplayType.PICKLIST){
            List<Schema.PicklistEntry> entries=fldres.getPickListValues();
            for(Schema.PicklistEntry p: entries){
                options.add(p.getValue());
            }
        }
        return options;
        
    }
}