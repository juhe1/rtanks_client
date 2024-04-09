package package_155
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.sfx.*;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.services.objectpool.IObjectPoolService;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.name_1497;
   import alternativa.tanks.sfx.name_1718;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.media.Sound;
   import package_1.Main;
   import package_159.name_1594;
   import package_161.IWeaponWeakeningModel;
   import package_163.name_1595;
   import package_163.name_1729;
   import package_359.class_77;
   import package_359.class_78;
   import package_360.StreamWeaponGraphicEffect;
   import package_360.name_1715;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_52.WeaponsManager;
   import package_7.name_32;
   
   public class FlamethrowerSFXModel extends class_78 implements class_77, class_76, class_11
   {
      
      private static const const_1479:int = 3;
      
      private static const const_1480:Number = 1;
      
      private static var var_138:IObjectPoolService;
      
      private static var var_58:IMaterialRegistry;
       
      
      private var battlefield:IBattleField;
      
      private var var_1045:name_1714;
      
      private var var_1046:name_1714;
      
      public function FlamethrowerSFXModel()
      {
         super();
         _interfaces.push(IModel,class_77,class_76,class_11);
         var_138 = IObjectPoolService(Main.osgi.getService(IObjectPoolService));
         var_58 = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry));
      }
      
      public function initObject(param1:ClientObject, param2:BitmapData, param3:BitmapData, param4:Sound) : void
      {
         if(this.battlefield == null)
         {
            this.battlefield = IBattleField(Main.osgi.getService(IBattleField));
         }
         var _loc5_:name_1715 = new name_1715();
         _loc5_.name_1725 = this.method_1238(param2);
         _loc5_.name_1727 = this.method_1236(param3);
         _loc5_.name_1721 = param4;
         _loc5_.name_1724 = name_1713.name_1720;
         param1.method_12(FlamethrowerSFXModel,_loc5_);
      }
      
      private function method_1238(param1:BitmapData) : name_1072
      {
         var _loc2_:name_1072 = GraphicsUtils.name_1073(var_58.textureMaterialRegistry as TextureMaterialRegistry,param1,128,128,51);
         _loc2_.material.resolution = name_1713.name_1722 / 128;
         _loc2_.fps = 25;
         return _loc2_;
      }
      
      private function method_1236(param1:BitmapData) : name_1072
      {
         var _loc2_:name_1072 = GraphicsUtils.name_1073(var_58.textureMaterialRegistry as TextureMaterialRegistry,param1,256,51,5);
         _loc2_.material.resolution = name_1713.name_1719 / 256;
         _loc2_.fps = 15;
         return _loc2_;
      }
      
      public function method_1235(param1:TankData, param2:Vector3, param3:Object3D, param4:IWeaponWeakeningModel) : name_1497
      {
         var _loc5_:name_1595 = name_1595(Main.osgi.getService(name_1595));
         var _loc6_:name_1729 = _loc5_.name_1735(param1.turret);
         var _loc7_:name_1715 = this.getData(param1.turret);
         var _loc8_:StreamWeaponGraphicEffect = StreamWeaponGraphicEffect(var_138.objectPool.getObject(StreamWeaponGraphicEffect));
         _loc8_.init(param1.tank,_loc6_.range.value,_loc6_.coneAngle.value,name_1713.name_1720,param2,param3,_loc7_,this.battlefield.getBattlefieldData().name_247,name_1713.name_1728,name_1713.name_1719,name_1713.name_1733,name_1713.name_1722,name_1713.name_1732,name_1713.name_1731,false);
         this.method_1237(param2,param3,param1.turret);
         var _loc9_:Sound3D = Sound3D.create(_loc7_.name_1721,name_89.name_191,name_89.name_229,name_89.name_250,1);
         var _loc10_:name_1718 = name_1718(var_138.objectPool.getObject(name_1718));
         _loc10_.init(null,_loc9_,param3,0,4);
         return new name_1497(_loc8_,_loc10_,this.var_1045,this.var_1046);
      }
      
      public function method_1237(param1:Vector3, param2:Object3D, param3:ClientObject) : void
      {
         var _loc4_:name_1716 = null;
         var _loc5_:name_1717 = null;
         this.var_1045 = name_1714(var_138.objectPool.getObject(name_1714));
         _loc4_ = name_1716(var_138.objectPool.getObject(name_1716));
         _loc4_.init(param2,param1);
         this.var_1045.init(_loc4_,LightDataManager.name_1250(param3.id),LightDataManager.name_1723(param3.id));
         this.battlefield.name_217(this.var_1045);
         this.var_1046 = name_1714(var_138.objectPool.getObject(name_1714));
         _loc5_ = name_1717(var_138.objectPool.getObject(name_1717));
         _loc5_.init(param2,param1,this.battlefield.getBattlefieldData().name_247,1500);
         this.var_1046.init(_loc5_,LightDataManager.name_1250(param3.id),LightDataManager.name_1723(param3.id));
         this.battlefield.name_217(this.var_1046);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:name_32 = name_32(Main.osgi.getService(name_32));
         var _loc3_:name_1715 = this.getData(param1);
         var _loc4_:Vector.<name_1594> = WeaponsManager.colorTransform[param1.id];
         if(_loc4_ != null)
         {
            _loc3_.name_1734 = _loc4_;
            _loc3_.name_1726 = _loc4_;
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:name_1715 = this.getData(param1);
         var _loc3_:TextureMaterial = null;
         var _loc4_:Array = _loc2_.name_1730();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc3_ = _loc4_[_loc5_];
            var_58.textureMaterialRegistry.disposeMaterial(_loc3_);
            _loc5_++;
         }
      }
      
      private function getData(param1:ClientObject) : name_1715
      {
         return param1.method_16(FlamethrowerSFXModel) as name_1715;
      }
   }
}
