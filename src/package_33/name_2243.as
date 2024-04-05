package package_33
{
   import flash.events.Event;
   
   public class name_2243 extends Event
   {
      
      public static const name_2245:String = "action changed: ";
       
      
      private var action:GameActionEnum;
      
      public function name_2243(param1:String, param2:GameActionEnum)
      {
         super(param1,true,false);
         this.action = param2;
      }
      
      public function method_2718() : GameActionEnum
      {
         return this.action;
      }
   }
}
