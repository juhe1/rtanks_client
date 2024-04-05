package alternativa.tanks.models.weapon.healing
{
   import package_278.name_1288;
   import package_278.name_905;
   
   public class name_1413
   {
       
      
      public var capacity:name_1288;
      
      public var chargeRate:name_1288;
      
      public var tickPeriod:name_1288;
      
      public var name_1414:name_905;
      
      public var coneAngle:name_905;
      
      public var dischargeDamageRate:name_905;
      
      public var dischargeHealingRate:name_905;
      
      public var dischargeIdleRate:name_905;
      
      public function name_1413()
      {
         this.capacity = new name_1288("capacity isida",0);
         this.chargeRate = new name_1288("chargeRate isida",0);
         this.tickPeriod = new name_1288("capacity isida",0);
         this.name_1414 = new name_905("maxRadius isida",0);
         this.coneAngle = new name_905("coneAngle isida",0);
         this.dischargeDamageRate = new name_905("dischargeDamageRate isida",0);
         this.dischargeHealingRate = new name_905("dischargeHealingRate isida",0);
         this.dischargeIdleRate = new name_905("dischargeIdleRate isida",0);
         super();
      }
   }
}
