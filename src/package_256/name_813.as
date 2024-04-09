package package_256
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.quest.challenge.ChallengeEvents;
   import alternativa.tanks.model.quest.challenge.name_547;
   import alternativa.tanks.model.quest.common.name_551;
   import flash.events.Event;
   import package_104.ChallengesRewardingModelBase;
   import package_104.name_327;
   import package_104.name_376;
   import package_133.StarsChangedEvent;
   import package_133.name_360;
   import package_134.BattlePassPurchaseEvent;
   import package_134.name_357;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   
   public class name_813 extends ChallengesRewardingModelBase implements name_376, name_170, name_287
   {
      
      public static var var_1578:name_547 = OSGi.getInstance().getService(name_547) as name_547;
      
      public static var var_1580:name_360 = OSGi.getInstance().getService(name_360) as name_360;
      
      public static var var_1579:name_551 = OSGi.getInstance().getService(name_551) as name_551;
      
      public static var var_1581:name_357 = OSGi.getInstance().getService(name_357) as name_357;
       
      
      public function name_813()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var_1578.method_1368(method_771().tiers);
         var_1578.addEventListener(ChallengeEvents.REQUEST_DATA,method_39(this.method_1766));
         var _loc1_:Function = method_39(this.method_1767);
         var_1581.addEventListener(BattlePassPurchaseEvent.PURCHASE,_loc1_);
         var_1580.addEventListener(StarsChangedEvent.STARS_CHANGED,_loc1_);
      }
      
      private function method_1766(param1:Event = null) : void
      {
         server.method_1766();
      }
      
      private function method_1767(param1:Event) : void
      {
         if(var_1579.isWindowOpen())
         {
            this.method_1766();
         }
      }
      
      public function sendTiersInfo(param1:Vector.<name_327>) : void
      {
         var_1578.method_1368(param1);
      }
      
      public function objectUnloaded() : void
      {
         var_1578.removeEventListener(ChallengeEvents.REQUEST_DATA,method_39(this.method_1766));
         var _loc1_:Function = method_39(this.method_1767);
         var_1581.removeEventListener(BattlePassPurchaseEvent.PURCHASE,_loc1_);
         var_1580.removeEventListener(StarsChangedEvent.STARS_CHANGED,_loc1_);
         var_1579.method_1145();
      }
   }
}
