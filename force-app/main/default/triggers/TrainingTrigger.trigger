trigger TrainingTrigger on Training__c (before insert, after insert, before update, 
                                      after update, before delete, after delete,after undelete) {

                                                                                   
                                          if(Trigger.isUpdate && Trigger.isBefore){
                                              
                                              for(Integer i=0;i<Trigger.size;i++){
                                                 
                                                  if(Trigger.new[i].Cource_Name__c != Trigger.old[i].Cource_Name__c){
                                                      Trigger.new[i].addError('Course Name cannot be changed');
                                                  }

                                              } 
                                          } 
}