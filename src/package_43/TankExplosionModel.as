package package_43
{
   import alternativa.engine3d.objects.Mesh;
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.sfx.LightAnimation;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.models.sfx.name_1096;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.services.objectpool.name_118;
   import alternativa.tanks.sfx.name_1070;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_1094;
   import alternativa.tanks.sfx.name_1095;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import package_1.Main;
   import package_13.Long;
   import package_238.ObjectPool;
   import package_242.name_662;
   import package_290.class_31;
   import package_290.class_32;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_61.name_124;
   import package_7.name_32;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class TankExplosionModel extends class_32 implements class_31, class_11, name_93
   {
      
      private static const const_123:int = 200;
       
      
      private const const_106:Number = 800;
      
      private const const_101:Number = 400;
      
      private const const_105:Number = 1000;
      
      private const const_104:Number = 600;
      
      private const const_107:Number = 800;
      
      private const const_100:Number = 200;
      
      private const const_103:Number = -2000;
      
      private const const_108:Number = 25;
      
      private const const_102:Number = 15;
      
      private var var_138:name_118;
      
      private var var_58:name_100;
      
      private var var_396:name_662;
      
      private var var_399:name_662;
      
      private var var_395:name_662;
      
      private var var_398:name_662;
      
      private var var_11:name_83;
      
      private var var_397:name_124;
      
      private var position:Vector3;
      
      private var const_64:Vector3;
      
      private var name_187:Vector3;
      
      private var matrix:Matrix3;
      
      public function TankExplosionModel()
      {
         this.var_138 = name_118(Main.osgi.name_6(name_118));
         this.var_58 = name_100(Main.osgi.name_6(name_100));
         this.var_396 = new name_662("tankexpl_size",800,1,2000);
         this.var_399 = new name_662("tankexpl_smoke_size",400,1,2000);
         this.var_395 = new name_662("tankexpl_scale",1,0,10);
         this.var_398 = new name_662("tankexpl_scale_speed",1,0,10);
         this.var_397 = new name_124();
         this.position = new Vector3();
         this.const_64 = new Vector3();
         this.name_187 = new Vector3();
         this.matrix = new Matrix3();
         super();
         var_365.push(name_66,class_11,name_93);
      }
      
      public function initObject(param1:ClientObject) : void
      {
         var _loc2_:name_32 = null;
         if(this.var_11 == null)
         {
            _loc2_ = name_32(Main.osgi.name_6(name_32));
            this.var_11 = Main.osgi.name_6(name_83) as name_83;
         }
         var _loc3_:name_1072 = this.name_1073(ImageResource(ResourceRegistry(OSGi.getInstance().name_6(ResourceRegistry)).getResource(Long.getLong(0,388817))).data,800,1024 / 6);
         _loc3_.fps = 50;
         var _loc4_:name_1072 = this.name_1073(ImageResource(ResourceRegistry(OSGi.getInstance().name_6(ResourceRegistry)).getResource(Long.getLong(0,857360))).data,1000,512 / 4);
         _loc4_.fps = 50;
         var _loc5_:name_1072 = this.name_1073(ImageResource(ResourceRegistry(OSGi.getInstance().name_6(ResourceRegistry)).getResource(Long.getLong(0,553309))).data,400,256 / 4);
         _loc5_.fps = 50;
         var _loc6_:ExplosionData = new ExplosionData(_loc3_,_loc4_,_loc5_);
         param1.method_12(TankExplosionModel,_loc6_);
      }
      
      private function name_1073(param1:BitmapData, param2:Number, param3:Number) : name_1072
      {
         var _loc4_:name_1072 = GraphicsUtils.name_1073(this.var_58.textureMaterialRegistry as TextureMaterialRegistry,param1,param3,param3);
         _loc4_.material.resolution = param2 / param3;
         return _loc4_;
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         this.method_575(ExplosionData(this.getData(param1)));
      }
      
      private function method_575(param1:ExplosionData) : void
      {
         this.var_58.textureMaterialRegistry.disposeMaterial(param1.flameAnimation.material);
         this.var_58.textureMaterialRegistry.disposeMaterial(param1.shockWaveAnimation.material);
         this.var_58.textureMaterialRegistry.disposeMaterial(param1.smokeAnimation.material);
      }
      
      public function method_502(param1:ClientObject, param2:TankData) : void
      {
         var _loc3_:ExplosionData = null;
         var _loc4_:ObjectPool = null;
         var _loc5_:Number = NaN;
         var _loc12_:Number = NaN;
         _loc3_ = null;
         _loc4_ = null;
         _loc5_ = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Vector3 = null;
         var _loc9_:Number = NaN;
         var _loc10_:Vector3 = null;
         var _loc11_:name_1094 = null;
         _loc12_ = NaN;
         var _loc13_:name_1070 = null;
         var _loc14_:name_1095 = null;
         var _loc15_:Number = NaN;
         _loc3_ = this.getData(param1);
         _loc4_ = this.var_138.objectPool;
         var _loc16_:Mesh = param2.tank.skin.name_123;
         var _loc17_:Number = _loc16_.boundMaxX - _loc16_.boundMinX;
         var _loc18_:Number = _loc16_.boundMaxY - _loc16_.boundMinY;
         var _loc19_:Number = _loc16_.boundMaxZ - _loc16_.boundMinZ;
         var _loc20_:Number = Math.sqrt(_loc17_ * _loc17_ + _loc18_ * _loc18_ + _loc19_ * _loc19_);
         _loc5_ = this.var_395.value * _loc20_ / 600;
         var _loc21_:Vector3 = new Vector3(0,0,-1);
         this.position.vCopy(param2.tank.state.position);
         if(this.var_11.getBattlefieldData().name_247.name_251(this.position,_loc21_,255,500,null,this.var_397))
         {
            this.var_397.position.z += 10;
            _loc6_ = 1000;
            _loc7_ = 200;
            if(this.var_397.t > _loc7_)
            {
               _loc6_ *= (500 - this.var_397.t) / (500 - _loc7_);
            }
            _loc8_ = this.var_397.normal;
            _loc9_ = Math.acos(_loc8_.z);
            _loc10_ = new Vector3(-_loc8_.y,_loc8_.x,0);
            _loc10_.vNormalize();
            this.matrix.name_1097(_loc10_,_loc9_);
            this.matrix.name_182(this.const_64);
            _loc11_ = name_1094(_loc4_.getObject(name_1094));
            _loc11_.init(_loc5_ * _loc6_,this.var_397.position,this.const_64,_loc3_.shockWaveAnimation,1);
            this.var_11.name_217(_loc11_);
         }
         this.position.z += 50;
         var _loc23_:name_1070 = name_1070(_loc4_.getObject(name_1070));
         var _loc24_:name_1071 = name_1071(_loc4_.getObject(name_1071));
         _loc24_.init(this.position,200);
         var _loc25_:Number = 800 * _loc5_;
         _loc23_.init(_loc25_,_loc25_,_loc3_.flameAnimation,Math.random() * 2 * Math.PI,_loc24_);
         this.var_11.name_217(_loc23_);
         this.method_627(_loc4_);
         var _loc26_:int = 0;
         while(_loc26_ < 3)
         {
            _loc12_ = 800 + Math.random() * 200;
            this.name_187.x = _loc12_ * (1 - 2 * Math.random());
            this.name_187.y = _loc12_ * (1 - 2 * Math.random());
            this.name_187.z = _loc12_ * 0.5 * (1 + Math.random());
            _loc13_ = name_1070(_loc4_.getObject(name_1070));
            _loc14_ = name_1095(_loc4_.getObject(name_1095));
            _loc14_.init(this.position,this.name_187,-2000);
            _loc15_ = this.var_399.value * _loc5_;
            _loc13_.init(_loc15_,_loc15_,_loc3_.smokeAnimation,Math.random() * 2 * Math.PI,_loc14_);
            this.var_11.name_217(_loc13_);
            _loc26_++;
         }
      }
      
      private function method_627(param1:ObjectPool) : void
      {
         var _loc2_:name_1071 = name_1071(param1.getObject(name_1071));
         var _loc3_:name_1096 = name_1096(param1.getObject(name_1096));
         var _loc4_:LightAnimation = LightDataManager.name_1098("tank");
         _loc2_.init(this.position,0);
         _loc3_.init(_loc2_,_loc4_);
         this.var_11.name_217(_loc3_);
      }
      
      private function getData(param1:ClientObject) : ExplosionData
      {
         return ExplosionData(param1.method_16(TankExplosionModel));
      }
   }
}

import alternativa.tanks.engine3d.name_1072;

class ExplosionData
{
    
   
   public var flameAnimation:name_1072;
   
   public var shockWaveAnimation:name_1072;
   
   public var smokeAnimation:name_1072;
   
   public function ExplosionData(param1:name_1072, param2:name_1072, param3:name_1072)
   {
      super();
      this.flameAnimation = param1;
      this.shockWaveAnimation = param2;
      this.smokeAnimation = param3;
   }
}
