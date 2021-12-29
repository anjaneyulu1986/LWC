public class TrainingBatch implements Database.Batchable<sObject>{
    
    public String status;
    public TrainingBatch(String status){
        this.status = status;
    }
    public Database.QueryLocator start(Database.BatchableContext BC){
        
        String query = 'SELECT Id, End_Date__c, Status__c FROM Training__c where Status__c =: status';
        
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc,List<Training__c> trainings){
        for(Training__c t : trainings){
            t.End_Date__c = t.End_Date__c == null ? System.today() : t.End_Date__c.addDays(1);
        }
        
        update trainings;
    }
    
    public void finish(Database.BatchableContext bc){
        
    }
}