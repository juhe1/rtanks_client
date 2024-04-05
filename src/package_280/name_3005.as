package package_280
{
   import flash.events.Event;
   
   public class name_3005 extends Event
   {
      
      public static const const_2724:String = "StatListUpdate";
      
      public static const name_3013:String = "StatListUpdateSort";
       
      
      public var var_3521:int = 0;
      
      public var var_3522:int = 0;
      
      public var name_3012:int;
      
      public function name_3005(param1:String, param2:int, param3:int, param4:int = 1)
      {
         super(param1,true,false);
         this.var_3521 = param2;
         this.var_3522 = param3;
         this.name_3012 = param4;
      }
   }
}
