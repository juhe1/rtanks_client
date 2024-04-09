package package_166
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.sfx.name_691;
   import package_334.name_1610;
   import package_37.Vector3;
   
   public class name_1771 implements class_193
   {
       
      
      public var var_2499:TankData;
      
      private var name_1496:HealingGunGraphicEffect;
      
      private var name_1494:name_2711;
      
      private var battlefield:IBattleField;
      
      private var var_2500:Boolean;
      
      private var var_2501:Boolean;
      
      public function name_1771(param1:BattlefieldModel)
      {
         super();
         this.name_1496 = new HealingGunGraphicEffect(param1.getObjectPool());
         this.name_1494 = new name_2711(param1.getObjectPool());
      }
      
      public function init(param1:name_1610, param2:name_1772, param3:Object3D, param4:Vector3, param5:TankData) : void
      {
         this.name_1496.init(this,param1,param2,param3,param4,param5);
         this.name_1494.init(this,param1,param2,param3);
         this.var_2500 = false;
         this.var_2501 = false;
      }
      
      public function set mode(param1:name_1610) : void
      {
         this.name_1496.mode = param1;
         this.name_1494.mode = param1;
      }
      
      public function name_1781(param1:IBattleField) : void
      {
         this.battlefield = param1;
         param1.name_217(this.name_1496);
         param1.name_195(this.name_1494);
      }
      
      public function destroy() : void
      {
         this.name_1496.kill();
         this.name_1494.kill();
         this.var_2499 = null;
         this.battlefield = null;
      }
      
      public function name_1775(param1:TankData, param2:TankData, param3:Object3D, param4:Vector3, param5:name_1610) : void
      {
         var _loc6_:Boolean = true;
         this.var_2499 = param1;
         if(param1 != null)
         {
            _loc6_ = true;
         }
         this.name_1496.isLocal = param2.local;
         this.name_1496.name_1775(param3,param4,param2,param5,_loc6_);
      }
      
      public function method_2496(param1:name_691) : void
      {
         if(param1 == this.name_1496)
         {
            this.var_2500 = true;
         }
         if(param1 == this.name_1494)
         {
            this.var_2501 = true;
         }
         if(this.var_2500 && this.var_2501)
         {
         }
      }
      
      private function method_2497() : Boolean
      {
         return this.var_2499 != null && this.var_2499 == TankData.localTankData;
      }
   }
}
