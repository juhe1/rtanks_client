package alternativa.tanks.models.weapon.machinegun
{
   import package_278.name_1288;
   
   public class name_1708
   {
      
      private static var i:int = 0;
       
      
      public var energyCapacity:int;
      
      public var energyDischargeSpeed:int;
      
      public var energyRechargeSpeed:int;
      
      public var spinUpTime:Number;
      
      public var weaponTickMsec:name_1288;
      
      public var damageTickMsec:name_1288;
      
      public var spinDownTime:Number;
      
      public var weaponTurnDecelerationCoeff:Number;
      
      public var recoilForce:Number;
      
      public var impactForce:Number;
      
      public function name_1708(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number)
      {
         this.weaponTickMsec = new name_1288("WeaponTickMsec" + i,0);
         this.damageTickMsec = new name_1288("DamageTickMsec" + i,0);
         super();
         this.energyCapacity = param1;
         this.energyDischargeSpeed = param2;
         this.energyRechargeSpeed = param3;
         this.weaponTickMsec.value = param4;
         this.damageTickMsec.value = param5;
         this.spinUpTime = param6;
         this.spinDownTime = param7;
         this.weaponTurnDecelerationCoeff = param8;
         this.recoilForce = param9;
         this.impactForce = param10;
         ++i;
      }
   }
}
