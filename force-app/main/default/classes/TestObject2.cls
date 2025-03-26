public class TestObject2 {

private final Integer DEFAULT_SIZE = 10;
String myStr = 'pub';

Integer size;

   //Constructor with no arguments
   public TestObject2() {

       System.debug(this.DEFAULT_SIZE); // Using this(...) calls the one argument constructor    
   }

   // Constructor with one argument 
   public TestObject2(Integer ObjectSize) {
     size = ObjectSize;
     System.debug(size);  
   }
   
   public TestObject2(String Str) {
     this.myStr = Str;
     System.debug(myStr );  
   }
}