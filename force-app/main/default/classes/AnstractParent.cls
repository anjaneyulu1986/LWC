public abstract class AnstractParent {
    
    public abstract  void parentMethod();
    
    public void method2(){
        System.debug('Mrthod 2 from Abstract...');
    }

    // Abstract class can have abstract methods and normal methods.
    // Abstract methods should be overridden in child class.
}