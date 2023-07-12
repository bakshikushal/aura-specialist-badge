public class testController {
      public String str { 
          get{ if (str == null)
           str = 'a';
           return str;} 
           set; }
       
      public String getstr(){
          return 'my String value';
      }
      
      public String getstr2(){
          if(str == null)
              str = 'b';
          return str;
      }

}