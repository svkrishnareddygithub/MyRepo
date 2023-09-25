public class Edit_Book_Details {
    public String searchText       	{set;get;}
    public  List<Book__c> bookList {set;get;}
    public String name        		{set;get;}
    public String bookName    		{set;get;}
    public String auther      		{set;get;}
    public integer totalCopies  	{set;get;}
    public integer availableCopies  {set;get;}
    public Edit_Book_Details(){
        bookList=new List<Book__c>();
    }
    public  void call(){
         List<Book__c> bList=[SELECT Id, Book_Name__c, Book_Auther__c, Cost__c, Total_Copies__c, Available_Copies__c, Name FROM Book__c where Id =: searchText];
        for(Book__c b: bList){
            bookList.add(b);
        }
                 
    }
}