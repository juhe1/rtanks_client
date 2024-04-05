package alternativa.tanks.models.weapon.shotgun
{
   import mx.utils.StringUtil;
   import package_37.Vector3;
   
   public class name_2504
   {
       
      
      private var direction:Vector3;
      
      private var var_2433:Number;
      
      public function name_2504(param1:Vector3, param2:Number)
      {
         this.direction = new Vector3();
         super();
         this.init(param1,param2);
      }
      
      public function init(param1:Vector3, param2:Number) : void
      {
         this.direction.copy(param1);
         this.var_2433 = param2;
      }
      
      public function name_1755() : Vector3
      {
         return this.direction;
      }
      
      public function name_2507() : Number
      {
         return this.var_2433;
      }
      
      public function toString() : String
      {
         return StringUtil.substitute("TargetingDirection[direction={0}, maxPriority={1}]",this.direction,this.var_2433.toFixed(0));
      }
   }
}
