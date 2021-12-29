public class AdditionController {

    @AuraEnabled
    public static Integer add(Integer a,Integer b){
        return (a+b);
    }
}