public class MixedDML {
    
    public static void ex(){
        Account a  = new Account(Name='My Test Account1');
        insert a;
 
        updateAttempts(UserInfo.getUserId());
    }
    
    @future
    public static void updateAttempts(Id userId){
        
        User u = [Select Id,Attempts__c from User where Id =: Userinfo.getUserId()];
        u.attempts__c = u.attempts__c == null ? 1 : u.attempts__c+1;
        
        update u;
    }
}