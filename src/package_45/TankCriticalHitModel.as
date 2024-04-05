package package_45
{
   import alternativa.engine3d.objects.Mesh;
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.services.objectpool.name_118;
   import alternativa.tanks.sfx.name_1070;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.utils.GraphicsUtils;
   import package_1.Main;
   import package_13.Long;
   import package_238.ObjectPool;
   import package_242.name_662;
   import package_287.class_28;
   import package_287.class_29;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_61.name_124;
   import package_7.name_32;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class TankCriticalHitModel extends class_28 implements class_29, class_11, name_91
   {
      
      public static var resourceRegistry:ResourceRegistry = ResourceRegistry(OSGi.getInstance().name_6(ResourceRegistry));
       
      
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
      
      public function TankCriticalHitModel()
      {
         this.var_138 = name_118(Main.osgi.name_6(name_118));
         this.var_58 = name_100(Main.osgi.name_6(name_100));
         this.var_396 = new name_662("tankexpl_size",800,1,500);
         this.var_395 = new name_662("tankexpl_scale",1,0,10);
         this.var_397 = new name_124();
         this.position = new Vector3();
         this.const_64 = new Vector3();
         this.name_187 = new Vector3();
         this.matrix = new Matrix3();
         super();
         var_365.push(name_66,class_11,name_91);
      }
      
      public function initObject(param1:ClientObject) : void
      {
         var _loc2_:name_32 = null;
         if(this.var_11 == null)
         {
            _loc2_ = name_32(Main.osgi.name_6(name_32));
            this.var_11 = Main.osgi.name_6(name_83) as name_83;
         }
         var _loc3_:MultiframeImageResource = resourceRegistry.getResource(Long.getLong(0,122455)) as MultiframeImageResource;
         var _loc4_:name_1072 = GraphicsUtils.name_1073(this.var_58.textureMaterialRegistry as TextureMaterialRegistry,_loc3_.data,_loc3_.frameWidth,_loc3_.frameHeight);
         _loc4_.material.resolution = 800 / 200;
         _loc4_.fps = 25;
         var _loc5_:ExplosionData = new ExplosionData(_loc4_);
         param1.method_12(TankCriticalHitModel,_loc5_);
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
         this.var_58.textureMaterialRegistry.disposeMaterial(param1.explosionData.material);
      }
      
      public function method_502(param1:ClientObject, param2:TankData) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:ObjectPool = null;
         var _loc3_:ExplosionData = null;
         _loc4_ = NaN;
         _loc3_ = this.getData(param1);
         _loc5_ = this.var_138.objectPool;
         var _loc6_:Mesh = param2.tank.skin.name_123;
         var _loc7_:Number = _loc6_.boundMaxX - _loc6_.boundMinX;
         var _loc8_:Number = _loc6_.boundMaxY - _loc6_.boundMinY;
         var _loc9_:Number = _loc6_.boundMaxZ - _loc6_.boundMinZ;
         var _loc10_:Number = Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_ + _loc9_ * _loc9_);
         _loc4_ = this.var_395.value * _loc10_ / 600;
         var _loc11_:Vector3 = new Vector3(0,0,-1);
         this.position.vCopy(param2.tank.state.position);
         this.position.z += 50;
         var _loc13_:name_1070 = name_1070(_loc5_.getObject(name_1070));
         var _loc14_:name_1072 = _loc3_.explosionData;
         var _loc15_:name_1071 = name_1071(_loc5_.getObject(name_1071));
         _loc15_.init(this.position,200);
         var _loc16_:Number = this.var_396.value * _loc4_;
         _loc13_.init(400,400,_loc14_,Math.random() * 2 * Math.PI,_loc15_);
         this.var_11.name_217(_loc13_);
      }
      
      private function getData(param1:ClientObject) : ExplosionData
      {
         return ExplosionData(param1.method_16(TankCriticalHitModel));
      }
   }
}

import alternativa.tanks.engine3d.name_1072;

class ExplosionData
{
    
   
   public var explosionData:name_1072;
   
   public function ExplosionData(param1:name_1072)
   {
      super();
      this.explosionData = param1;
   }
}
