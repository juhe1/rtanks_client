package package_411
{
   import flash.events.Event;
   
   public class name_2247 extends Event
   {
      
      public static const name_2254:String = "ShopItemChosenEVENT";
       
      
      public var itemId:String;
      
      public var gridPosition:int;
      
      public function name_2247(param1:String, param2:int)
      {
         super("ShopItemChosenEVENT",true);
         this.itemId = param1;
         this.gridPosition = param2;
      }
   }
}
