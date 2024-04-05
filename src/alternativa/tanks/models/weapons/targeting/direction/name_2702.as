package alternativa.tanks.models.weapons.targeting.direction
{
   import mx.utils.StringUtil;
   import package_37.Vector3;
   
   public class name_2702
   {
       
      
      private var direction:Vector3;
      
      private var angle:Number;
      
      private var var_2433:Number;
      
      private var var_3320:Number;
      
      public function name_2702(param1:Vector3, param2:Number, param3:Number, param4:Number = 0)
      {
         super();
         this.direction = param1.clone();
         this.angle = param2;
         this.var_2433 = param3;
         this.var_3320 = param4;
      }
      
      public static function method_271(param1:name_2702, param2:name_2702) : Number
      {
         return param2.var_2433 - param1.var_2433;
      }
      
      public function name_1755() : Vector3
      {
         return this.direction;
      }
      
      public function name_2703() : Number
      {
         return this.angle;
      }
      
      public function name_2507() : Number
      {
         return this.var_2433;
      }
      
      public function name_2706() : Number
      {
         return this.var_3320;
      }
      
      public function toString() : String
      {
         return StringUtil.substitute("TargetingDirection[direction={0}, angle={1}, maxPriority={2}]",this.direction,this.angle.toFixed(2),this.var_2433.toFixed(0));
      }
   }
}
