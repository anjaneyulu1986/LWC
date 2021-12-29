public virtual class VirtualParent {

    public virtual void parentMethod1(){
        System.debug('A method from a parent.');
    }
    
    public void parentMethod2(){
        System.debug('A method1 from a parent.');
    }
    
    // Virtual class can contain the Virtual methods and normal methods.
    // Virtual methods should be overridden child class.
}