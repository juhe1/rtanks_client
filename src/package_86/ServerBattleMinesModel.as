package package_86
{
   import package_1.Main;
   import package_13.Long;
   import package_251.name_1410;
   import package_251.name_690;
   import package_319.name_1411;
   import package_4.ClientObject;
   import package_7.name_32;
   import package_99.BattleMinesModel;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.Base;
   
   public class ServerBattleMinesModel
   {
      
      public static var resourceRegistry:ResourceRegistry;
      
      private static const const_455:ClientObject = new ClientObject("ServerBattleMinesModel_obj",null,"ServerBattleMinesModel_obj",null);
       
      
      private var model:BattleMinesModel;
      
      private var var_686:name_32;
      
      public function ServerBattleMinesModel()
      {
         super();
      }
      
      public function init() : void
      {
         this.var_686 = name_32(Main.osgi.name_6(name_32));
         this.model = BattleMinesModel(this.var_686.getModelsByInterface(name_690)[0]);
      }
      
      public function method_76(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:Object = _loc2_.resources;
         var _loc4_:name_1411 = new name_1411();
         _loc4_.activateSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.activateSound)));
         _loc4_.activateTimeMsec = _loc2_.activationTimeMsec;
         _loc4_.blueMineTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.blueMineTexture)));
         _loc4_.deactivateSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.deactivateSound)));
         _loc4_.enemyMineTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.enemyMineTexture)));
         _loc4_.explosionSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.explosionSound)));
         _loc4_.farVisibilityRadius = _loc2_.farVisibilityRadius;
         _loc4_.friendlyMineTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.friendlyMineTexture)));
         _loc4_.idleExplosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.idleExplosionTexture)));
         _loc4_.impactForce = _loc2_.impactForce;
         _loc4_.mainExplosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.mainExplosionTexture)));
         _loc4_.minDistanceFromBase = _loc2_.minDistanceFromBase;
         _loc4_.model3ds = Tanks3DSResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.model3ds)));
         _loc4_.nearVisibilityRadius = _loc2_.nearVisibilityRadius;
         _loc4_.radius = _loc2_.radius;
         _loc4_.redMineTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_loc3_.redMineTexture)));
         Base.object = _loc4_;
         this.model.method_18(_loc4_);
         this.model.initObject(const_455);
         this.model.objectLoaded(const_455);
         Base.method_38();
      }
      
      public function method_954(param1:String) : void
      {
         var _loc4_:Object = null;
         var _loc5_:name_1410 = null;
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:Vector.<name_1410> = new Vector.<name_1410>();
         for each(_loc4_ in _loc2_.mines)
         {
            _loc5_ = new name_1410(true,_loc4_.mineId,_loc4_.ownerId,_loc4_.x,_loc4_.y,_loc4_.z);
            _loc3_.push(_loc5_);
         }
         this.model.method_954(_loc3_);
      }
      
      public function method_957(param1:String) : void
      {
         this.model.method_957(null,param1);
      }
      
      public function method_955(param1:ClientObject, param2:Object) : void
      {
         var _loc3_:Object = param2;
         this.model.method_955(param1,_loc3_.mineId,_loc3_.x,_loc3_.y,_loc3_.z,_loc3_.userId);
      }
      
      public function method_956(param1:String) : void
      {
         this.model.method_956(null,param1);
      }
      
      public function method_958(param1:ClientObject, param2:String) : void
      {
         this.model.name_1412(param1,param2,param1.id);
      }
   }
}
