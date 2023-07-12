@isTest
Public Class suareNumberTestClass{
    
    @isTest Static Void squaretest1(){    
    integer n1 = squareNumberClass.squareNumber(5);
    system.assertEquals(n1,25);          
    }
   
    @isTest Static Void squaretest2(){    
    integer n1 = squareNumberClass.squareNumber(2);
    system.assertEquals(n1,4);          
    }
    
     @isTest Static Void squaretest3(){    
    integer n1 = squareNumberClass.squareNumber(3);
    system.assertEquals(n1,9,'Incorrect Square Calculated');          
    }

    @isTest Static Void addtest1(){    
    integer n1 = squareNumberClass.addNumber(3,5);
    system.assertEquals(n1,8,'Incorrect Square Calculated');          
    }

}