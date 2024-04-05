package package_354
{
   import package_13.Long;
   
   public class name_1690 extends Error
   {
       
      
      public function name_1690(param1:Long, param2:Long, param3:Error)
      {
         super();
         message = "Object loading event processing error. Space id: " + param1 + ".Object id: " + param2 + ". Error: " + param3.getStackTrace();
      }
   }
}
