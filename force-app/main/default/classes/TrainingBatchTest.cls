@isTest
public class TrainingBatchTest {
    
    
    @isTest
    static void dateTest(){
        List<Training__c> trains = new List<Training__c>();
        for(Integer i=1;i<=200;i++){
            trains.add(new Training__c(Cource_Name__c = 'Test'+i,Status__c='Started',Start_Date__c = System.today()));
        }
        insert trains;
        
        Test.startTest();
        TrainingBatch tb = new TrainingBatch('Started');
        Database.executeBatch(tb, 200);
        Test.stopTest();
        
        List<Training__c> trainsUpdated = [Select End_Date__c from Training__c];
        
        System.assert(trainsUpdated[0].End_Date__c != null);
    }
}