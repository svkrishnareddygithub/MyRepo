public class JsonGenerator 
{
    public void generator(string name,string rating,string phone)
    {
        system.JSONGenerator js=json.createGenerator(true);
        js.writeStartObject();
            try
            {
                Account acc=new Account();
                acc.Name=name;
                acc.Rating=rating;
                acc.Phone=phone;
                insert acc;
                js.writeStringField('Status', 'Success');
                js.writeStringField('Id', acc.Id);
                js.writeStringField('msg','Account is created');
                js.writeStringField('Code', '100');
            }
            catch(exception e)
            {
                js.writeStringField('Status', 'Failed');
                //js.writeStringField('Id',acc.id);
                js.writeStringField('Msg', e.getMessage());
                js.writeStringField('Code','200');
            }
        js.writeEndObject();
        String s=js.getAsString();
        System.debug(s);
    }
}