public class Json_Class {
    public void create(String name,String rating,String  phone){
        System.JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
        try{
            Account acc=new Account();
            acc.Name=name;
            acc.Rating=rating;
            acc.Phone=phone;
            insert acc;
            js.writeStringField('status','success');
            js.writeIdField('Id', acc.id);
            js.writeNumberField('StatusCode',100);
            
            
        }
        catch(Exception e){
            js.writeStringField('Status','Failed');
            js.writeStringField('Error',e.getMessage());
            js.writeNumberField('StatusCode',200);
        }
        js.writeEndObject();
        String res=js.getAsString();
        System.debug(res);
    }
}