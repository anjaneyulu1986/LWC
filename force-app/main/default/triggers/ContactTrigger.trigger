trigger ContactTrigger on Contact (before insert, after insert, before update, 
                                      after update, before delete, after delete,after undelete) {

                                          if(Trigger.isInsert && Trigger.isAfter){
                                              
                                              Map<Id,Account> accounts = new Map<Id,Account>();
                                              
                                              for(Contact c : Trigger.new){
                                                  if(String.isNotBlank(c.AccountId)){
                                                      accounts.put(c.AccountId,null);
                                                  }
                                              }
                                              
                                              accounts = new Map<Id,Account>([Select Id,Contact_Ids__c from Account where Id IN : accounts.keySet()]);
                                              
                                              for(Contact c : Trigger.new){
                                                  if(String.isNotBlank(c.AccountId)){
                                                     Account a = accounts.get(c.AccountId);
                                                      a.Contact_Ids__c = String.isBlank(a.Contact_Ids__c) ? ''+c.Id : a.Contact_Ids__c+','+c.Id;
                                                  }
                                              }
                                              
                                              update accounts.values();
                                          }
                                          
                                          if(Trigger.isUpdate && Trigger.isAfter){
                                             
                                          }
                                          
                                          if(Trigger.isDelete && Trigger.isAfter){
                                              
                                              Map<Id,Account> accounts = new Map<Id,Account>();
                                              
                                              for(Contact c : Trigger.old){
                                                  if(String.isNotBlank(c.AccountId)){
                                                      accounts.put(c.AccountId,null);
                                                  }
                                              }
                                              
                                              accounts = new Map<Id,Account>([Select Id,Contact_Ids__c from Account where Id IN : accounts.keySet()]);
                                              
                                              for(Contact c : Trigger.old){
                                                  if(String.isNotBlank(c.AccountId)){
                                                     Account a = accounts.get(c.AccountId);
                                                      a.Contact_Ids__c = a.Contact_Ids__c.contains(','+c.Id) ?  a.Contact_Ids__c.replace(','+c.Id,'') : a.Contact_Ids__c.replace(''+c.Id,'') ;
                                                  }
                                              }
                                              
                                              update accounts.values();
                                          }
                                          
                                          if(Trigger.isUndelete && Trigger.isAfter){
                                              
                                          }
                                         
                                          
}