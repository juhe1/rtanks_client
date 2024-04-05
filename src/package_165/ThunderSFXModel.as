package package_165
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.model.name_66;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.models.sfx.name_1096;
   import alternativa.tanks.models.sfx.name_1716;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.services.objectpool.name_118;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_1070;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_1497;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.media.Sound;
   import package_1.Main;
   import package_238.ObjectPool;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_376.class_113;
   import package_376.class_114;
   import package_4.ClientObject;
   
   public class ThunderSFXModel extends class_113 implements class_114, name_1701
   {
      
      private static const const_1484:Number = 1000;
      
      private static const const_1487:Number = 110;
      
      private static var var_58:name_100;
      
      private static var var_138:name_118;
      
      private static var var_515:Matrix4 = new Matrix4();
      
      private static var name_1421:Vector3 = new Vector3();
       
      
      private var var_421:BattlefieldModel;
      
      public function ThunderSFXModel()
      {
         this.var_421 = Main.osgi.name_6(name_83) as BattlefieldModel;
         super();
         var_365.push(name_66,name_1701);
         var_58 = name_100(Main.osgi.name_6(name_100));
         var_138 = name_118(Main.osgi.name_6(name_118));
      }
      
      private static function method_1266(param1:BitmapData) : TextureMaterial
      {
         var _loc2_:TextureMaterial = var_58.textureMaterialRegistry.getMaterial(null,param1,1);
         _loc2_.resolution = 60 / param1.height;
         return _loc2_;
      }
      
      private static function method_1049(param1:BitmapData, param2:Number, param3:Number) : name_1072
      {
         var _loc4_:name_1072 = GraphicsUtils.name_1073(var_58.textureMaterialRegistry as TextureMaterialRegistry,param1,param3,param3);
         _loc4_.material.resolution = param2 / param3;
         _loc4_.fps = 30;
         return _loc4_;
      }
      
      public function initObject(param1:ClientObject, param2:Sound, param3:Sound, param4:BitmapData, param5:BitmapData) : void
      {
         var _loc6_:name_1820 = new name_1820();
         _loc6_.name_1821 = method_1266(param4);
         _loc6_.name_1762 = method_1049(param5,1000,170);
         _loc6_.shotSound = param3;
         _loc6_.explosionSound = param2;
         param1.method_12(ThunderSFXModel,_loc6_);
      }
      
      public function name_1249(param1:ClientObject, param2:Vector3, param3:Object3D) : name_1497
      {
         var _loc4_:name_1820 = this.method_1264(param1);
         var _loc5_:ThunderShotEffect = ThunderShotEffect(var_138.objectPool.getObject(ThunderShotEffect));
         _loc5_.init(param3,param2,_loc4_.name_1821);
         var _loc6_:Sound3D = Sound3D.create(_loc4_.shotSound,name_89.name_191,name_89.name_229,name_89.name_250,0.7);
         var_515.name_943(param3.x,param3.y,param3.z,param3.rotationX,param3.rotationY,param3.rotationZ);
         var_515.name_890(param2,name_1421);
         var _loc7_:Sound3DEffect = Sound3DEffect.create(var_138.objectPool,null,name_1421,_loc6_);
         this.method_1297(param2,param3 as Mesh,param1);
         return new name_1497(_loc5_,_loc7_);
      }
      
      public function method_1297(param1:Vector3, param2:Object3D, param3:ClientObject) : void
      {
         var _loc4_:name_1096 = name_1096(var_138.objectPool.getObject(name_1096));
         var _loc5_:name_1716 = name_1716(var_138.objectPool.getObject(name_1716));
         _loc5_.init(param2,param1);
         _loc4_.init(_loc5_,LightDataManager.name_1250(param3.id));
         this.var_421.name_217(_loc4_);
      }
      
      public function method_502(param1:ClientObject, param2:Vector3) : name_1497
      {
         var _loc3_:name_1820 = this.method_1264(param1);
         var _loc4_:ObjectPool = this.var_421.getObjectPool();
         var _loc5_:name_1071 = name_1071(_loc4_.getObject(name_1071));
         _loc5_.init(param2,110);
         var _loc6_:name_1070 = name_1070(var_138.objectPool.getObject(name_1070));
         _loc6_.init(1000,1000,_loc3_.name_1762,Math.random() * 2 * Math.PI,_loc5_);
         var _loc7_:Sound3D = Sound3D.create(_loc3_.explosionSound,name_89.name_191,name_89.name_229,name_89.name_250,0.7);
         var _loc8_:Sound3DEffect = Sound3DEffect.create(var_138.objectPool,null,param2,_loc7_);
         this.method_1267(param2,param1);
         return new name_1497(_loc6_,_loc8_);
      }
      
      private function method_1267(param1:Vector3, param2:ClientObject) : void
      {
         var _loc3_:name_1096 = name_1096(var_138.objectPool.getObject(name_1096));
         var _loc4_:name_1071 = name_1071(var_138.objectPool.getObject(name_1071));
         _loc4_.init(param1,110);
         _loc3_.init(_loc4_,LightDataManager.name_1098(param2.id));
         this.var_421.name_217(_loc3_);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:name_1820 = this.method_1264(param1);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1821);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1762.material);
      }
      
      private function method_1264(param1:ClientObject) : name_1820
      {
         return name_1820(param1.method_16(ThunderSFXModel));
      }
   }
}
