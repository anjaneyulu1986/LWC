trigger StudentTrigger on Student__c (before insert, after insert, before update, 
                                      after update, before delete, after delete,after undelete) {
                         
                                          if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
                                              
                                              Map<Id,Training__c> idVsTraining = new Map<Id,Training__c>();
                                              for(Student__c st : Trigger.new){
                                                  
                                                  idVsTraining.put(st.Training__c,null);
                                              }
                                             
                                              for(Training__c t : [Select Id,Name,(Select Id from Students__r) from Training__c where Id IN : idVsTraining.keySet()]){
                                                  idVsTraining.put(t.Id,t);
                                              }
                                              
                                              for(Student__c st : Trigger.new){
                                                  
                                                   if(idVsTraining.get(st.Training__c).Students__r.size() >= 500){
                                                     st.addError('Training '+idVsTraining.get(st.Training__c).Name+' has max number of students.'); 
                                                  }
                                              }
                                          }
                                          
       }