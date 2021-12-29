@isTest
public class StudentDOJUpdateTest {

    @isTest
    public static void adjustDOJTest(){
         Profile p = [Select Id from Profile where Name = 'Customer Profile' limit 1];
        Date tday = System.today();
        User u = new User(firstName='Test',LastName='User',Email='TestUser@gmail.com',EmailEncodingKey = 'ISO-8859-1', 
                          Alias ='tesus', 
                          TimeZoneSidKey = 'America/Los_Angeles', 
                          LocaleSidKey = 'en_US', 
                          LanguageLocaleKey = 'en_US',Username = 'TestUser'+tday.day()+tday.month()+tday.year()+'@gmail.com',ProfileId = p.Id);
        insert u;
        System.runAs(u){
        Training__c train = new Training__c(Cource_Name__c = 'Test',Status__c='Started',Start_Date__c = tday);
        
        insert train;
        
        Student__c st = new Student__c(Name='Test Student',DOJ__c = tday,Status__c='Active',Training__c = train.Id);
        insert st;
        
        Test.startTest();
        update train;
        Test.stopTest();
        
        Student__c st1 = [Select Id,DOJ__c from Student__c where Id =: st.id];
        
        System.assertEquals(tday.addDays(1), st1.DOJ__c);
        }
    }
}