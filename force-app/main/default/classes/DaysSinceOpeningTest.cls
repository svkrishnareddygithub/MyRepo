@isTest
public class DaysSinceOpeningTest {
   @isTest 
    static void testInsertion() {
        //Inserting one Retail_Store__c record
        Retail_Store__c storeRecord = new Retail_Store__c(Name = 'Test Store',Opening_Date__c = Date.today().addDays(-5));
        Insert storeRecord;
        //Method to check whether the number of days between the opening date (storeRecord.Opening_Date__c) and today is equal to 5.
        System.assertEquals(storeRecord.Opening_Date__c.daysBetween(Date.today()), 5, 'Days_Since_Opening__c should be 5');
        
        //Retrieving the above inserted record based on the Id
        Retail_Store__c toBeupdate=[select Id,Name,Opening_Date__c,Days_Since_Opening__c from Retail_Store__c where Id=:storeRecord.Id];
        //Updating record with Opening_Date__c
        toBeupdate.Opening_Date__c=Date.today().addDays(-20);
        update toBeupdate;
        //Method to check whether the number of days between the opening date (storeRecord.Opening_Date__c) and today is equal to 20.
        System.assertEquals(toBeupdate.Opening_Date__c.daysBetween(Date.today()), 20, 'Days_Since_Opening__c should be 20');  
    }
}