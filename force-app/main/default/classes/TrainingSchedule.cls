public class TrainingSchedule implements System.Schedulable{
    
    public String status;
    public TrainingSchedule(String status){
        this.status = status;
    }
    
    public void execute(System.SchedulableContext sc){
        
        TrainingBatch tb = new TrainingBatch(status);
        Database.executeBatch(tb, 1);
    }
}