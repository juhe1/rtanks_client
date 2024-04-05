package package_127
{
   import flash.events.Event;
   
   public class name_1582 extends Event
   {
      
      public static var OPEN:String = "LootBoxEvent1";
       
      
      public var count:int = 0;
      
      public function name_1582(param1:int)
      {
         this.count = param1;
         super(OPEN,false,false);
      }
   }
}
