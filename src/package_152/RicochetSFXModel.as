package package_152
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.media.Sound;
   import package_1.Main;
   import package_151.RicochetShot;
   import package_159.BCSHModel;
   import package_159.name_1594;
   import package_159.name_1737;
   import package_371.BCSHFilter;
   import package_375.class_111;
   import package_375.class_112;
   import package_4.ClientObject;
   import package_52.WeaponsManager;
   import package_7.name_32;
   
   public class RicochetSFXModel extends class_112 implements class_111, class_11, name_1795
   {
      
      private static var var_58:IMaterialRegistry;
       
      
      public function RicochetSFXModel()
      {
         super();
         _interfaces.push(IModel,class_11,name_1795);
         var_58 = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry));
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
      
      private static function method_1296(param1:BitmapData, param2:BitmapFilter) : name_1072
      {
         return name_1073(param1,RicochetShot.name_1817,param2,128,10,13);
      }
      
      private static function name_1073(param1:BitmapData, param2:Number, param3:BitmapFilter, param4:Number, param5:Number, param6:Number) : name_1072
      {
         var _loc7_:name_1072 = GraphicsUtils.name_1818(var_58.textureMaterialRegistry as TextureMaterialRegistry,param1,param3,param4,param4,param5);
         _loc7_.material.resolution = param2 / param4;
         _loc7_.fps = param6;
         return _loc7_;
      }
      
      private static function method_1049(param1:BitmapData, param2:BitmapFilter) : name_1072
      {
         return name_1073(param1,RicochetShot.name_1815,param2,205,20,30);
      }
      
      private static function method_1295(param1:BitmapData, param2:BitmapFilter) : name_1072
      {
         return name_1073(param1,RicochetShot.name_1815,param2,205,20,45);
      }
      
      private static function method_1266(param1:BitmapData) : TextureMaterial
      {
         var _loc2_:TextureMaterial = var_58.textureMaterialRegistry.getMaterial(null,param1,1);
         _loc2_.resolution = RicochetShot.name_1819 / param1.height;
         return _loc2_;
      }
      
      private static function method_1290(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc4_:TextureMaterial = null;
         var _loc3_:BitmapData = GraphicsUtils.name_1786(param1,param2);
         _loc4_ = var_58.textureMaterialRegistry.getMaterial(null,_loc3_,1);
         _loc4_.resolution = RicochetShot.const_1492 / param1.height;
         return _loc4_;
      }
      
      public function initObject(param1:ClientObject, param2:Sound, param3:Sound, param4:Sound, param5:BitmapData, param6:BitmapData, param7:BitmapData, param8:BitmapData) : void
      {
         var _loc9_:name_1793 = new name_1793();
         _loc9_.name_1813 = method_1296(param7,method_1276(param1.id,"shot"));
         _loc9_.name_1762 = method_1049(param5,method_1276(param1.id,"expl"));
         _loc9_.name_1814 = method_1295(param5,method_1276(param1.id,"expl"));
         _loc9_.name_1761 = method_1266(param6);
         _loc9_.name_1816 = method_1290(param8,method_1276(param1.id,"trail"));
         _loc9_.shotSound = param4;
         _loc9_.ricochetSound = param3;
         _loc9_.explosionSound = param2;
         param1.method_12(name_1793,_loc9_);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:name_1793 = null;
         var _loc3_:Vector.<name_1594> = null;
         var _loc4_:name_1594 = null;
         var _loc5_:name_32 = name_32(Main.osgi.getService(name_32));
         var _loc6_:name_1737 = name_1737(_loc5_.method_260(param1,name_1737));
         if(_loc6_ != null)
         {
            _loc2_ = this.method_1264(param1);
            _loc3_ = _loc6_.name_1738(param1);
            if(_loc3_.length > 0)
            {
               _loc4_ = _loc3_[0];
            }
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:name_1793 = this.method_1264(param1);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1762.material);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1814.material);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1813.material);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1761);
         var_58.textureMaterialRegistry.disposeMaterial(_loc2_.name_1816);
      }
      
      public function method_1264(param1:ClientObject) : name_1793
      {
         return name_1793(param1.method_16(name_1793));
      }
   }
}
