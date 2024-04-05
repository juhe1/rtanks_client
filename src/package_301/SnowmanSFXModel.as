package package_301
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.model.class_11;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.models.sfx.name_1096;
   import alternativa.tanks.models.sfx.name_1716;
   import alternativa.tanks.models.sfx.name_2412;
   import alternativa.tanks.models.sfx.shoot.name_1187;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.services.objectpool.name_118;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_1070;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_1497;
   import alternativa.tanks.sfx.name_89;
   import flash.geom.ColorTransform;
   import package_1.Main;
   import package_159.name_1594;
   import package_159.name_1737;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_7.name_32;
   
   public class SnowmanSFXModel implements name_1187, class_171, class_11
   {
      
      private static var var_58:name_100;
      
      private static var var_138:name_118;
      
      private static var var_1085:Vector3 = new Vector3();
      
      private static var var_421:BattlefieldModel;
       
      
      public function SnowmanSFXModel()
      {
         super();
         var_58 = name_100(Main.osgi.name_6(name_100));
         var_138 = name_118(Main.osgi.name_6(name_118));
         var_421 = Main.osgi.name_6(name_83) as BattlefieldModel;
      }
      
      public function initObject(param1:ClientObject, param2:String, param3:String, param4:String, param5:String, param6:String) : void
      {
         var _loc7_:name_2411 = new name_2411();
         param1.method_12(SnowmanSFXModel,_loc7_);
      }
      
      public function name_1249(param1:ClientObject, param2:Vector3, param3:Object3D, param4:Camera3D) : name_1497
      {
         var _loc5_:Sound3D = null;
         var _loc6_:name_2411 = this.method_2105(param1);
         var _loc7_:name_2412 = name_2412(var_138.objectPool.getObject(name_2412));
         _loc7_.init(_loc6_.name_2413,param2,param3,10,80,50,50,_loc6_.colorTransform);
         var _loc8_:Sound3DEffect = null;
         if(_loc6_.shotSound != null)
         {
            _loc5_ = Sound3D.create(_loc6_.shotSound,name_89.name_191,name_89.name_229,name_89.name_250,0.8);
            var_1085.x = param3.x;
            var_1085.y = param3.y;
            var_1085.z = param3.z;
            _loc8_ = Sound3DEffect.create(var_138.objectPool,null,var_1085,_loc5_);
         }
         this.method_1299(param2,param3,param1);
         return new name_1497(_loc7_,_loc8_);
      }
      
      private function method_1299(param1:Vector3, param2:Object3D, param3:ClientObject) : void
      {
         var _loc4_:name_1096 = name_1096(var_138.objectPool.getObject(name_1096));
         var _loc5_:name_1716 = name_1716(var_138.objectPool.getObject(name_1716));
         _loc5_.init(param2,param1);
         _loc4_.init(_loc5_,LightDataManager.name_1098(param3.id));
         var_421.name_217(_loc4_);
      }
      
      public function method_502(param1:ClientObject, param2:Vector3, param3:Camera3D, param4:Number) : name_1497
      {
         var _loc5_:name_2411 = this.method_2105(param1);
         var _loc6_:Number = 180 * (1 + param4);
         var _loc7_:name_1070 = name_1070(var_138.objectPool.getObject(name_1070));
         var _loc8_:name_1072 = _loc5_.explosionData;
         var _loc9_:name_1071 = name_1071(var_138.objectPool.getObject(name_1071));
         _loc9_.init(param2,50);
         _loc7_.init(_loc6_,_loc6_,_loc8_,6.28 * Math.random(),_loc9_);
         this.method_1267(param2,param1);
         return new name_1497(_loc7_,null);
      }
      
      private function method_1267(param1:Vector3, param2:ClientObject) : void
      {
         var _loc3_:name_1096 = name_1096(var_138.objectPool.getObject(name_1096));
         var _loc4_:name_1071 = name_1071(var_138.objectPool.getObject(name_1071));
         _loc4_.init(param1,110);
         _loc3_.init(_loc4_,LightDataManager.name_1098(param2.id));
         var_421.name_217(_loc3_);
      }
      
      public function method_2105(param1:ClientObject) : name_2411
      {
         return name_2411(param1.method_16(SnowmanSFXModel));
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:name_2411 = null;
         var _loc3_:Vector.<name_1594> = null;
         var _loc4_:name_1594 = null;
         var _loc5_:name_32 = name_32(Main.osgi.name_6(name_32));
         var _loc6_:name_1737 = name_1737(_loc5_.method_260(param1,name_1737));
         if(_loc6_ != null)
         {
            _loc2_ = this.method_2105(param1);
            _loc3_ = _loc6_.name_1738(param1);
            _loc4_ = _loc3_[0];
            _loc2_.colorTransform = new ColorTransform(_loc4_.redMultiplier,_loc4_.greenMultiplier,_loc4_.blueMultiplier,_loc4_.alphaMultiplier,_loc4_.redOffset,_loc4_.greenOffset,_loc4_.blueOffset,_loc4_.alphaOffset);
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
      }
   }
}
