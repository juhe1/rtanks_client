package package_84
{
   import alternativa.physics.Body;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.weapon.healing.name_1413;
   import alternativa.tanks.models.weapon.shared.name_651;
   import alternativa.tanks.models.weapon.shared.name_653;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_320.class_38;
   
   public class name_300 implements class_38
   {
      
      public static var battleService:IBattleField;
       
      
      private const const_458:Number = 0.0001;
      
      private const const_457:Number = 50;
      
      private const const_456:Number = 100;
      
      private var var_149:name_653;
      
      private var var_689:name_651;
      
      private var var_690:Number;
      
      private var var_691:Number;
      
      private var target:Tank;
      
      public function name_300(param1:name_1413)
      {
         super();
         this.var_149 = battleService.method_154();
         this.var_689 = battleService.method_151();
         this.var_691 = param1.name_1414.value - 50;
         this.var_690 = param1.coneAngle.value;
      }
      
      public function name_758(param1:Tank) : void
      {
         this.target = param1;
      }
      
      public function method_962() : void
      {
         this.target = null;
      }
      
      public function method_960(param1:Tank, param2:Number, param3:Number) : Number
      {
         if(param1.tankData.health == 0)
         {
            return 0;
         }
         var _loc4_:Body = param1 as Body;
         var _loc5_:Number = this.var_149.method_960(_loc4_,param2,param3);
         return this.var_689.method_960(_loc4_) + _loc5_ * 0.0001 + this.method_961(param1);
      }
      
      private function method_961(param1:Tank) : Number
      {
         return param1 != this.target ? Number(0) : Number(100);
      }
   }
}
