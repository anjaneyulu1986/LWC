@isTest
public class TrainingTriggerTest {
    
    @TestSetUp
    static void setTestData(){
          Profile p = [Select Id from Profile where Name = 'Customer Profile' limit 1];
        Date tday = System.today();
        User u = new User(firstName='Test',LastName='User',Email='TestUser@gmail.com',EmailEncodingKey = 'ISO-8859-1', 
                          Alias ='tesus', 
                          TimeZoneSidKey = 'America/Los_Angeles', 
                          LocaleSidKey = 'en_US', 
                          LanguageLocaleKey = 'en_US',Username = 'TestUser'+tday.day()+tday.month()+tday.year()+'@gmail.com',ProfileId = p.Id);
        insert u;
        System.runAs(u){
            List<Training__c> trains = new List<Training__c>();
            for(Integer i=1;i<=200;i++){
        trains.add(new Training__c(Cource_Name__c = 'Test'+i,Status__c='Started',Start_Date__c = System.today()));
            }
            
            insert trains;
        }
    }
    
    @isTest
    static void courseNameChangeTest(){
        
      
        
        User u = [Select Id from User where Email = 'TestUser@gmail.com'];
        
        System.runAs(u){
            Test.startTest();
            Training__c t = [Select Id,Cource_Name__c from Training__c limit 1];
            t.Cource_Name__c = 'Test Course';
            try{
                
                update t;
                
            }catch(Exception e){
                System.assert(e.getMessage().contains('Course Name cannot be changed'));    
            }
            Test.stopTest();
        }
        
    }
}