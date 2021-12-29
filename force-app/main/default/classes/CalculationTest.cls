@isTest
public class CalculationTest {
    
    @isTest
    static void addTest(){
        
        Calculation c = new Calculation(50,70);
        Integer result = c.add();
        System.assert(120 == result);
        System.assert(120 == result, 'Result is not matching');
        System.assertEquals(120, result);
        
    }
    
    @isTest
    static void subTest(){
        Calculation c = new Calculation();
        c.a = 100;
        c.b = 50;
        Integer result = c.sub();
        System.assertEquals(50, result);
        
        Integer mul = c.multiply();
        System.assertEquals(5000, mul);
    }
}