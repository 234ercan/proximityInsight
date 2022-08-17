//Author:Ercan*****Date:17/08/2022
@isTest
private class contactTriggerHandlerTest {
    @isTest static void contactsInserted(){
        List<Contact> cntList = new List<Contact>();
        Account acc = new Account(Name='TestAcc');
        insert acc;
        for(Integer i=0; i<250; i++){
            if(i<67){
                Contact cnt = new Contact(LastName='TestCnt'+i, Level__c='Primary', AccountId=acc.Id);
                cntList.add(cnt);
            }else if(66<i && i<133){
                Contact cnt = new Contact(LastName='TestCnt'+i, Level__c='Secondary', AccountId=acc.Id);
                cntList.add(cnt);
            }else if(132<i && i<200){
                Contact cnt = new Contact(LastName='TestCnt'+i, Level__c='Tertiary', AccountId=acc.Id);
                cntList.add(cnt);
            }else{
                Contact cnt = new Contact(LastName='TestCnt'+i, Level__c='Tertiary', AccountId=null);
                cntList.add(cnt);
            }
        }
        insert cntList;
    }
 }