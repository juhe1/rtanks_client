package package_299
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.sfx.name_1716;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.services.objectpool.name_118;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_1070;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_1718;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.media.Sound;
   import package_1.Main;
   import package_159.BCSHModel;
   import package_238.ObjectPool;
   import package_281.name_2403;
   import package_37.Vector3;
   import package_371.BCSHFilter;
   import package_4.ClientObject;
   import package_417.TrailEffect1;
   import package_417.TrailEffect2;
   import package_417.name_2407;
   import package_52.WeaponsManager;
   
   public class ShaftSFXModel implements class_167
   {
      
      private static const const_1780:Number = 0.35;
      
      public static const name_1819:Number = 200;
      
      public static const const_1782:Number = 200;
      
      private static const const_1487:Number = 110;
      
      private static const const_1779:Number = 0.8;
      
      private static const const_1781:int = 1000;
      
      private static const const_1778:Vector3 = new Vector3();
      
      private static const const_1783:int = 300;
      
      private static var var_138:name_118;
       
      
      private const const_1488:Number = 0.4;
      
      private var var_11:BattlefieldModel;
      
      public function ShaftSFXModel()
      {
         super();
         var_138 = name_118(Main.osgi.name_6(name_118));
         this.var_11 = Main.osgi.name_6(name_83) as BattlefieldModel;
      }
      
      private static function method_1276(param1:String, param2:String) : BitmapFilter
      {
         var _loc3_:BCSHModel = WeaponsManager.var_496[param1];
         if(_loc3_ == null)
         {
            return BCSHFilter.name_1776(0,0,0,0);
         }
         return _loc3_.getData(param2).name_1776();
      }
      
      private static function name_1073(param1:BitmapData, param2:BitmapFilter, param3:Number, param4:Number, param5:*) : name_1072
      {
         var _loc6_:BitmapData = GraphicsUtils.name_1786(param1,param2);
         var _loc7_:name_1072 = GraphicsUtils.name_1073(name_100(Main.osgi.name_6(name_100)).textureMaterialRegistry as TextureMaterialRegistry,_loc6_,param4,param5);
         _loc7_.material.resolution = param3 / param4;
         return _loc7_;
      }
      
      private static function method_1290(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.name_1786(param1,param2);
         var _loc4_:TextureMaterial = name_100(Main.osgi.name_6(name_100)).textureMaterialRegistry.getMaterial(null,_loc3_,2);
         _loc4_.resolution = TrailEffect1.WIDTH / param1.width;
         return _loc4_;
      }
      
      public function initObject(param1:ClientObject, param2:Sound, param3:Sound, param4:Sound, param5:Sound, param6:BitmapData, param7:BitmapData, param8:BitmapData) : void
      {
         var alert:name_2403 = null;
         var _loc6_:BitmapFilter = null;
         var clientObject:ClientObject = param1;
         var zoomModeSound:Sound = param2;
         var targetingSound:Sound = param3;
         var shotSound:Sound = param4;
         var explosionSound:Sound = param5;
         var explosionTexture:BitmapData = param6;
         var trailTexture:BitmapData = param7;
         var muzzleFlashTexture:BitmapData = param8;
         var sfxData:name_2402 = null;
         var trailBitmapData:BitmapData = null;
         var trailMaterial:TextureMaterial = null;
         var exlpBitmap:BitmapData = null;
         var muzzleFlash:BitmapData = null;
         alert = null;
         try
         {
            sfxData = new name_2402();
            sfxData.zoomModeSound = zoomModeSound;
            sfxData.targetingSound = targetingSound;
            sfxData.shotSound = shotSound;
            sfxData.explosionSound = explosionSound;
            _loc6_ = method_1276(clientObject.id,"def");
            trailBitmapData = trailTexture;
            trailMaterial = method_1290(trailBitmapData,_loc6_);
            sfxData.trailMaterial = trailMaterial;
            exlpBitmap = explosionTexture;
            sfxData.name_1762 = name_1073(exlpBitmap,_loc6_,200,78,256);
            sfxData.name_1762.fps = 25;
            muzzleFlash = muzzleFlashTexture;
            sfxData.name_2406 = name_1073(muzzleFlash,_loc6_,200,102,128);
            sfxData.name_2406.fps = 25;
            clientObject.method_12(ShaftSFXModel,sfxData);
         }
         catch(e:Error)
         {
            alert = new name_2403();
            alert.text = "Произошла ошибка: " + e.getStackTrace();
            Main.stage.addChild(alert);
         }
      }
      
      public function method_2104(param1:ClientObject, param2:ClientObject, param3:Object3D) : name_1718
      {
         var _loc4_:name_2402 = param1.method_16(ShaftSFXModel) as name_2402;
         var _loc5_:name_2401 = param2.method_16(name_2401) != null ? param2.method_16(name_2401) as name_2401 : new name_2401();
         _loc5_.name_2404 = name_1718(var_138.objectPool.getObject(name_1718));
         var _loc6_:Sound3D = Sound3D.create(_loc4_.zoomModeSound,name_89.name_191,name_89.name_229,name_89.name_250,0.35);
         _loc5_.name_2404.init(null,_loc6_,param3,0,9999);
         this.var_11.name_195(_loc5_.name_2404);
         param2.method_12(name_2401,_loc5_);
         return _loc5_.name_2404;
      }
      
      public function name_1273(param1:ClientObject, param2:ClientObject) : void
      {
         var _loc3_:name_2402 = param1.method_16(ShaftSFXModel) as name_2402;
         var _loc4_:name_2401 = param2.method_16(name_2401) != null ? param2.method_16(name_2401) as name_2401 : new name_2401();
         if(_loc4_.name_2404 != null)
         {
            _loc4_.name_2404.name_2409(1000);
         }
      }
      
      public function method_2101(param1:ClientObject, param2:ClientObject, param3:Vector3) : void
      {
         var _loc4_:name_2402 = param1.method_16(ShaftSFXModel) as name_2402;
         var _loc5_:Sound3D = Sound3D.create(_loc4_.shotSound,1000,5000,5,0.4);
         var _loc6_:Sound3DEffect = Sound3DEffect.create(var_138.objectPool,param2,param3,_loc5_);
         this.var_11.name_195(_loc6_);
      }
      
      public function method_2103(param1:ClientObject, param2:Vector3, param3:Object3D) : void
      {
         var _loc4_:name_2402 = param1.method_16(ShaftSFXModel) as name_2402;
         var _loc5_:ObjectPool = this.var_11.getObjectPool();
         var _loc6_:name_1716 = name_1716(_loc5_.getObject(name_1716));
         _loc6_.init(param3,param2,10);
         var _loc7_:name_1070 = name_1070(_loc5_.getObject(name_1070));
         _loc7_.init(200,200,_loc4_.name_2406,0,_loc6_);
         this.var_11.name_217(_loc7_);
      }
      
      public function method_2100(param1:ClientObject) : void
      {
         var _loc2_:name_2401 = param1.method_16(name_2401) == null ? null : param1.method_16(name_2401) as name_2401;
         if(_loc2_ == null)
         {
            _loc2_ = new name_2401();
            param1.method_12(name_2401,_loc2_);
         }
         if(_loc2_.name_2404 != null)
         {
            _loc2_.name_2404.kill();
         }
      }
      
      public function name_1260(param1:ClientObject, param2:ClientObject, param3:Boolean) : void
      {
         var alert:name_2403 = null;
         var turretObj:ClientObject = param1;
         var clientObject:ClientObject = param2;
         var play:Boolean = param3;
         var sfxData:name_2402 = null;
         var soundData:name_2401 = null;
         alert = null;
         try
         {
            sfxData = turretObj.method_16(ShaftSFXModel) as name_2402;
            soundData = clientObject.method_16(name_2401) == null ? null : clientObject.method_16(name_2401) as name_2401;
            if(soundData == null)
            {
               soundData = new name_2401();
               clientObject.method_12(name_2401,soundData);
            }
            if(play)
            {
               if(soundData.name_2405 == null)
               {
                  soundData.name_2405 = this.var_11.soundManager.playSound(sfxData.targetingSound,0,9999);
               }
            }
            else if(soundData.name_2405 != null)
            {
               this.var_11.soundManager.name_763(soundData.name_2405);
               soundData.name_2405 = null;
            }
         }
         catch(e:Error)
         {
            alert = new name_2403();
            alert.text = "Произошла ошибка: " + e.getStackTrace();
            Main.stage.addChild(alert);
         }
      }
      
      public function method_2102(param1:ClientObject, param2:ClientObject, param3:Vector3, param4:Vector3, param5:Vector3, param6:Vector3, param7:Vector3) : void
      {
         var _loc8_:name_2402 = param1.method_16(ShaftSFXModel) as name_2402;
         if(param3 != null)
         {
            this.method_2096(param1,param2,_loc8_,param3,param5,param6,param7,false);
         }
         if(param4 != null)
         {
            this.method_2096(param1,param2,_loc8_,param4,param5,param6,param7,true);
         }
      }
      
      private function method_2096(param1:ClientObject, param2:ClientObject, param3:name_2402, param4:Vector3, param5:Vector3, param6:Vector3, param7:Vector3, param8:Boolean) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = param3.name_2408;
         const_1778.diff(param4,param5);
         if(const_1778.dot(param6) > 0)
         {
            _loc9_ = const_1778.vLength();
            if(_loc9_ > _loc10_)
            {
               _loc9_ = _loc10_;
            }
            this.method_2097(param3,TrailEffect1,param4,param7,_loc9_,_loc9_ / _loc10_);
            if(param8)
            {
               this.method_2097(param3,TrailEffect2,param4,param7,_loc9_,0.5);
            }
         }
         this.method_2098(param1,param2,param3,param4);
         this.method_2099(param1,param2,param3,param4);
      }
      
      private function method_2098(param1:ClientObject, param2:ClientObject, param3:name_2402, param4:Vector3) : void
      {
         var _loc5_:name_1071 = name_1071(var_138.objectPool.getObject(name_1071));
         _loc5_.init(param4,110);
         var _loc6_:name_1070 = name_1070(var_138.objectPool.getObject(name_1070));
         _loc6_.init(200,2.5 * 200,param3.name_1762,0,_loc5_);
         this.var_11.name_217(_loc6_);
      }
      
      private function method_2099(param1:ClientObject, param2:ClientObject, param3:name_2402, param4:Vector3) : void
      {
         var _loc5_:Sound3D = Sound3D.create(param3.explosionSound,1000,5000,5,0.8);
         var _loc6_:Sound3DEffect = Sound3DEffect(var_138.objectPool.getObject(Sound3DEffect));
         _loc6_.init(param2,param4,_loc5_,100);
         this.var_11.name_195(_loc6_);
      }
      
      private function method_2097(param1:name_2402, param2:Class, param3:Vector3, param4:Vector3, param5:Number, param6:Number) : void
      {
         var _loc7_:name_2407 = name_2407(var_138.objectPool.getObject(param2));
         _loc7_.init(param3,param4,param5,param6,param1.trailMaterial,300);
         this.var_11.name_217(_loc7_);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:name_2402 = this.method_1264(param1);
         name_100(Main.osgi.name_6(name_100)).textureMaterialRegistry.disposeMaterial(_loc2_.trailMaterial);
         name_100(Main.osgi.name_6(name_100)).textureMaterialRegistry.disposeMaterial(_loc2_.name_1762.material);
         name_100(Main.osgi.name_6(name_100)).textureMaterialRegistry.disposeMaterial(_loc2_.name_2406.material);
      }
      
      private function method_1264(param1:ClientObject) : name_2402
      {
         return name_2402(param1.method_16(ShaftSFXModel));
      }
   }
}
