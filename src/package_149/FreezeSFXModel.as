package package_149
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
   import alternativa.tanks.models.sfx.name_1714;
   import alternativa.tanks.models.sfx.name_1716;
   import alternativa.tanks.models.sfx.name_1717;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.services.objectpool.name_118;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.name_132;
   import alternativa.tanks.sfx.name_1718;
   import alternativa.tanks.sfx.name_657;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_159.name_1594;
   import package_159.name_1737;
   import package_24.LogLevel;
   import package_357.class_79;
   import package_357.class_80;
   import package_360.StreamWeaponGraphicEffect;
   import package_360.name_1715;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_7.name_11;
   import package_7.name_32;
   import package_92.name_1451;
   
   public class FreezeSFXModel extends class_80 implements class_79, class_11, name_1707
   {
      
      private static const const_1479:Number = 2;
      
      private static const const_1480:Number = 1;
      
      private static var var_58:name_100;
      
      private static var var_138:name_118;
       
      
      private var battlefield:name_83;
      
      private var var_1048:class_70;
      
      private var name_694:Dictionary;
      
      private var var_1047:Dictionary;
      
      private var var_421:BattlefieldModel;
      
      private var var_1045:name_1714;
      
      private var var_1046:name_1714;
      
      public function FreezeSFXModel()
      {
         this.name_694 = new Dictionary();
         this.var_1047 = new Dictionary();
         this.var_421 = Main.osgi.name_6(name_83) as BattlefieldModel;
         super();
         var_365.push(name_66,class_11,name_1707);
         var_58 = name_100(Main.osgi.name_6(name_100));
         var_138 = name_118(Main.osgi.name_6(name_118));
      }
      
      public function initObject(param1:ClientObject, param2:BitmapData, param3:BitmapData, param4:Sound) : void
      {
         this.method_1223();
         var _loc5_:name_1715 = new name_1715();
         _loc5_.name_1725 = this.method_1238(param2);
         _loc5_.name_1727 = this.method_1236(param3);
         _loc5_.name_1724 = 100;
         _loc5_.name_1721 = param4;
         param1.method_12(FreezeSFXModel,_loc5_);
      }
      
      private function method_1238(param1:BitmapData) : name_1072
      {
         var _loc2_:name_1072 = GraphicsUtils.name_1073(var_58.textureMaterialRegistry as TextureMaterialRegistry,param1,128,128,13);
         _loc2_.material.resolution = name_1736.name_1722 / 128;
         _loc2_.fps = 25;
         return _loc2_;
      }
      
      private function method_1236(param1:BitmapData) : name_1072
      {
         var _loc2_:name_1072 = GraphicsUtils.name_1073(var_58.textureMaterialRegistry as TextureMaterialRegistry,param1,256,150,11);
         _loc2_.material.resolution = name_1736.name_1719 / 256;
         _loc2_.fps = 15;
         return _loc2_;
      }
      
      public function method_739(param1:TankData, param2:name_1451) : void
      {
         var _loc3_:String = null;
         var _loc4_:Sound3D = null;
         var _loc5_:name_1718 = null;
         var _loc6_:name_1715 = this.method_1239(param1.turret);
         if(_loc6_ == null)
         {
            _loc3_ = "SFX data not found";
            name_11.log(LogLevel.name_79,_loc3_);
            throw new Error(_loc3_);
         }
         var _loc7_:name_1703 = this.var_1048.method_1220(param1.turret);
         if(_loc7_ == null)
         {
            _loc3_ = "Freeze data not found";
            name_11.log(LogLevel.name_79,_loc3_);
            throw new Error(_loc3_);
         }
         var _loc8_:StreamWeaponGraphicEffect = StreamWeaponGraphicEffect(var_138.objectPool.getObject(StreamWeaponGraphicEffect));
         _loc8_.init(param1.tank,_loc7_.damageAreaRange,_loc7_.damageAreaConeAngle,name_1736.name_1720,param2.muzzles[0],param1.tank.skin.name_200,_loc6_,this.battlefield.getBattlefieldData().name_247,name_1736.name_1728,name_1736.name_1719,name_1736.name_1733,name_1736.name_1722,name_1736.name_1740,name_1736.name_1739,false);
         this.method_1237(param2.muzzles[0],param1.tank.skin.name_200,param1.turret);
         this.battlefield.name_217(_loc8_);
         this.name_694[param1] = _loc8_;
         if(_loc6_.name_1721 != null)
         {
            _loc4_ = Sound3D.create(_loc6_.name_1721,name_89.name_191,name_89.name_229,name_89.name_250,1);
            _loc5_ = name_1718(var_138.objectPool.getObject(name_1718));
            _loc5_.init(null,_loc4_,param1.tank.skin.name_200,0,1);
            this.battlefield.name_195(_loc5_);
            this.var_1047[param1] = _loc5_;
         }
      }
      
      public function method_1237(param1:Vector3, param2:Object3D, param3:ClientObject) : void
      {
         var _loc4_:name_1716 = null;
         var _loc5_:name_1717 = null;
         if(this.var_1045 == null)
         {
            this.var_1045 = name_1714(var_138.objectPool.getObject(name_1714));
            _loc4_ = name_1716(var_138.objectPool.getObject(name_1716));
            _loc4_.init(param2,param1);
            this.var_1045.init(_loc4_,LightDataManager.name_1250(param3.id),LightDataManager.name_1723(param3.id));
            this.var_421.name_217(this.var_1045);
         }
         if(this.var_1046 == null)
         {
            this.var_1046 = name_1714(var_138.objectPool.getObject(name_1714));
            _loc5_ = name_1717(var_138.objectPool.getObject(name_1717));
            _loc5_.init(param2,param1,this.var_421.var_117.name_247,1500);
            this.var_1046.init(_loc5_,LightDataManager.name_1250(param3.id),LightDataManager.name_1723(param3.id));
            this.var_421.name_217(this.var_1046);
         }
      }
      
      public function name_1706(param1:TankData) : void
      {
         var _loc2_:name_657 = this.name_694[param1];
         if(_loc2_ != null)
         {
            delete this.name_694[param1];
            _loc2_.kill();
            if(this.var_1045 != null)
            {
               this.var_1045.stop();
               this.var_1045 = null;
            }
            if(this.var_1046 != null)
            {
               this.var_1046.stop();
               this.var_1046 = null;
            }
         }
         var _loc3_:name_132 = this.var_1047[param1];
         if(_loc3_ != null)
         {
            delete this.var_1047[param1];
            _loc3_.kill();
         }
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:Vector.<name_1594> = null;
         var _loc3_:name_1715 = null;
         var _loc4_:name_32 = name_32(Main.osgi.name_6(name_32));
         var _loc5_:name_1737 = name_1737(_loc4_.method_260(param1,name_1737));
         if(_loc5_ != null)
         {
            _loc2_ = _loc5_.name_1738(param1);
            if(_loc2_ != null)
            {
               _loc3_ = this.method_1239(param1);
               _loc3_.name_1734 = _loc2_;
               _loc3_.name_1726 = _loc2_;
            }
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:TextureMaterial = null;
         var _loc3_:name_1715 = this.method_1239(param1);
         var _loc4_:Array = _loc3_.name_1730();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc5_];
            var_58.textureMaterialRegistry.disposeMaterial(_loc2_);
            _loc5_++;
         }
      }
      
      private function method_1223() : void
      {
         var _loc1_:name_32 = null;
         if(this.battlefield == null)
         {
            _loc1_ = name_32(Main.osgi.name_6(name_32));
            this.battlefield = name_83(Main.osgi.name_6(name_83));
            this.var_1048 = class_70(_loc1_.getModelsByInterface(class_70)[0]);
         }
      }
      
      private function method_1239(param1:ClientObject) : name_1715
      {
         return name_1715(param1.method_16(FreezeSFXModel));
      }
   }
}
