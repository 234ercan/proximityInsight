//Author:Ercan*****Date:17/08/2022
trigger ContactTrigger on Contact (after insert) {
    if(Trigger.isAfter & Trigger.isInsert){
        contactTriggerHandler.createCaseRealatedToContact(Trigger.new);
    }
}