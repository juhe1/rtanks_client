package package_149
{
   import package_278.name_1288;
   
   public class name_1703
   {
      
      private static var i:int = 0;
       
      
      public var damageAreaConeAngle:Number;
      
      public var damageAreaRange:Number;
      
      public var energyCapacity:int;
      
      public var energyDischargeSpeed:int;
      
      public var energyRechargeSpeed:int;
      
      public var weaponTickMsec:name_1288;
      
      public function name_1703(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:int)
      {
         this.weaponTickMsec = new name_1288("WeaponTickMsec" + i,0);
         super();
         this.damageAreaConeAngle = param1;
         this.damageAreaRange = param2;
         this.energyCapacity = param3;
         this.energyDischargeSpeed = param4;
         this.energyRechargeSpeed = param5;
         this.weaponTickMsec.value = param6;
         ++i;
      }
   }
}
