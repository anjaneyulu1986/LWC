@isTest
public class AccountTriggerTest {

    
    @isTest
    static void contactsUpdateTest(){
        
        Account a = new Account(Name = 'My Test Account');
        insert a;
        
        Contact c = new Contact(lastName='My Test Contact',AccountId = a.Id);
        
        insert c;
        
        update a;
        
        Contact updatedCon = [Select Department from Contact where Id =: c.Id];
        
        System.assertEquals('Admin', updatedCon.Department);
        
        Account updatedAccount = [Select Id,Type from Account where Id =: a.Id];
        
        System.assertEquals('Prospect', updatedAccount.Type);
    }
    
}