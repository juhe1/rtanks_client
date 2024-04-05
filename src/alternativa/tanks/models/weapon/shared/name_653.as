package alternativa.tanks.models.weapon.shared
{
   import alternativa.physics.name_660;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_161.name_1448;
   import package_167.name_1454;
   import package_47.BattleTeamType;
   import package_7.name_32;
   import package_79.class_36;
   
   public class name_653 implements name_1709
   {
      
      private static const var_1050:Number = 0.65;
      
      private static const const_1552:Number = 1000;
       
      
      private var name_106:TankData;
      
      private var ctfModel:class_36;
      
      private var var_691:Number;
      
      private var var_690:Number;
      
      public function name_653(param1:TankData, param2:class_36, param3:Number, param4:Number)
      {
         super();
         this.name_106 = param1;
         this.ctfModel = param2;
         this.var_691 = param3;
         this.var_690 = param4;
      }
      
      public static function create(param1:TankData, param2:name_1454, param3:name_83, param4:name_1448, param5:name_32) : name_653
      {
         var _loc6_:Number = NaN;
         if(param4 != null)
         {
            _loc6_ = Number(param4.method_1243(param1.turret));
         }
         else
         {
            _loc6_ = 10000;
         }
         var _loc7_:Number = param2.name_1614.value > param2.name_1618.value ? param2.name_1614.value : param2.name_1618.value;
         return new name_653(param1,null,_loc6_,_loc7_);
      }
      
      public function method_960(param1:name_660, param2:Number, param3:Number) : Number
      {
         var _loc4_:Tank = param1 as Tank;
         if(_loc4_ == null)
         {
            return 0;
         }
         if(_loc4_.tankData.health == 0)
         {
            return 0;
         }
         var _loc5_:BattleTeamType = _loc4_.tankData.teamType;
         if(_loc5_ == BattleTeamType.NONE)
         {
            return this.method_1617(param2,param3);
         }
         if(_loc5_ == this.name_106.teamType)
         {
            return 0;
         }
         var _loc6_:Number = this.method_1617(param2,param3);
         if(this.ctfModel != null && Boolean(this.ctfModel.method_804(_loc4_.tankData)))
         {
            _loc6_ += 1000;
         }
         return _loc6_;
      }
      
      private function method_1617(param1:Number, param2:Number) : Number
      {
         return 1000 - (0.65 * param1 / this.var_691 + (1 - 0.65) * Math.abs(param2) / this.var_690);
      }
   }
}
