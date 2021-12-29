public class StudentDOJUpdate {

    @InvocableMethod(label = 'AdjustDOJ')
    public static void adjustDOJ(List<Id> trainingIds){
        
        List<Student__c> students = new List<Student__c>([Select Id,DOJ__c from Student__c where Training__c IN : trainingIds]);
        
        for(Student__c st : students){
            st.DOJ__c = st.DOJ__c.addDays(1);
        }
        
        update students;
    }
}