public class Json_Cls_Exmple {
    public static  void call(String name,String rating,String phone,String industry){
      System.JSONGenerator js=JSON.createGenerator(true);
      js.writeStartObject();
        try{
            Account acc=new Account();
            acc.Name=name;
            acc.Rating=rating;
            acc.Phone=phone;
            acc.Industry=industry;
            insert acc;
            js.writeIdField('id',acc.Id);
            js.writeStringField('status', 'success');
        }
            catch(Exception e){
                
            }
       }
}