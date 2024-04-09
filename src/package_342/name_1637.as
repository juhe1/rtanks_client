package package_342
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.name_26;
   import package_315.name_1357;
   import package_337.DelayMountCategoryModelBase;
   import package_337.name_1639;
   import package_53.name_94;
   import package_75.BattleInfoServiceEvent;
   import package_75.name_274;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_287;
   
   public class name_1637 extends DelayMountCategoryModelBase implements name_1639, name_141, name_287
   {
      
      public static var delayMountCategoryService:name_1357 = OSGi.getInstance().getService(name_1357) as name_1357;
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().getService(name_94) as name_94;
      
      public static var battleInfoService:name_274 = OSGi.getInstance().getService(name_274) as name_274;
      
      public static var logService:name_26;
       
      
      public function name_1637()
      {
         super();
      }
      
      private static function method_2415(param1:BattleInfoServiceEvent) : void
      {
         delayMountCategoryService.method_2289();
      }
      
      private static function method_525(param1:BattleInfoServiceEvent) : void
      {
         delayMountCategoryService.method_2289();
      }
      
      public function objectLoadedPost() : void
      {
         if(lobbyLayoutService.inBattle())
         {
            delayMountCategoryService.method_2287(method_771());
            battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_RESTART,method_2415);
            battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,method_525);
         }
      }
      
      public function objectUnloaded() : void
      {
         battleInfoService.removeEventListener(BattleInfoServiceEvent.BATTLE_RESTART,method_2415);
         battleInfoService.removeEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,method_525);
         if(lobbyLayoutService.inBattle())
         {
            delayMountCategoryService.method_2288();
         }
      }
   }
}
