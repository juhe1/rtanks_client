package package_52
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.sfx.shoot.name_1187;
   import alternativa.tanks.models.weapon.machinegun.VulcanSFXModel;
   import alternativa.tanks.models.weapon.name_213;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_13.Long;
   import package_149.FreezeSFXModel;
   import package_152.RicochetSFXModel;
   import package_153.PlasmaSFXModel;
   import package_155.FlamethrowerSFXModel;
   import package_157.RailgunSFXModel;
   import package_162.SmokySFXModel;
   import package_165.ThunderSFXModel;
   import package_166.HealingGunSFXModel;
   import package_299.ShaftSFXModel;
   import package_300.name_1189;
   import package_301.SnowmanSFXModel;
   import package_4.ClientObject;
   import package_6.ClientClass;
   import package_73.name_296;
   import package_92.WeaponCommonModel;
   import package_92.name_1188;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class WeaponsManager
   {
      
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().name_6(ResourceRegistry) as ResourceRegistry;
      
      public static var modelRegister:name_29 = OSGi.getInstance().name_6(name_29) as name_29;
      
      public static var colorTransform:Dictionary = new Dictionary();
      
      public static var var_496:Dictionary = new Dictionary();
      
      public static var var_495:Dictionary = new Dictionary();
      
      public static var var_497:Dictionary = new Dictionary();
      
      private static var var_487:Dictionary = new Dictionary();
      
      private static var var_488:Dictionary = new Dictionary();
      
      private static var var_483:Dictionary = new Dictionary();
      
      private static var var_493:Dictionary = new Dictionary();
      
      private static var var_490:Dictionary;
      
      private static var var_491:Dictionary;
      
      private static var var_484:Dictionary;
      
      private static var var_486:Dictionary = new Dictionary();
      
      private static var var_485:Dictionary = new Dictionary();
      
      private static var var_494:Dictionary = new Dictionary();
      
      private static var var_492:Dictionary = new Dictionary();
      
      private static var var_489:Dictionary = new Dictionary();
       
      
      public function WeaponsManager()
      {
         super();
      }
      
      public static function name_231(param1:ClientObject, param2:ClientObject, param3:Number, param4:Number, param5:Number, param6:Number) : name_213
      {
         var _loc7_:WeaponCommonModel = Main.osgi.name_6(name_1188) as WeaponCommonModel;
         if(_loc7_ == null)
         {
            _loc7_ = new WeaponCommonModel();
            Main.osgi.name_1(name_1188,_loc7_);
         }
         _loc7_.initObject(param2,param3,param4,param5,param6);
         _loc7_.objectLoaded(param2);
         return _loc7_;
      }
      
      public static function createRailgunSFXModel(param1:ClientObject, param2:Object = null) : RailgunSFXModel
      {
         var _loc3_:RailgunSFXModel = null;
         var _loc4_:ImageResource = null;
         var _loc5_:ImageResource = null;
         var _loc6_:ImageResource = null;
         var _loc7_:ImageResource = null;
         var _loc8_:ImageResource = null;
         var _loc9_:SoundResource = null;
         if(var_487 == null)
         {
            var_487 = new Dictionary();
         }
         if(var_487[param1.id] == null)
         {
            var_487[param1.id] = new RailgunSFXModel();
            _loc4_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.beam)));
            _loc5_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.smoke)));
            _loc6_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.charge_part1)));
            _loc7_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.charge_part2)));
            _loc8_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.charge_part3)));
            _loc9_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            var_487[param1.id].initObject(param1,_loc6_,_loc7_,_loc8_,_loc4_.data,_loc5_.data,_loc9_.sound);
         }
         _loc3_ = var_487[param1.id];
         if(_loc3_ == null)
         {
            throw new Error("пизда бачок " + param1.id);
         }
         return _loc3_;
      }
      
      public static function createShotGunSFXModel(param1:ClientObject, param2:Object = null) : name_296
      {
         var _loc3_:name_296 = null;
         _loc3_ = name_296(modelRegister.getModel(Long.getLong(179431987,214974876)));
         var _loc4_:MultiframeImageResource = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunSmokeTexture)));
         var _loc5_:MultiframeImageResource = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunShotAlongTexture)));
         var _loc6_:MultiframeImageResource = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunShotAcrossTexture)));
         var _loc7_:ImageResource = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunPelletTrailTexture)));
         var _loc8_:ImageResource = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunSparkleTexture)));
         var _loc9_:SoundResource = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunShotSound)));
         var _loc10_:SoundResource = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunReloadSound)));
         var _loc11_:SoundResource = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunMagazineReloadSound)));
         var _loc12_:Vector.<ImageResource> = new Vector.<ImageResource>();
         _loc12_.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunExplosionMarkTexture1))));
         _loc12_.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunExplosionMarkTexture2))));
         _loc12_.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunExplosionMarkTexture3))));
         _loc12_.push(ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shotgunExplosionMarkTexture4))));
         _loc3_.initObject(param1,_loc12_,_loc7_,_loc6_,_loc5_,_loc4_,_loc8_,_loc11_,_loc10_,_loc9_);
         return _loc3_;
      }
      
      public static function createSmokySFXModel(param1:ClientObject, param2:Object = null) : SmokySFXModel
      {
         var _loc3_:SmokySFXModel = null;
         var _loc4_:ImageResource = null;
         var _loc5_:ImageResource = null;
         var _loc6_:SoundResource = null;
         var _loc7_:SoundResource = null;
         if(var_488 == null)
         {
            var_488 = new Dictionary();
         }
         if(var_488[param1.id] == null)
         {
            var_488[param1.id] = new SmokySFXModel();
            _loc4_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shot)));
            _loc5_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosion)));
            _loc6_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc7_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
            var_488[param1.id].initObject(param1,_loc7_.sound,_loc6_.sound,_loc4_.data,_loc5_.data);
         }
         return var_488[param1.id];
      }
      
      public static function createFlamethrowerSFXModel(param1:ClientObject, param2:Object = null) : FlamethrowerSFXModel
      {
         var _loc3_:ImageResource = null;
         var _loc4_:ImageResource = null;
         var _loc5_:SoundResource = null;
         if(var_483 == null)
         {
            var_483 = new Dictionary();
         }
         if(var_483[param1.id] == null)
         {
            var_483[param1.id] = new FlamethrowerSFXModel();
            _loc3_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.flamethrower_fire)));
            _loc4_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.flamethrower_muzzle)));
            _loc5_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            var_483[param1.id].initObject(param1,_loc3_.data,_loc4_.data,_loc5_.sound);
            var_483[param1.id].objectLoaded(param1);
         }
         return var_483[param1.id];
      }
      
      public static function createTwinsSFXModel(param1:ClientObject, param2:Object = null) : PlasmaSFXModel
      {
         var _loc3_:ImageResource = null;
         var _loc4_:ImageResource = null;
         var _loc5_:ImageResource = null;
         var _loc6_:SoundResource = null;
         var _loc7_:SoundResource = null;
         if(var_493 == null)
         {
            var_493 = new Dictionary();
         }
         if(var_493[param1.id] == null)
         {
            _loc3_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shot)));
            _loc4_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.muzzle)));
            _loc5_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosion)));
            _loc6_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc7_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
            var_493[param1.id] = new PlasmaSFXModel();
            var_493[param1.id].initObject(param1,_loc7_.sound,_loc6_.sound,_loc3_.data,_loc5_.data,_loc4_.data);
         }
         return var_493[param1.id];
      }
      
      public static function createIsidaSFXModel(param1:ClientObject, param2:Object = null) : HealingGunSFXModel
      {
         var _loc3_:ImageResource = null;
         var _loc4_:ImageResource = null;
         var _loc5_:ImageResource = null;
         var _loc6_:ImageResource = null;
         var _loc7_:SoundResource = null;
         var _loc8_:SoundResource = null;
         var _loc9_:SoundResource = null;
         if(var_490 == null)
         {
            var_490 = new Dictionary();
         }
         if(var_490[param1.id] == null)
         {
            _loc3_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.heal)));
            _loc4_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.damage)));
            _loc5_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.heal_shaft)));
            _loc6_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.damage_shaft)));
            _loc7_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.damagingSound)));
            _loc8_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.healingSound)));
            _loc9_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.idleSound)));
            var_490[param1.id] = new HealingGunSFXModel();
            var_490[param1.id].initObject(param1,_loc7_.sound,_loc8_.sound,_loc9_.sound,_loc3_.data,_loc4_.data,_loc5_.data,_loc6_.data);
         }
         return var_490[param1.id];
      }
      
      public static function createThunderSFXModel(param1:ClientObject, param2:Object = null) : ThunderSFXModel
      {
         var _loc3_:ImageResource = null;
         var _loc4_:ImageResource = null;
         var _loc5_:SoundResource = null;
         var _loc6_:SoundResource = null;
         if(var_491 == null)
         {
            var_491 = new Dictionary();
         }
         if(var_491[param1.id] == null)
         {
            var_491[param1.id] = new ThunderSFXModel();
            _loc3_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shot)));
            _loc4_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosion)));
            _loc5_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc6_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
            var_491[param1.id].initObject(param1,_loc6_.sound,_loc5_.sound,_loc3_.data,_loc4_.data);
         }
         return var_491[param1.id];
      }
      
      public static function createFrezeeSFXModel(param1:ClientObject, param2:Object = null) : FreezeSFXModel
      {
         var _loc3_:ImageResource = null;
         var _loc4_:ImageResource = null;
         var _loc5_:SoundResource = null;
         if(var_484 == null)
         {
            var_484 = new Dictionary();
         }
         if(var_484[param1.id] == null)
         {
            var_484[param1.id] = new FreezeSFXModel();
            _loc3_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.frezee_freezeballs)));
            _loc4_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.frezee_muzzle)));
            _loc5_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            var_484[param1.id].initObject(param1,_loc3_.data,_loc4_.data,_loc5_.sound);
            var_484[param1.id].objectLoaded(param1);
         }
         return var_484[param1.id];
      }
      
      public static function createRicochetSFXModel(param1:ClientObject, param2:Object = null) : RicochetSFXModel
      {
         var _loc3_:ImageResource = null;
         var _loc4_:ImageResource = null;
         var _loc5_:ImageResource = null;
         var _loc6_:ImageResource = null;
         var _loc7_:SoundResource = null;
         var _loc8_:SoundResource = null;
         var _loc9_:SoundResource = null;
         if(var_486 == null)
         {
            var_486 = new Dictionary();
         }
         if(var_486[param1.id] == null)
         {
            _loc3_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shot)));
            _loc4_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.muzzle)));
            _loc5_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.explosion)));
            _loc6_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.trail)));
            _loc7_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc8_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.ricochetSound)));
            _loc9_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
            var_486[param1.id] = new RicochetSFXModel();
            var_486[param1.id].initObject(param1,_loc9_.sound,_loc8_.sound,_loc7_.sound,_loc5_.data,_loc4_.data,_loc3_.data,_loc6_.data);
         }
         return var_486[param1.id];
      }
      
      public static function createShaftSFXModel(param1:ClientObject, param2:Object = null) : ShaftSFXModel
      {
         var _loc3_:ShaftSFXModel = null;
         var _loc4_:ImageResource = null;
         var _loc5_:ImageResource = null;
         var _loc6_:ImageResource = null;
         var _loc7_:SoundResource = null;
         var _loc8_:SoundResource = null;
         var _loc9_:SoundResource = null;
         var _loc10_:SoundResource = null;
         if(var_485 == null)
         {
            var_485 = new Dictionary();
         }
         if(var_485[param1.id] == null)
         {
            var_485[param1.id] = new ShaftSFXModel();
            _loc4_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.trail)));
            _loc5_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.shot)));
            _loc6_ = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.muzzle)));
            _loc7_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.zoomSound)));
            _loc8_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.targetingSound)));
            _loc9_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shotSound)));
            _loc10_ = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.explosionSound)));
            var_485[param1.id].initObject(param1,_loc7_.sound,_loc8_.sound,_loc9_.sound,_loc10_.sound,_loc5_.data,_loc4_.data,_loc6_.data);
         }
         return var_485[param1.id];
      }
      
      public static function name_185(param1:String) : ClientObject
      {
         if(var_494[param1] == null)
         {
            var_494[param1] = initObject(param1);
         }
         return var_494[param1];
      }
      
      public static function method_715(param1:ClientObject) : SnowmanSFXModel
      {
         if(var_492 == null)
         {
            var_492 = new Dictionary();
         }
         if(var_492[param1.id] == null)
         {
            var_492[param1.id] = new SnowmanSFXModel();
            var_492[param1.id].initObject(param1,"snowman_shotExplosion",param1.id + "_fire",param1.id + "_snow","snowman_shotSound",param1.id + "_snow");
         }
         return var_492[param1.id];
      }
      
      public static function createVulcanSFXModel(param1:ClientObject, param2:Object = null) : VulcanSFXModel
      {
         var _loc3_:name_1189 = null;
         if(var_489 == null)
         {
            var_489 = new Dictionary();
         }
         if(var_489[param1.id] == null)
         {
            _loc3_ = new name_1189();
            _loc3_.fireAcrossTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.fireAcrossTexture)));
            _loc3_.fireAlongTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.fireAlongTexture)));
            _loc3_.dustTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.dustTexture)));
            _loc3_.smokeTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.smokeTexture)));
            _loc3_.sparklesTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.sparklesTexture)));
            _loc3_.tankSparklesTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.tankSparklesTexture)));
            _loc3_.tracerTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.tracerTexture)));
            _loc3_.crumbsTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.crumbsTexture)));
            _loc3_.chainStartSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.chainStartSound)));
            _loc3_.turbineStartSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.turbineStartSound)));
            _loc3_.shootEndSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shootEndSound)));
            _loc3_.shootSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.shootSound)));
            _loc3_.longFailSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.longFailSound)));
            _loc3_.hitSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.hitSound)));
            _loc3_.tankHitSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,param2.tankHitSound)));
            var_489[param1.id] = new VulcanSFXModel();
            var_489[param1.id].initObject(param1,_loc3_);
         }
         return var_489[param1.id];
      }
      
      public static function method_721(param1:ClientObject) : name_1187
      {
         var _loc3_:name_1187 = null;
         var _loc2_:String = String(param1.id.split("_")[0]);
         switch(_loc2_)
         {
            case "smoky":
               _loc3_ = createSmokySFXModel(param1);
               break;
            case "hammer":
               _loc3_ = createSmokySFXModel(param1);
               break;
            case "smokyxt":
               _loc3_ = createSmokySFXModel(param1);
               break;
            case "twins":
               _loc3_ = createTwinsSFXModel(param1);
               break;
            case "shaft":
               break;
            case "snowman":
               _loc3_ = method_715(param1);
         }
         return _loc3_;
      }
      
      private static function initObject(param1:String) : ClientObject
      {
         return new ClientObject(param1,new ClientClass(param1,null,param1,null),param1,null);
      }
      
      public static function objectUnloaded(param1:ClientObject) : void
      {
         var _loc3_:Object = null;
         var _loc2_:* = null;
         for(_loc3_ in var_488)
         {
            if(param1.id == _loc3_)
            {
               _loc2_ = var_488[_loc3_];
               _loc2_.objectUnloaded(param1);
               _loc2_ = null;
               delete var_488[_loc3_];
            }
         }
         for(_loc3_ in var_483)
         {
            if(param1.id == _loc3_)
            {
               _loc2_ = var_483[_loc3_];
               _loc2_.objectUnloaded(param1);
               _loc2_ = null;
               delete var_483[_loc3_];
            }
         }
         for(_loc3_ in var_486)
         {
            if(param1.id == _loc3_)
            {
               _loc2_ = var_486[_loc3_];
               _loc2_.objectUnloaded(param1);
               _loc2_ = null;
               delete var_486[_loc3_];
            }
         }
         for(_loc3_ in var_484)
         {
            if(param1.id == _loc3_)
            {
               _loc2_ = var_484[_loc3_];
               _loc2_.objectUnloaded(param1);
               _loc2_ = null;
               delete var_484[_loc3_];
            }
         }
         for(_loc3_ in var_487)
         {
            if(param1.id == _loc3_)
            {
               _loc2_ = var_487[_loc3_];
               _loc2_.objectUnloaded(param1);
               _loc2_ = null;
               delete var_487[_loc3_];
            }
         }
         for(_loc3_ in var_485)
         {
            if(param1.id == _loc3_)
            {
               _loc2_ = var_485[_loc3_];
               _loc2_.objectUnloaded(param1);
               _loc2_ = null;
               delete var_485[_loc3_];
            }
         }
         for(_loc3_ in var_491)
         {
            if(param1.id == _loc3_)
            {
               _loc2_ = var_491[_loc3_];
               _loc2_.objectUnloaded(param1);
               _loc2_ = null;
               delete var_491[_loc3_];
            }
         }
         for(_loc3_ in var_490)
         {
            if(param1.id == _loc3_)
            {
               _loc2_ = var_490[_loc3_];
               _loc2_.objectUnloaded(param1);
               _loc2_ = null;
               delete var_490[_loc3_];
            }
         }
         for(_loc3_ in var_489)
         {
            if(param1.id == _loc3_)
            {
               _loc2_ = var_489[_loc3_];
               _loc2_.objectUnloaded(param1);
               _loc2_ = null;
               delete var_489[_loc3_];
            }
         }
      }
      
      public static function destroy() : void
      {
         var_490 = null;
         var_493 = null;
         var_483 = null;
         var_488 = null;
         var_487 = null;
         var_491 = null;
         var_486 = null;
         var_484 = null;
         var_485 = null;
         var_492 = null;
         var_489 = null;
      }
   }
}
