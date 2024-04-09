package package_403
{
   import alternativa.physics.BodyContact;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.Body;
   import package_37.Vector3;
   
   public class ContactIsland
   {
      
      private static const pool:Vector.<ContactIsland> = new Vector.<ContactIsland>();
      
      private static var var_1982:int;
      
      private static const const_1625:Vector3 = new Vector3();
      
      private static const const_2209:int = 0;
      
      private static const const_2208:int = 1;
       
      
      public const const_1611:Vector.<BodyContact> = new Vector.<BodyContact>();
      
      private var name_678:PhysicsScene;
      
      private const const_2205:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private const const_2204:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private var var_2823:Vector.<Body>;
      
      private var var_2824:Vector.<Body>;
      
      private const const_2206:Vector.<BodyContact> = new Vector.<BodyContact>();
      
      private const const_2207:ContactLevels = new ContactLevels();
      
      public function ContactIsland()
      {
         this.var_2823 = new Vector.<Body>();
         this.var_2824 = new Vector.<Body>();
         super();
      }
      
      public static function create() : ContactIsland
      {
         if(var_1982 == 0)
         {
            return new ContactIsland();
         }
         --var_1982;
         var _loc1_:ContactIsland = pool[var_1982];
         pool[var_1982] = null;
         return _loc1_;
      }
      
      public function dispose() : void
      {
         this.name_678 = null;
         this.const_1611.length = 0;
         this.const_2205.length = 0;
         this.const_2204.length = 0;
         this.var_2823.length = 0;
         this.var_2824.length = 0;
         this.const_2206.length = 0;
         this.const_2207.clear();
         var _loc1_:* = var_1982++;
         pool[_loc1_] = this;
      }
      
      public function init(param1:PhysicsScene) : void
      {
         var _loc2_:BodyContact = null;
         var _loc3_:Vector.<ShapeContact> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.name_678 = param1;
         var _loc6_:int = int(this.const_1611.length);
         var _loc7_:Vector.<ShapeContact> = this.const_2205;
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc2_ = this.const_1611[_loc8_];
            _loc3_ = _loc2_.const_368;
            _loc4_ = int(_loc3_.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc7_[_loc7_.length] = _loc3_[_loc5_];
               _loc5_++;
            }
            _loc8_++;
         }
      }
      
      public function name_2176(param1:int) : void
      {
         this.method_1855(param1);
      }
      
      public function name_2174(param1:int) : void
      {
         this.method_1861(param1);
      }
      
      private function method_1855(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.const_2205.length);
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            this.method_2646(this.const_2205);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.method_2650(this.const_2205[_loc2_],0);
               _loc2_++;
            }
            _loc4_++;
         }
      }
      
      private function method_1861(param1:int) : void
      {
         var _loc2_:Vector.<Body> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:ShapeContact = null;
         this.method_2653(param1);
         this.const_2207.init(this.const_1611);
         this.const_2207.name_2863(this.const_2206,this.var_2824);
         if(this.const_2206.length > 0)
         {
            this.method_2649(this.const_2206,this.const_2204);
            this.method_2647(param1,this.const_2204);
            this.method_2648(param1,this.const_2204);
            while(this.const_2207.name_2864())
            {
               _loc2_ = this.var_2823;
               this.var_2823 = this.var_2824;
               this.var_2824 = _loc2_;
               this.const_2206.length = 0;
               this.var_2824.length = 0;
               this.const_2207.name_2865(this.var_2823,this.const_2206,this.var_2824);
               this.method_2651(this.var_2823,false);
               this.const_2204.length = 0;
               this.method_2649(this.const_2206,this.const_2204);
               _loc3_ = int(this.const_2204.length);
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  _loc5_ = this.const_2204[_loc4_];
                  _loc5_.name_2173(this.name_678.var_1684,this.name_678.var_1679,this.name_678.var_1685,this.name_678.var_1676);
                  _loc4_++;
               }
               this.method_2647(param1,this.const_2204);
               this.method_2648(param1,this.const_2204);
               this.method_2651(this.var_2823,true);
            }
         }
         else
         {
            this.method_2649(this.const_1611,this.const_2204);
            this.method_2647(param1,this.const_2204);
            this.method_2648(param1,this.const_2204);
         }
      }
      
      private function method_2653(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.const_2205.length);
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            this.method_2646(this.const_2205);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.method_2650(this.const_2205[_loc2_],1);
               _loc2_++;
            }
            _loc4_++;
         }
      }
      
      private function method_2649(param1:Vector.<BodyContact>, param2:Vector.<ShapeContact>) : void
      {
         var _loc3_:BodyContact = null;
         var _loc4_:Vector.<ShapeContact> = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = int(param1.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc3_ = param1[_loc8_];
            _loc4_ = _loc3_.const_368;
            _loc5_ = int(_loc4_.length);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               param2[param2.length] = _loc4_[_loc6_];
               _loc6_++;
            }
            _loc8_++;
         }
      }
      
      private function method_2646(param1:Vector.<ShapeContact>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ShapeContact = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 1;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc5_ * Math.random();
            _loc3_ = param1[_loc2_];
            param1[_loc2_] = param1[_loc5_];
            param1[_loc5_] = _loc3_;
            _loc5_++;
         }
      }
      
      private function method_2647(param1:int, param2:Vector.<ShapeContact>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            this.method_2646(param2);
            _loc3_ = int(param2.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.method_2650(param2[_loc4_],1);
               _loc4_++;
            }
            _loc5_++;
         }
      }
      
      private function method_2648(param1:int, param2:Vector.<ShapeContact>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            this.method_2646(param2);
            _loc3_ = int(param2.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.method_2654(param2[_loc4_]);
               _loc4_++;
            }
            _loc5_++;
         }
      }
      
      private function method_2651(param1:Vector.<Body>, param2:Boolean) : void
      {
         var _loc3_:Body = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            _loc3_.var_317 = param2;
            _loc5_++;
         }
      }
      
      private function method_2650(param1:ShapeContact, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Vector3 = param1.normal;
         var _loc6_:Body = param1.shape1.name_787;
         var _loc7_:Body = param1.shape2.name_787;
         var _loc8_:Vector3 = const_1625;
         this.method_2652(param1,_loc8_);
         var _loc9_:Number = _loc8_.x * _loc5_.x + _loc8_.y * _loc5_.y + _loc8_.z * _loc5_.z;
         if(param2 == 1)
         {
            _loc3_ = 0;
            if(_loc9_ < 0)
            {
               param1.var_1988 = false;
            }
            else if(param1.var_1988)
            {
               return;
            }
         }
         else
         {
            param1.var_1988 = true;
            _loc3_ = param1.var_1984;
         }
         var _loc10_:Number = _loc8_.dot(param1.tangent1);
         var _loc11_:Number = _loc8_.dot(param1.tangent2);
         var _loc12_:Number = param1.tangentImpulse1 - _loc10_ / param1.tangentSpeedDelta1;
         var _loc13_:Number = param1.tangentImpulse2 - _loc11_ / param1.tangentSpeedDelta2;
         var _loc14_:Number = _loc12_ * _loc12_ + _loc13_ * _loc13_;
         var _loc15_:Number = param1.var_1688 * param1.var_1987;
         if(_loc14_ > _loc15_ * _loc15_)
         {
            _loc4_ = Math.sqrt(_loc14_);
            _loc12_ *= _loc15_ / _loc4_;
            _loc13_ *= _loc15_ / _loc4_;
         }
         var _loc16_:Number = _loc12_ - param1.tangentImpulse1;
         var _loc17_:Number = _loc13_ - param1.tangentImpulse2;
         param1.tangentImpulse1 = _loc12_;
         param1.tangentImpulse2 = _loc13_;
         if(_loc6_.var_317)
         {
            _loc6_.method_430(param1.r1,param1.tangent1,_loc16_);
            _loc6_.method_430(param1.r1,param1.tangent2,_loc17_);
         }
         if(_loc7_.var_317)
         {
            _loc7_.method_430(param1.r2,param1.tangent1,-_loc16_);
            _loc7_.method_430(param1.r2,param1.tangent2,-_loc17_);
         }
         this.method_2652(param1,_loc8_);
         _loc9_ = _loc8_.x * _loc5_.x + _loc8_.y * _loc5_.y + _loc8_.z * _loc5_.z;
         var _loc18_:Number = _loc3_ - _loc9_;
         var _loc19_:Number = param1.var_1987 + _loc18_ / param1.var_1983;
         if(_loc19_ < 0)
         {
            _loc19_ = 0;
         }
         var _loc20_:Number = _loc19_ - param1.var_1987;
         param1.var_1987 = _loc19_;
         if(_loc6_.var_317)
         {
            _loc6_.method_430(param1.r1,param1.normal,_loc20_);
         }
         if(_loc7_.var_317)
         {
            _loc7_.method_430(param1.r2,param1.normal,-_loc20_);
         }
      }
      
      private function method_2652(param1:ShapeContact, param2:Vector3) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Vector3 = param1.shape1.name_787.state.name_181;
         var _loc6_:Vector3 = param1.r1;
         var _loc7_:Number = _loc5_.y * _loc6_.z - _loc5_.z * _loc6_.y;
         _loc3_ = _loc5_.z * _loc6_.x - _loc5_.x * _loc6_.z;
         _loc4_ = _loc5_.x * _loc6_.y - _loc5_.y * _loc6_.x;
         _loc6_ = param1.shape1.name_787.state.name_187;
         param2.x = _loc6_.x + _loc7_;
         param2.y = _loc6_.y + _loc3_;
         param2.z = _loc6_.z + _loc4_;
         _loc5_ = param1.shape2.name_787.state.name_181;
         _loc6_ = param1.r2;
         _loc7_ = _loc5_.y * _loc6_.z - _loc5_.z * _loc6_.y;
         _loc3_ = _loc5_.z * _loc6_.x - _loc5_.x * _loc6_.z;
         _loc4_ = _loc5_.x * _loc6_.y - _loc5_.y * _loc6_.x;
         _loc6_ = param1.shape2.name_787.state.name_187;
         param2.x -= _loc6_.x + _loc7_;
         param2.y -= _loc6_.y + _loc3_;
         param2.z -= _loc6_.z + _loc4_;
      }
      
      private function method_2654(param1:ShapeContact) : void
      {
         var _loc2_:Vector3 = const_1625;
         this.method_2655(param1,_loc2_);
         var _loc3_:Number = _loc2_.x * param1.normal.x + _loc2_.y * param1.normal.y + _loc2_.z * param1.normal.z;
         var _loc4_:Number = param1.var_1986 - _loc3_;
         var _loc5_:Number = _loc4_ / param1.var_1983;
         if(param1.shape1.name_787.var_317)
         {
            param1.shape1.name_787.method_455(param1.r1,param1.normal,_loc5_);
         }
         if(param1.shape2.name_787.var_317)
         {
            param1.shape2.name_787.method_455(param1.r2,param1.normal,-_loc5_);
         }
      }
      
      private function method_2655(param1:ShapeContact, param2:Vector3) : void
      {
         var _loc3_:Vector3 = param1.shape1.name_787.var_300;
         var _loc4_:Vector3 = param1.r1;
         var _loc5_:Number = _loc3_.y * _loc4_.z - _loc3_.z * _loc4_.y;
         var _loc6_:Number = _loc3_.z * _loc4_.x - _loc3_.x * _loc4_.z;
         var _loc7_:Number = _loc3_.x * _loc4_.y - _loc3_.y * _loc4_.x;
         _loc4_ = param1.shape1.name_787.var_298;
         param2.x = _loc4_.x + _loc5_;
         param2.y = _loc4_.y + _loc6_;
         param2.z = _loc4_.z + _loc7_;
         _loc3_ = param1.shape2.name_787.var_300;
         _loc4_ = param1.r2;
         _loc5_ = _loc3_.y * _loc4_.z - _loc3_.z * _loc4_.y;
         _loc6_ = _loc3_.z * _loc4_.x - _loc3_.x * _loc4_.z;
         _loc7_ = _loc3_.x * _loc4_.y - _loc3_.y * _loc4_.x;
         _loc4_ = param1.shape2.name_787.var_298;
         param2.x -= _loc4_.x + _loc5_;
         param2.y -= _loc4_.y + _loc6_;
         param2.z -= _loc4_.z + _loc7_;
      }
   }
}
