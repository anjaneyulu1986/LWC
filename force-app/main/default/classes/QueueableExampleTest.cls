@isTest
public class QueueableExampleTest {
    
    @isTest
    static void uTest(){
        
        User u = [Select Id,Attempts__c from User where Id =: Userinfo.getUserId()];
        QueueableExample qe = new QueueableExample(u);
        Test.startTest();
        Id jobId = System.enqueueJob(qe);
        Test.stopTest();
        
        User u1 = [Select Id,Attempts__c from User where Id =: Userinfo.getUserId()];
        
        System.assertEquals(u.Attempts__c+1, u1.Attempts__c);
    }
}