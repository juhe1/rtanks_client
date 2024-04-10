package package_168
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.tanks.models.battlefield.name_128;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.IWeaponController;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.models.weapon.shared.CommonTargetSystem;
   import alternativa.tanks.models.weapon.shared.name_1709;
   import alternativa.tanks.models.weapon.shared.name_653;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import package_1.Main;
   import package_161.IWeaponWeakeningModel;
   import package_167.name_1454;
   import package_278.name_1288;
   import package_362.class_83;
   import package_362.class_84;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_41.ItemProperty;
   import package_41.Vector3dData;
   import package_52.WeaponsManager;
   import package_7.name_32;
   import package_92.name_1188;
   import package_92.name_1451;
   import package_92.name_1699;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   use namespace alternativa3d;
   
   public class SmokyModel extends class_84 implements class_83, class_11, IWeaponController
   {
      
      public static var var_1050:Number = 0.5;
      
      private static const const_492:Class = name_1741;
      
      private static var var_1001:TextureMaterial;
       
      
      private var modelService:name_32;
      
      private var var_11:IBattleField;
      
      private var var_13:TankModel;
      
      private var var_728:name_1188;
      
      private var var_730:IWeaponWeakeningModel;
      
      private var name_106:TankData;
      
      private var var_733:name_1454;
      
      private var var_727:name_1451;
      
      private var targetSystem:CommonTargetSystem;
      
      private var hitInfo:name_1699;
      
      private var var_1016:name_911;
      
      private var var_1011:Boolean;
      
      private var nextReadyTime:name_1288;
      
      private var var_1003:Vector3;
      
      private var var_1005:Vector3;
      
      private var var_1017:Vector3;
      
      private var var_1004:Vector3;
      
      private var var_1007:Vector3;
      
      private var var_1006:Vector3;
      
      private var var_1012:Vector3;
      
      private var _hitPos3d:Vector3dData;
      
      private var var_1049:Vector3dData;
      
      private var var_689:name_1709;
      
      private var var_1023:Number = 100000;
      
      private var currTime:name_1288;
      
      public function SmokyModel()
      {
         this.hitInfo = new name_1699();
         this.var_1016 = name_911.getInstance();
         this.nextReadyTime = new name_1288("smoky_next_ready_time");
         this.var_1003 = new Vector3();
         this.var_1005 = new Vector3();
         this.var_1017 = new Vector3();
         this.var_1004 = new Vector3();
         this.var_1007 = new Vector3();
         this.var_1006 = new Vector3();
         this.var_1012 = new Vector3();
         this._hitPos3d = new Vector3dData(0,0,0);
         this.var_1049 = new Vector3dData(0,0,0);
         this.currTime = new name_1288("smoky_curr_time");
         super();
         _interfaces.push(IModel,class_83,class_11,IWeaponController);
      }
      
      public function name_1436() : ItemProperty
      {
         return ItemProperty.MECH_RESISTANCE;
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         if(this.modelService != null)
         {
            return;
         }
         this.modelService = name_32(Main.osgi.getService(name_32));
         this.var_11 = Main.osgi.getService(IBattleField) as IBattleField;
         this.var_13 = Main.osgi.getService(ITank) as TankModel;
         this.var_728 = Main.osgi.getService(name_1188) as name_1188;
         this.var_730 = IWeaponWeakeningModel(this.modelService.getModelsByInterface(IWeaponWeakeningModel)[0]);
         if(var_1001 == null)
         {
            var_1001 = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry)).textureMaterialRegistry.getMaterial(null,new const_492().bitmapData,1);
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         IMaterialRegistry(Main.osgi.getService(IMaterialRegistry)).textureMaterialRegistry.disposeMaterial(var_1001);
         var_1001 = null;
      }
      
      public function fire(param1:ClientObject, param2:String, param3:Vector3dData, param4:String, param5:Number) : void
      {
         var _loc10_:ClientObject = null;
         var _loc11_:TankData = null;
         var _loc6_:ClientObject = BattleController.tankClientObjectByTankId[param2];
         if(_loc6_ == null)
         {
            return;
         }
         if(this.var_13.localUserData != null)
         {
            if(_loc6_.id == this.var_13.localUserData.user.id)
            {
               return;
            }
         }
         var _loc7_:TankData = this.var_13.getTankData(_loc6_);
         var _loc8_:name_1451 = this.var_728.name_1457(_loc7_.turret);
         this.var_1016.name_1702(_loc7_.tank.skin.name_200,_loc8_.muzzles[0],this.var_1007,this.var_1004);
         this.var_728.name_1249(_loc7_.turret,_loc7_.tank,0,this.var_1007,this.var_1004);
         if(param3 == null || isNaN(param3.x) || isNaN(param3.y))
         {
            return;
         }
         this.var_1003.x = param3.x;
         this.var_1003.y = param3.y;
         this.var_1003.z = param3.z;
         if(param4 != null)
         {
            _loc10_ = BattleController.tankClientObjectByTankId[param4];
            if(_loc10_ == null)
            {
               return;
            }
            _loc11_ = this.var_13.getTankData(_loc10_);
            if(_loc11_ == null || _loc11_.tank == null)
            {
               return;
            }
            this.var_728.method_502(_loc7_.turret,this.var_11.getBattlefieldData().viewport.camera,true,this.var_1003,this.var_1004,_loc11_,param5);
            this.var_11.method_144(_loc11_,this.var_1004,param5 * _loc8_.name_1498);
         }
         else
         {
            this.var_728.method_502(_loc7_.turret,this.var_11.getBattlefieldData().viewport.camera,false,param3.toVector3(),this.var_1004,null,param5 * _loc8_.name_1498);
            this.var_11.addDecal(param3.toVector3(),this.var_1006,250,var_1001);
         }
      }
      
      public function name_125(param1:TankData) : void
      {
         this.objectLoaded(null);
         this.name_106 = param1;
         this.var_733 = WeaponsManager.var_495[param1.turret.id];
         this.var_727 = this.var_728.name_1457(param1.turret);
         this.var_689 = name_653.create(this.name_106,this.var_733,this.var_11,this.var_730,this.modelService);
         this.targetSystem = new CommonTargetSystem(this.var_1023,this.var_733.name_1614.value,this.var_733.name_1628.value,this.var_733.name_1618.value,this.var_733.name_1622.value,this.var_11.getBattlefieldData().name_247,this.var_689);
         this.reset();
      }
      
      public function method_1000() : void
      {
         this.name_106 = null;
         this.var_733 = null;
         this.var_727 = null;
         this.targetSystem = null;
         this.var_689 = null;
      }
      
      public function update(param1:int, param2:int) : Number
      {
         var _loc7_:Number = NaN;
         var _loc8_:* = undefined;
         var _loc9_:TankData = null;
         var _loc10_:Vector3 = null;
         this.currTime.value = param1;
         if(!this.var_1011 || this.currTime.value < this.nextReadyTime.value)
         {
            if(this.currTime.value < this.nextReadyTime.value)
            {
               return 1 + (this.currTime.value - this.nextReadyTime.value) / this.var_733.reloadMsec.value;
            }
            return 1;
         }
         this.nextReadyTime.value = this.currTime.value + this.var_733.reloadMsec.value;
         this.var_1016.method_797(this.name_106.tank.skin.name_200,this.var_727.muzzles[this.var_727.currBarrel],this.var_1007,this.var_1006,this.var_1012,this.var_1004);
         this.var_728.name_1249(this.name_106.turret,this.name_106.tank,this.var_727.currBarrel,this.var_1007,this.var_1004);
         var _loc3_:name_128 = this.var_11.getBattlefieldData();
         var _loc4_:TankData = null;
         var _loc5_:Vector3dData = null;
         var _loc6_:Number = 0;
         if(this.targetSystem.name_670(this.var_1006,this.var_1004,this.var_1012,this.name_106.tank,this.hitInfo))
         {
            _loc6_ = this.hitInfo.position.distanceTo(this.name_106.tank.state.position);
            _loc5_ = this._hitPos3d;
            _loc5_.x = this.hitInfo.position.x;
            _loc5_.y = this.hitInfo.position.y;
            _loc5_.z = this.hitInfo.position.z;
            if(this.hitInfo.name_787 != null)
            {
               for(_loc8_ in _loc3_.name_263)
               {
                  _loc9_ = _loc8_;
                  if(this.hitInfo.name_787 == _loc9_.tank)
                  {
                     _loc4_ = _loc9_;
                     break;
                  }
               }
            }
            _loc7_ = Number(this.var_730.name_1458(this.name_106.turret,_loc6_));
            this.var_728.method_502(this.name_106.turret,_loc3_.viewport.camera,false,this.hitInfo.position,this.var_1004,_loc4_,_loc7_);
            if(_loc4_ != null)
            {
               this.var_1017.diff(this.hitInfo.position,_loc4_.tank.state.position);
               _loc4_.tank.name_225.name_1334(this.var_1017,this.var_1005);
               _loc5_.x = this.var_1005.x;
               _loc5_.y = this.var_1005.y;
               _loc5_.z = this.var_1005.z;
            }
         }
         if(_loc4_ != null)
         {
            _loc10_ = _loc4_.tank.state.position;
            this.var_1049.x = _loc10_.x;
            this.var_1049.y = _loc10_.y;
            this.var_1049.z = _loc10_.z;
            this.method_1217(this.name_106.turret,_loc6_,_loc5_,_loc4_.user.id,_loc4_.name_149,this.var_1049);
         }
         else
         {
            this.method_1217(this.name_106.turret,_loc6_,_loc5_,null,-1,null);
            if(_loc5_ != null)
            {
               this.var_11.addDecal(_loc5_.toVector3(),this.var_1006,250,var_1001);
            }
         }
         return 0;
      }
      
      private function method_1217(param1:ClientObject, param2:Number, param3:Vector3dData, param4:String, param5:int, param6:Vector3dData) : void
      {
         var _loc7_:Object = new Object();
         _loc7_.hitPos = param3;
         _loc7_.victimId = param4;
         _loc7_.victimInc = param5;
         _loc7_.tankPos = param6;
         _loc7_.reloadTime = this.var_733.reloadMsec.value;
         Network(Main.osgi.getService(INetworker)).send("battle;fire;" + JSON.stringify(_loc7_));
      }
      
      public function method_1002(param1:int) : void
      {
         this.var_1011 = true;
      }
      
      public function method_1001(param1:int, param2:Boolean) : void
      {
         this.var_1011 = false;
      }
      
      public function reset() : void
      {
         this.var_1011 = false;
         this.nextReadyTime.value = 0;
      }
      
      public function method_999(param1:TankData) : void
      {
      }
   }
}
