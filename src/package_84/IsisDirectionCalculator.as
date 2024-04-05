package package_84
{
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapons.targeting.direction.name_2702;
   import alternativa.tanks.models.weapons.targeting.direction.name_2704;
   import package_37.Vector3;
   
   public class IsisDirectionCalculator implements name_2704
   {
       
      
      private const const_2024:int = 11;
      
      private var const_117:Vector3;
      
      private var var_2487:Vector3;
      
      private var angle:Number;
      
      private var screenSize:Number;
      
      private var const_1482:Vector3;
      
      public function IsisDirectionCalculator(param1:Number)
      {
         this.const_117 = new Vector3();
         this.var_2487 = new Vector3();
         super();
         this.angle = param1 / 2;
         this.screenSize = Math.tan(this.angle) * 2;
      }
      
      public function name_1754(param1:Vector3) : void
      {
         this.const_1482 = param1;
      }
      
      public function name_1756() : void
      {
         this.const_1482 = null;
      }
      
      public function name_2707(param1:name_903) : Vector.<name_2702>
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         this.const_117.cross2(param1.const_1614,param1.direction);
         var _loc5_:Vector.<name_2702> = new Vector.<name_2702>();
         var _loc6_:Number = this.screenSize / (11 - 1);
         var _loc7_:Number = -this.screenSize * 0.5;
         var _loc8_:int = 0;
         while(_loc8_ < 11)
         {
            _loc2_ = -this.screenSize * 0.5;
            _loc3_ = 0;
            while(_loc3_ < 11)
            {
               this.var_2487.copy(param1.direction);
               this.var_2487.addScaled(_loc7_,this.const_117);
               this.var_2487.addScaled(_loc2_,param1.const_1614);
               this.var_2487.normalize();
               _loc4_ = Math.acos(this.var_2487.vDot(param1.direction));
               if(_loc4_ <= this.angle)
               {
                  _loc5_.push(new name_2702(this.var_2487,_loc4_,Number.MAX_VALUE));
               }
               _loc2_ += _loc6_;
               _loc3_++;
            }
            _loc7_ += _loc6_;
            _loc8_++;
         }
         if(this.const_1482 != null)
         {
            _loc5_.push(new name_2702(this.const_1482,Math.acos(this.const_1482.vDot(param1.direction)),Number.MAX_VALUE,10));
         }
         return _loc5_;
      }
   }
}
