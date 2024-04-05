package alternativa.tanks.gui
{
   import flash.events.Event;
   
   public class name_1532 extends Event
   {
      
      public static const name_1557:String = "GarageWindowEventWirehouseItemSelected";
      
      public static const name_1556:String = "GarageWindowEventStoreItemSelected";
      
      public static const name_1572:String = "GarageWindowEventBuyItem";
      
      public static const name_1558:String = "GarageWindowEventSetupItem";
      
      public static const name_1574:String = "GarageWindowEventUpgradeItem";
      
      public static const name_2629:String = "GarageWindowEventSkin";
      
      public static const name_1564:String = "GarageWindowEventAddCrystals";
       
      
      public var itemId:String;
      
      public function name_1532(param1:String, param2:String)
      {
         super(param1,true,false);
         this.itemId = param2;
      }
   }
}
