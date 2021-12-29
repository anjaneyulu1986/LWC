public class AccountSearchController {

    @AuraEnabled
    public static List<Account> getAccounts(String searchString){
        
        List<Account> accounts = new List<Account>();
        accounts = [Select Id,Name,Phone,Type,Industry from Account where Name like : '%'+searchString+'%'];
        System.debug('Accounts :: '+accounts);
        return accounts;
    }
}