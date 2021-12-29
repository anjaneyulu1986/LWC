public class Calculation {
    
    @TestVisible
    private Integer a,b;
    
    @TestVisible
    private Calculation(){
        
        System.debug('Constructor is defined....');
    }

    public Calculation(Integer x,Integer y){
        this.a = x;
        this.b = y;
    }
    
    
    public  Integer add(){
        System.debug('add two');
       return (a+b);
    }
    
     
    
    public  Integer sub(){
        
        return (a-b);
    }
    
    public  Integer multiply(){
       return (a*b);
    }
}