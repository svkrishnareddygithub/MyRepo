public class DaysSinceOpening {  //trigger Handler
    Public static void insertOrUpdate(List<Retail_Store__c> insertOrUpdateList){ // passing list of records 
        //iterating over the list
        for(Retail_Store__c c: insertOrUpdateList){  
            //Calculating days from Opening date to till date and assigning the value to variable called daysSinceOpening
            integer daysSinceOpening=c.Opening_Date__c.daysBetween(Date.TODAY());
            //Updating the new field called Days_Since_Opening__c whith the daysSinceOpening value
			c.Days_Since_Opening__c=daysSinceOpening;
        }
    }
}