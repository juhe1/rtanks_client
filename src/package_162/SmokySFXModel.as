package package_162
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.model.IModel;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.models.sfx.name_1096;
   import alternativa.tanks.models.sfx.name_1716;
   import alternativa.tanks.models.sfx.shoot.name_1187;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.services.objectpool.IObjectPoolService;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_1070;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_1497;
   import alternativa.tanks.sfx.name_1760;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.media.Sound;
   import package_1.Main;
   import package_367.class_93;
   import package_367.class_94;
   import package_37.Vector3;
   import package_4.ClientObject;
   
   public class SmokySFXModel extends class_94 implements class_93, name_1187
   {
      
      public static const name_1728:Number = 60;
      
      public static const name_1719:Number = 210;
      
      public static const const_1488:Number = 1;
      
      public static const const_1487:Number = 110;
      
      public static const const_1485:int = 100;
      
      public static const const_1486:int = 100;
      
      public static const const_498:int = 250;
      
      private static const const_1484:Number = 300;
      
      private static var var_138:IObjectPoolService;
      
      private static var var_58:IMaterialRegistry;
      
      private static var const_1479:Number = 2;
      
      private static var position:Vector3 = new Vector3();
      
      private static var var_421:BattlefieldModel;
       
      
      public function SmokySFXModel()
      {
         super();
         _interfaces.push(IModel,class_93,name_1187);
      }
      
      private static function method_1266(param1:BitmapData) : TextureMaterial
      {
         var _loc2_:TextureMaterial = var_58.textureMaterialRegistry.getMaterial(null,param1,1);
         _loc2_.resolution = 60 / param1.height;
         return _loc2_;
      }
      
      private static function method_1265(param1:BitmapData, param2:int, param3:Number) : name_1072
      {
         var _loc4_:name_1072 = GraphicsUtils.name_1073(var_58.textureMaterialRegistry as TextureMaterialRegistry,param1,param3,param3);
         _loc4_.material.resolution = param2 / param3;
         _loc4_.fps = 30;
         return _loc4_;
      }
      
      public function initObject(param1:ClientObject, param2:Sound, param3:Sound, param4:BitmapData, param5:BitmapData) : void
      {
         var_138 = IObjectPoolService(Main.osgi.getService(IObjectPoolService));
         var_58 = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry));
         var _loc6_:name_1759 = new name_1759();
         _loc6_.name_1761 = method_1266(param4);
         _loc6_.name_1762 = method_1265(param5,300,102);
         _loc6_.shotSound = param3;
         _loc6_.explosionSound = param2;
         _loc6_.var_396 = 300;
         param1.method_12(SmokySFXModel,_loc6_);
      }
      
      public function name_1249(param1:ClientObject, param2:Vector3, param3:Object3D, param4:Camera3D) : name_1497
      {
         var _loc5_:name_1759 = null;
         _loc5_ = this.method_1264(param1);
         var _loc6_:Sound3D = Sound3D.create(_loc5_.shotSound,name_89.name_191,name_89.name_229,name_89.name_250,1);
         position.x = param3.x;
         position.y = param3.y;
         position.z = param3.z;
         var _loc7_:Sound3DEffect = Sound3DEffect.create(var_138.objectPool,null,position,_loc6_);
         var _loc8_:name_1760 = name_1760(var_138.objectPool.getObject(name_1760));
         _loc8_.init(param2,param3,_loc5_.name_1761,100,60,210);
         this.method_1268(param2,param3 as Mesh,param1);
         return new name_1497(_loc8_,_loc7_);
      }
      
      public function method_502(param1:ClientObject, param2:Vector3, param3:Camera3D, param4:Number) : name_1497
      {
         var _loc5_:name_1759 = this.method_1264(param1);
         var _loc6_:Sound3D = Sound3D.create(_loc5_.explosionSound,name_89.name_191,name_89.name_229,name_89.name_250,1);
         var _loc7_:Sound3DEffect = Sound3DEffect.create(var_138.objectPool,null,param2,_loc6_,100);
         var _loc8_:name_1070 = name_1070(var_138.objectPool.getObject(name_1070));
         var _loc9_:name_1071 = name_1071(var_138.objectPool.getObject(name_1071));
         _loc9_.init(param2,110);
         this.method_1267(param2,param1);
         _loc8_.init(_loc5_.var_396,_loc5_.var_396,_loc5_.name_1762,0,_loc9_);
         return new name_1497(_loc8_,_loc7_);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:name_1759 = this.method_1264(param1);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1761);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1762.material);
      }
      
      private function method_1264(param1:ClientObject) : name_1759
      {
         return name_1759(param1.method_16(SmokySFXModel));
      }
      
      private function method_1268(param1:Vector3, param2:Mesh, param3:ClientObject) : void
      {
         var _loc4_:name_1096 = name_1096(var_138.objectPool.getObject(name_1096));
         var _loc5_:name_1716 = name_1716(var_138.objectPool.getObject(name_1716));
         _loc5_.init(param2,param1,0);
         _loc4_.init(_loc5_,LightDataManager.name_1250(param3.id));
         var_421 = Main.osgi.getService(IBattleField) as BattlefieldModel;
         var_421.name_217(_loc4_);
      }
      
      private function method_1267(param1:Vector3, param2:ClientObject) : void
      {
         var _loc3_:name_1096 = name_1096(var_138.objectPool.getObject(name_1096));
         var _loc4_:name_1071 = name_1071(var_138.objectPool.getObject(name_1071));
         _loc4_.init(param1,30);
         if(_loc4_ == null)
         {
            throw new ArgumentError("pos can not be null");
         }
         _loc3_.init(_loc4_,LightDataManager.name_1098(param2.id));
         var_421 = Main.osgi.getService(IBattleField) as BattlefieldModel;
         var_421.name_217(_loc3_);
      }
   }
}
