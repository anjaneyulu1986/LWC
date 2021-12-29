public with sharing class DisplayAccountsController {
    
    @AuraEnabled(cacheable = true)
    public static List<Account> getAccounts(){
        try {

            if(Schema.SObjectType.Account.isAccessible()){
            return [Select Id,Name,Type,Industry from Account limit 10];
            }
            else{
                 return null;
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> getAccountsList(){
        try {
            
            return [Select Id,Name,Type,Industry from Account limit 10];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}