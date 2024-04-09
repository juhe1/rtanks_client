package package_1
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.tank.TankEventDispatcher;
   import alternativa.tanks.models.tank.ITankEventDispatcher;
   import alternativa.tanks.service.settings.IBattleSettings;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.services.objectpool.IObjectPoolService;
   import flash.net.SharedObject;
   import package_11.IBundleActivator;
   import package_269.ObjectPoolService;
   import package_270.MaterialRegistry;
   import package_95.IStorageService;
   
   public class BattlefieldSharedActivator implements IBundleActivator
   {
       
      
      public function BattlefieldSharedActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var _loc3_:IMaterialRegistry = null;
         var _loc2_:SharedObject = IStorageService(param1.getService(IStorageService)).getStorage();
         _loc3_ = new MaterialRegistry(param1);
         var _loc4_:IBattleSettings = IBattleSettings(param1.getService(IBattleSettings));
         _loc3_.useMipMapping = _loc4_.mipMapping;
         param1.registerService(IMaterialRegistry,_loc3_);
         param1.registerService(IObjectPoolService,new ObjectPoolService());
         param1.registerService(ITankEventDispatcher,new TankEventDispatcher());
      }
      
      public function stop(param1:OSGi) : void
      {
         param1.unregisterService(IMaterialRegistry);
         param1.unregisterService(IObjectPoolService);
         param1.unregisterService(ITankEventDispatcher);
      }
   }
}
