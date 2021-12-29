public class QueueableExample implements System.Queueable{

    public User u;
    public QueueableExample(User u){
        this.u = u;
    }
    public void execute(System.QueueableContext qc){
        u.attempts__c = u.attempts__c == null ? 1 : u.attempts__c+1;
        
        update u;
    }
}