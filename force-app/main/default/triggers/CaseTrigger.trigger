trigger CaseTrigger on Case (before insert, after insert, before update, 
                                      after update, before delete, after delete,after undelete) {

                                          if(Trigger.isBefore && Trigger.isDelete){
                                              
                                              for(Case c : Trigger.Old){
                                                  if(String.isNotBlank(c.ContactId) || String.isNotBlank(c.AccountId)){
                                                      c.addError('Case cannot be deleted as it is associated to a Contact or Account');
                                                  }
                                              }
                                          }
    
}