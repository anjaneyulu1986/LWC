trigger AccountTrigger on Account (before insert, after insert, before update, 
                                      after update, before delete, after delete,after undelete) {
                                          
                                          if(Trigger.isAfter && Trigger.isUpdate){
                                              List<Contact> contacts = new List<Contact>([Select Id,Department from Contact where AccountId IN : Trigger.new]);
                                              
                                              for(Contact c : contacts){
                                                  c.Department = 'Admin';
                                              }
                                              if(ContactTriggerController.IS_CONTACT_ADMIN_UPDATE_REQUIRED){
                                                  ContactTriggerController.IS_CONTACT_ADMIN_UPDATE_REQUIRED = false;
                                              update contacts;
                                              }    
                                              
                                          }

}