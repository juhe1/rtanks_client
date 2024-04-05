package package_166
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.model.name_66;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.engine3d.name_1076;
   import alternativa.tanks.engine3d.name_1773;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.services.objectpool.name_118;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.media.Sound;
   import package_1.Main;
   import package_159.BCSHModel;
   import package_334.name_1610;
   import package_37.Vector3;
   import package_370.class_100;
   import package_370.class_102;
   import package_371.BCSHFilter;
   import package_4.ClientObject;
   import package_52.WeaponsManager;
   import package_7.name_32;
   import package_92.name_1188;
   import package_92.name_1451;
   
   public class HealingGunSFXModel extends class_102 implements class_100, class_101
   {
      
      private static const const_1479:Number = 1;
      
      private static var var_58:name_100;
      
      private static var var_138:name_118;
       
      
      private var battlefield:name_83;
      
      private var var_728:name_1188;
      
      public function HealingGunSFXModel()
      {
         super();
         var_365.push(name_66,class_100,class_101);
         name_1774.name_725();
         var_58 = name_100(Main.osgi.name_6(name_100));
         var_138 = name_118(Main.osgi.name_6(name_118));
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
      
      private static function method_1277(param1:BitmapData, param2:BitmapFilter) : TextureMaterial
      {
         var _loc3_:BitmapData = GraphicsUtils.name_1786(param1,param2);
         var _loc4_:TextureMaterial = var_58.textureMaterialRegistry.getMaterial(null,_loc3_,1);
         _loc4_.repeat = true;
         return _loc4_;
      }
      
      private static function method_1278(param1:Vector.<name_1773>) : Vector.<name_1773>
      {
         var _loc2_:Vector.<name_1773> = new Vector.<name_1773>();
         var _loc3_:int = param1.length - 1;
         while(_loc3_ >= 0)
         {
            _loc2_.push(param1[_loc3_]);
            _loc3_--;
         }
         return _loc2_;
      }
      
      public function initObject(param1:ClientObject, param2:Sound, param3:Sound, param4:Sound, param5:BitmapData, param6:BitmapData, param7:BitmapData, param8:BitmapData) : void
      {
         var _loc9_:name_32 = null;
         if(this.battlefield == null)
         {
            _loc9_ = name_32(Main.osgi.name_6(name_32));
            this.battlefield = name_83(Main.osgi.name_6(name_83));
            this.var_728 = name_1188(_loc9_.getModelsByInterface(name_1188)[0]);
         }
         var _loc10_:name_1772 = new name_1772();
         var _loc11_:TextureMaterial = method_1277(param5,method_1276(param1.id,"hs"));
         var _loc12_:TextureMaterial = method_1277(param7,method_1276(param1.id,"hss"));
         var _loc13_:TextureMaterial = method_1277(param6,method_1276(param1.id,"ds"));
         var _loc14_:TextureMaterial = method_1277(param8,method_1276(param1.id,"dss"));
         var _loc15_:Vector.<name_1773> = GraphicsUtils.name_1779(_loc11_.texture,128,128,32);
         var _loc16_:Vector.<name_1773> = method_1278(_loc15_);
         _loc10_.name_1788 = new name_1072(_loc11_,_loc15_,30);
         _loc10_.idleSound = param4;
         _loc10_.name_1783 = new name_1072(_loc11_,_loc15_,30);
         _loc10_.name_1778 = new name_1072(_loc11_,_loc16_,30);
         _loc10_.name_1777 = _loc12_;
         _loc10_.name_1785 = param3;
         _loc10_.name_1780 = new name_1072(_loc13_,_loc16_,30);
         _loc10_.name_1782 = new name_1072(_loc13_,_loc15_,30);
         _loc10_.name_1784 = _loc14_;
         _loc10_.name_1787 = param2;
         param1.method_12(HealingGunSFXModel,_loc10_);
      }
      
      private function name_1073(param1:BitmapData, param2:int, param3:int = 30) : name_1072
      {
         var _loc4_:name_1072 = GraphicsUtils.name_1073(null,param1,param2,param2);
         _loc4_.fps = param3;
         return _loc4_;
      }
      
      private function getEffects(param1:ClientObject) : name_1771
      {
         return name_1771(param1.method_16(name_1771));
      }
      
      private function method_739(param1:ClientObject) : name_1771
      {
         var _loc2_:name_1771 = name_1771(param1.method_16(name_1771));
         if(_loc2_ == null)
         {
            _loc2_ = new name_1771(this.battlefield as BattlefieldModel);
            param1.method_12(name_1771,_loc2_);
         }
         return _loc2_;
      }
      
      public function name_1748(param1:TankData, param2:name_1610, param3:TankData, param4:Vector3 = null) : void
      {
         var _loc5_:name_1771 = null;
         if(param3 != null && !param3.enabled)
         {
            return;
         }
         var _loc6_:Vector3 = null;
         var _loc7_:ClientObject = param1.turret;
         var _loc8_:name_1772 = name_1772(_loc7_.method_16(HealingGunSFXModel));
         var _loc9_:name_1451 = this.var_728.name_1457(_loc7_);
         var _loc10_:Object3D = param1.tank.skin.name_144();
         var _loc11_:Vector3 = _loc9_.muzzles[0];
         var _loc12_:Object3D = param3 == null ? null : param3.tank.skin.name_123;
         if(param3 != null)
         {
            _loc6_ = new Vector3();
            _loc6_.copy(param4);
            _loc6_.vRemove(param3.tank.var_328);
         }
         _loc5_ = this.getEffects(param1.user);
         if(_loc5_ == null)
         {
            _loc5_ = this.method_739(param1.user);
            _loc5_.init(param2,_loc8_,_loc10_,_loc11_,param1);
            if(param3 != null)
            {
               _loc5_.name_1775(param3,param1,_loc12_,_loc6_,param2);
            }
            _loc5_.name_1781(this.battlefield);
         }
         else
         {
            _loc5_.mode = param2;
            _loc5_.name_1775(param3,param1,_loc12_,_loc6_,param2);
         }
      }
      
      public function name_1749(param1:TankData) : void
      {
         var _loc2_:name_1771 = this.getEffects(param1.user);
         if(_loc2_ != null)
         {
            if(Boolean(_loc2_))
            {
               _loc2_.destroy();
               param1.user.method_19(name_1771);
            }
         }
      }
      
      public function name_1758(param1:TankData) : void
      {
         var _loc2_:name_1771 = this.getEffects(param1.user);
         if(_loc2_ != null)
         {
            _loc2_.destroy();
            param1.user.method_19(name_1771);
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:TextureMaterial = null;
         var _loc3_:name_1772 = name_1772(param1.method_16(HealingGunSFXModel));
         var _loc4_:Array = _loc3_.name_1730();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc5_];
            var_58.textureMaterialRegistry.disposeMaterial(_loc2_);
            _loc5_++;
         }
      }
      
      private function method_1279(param1:BitmapData) : Vector.<Material>
      {
         return var_58.method_499.name_1296(name_1076.name_1079,param1,100,1,false,true).materials;
      }
      
      private function method_1280(param1:BitmapData) : Vector.<Material>
      {
         return var_58.method_499.name_1296(name_1076.name_1079,param1,param1.height,1).materials;
      }
   }
}
