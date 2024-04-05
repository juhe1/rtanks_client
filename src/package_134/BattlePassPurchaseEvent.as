package package_134
{
   import flash.events.Event;
   
   public class BattlePassPurchaseEvent extends Event
   {
      
      public static const PURCHASE:String = "BattlePassPurchaseEvent.PURCHASE";
       
      
      public function BattlePassPurchaseEvent()
      {
         super("BattlePassPurchaseEvent.PURCHASE",true);
      }
   }
}
