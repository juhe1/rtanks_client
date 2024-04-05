package package_151
{
   import alternativa.physics.collision.name_1083;
   import alternativa.physics.collision.name_1160;
   import alternativa.physics.name_660;
   import alternativa.tanks.models.weapon.shared.name_1709;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_42.name_73;
   import package_61.name_124;
   
   public class name_1794 implements name_1160
   {
       
      
      public var var_2513:Number;
      
      public var name_1628:int;
      
      public var var_2512:Number;
      
      public var name_1622:int;
      
      public var range:Number;
      
      public var name_247:name_1083;
      
      public var var_689:name_1709;
      
      private var var_397:name_124;
      
      private var var_2511:Number;
      
      private var var_2433:Number;
      
      private var const_1854:Vector3;
      
      private var var_1724:Vector3;
      
      private var dir:Vector3;
      
      private var matrix:Matrix3;
      
      private var var_2185:int;
      
      private var var_2183:name_660;
      
      public function name_1794(param1:Number, param2:int, param3:Number, param4:int, param5:Number, param6:name_1083, param7:name_1709)
      {
         this.var_397 = new name_124();
         this.const_1854 = new Vector3();
         this.var_1724 = new Vector3();
         this.dir = new Vector3();
         this.matrix = new Matrix3();
         super();
         this.init(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function init(param1:Number, param2:int, param3:Number, param4:int, param5:Number, param6:name_1083, param7:name_1709) : void
      {
         this.var_2513 = param1;
         this.name_1628 = param2;
         this.var_2512 = param3;
         this.name_1622 = param4;
         this.range = param5;
         this.name_247 = param6;
         this.var_689 = param7;
      }
      
      public function name_1453(param1:Vector3, param2:Vector3, param3:Vector3, param4:name_660, param5:Vector3) : Boolean
      {
         this.var_2183 = param4;
         this.var_2433 = 0;
         this.var_2511 = this.range + 1;
         this.method_2502(param1,param2,0,param5);
         this.method_2466(param1,param2,param3,this.var_2513 / this.name_1628,this.name_1628,param5);
         this.method_2466(param1,param2,param3,-this.var_2512 / this.name_1622,this.name_1622,param5);
         this.var_2183 = null;
         return this.var_2511 < this.range + 1;
      }
      
      public function considerBody(param1:name_660) : Boolean
      {
         return this.var_2183 != param1 || this.var_2185 > 0;
      }
      
      private function method_2502(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : void
      {
         var _loc7_:name_660 = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Vector3 = null;
         this.var_2185 = 0;
         var _loc5_:Number = this.range;
         var _loc6_:int = name_73.WEAPON;
         this.const_1854.vCopy(param1);
         this.var_1724.vCopy(param2);
         while(_loc5_ > 0)
         {
            if(!this.name_247.raycast(this.const_1854,this.var_1724,_loc6_,_loc5_,this,this.var_397))
            {
               return;
            }
            _loc5_ -= this.var_397.t;
            if(_loc5_ < 0)
            {
               _loc5_ = 0;
            }
            _loc7_ = this.var_397.var_81.name_787;
            if(_loc7_.tank != null && _loc7_ != this.var_2183)
            {
               _loc8_ = this.range - _loc5_;
               _loc9_ = Number(this.var_689.method_960(_loc7_,_loc8_,param3));
               if(_loc9_ > this.var_2433)
               {
                  this.var_2433 = _loc9_;
                  this.var_2511 = _loc8_;
                  param4.vCopy(param2);
               }
               return;
            }
            ++this.var_2185;
            _loc10_ = this.var_397.normal;
            this.var_1724.vAddScaled(-2 * this.var_1724.dot(_loc10_),_loc10_);
            this.const_1854.vCopy(this.var_397.position).vAddScaled(0.1,_loc10_);
         }
      }
      
      private function method_2466(param1:Vector3, param2:Vector3, param3:Vector3, param4:Number, param5:int, param6:Vector3) : void
      {
         this.dir.vCopy(param2);
         this.matrix.name_1097(param3,param4);
         if(param4 < 0)
         {
            param4 = -param4;
         }
         var _loc7_:Number = param4;
         var _loc8_:int = 0;
         while(_loc8_ < param5)
         {
            this.dir.vTransformBy3(this.matrix);
            this.method_2502(param1,this.dir,_loc7_,param6);
            _loc8_++;
            _loc7_ += param4;
         }
      }
   }
}
