package alternativa.tanks.models.weapon.shotgun
{
   import alternativa.model.class_11;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.WeaponObject;
   import alternativa.tanks.models.weapon.IWeaponController;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.models.weapon.shared.name_653;
   import alternativa.tanks.vehicles.tanks.Tank;
   import alternativa.tanks.vehicles.tanks.class_20;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import package_13.Long;
   import package_161.IWeaponWeakeningModel;
   import package_161.WeaponWeakeningModel;
   import package_167.name_1454;
   import package_322.IShotModelBase;
   import package_323.name_1447;
   import package_37.Vector3;
   import package_39.Model;
   import package_4.ClientObject;
   import package_41.ItemProperty;
   import package_52.WeaponsManager;
   import package_63.name_162;
   import package_7.name_32;
   import package_70.name_273;
   import package_72.name_280;
   import package_73.name_1244;
   import package_73.name_282;
   import package_92.name_1188;
   import package_92.name_1451;
   import package_93.name_1243;
   import package_98.name_304;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.name_1378;
   
   public class ShotgunModel extends name_304 implements IShotModelBase, class_11, IWeaponController, name_273
   {
      
      protected static const var_557:name_903 = new name_903();
       
      
      private var modelService:name_32;
      
      private var var_11:IBattleField;
      
      private var var_13:TankModel;
      
      private var var_728:name_1188;
      
      private var var_730:IWeaponWeakeningModel;
      
      private var name_106:TankData;
      
      private var var_733:name_1454;
      
      private var var_727:name_1451;
      
      private var var_722:Vector3;
      
      private var effects:name_1244;
      
      private var targeting:ShotgunRicochetTargetingSystem;
      
      private var method_799:name_1247;
      
      private var var_725:Boolean;
      
      private var params:name_1447;
      
      private var var_723:int;
      
      private var var_724:int;
      
      private var var_731:int;
      
      private var var_726:Boolean;
      
      private var var_732:int;
      
      private var var_729:Boolean;
      
      public function ShotgunModel()
      {
         super();
         this.var_722 = new Vector3();
      }
      
      public function name_1436() : ItemProperty
      {
         return ItemProperty.SHOTGUN_RESISTANCE;
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         if(this.modelService != null)
         {
            return;
         }
         this.modelService = name_32(OSGi.getInstance().getService(name_32));
         this.var_11 = OSGi.getInstance().getService(IBattleField) as IBattleField;
         this.var_13 = OSGi.getInstance().getService(ITank) as TankModel;
         this.var_728 = OSGi.getInstance().getService(name_1188) as name_1188;
         this.var_730 = IWeaponWeakeningModel(this.modelService.getModelsByInterface(IWeaponWeakeningModel)[0]);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
      }
      
      private function method_1006(param1:ClientObject) : name_1447
      {
         return name_1447(param1.method_16(name_1447));
      }
      
      public function initObject(param1:ClientObject, param2:int, param3:int, param4:int, param5:Number, param6:Number, param7:int) : void
      {
         var _loc8_:name_1447 = new name_1447(param2,param3,param4);
         param1.method_12(name_1447,_loc8_);
         var _loc9_:name_162 = new name_162(param5,param6,param7);
         param1.method_12(name_162,_loc9_);
      }
      
      public function method_999(param1:TankData) : void
      {
      }
      
      public function reset() : void
      {
         this.var_725 = false;
         this.var_723 = this.params.magazineSize;
         this.var_724 = getTimer();
         this.var_726 = false;
      }
      
      public function name_125(param1:TankData) : void
      {
         this.params = this.method_1006(param1.turret);
         this.name_106 = param1;
         this.var_727 = this.var_728.name_1457(param1.turret);
         Model.object = param1.object;
         var _loc2_:name_29 = OSGi.getInstance().getService(name_29) as name_29;
         _loc2_.getModel(Long.getLong(1519945329,-715940911)).method_18(param1.turret.method_16(name_162));
         Model.method_38();
         this.var_11.method_147(name_653.create(param1,WeaponsManager.var_495[param1.turret.id],null,null,null));
         this.effects = name_282(param1.object.name_176(name_282)).getEffects();
         this.method_799 = new name_1247(param1.turret);
         this.targeting = name_280(param1.object.name_176(name_280)).createTargetingSystem();
      }
      
      public function method_1000() : void
      {
         this.params = null;
         this.name_106 = null;
         this.effects = null;
         this.method_799 = null;
         this.var_727 = null;
         this.targeting = null;
      }
      
      public function method_1002(param1:int) : void
      {
         this.var_725 = true;
      }
      
      public function method_1001(param1:int, param2:Boolean) : void
      {
         this.var_725 = false;
      }
      
      public function update(param1:int, param2:int) : Number
      {
         if(this.method_1005() && param1 >= this.var_724)
         {
            Model.object = this.name_106.object;
            this.shoot(param1);
            Model.method_38();
         }
         return this.getStatus();
      }
      
      private function shoot(param1:int) : void
      {
         var _loc2_:Vector.<name_1378> = null;
         var _loc3_:class_20 = this.name_106.tank;
         if(!this.var_729 && --this.var_723 == 0)
         {
            this.var_726 = true;
            this.var_723 = this.params.magazineSize;
            this.var_724 = param1 + this.params.magazineReloadTime;
            this.effects.name_1455(_loc3_.name_144(),this.params.magazineReloadTime);
         }
         else
         {
            this.var_726 = false;
            this.var_724 = param1 + this.params.reloadTime;
            if(!this.var_729)
            {
               this.effects.name_1450(_loc3_.name_144(),this.params.reloadTime);
            }
         }
         _loc3_.method_458(var_557);
         _loc3_.method_456().method_432(var_557.name_1422,var_557.direction,-this.var_727.kickback);
         _loc3_.method_459();
         if(BattleUtils.name_1452(_loc3_.method_456(),var_557))
         {
            _loc2_ = this.targeting.name_1453(var_557,_loc3_.method_456(),this.var_722);
            this.method_799.name_1449().method_909(param1,this.var_722,_loc2_);
         }
         else
         {
            this.var_722.copy(var_557.direction);
            this.method_799.name_1449().method_910(param1,this.var_722);
         }
         this.effects.name_1249(this.method_799,var_557,_loc3_,this.var_722);
         var _loc4_:Vector.<name_1243> = this.method_1004(_loc2_);
         this.method_1003(_loc4_,this.name_106);
      }
      
      private function method_1004(param1:Vector.<name_1378>) : Vector.<name_1243>
      {
         var _loc2_:Dictionary = new Dictionary();
         var _loc3_:Vector.<name_1243> = new Vector.<name_1243>();
         var _loc4_:name_1378 = null;
         var _loc5_:name_1243 = null;
         for each(_loc4_ in param1)
         {
            if(_loc2_[_loc4_.target] == null)
            {
               _loc5_ = new name_1243(_loc4_.orientation,_loc4_.localHitPoint,1,_loc4_.target.tankData.object);
               _loc2_[_loc4_.target] = _loc5_;
               _loc3_.push(_loc5_);
            }
            else
            {
               ++name_1243(_loc2_[_loc4_.target]).numberHits;
            }
         }
         return _loc3_;
      }
      
      private function method_1003(param1:Vector.<name_1243>, param2:TankData) : void
      {
         var _loc3_:name_1243 = null;
         var _loc4_:ITank = null;
         var _loc5_:Tank = null;
         var _loc6_:Vector3 = null;
         var _loc7_:Number = NaN;
         var _loc8_:WeaponObject = null;
         var _loc9_:Number = 0;
         var _loc10_:WeaponWeakeningModel = null;
         for each(_loc3_ in param1)
         {
            _loc4_ = ITank(_loc3_.target.name_176(ITank));
            _loc5_ = _loc4_.getTank();
            _loc6_ = BattleUtils.getVector3(_loc3_.localHitPoint);
            BattleUtils.localToGlobal(_loc5_.method_456(),_loc6_);
            _loc8_ = new WeaponObject(param2.user);
            _loc9_ = _loc8_.commonData().impactForce;
            _loc10_ = _loc8_.name_1456();
            _loc7_ = _loc10_.name_1458(param2.turret,_loc6_.distanceTo(var_557.name_1422));
            _loc5_.method_496(_loc6_,BattleUtils.getVector3(_loc3_.direction),_loc9_ * _loc7_ * _loc3_.numberHits);
         }
      }
      
      private function getStatus() : Number
      {
         if(this.var_726)
         {
            return 1 - (this.var_724 - getTimer()) / this.params.magazineReloadTime;
         }
         return this.var_723 / Number(this.params.magazineSize);
      }
      
      private function method_1005() : Boolean
      {
         return this.var_725;
      }
      
      public function method_796(param1:name_70, param2:Vector3, param3:Vector.<name_1243>) : void
      {
         var _loc4_:ITank = ITank(param1.name_176(ITank));
         var _loc5_:Tank = _loc4_.getTank();
         this.method_797(_loc5_);
         this.method_1003(param3,_loc5_.tankData);
      }
      
      private function method_797(param1:Tank) : void
      {
         name_911.getInstance().name_920(param1.name_144(),param1.method_463(),var_557);
      }
   }
}
