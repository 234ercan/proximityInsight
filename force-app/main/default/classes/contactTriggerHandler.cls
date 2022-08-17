//Author:Ercan****Date:17/08/2022
public class contactTriggerHandler {
//For each new Contact inserted to Salesforce, a Case related to the Contact will automatically be created
    public static void createCaseRealatedToContact(List<Contact> contactList){
        List<Case> newCaseList = new List<Case>();
        for(Contact cnt:contactList){
          if(cnt.AccountId!=null){
          	if(cnt.Level__c=='Primary'){
                Case newCase=new Case(ContactId=cnt.id, AccountId=cnt.AccountId, Status='Working', Origin='New Contact', ownerId=cnt.OwnerId, priority='High');
            	newCaseList.add(newCase);
            }else if(cnt.Level__c=='Secondary'){
                Case newCase=new Case(ContactId=cnt.id, AccountId=cnt.AccountId, Status='Working', Origin='New Contact', ownerId=cnt.OwnerId, priority='Medium');
            	newCaseList.add(newCase);
            }else if(cnt.Level__c=='Tertiary'){
                Case newCase=new Case(ContactId=cnt.id, AccountId=cnt.AccountId, Status='Working', Origin='New Contact', ownerId=cnt.OwnerId, priority='Low');
            	newCaseList.add(newCase);
            }
                   }else{
                        Case newCase=new Case(ContactId=cnt.id, Status='Working', Origin='New Contact', ownerId=cnt.OwnerId);//priority is 'Medium' by default
            	newCaseList.add(newCase);             
                                  }
        }
        if(newCaseList.size()>0){
            insert newCaseList;
        }
//Create a Task for each new Case
     	List<Task> newTaskList= new List<Task>();
        for(Case cs:[SELECT Id, CaseNumber, Priority FROM Case WHERE id in: newCaseList]){
            if(cs.Priority=='High'){
            	Task newTask = new Task(Status='Not Started',Subject='Welcome call for '+cs.CaseNumber, Priority='Normal', ActivityDate=System.today()+7); 
            	newTaskList.add(newTask);
            }else if(cs.Priority=='Medium'){
            	Task newTask = new Task(Status='Not Started',Subject='Welcome call for '+cs.CaseNumber, Priority='Normal', ActivityDate=System.today()+14); 
            	newTaskList.add(newTask);
            }else if(cs.Priority=='Low'){
            	Task newTask = new Task(Status='Not Started',Subject='Welcome call for '+cs.CaseNumber, Priority='Normal', ActivityDate=System.today()+21); 
            	newTaskList.add(newTask);
            }else{System.debug('Case priority is Medium by default');
            }
        }
        insert newTaskList;
    }
}