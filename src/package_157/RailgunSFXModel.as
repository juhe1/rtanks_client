package package_157
{
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
   import alternativa.tanks.models.sfx.name_1808;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.services.objectpool.name_118;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_132;
   import alternativa.tanks.sfx.name_657;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.geom.Matrix;
   import flash.media.Sound;
   import package_1.Main;
   import package_159.BCSHModel;
   import package_159.name_1594;
   import package_159.name_1737;
   import package_37.Vector3;
   import package_371.BCSHFilter;
   import package_374.class_109;
   import package_374.class_110;
   import package_4.ClientObject;
   import package_52.WeaponsManager;
   import package_7.name_32;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class RailgunSFXModel extends class_109 implements class_110, name_1798, class_11
   {
      
      public static const const_1504:int = 300;
      
      public static const const_1498:Number = 200;
      
      public static const const_1501:Number = 30;
      
      private static const const_1492:Number = 25;
      
      private static const const_1502:Number = 0.5;
      
      private static const const_1495:Number = 1.5;
      
      private static const const_1500:Number = 20;
      
      private static const const_1503:int = 500;
      
      private static const const_1499:Number = 80;
      
      private static const const_1493:Number = 0.5;
      
      private static const const_1497:Number = 2;
      
      private static const const_1494:Number = 100;
      
      private static const const_1496:int = 2200;
      
      private static const const_1480:Number = 1;
      
      private static var var_138:name_118;
      
      private static var var_58:name_100;
       
      
      private var matrix:Matrix;
      
      private var battlefield:BattlefieldModel;
      
      private const const_1491:ChargingTextureRegistry = new ChargingTextureRegistry();
      
      public function RailgunSFXModel()
      {
         this.matrix = new Matrix();
         super();
         var_365.push(name_66,class_110,name_1798,class_11);
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
      
      private static function method_1290(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.name_1786(param1,param2);
         var _loc4_:TextureMaterial = var_58.textureMaterialRegistry.getMaterial(null,_loc3_,1);
         _loc4_.repeat = true;
         _loc4_.mipMapping = 0;
         return _loc4_;
      }
      
      public function initObject(param1:ClientObject, param2:ImageResource, param3:ImageResource, param4:ImageResource, param5:BitmapData, param6:BitmapData, param7:Sound) : void
      {
         var_58 = name_100(Main.osgi.name_6(name_100));
         var_138 = name_118(Main.osgi.name_6(name_118));
         this.battlefield = Main.osgi.name_6(name_83) as BattlefieldModel;
         var _loc8_:name_1805 = new name_1805();
         _loc8_.trailMaterial = method_1290(param5,method_1276(param1.id,"trail"));
         _loc8_.name_1810 = method_1290(param6,method_1276(param1.id,"trail"));
         _loc8_.name_1809 = this.method_1292(param2,param3,param4,method_1276(param1.id,"charge"));
         _loc8_.sound = param7;
         param1.method_12(RailgunSFXModel,_loc8_);
      }
      
      private function method_1292(param1:ImageResource, param2:ImageResource, param3:ImageResource, param4:BitmapFilter) : name_1072
      {
         var _loc5_:BitmapData = GraphicsUtils.name_1786(this.const_1491.method_670(param1,param2,param3),param4);
         var _loc6_:int = _loc5_.height;
         var _loc7_:name_1072 = GraphicsUtils.name_1073(var_58.textureMaterialRegistry as TextureMaterialRegistry,_loc5_,_loc6_,_loc6_);
         _loc7_.material.resolution = 300 / _loc6_;
         return _loc7_;
      }
      
      public function method_1239(param1:ClientObject) : name_1805
      {
         return name_1805(param1.method_16(RailgunSFXModel));
      }
      
      public function name_1799(param1:ClientObject, param2:Vector3, param3:Vector3) : name_657
      {
         var _loc4_:name_1805 = this.method_1239(param1);
         var _loc5_:name_1806 = null;
         var _loc6_:name_1807 = null;
         _loc5_ = name_1806(var_138.objectPool.getObject(name_1806));
         _loc5_.init(param2,param3,_loc4_.trailMaterial,25,0.5,1.5,20,500);
         _loc6_ = name_1807(var_138.objectPool.getObject(name_1807));
         _loc6_.init(param2,param3,_loc4_.name_1810,80,0.5,2,100,2200);
         this.battlefield.name_217(_loc6_);
         this.method_1291(param2,param1);
         this.method_1294(param1,param2,param3,param1);
         return _loc5_;
      }
      
      public function name_1800(param1:ClientObject, param2:ClientObject, param3:Vector3, param4:Object3D, param5:int) : name_657
      {
         var _loc6_:name_1805 = this.method_1239(param1);
         var _loc7_:ChargeEffect = ChargeEffect(this.battlefield.getObjectPool().getObject(ChargeEffect));
         _loc7_.init(param2,300,300,_loc6_.name_1809,param3,param4,0,1000 * _loc6_.name_1809.name_1811.length / param5);
         this.method_1293(param3,param4,param5,param1);
         return _loc7_;
      }
      
      public function method_1293(param1:Vector3, param2:Object3D, param3:int, param4:ClientObject) : void
      {
         var _loc5_:name_1096 = name_1096(var_138.objectPool.getObject(name_1096));
         var _loc6_:name_1716 = name_1716(var_138.objectPool.getObject(name_1716));
         _loc6_.init(param2,param1);
         _loc5_.name_1812(_loc6_,param3,LightDataManager.name_1250(param4.id));
         this.battlefield.name_217(_loc5_);
      }
      
      private function method_1294(param1:ClientObject, param2:Vector3, param3:Vector3, param4:ClientObject) : void
      {
         var _loc5_:name_1805 = this.method_1239(param1);
         var _loc6_:name_1071 = name_1071(var_138.objectPool.getObject(name_1071));
         var _loc7_:name_1071 = name_1071(var_138.objectPool.getObject(name_1071));
         _loc6_.init(param2,0);
         _loc7_.init(param3,0);
         var _loc8_:name_1808 = name_1808(var_138.objectPool.getObject(name_1808));
         _loc8_.init(_loc6_,_loc7_,LightDataManager.name_1723(param4.id));
         this.battlefield.name_217(_loc8_);
      }
      
      public function method_1291(param1:Vector3, param2:ClientObject) : void
      {
         var _loc3_:name_1096 = name_1096(var_138.objectPool.getObject(name_1096));
         var _loc4_:name_1071 = name_1071(var_138.objectPool.getObject(name_1071));
         _loc4_.init(param1,0);
         _loc3_.init(_loc4_,LightDataManager.name_1098(param2.id));
         this.battlefield.name_217(_loc3_);
      }
      
      public function name_1803(param1:ClientObject, param2:ClientObject, param3:Vector3) : name_132
      {
         var _loc4_:name_1805 = this.method_1239(param1);
         if(_loc4_.sound == null)
         {
            return null;
         }
         var _loc5_:Sound3D = Sound3D.create(_loc4_.sound,name_89.name_191,name_89.name_229,name_89.name_250,1);
         return Sound3DEffect.create(var_138.objectPool,param2,param3,_loc5_);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Vector.<name_1594> = null;
         var _loc3_:name_1594 = null;
         var _loc4_:name_1805 = this.method_1239(param1);
         var _loc5_:name_32 = name_32(Main.osgi.name_6(name_32));
         var _loc6_:name_1737 = name_1737(_loc5_.method_260(param1,name_1737));
         if(_loc6_ != null)
         {
            _loc2_ = _loc6_.name_1738(param1);
            if(_loc2_ != null && _loc2_.length > 0)
            {
               _loc3_ = _loc2_[0];
            }
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:name_1805 = name_1805(this.method_1239(param1));
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.trailMaterial);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1810);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1809.material);
      }
   }
}
