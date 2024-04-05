package package_153
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.models.sfx.name_1096;
   import alternativa.tanks.models.sfx.name_1716;
   import alternativa.tanks.models.sfx.shoot.name_1187;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.services.objectpool.name_118;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_1070;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_1497;
   import alternativa.tanks.sfx.name_1760;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.tanks.utils.name_75;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.geom.ColorTransform;
   import flash.media.Sound;
   import package_1.Main;
   import package_159.BCSHModel;
   import package_159.name_1594;
   import package_159.name_1737;
   import package_37.Vector3;
   import package_371.BCSHFilter;
   import package_377.class_116;
   import package_377.class_117;
   import package_4.ClientObject;
   import package_52.WeaponsManager;
   import package_7.name_32;
   
   public class PlasmaSFXModel extends class_116 implements class_117, name_1187, class_115, class_11
   {
      
      public static const const_1505:int = 120;
      
      private static const const_1508:int = 50;
      
      public static const const_1507:Number = 250;
      
      public static const name_1815:Number = 300;
      
      public static const const_1487:Number = 110;
      
      public static const const_1506:Number = 500;
      
      private static var var_58:name_100;
      
      private static var var_138:name_118;
      
      private static var var_1085:Vector3 = new Vector3();
      
      private static var var_421:BattlefieldModel;
       
      
      public function PlasmaSFXModel()
      {
         super();
         var_365.push(name_66,class_117,name_1187,class_115,class_11);
         var_58 = name_100(Main.osgi.name_6(name_100));
         var_138 = name_118(Main.osgi.name_6(name_118));
         var_421 = Main.osgi.name_6(name_83) as BattlefieldModel;
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
      
      private static function method_1266(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.name_1786(param1,param2);
         var _loc4_:TextureMaterial = var_58.textureMaterialRegistry.getMaterial(null,_loc3_,1);
         _loc4_.resolution = 120 / param1.height;
         return _loc4_;
      }
      
      private static function method_1298(param1:BitmapData, param2:BitmapFilter) : name_1072
      {
         return name_1073(param1,250,param2,128);
      }
      
      private static function method_1049(param1:BitmapData, param2:BitmapFilter) : name_1072
      {
         return name_1073(param1,300,param2,256);
      }
      
      private static function name_1073(param1:BitmapData, param2:Number, param3:BitmapFilter, param4:Number) : name_1072
      {
         var _loc5_:name_1072 = GraphicsUtils.name_1818(var_58.textureMaterialRegistry as TextureMaterialRegistry,param1,param3,param4,param4,10);
         _loc5_.material.resolution = param2 / param4;
         _loc5_.fps = 25;
         return _loc5_;
      }
      
      public function initObject(param1:ClientObject, param2:Sound, param3:Sound, param4:BitmapData, param5:BitmapData, param6:BitmapData) : void
      {
         var _loc7_:name_1770 = new name_1770();
         _loc7_.name_1761 = method_1266(param6,method_1276(param1.id,"flash"));
         _loc7_.name_1813 = method_1298(param4,method_1276(param1.id,"shot"));
         _loc7_.name_1762 = method_1049(param5,method_1276(param1.id,"expl"));
         _loc7_.shotSound = param3;
         _loc7_.explosionSound = param2;
         param1.method_12(PlasmaSFXModel,_loc7_);
      }
      
      public function name_1249(param1:ClientObject, param2:Vector3, param3:Object3D, param4:Camera3D) : name_1497
      {
         var _loc5_:Sound3D = null;
         var _loc6_:name_1770 = this.name_1768(param1);
         var _loc7_:name_1760 = name_1760(var_138.objectPool.getObject(name_1760));
         _loc7_.init(param2,param3,_loc6_.name_1761,50,120,120);
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
         _loc4_.init(_loc5_,LightDataManager.name_1250(param3.id));
         var_421.name_217(_loc4_);
      }
      
      public function method_502(param1:ClientObject, param2:Vector3, param3:Camera3D, param4:Number) : name_1497
      {
         var _loc5_:name_1770 = this.name_1768(param1);
         var _loc6_:Number = 300 * (1 + param4) / 2;
         var _loc7_:name_1070 = name_1070(var_138.objectPool.getObject(name_1070));
         var _loc8_:name_1072 = _loc5_.name_1762;
         var _loc9_:name_1071 = name_1071(var_138.objectPool.getObject(name_1071));
         _loc9_.init(param2,110);
         _loc7_.init(_loc6_,_loc6_,_loc8_,name_75.PI2 * Math.random(),_loc9_);
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
      
      public function name_1768(param1:ClientObject) : name_1770
      {
         return name_1770(param1.method_16(PlasmaSFXModel));
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:name_1770 = null;
         var _loc3_:Vector.<name_1594> = null;
         var _loc4_:name_1594 = null;
         var _loc5_:name_32 = name_32(Main.osgi.name_6(name_32));
         var _loc6_:name_1737 = name_1737(_loc5_.method_260(param1,name_1737));
         if(_loc6_ != null)
         {
            _loc2_ = this.name_1768(param1);
            _loc3_ = _loc6_.name_1738(param1);
            _loc4_ = _loc3_[0];
            _loc2_.colorTransform = new ColorTransform(_loc4_.redMultiplier,_loc4_.greenMultiplier,_loc4_.blueMultiplier,_loc4_.alphaMultiplier,_loc4_.redOffset,_loc4_.greenOffset,_loc4_.blueOffset,_loc4_.alphaOffset);
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:name_1770 = this.name_1768(param1);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1761);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1813.material);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1762.material);
      }
   }
}
