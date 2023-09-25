trigger New_Trigger on Questions__c (after insert) {
    List<Answer__c> aList=new List<Answer__c>();
    for(Questions__c c: trigger.new){
        Answer__c a=new Answer__c();
        a.Name='krishna';
        a.Question__c=c.Id;
        aList.add(a);
    }
    insert aList;
}