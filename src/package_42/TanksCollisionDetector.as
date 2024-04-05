package package_42
{
   import alternativa.physics.BodyContact;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.CollisionKdTree;
   import alternativa.physics.collision.name_1083;
   import alternativa.physics.collision.name_1160;
   import alternativa.physics.collision.name_1161;
   import alternativa.physics.collision.name_1172;
   import alternativa.physics.collision.name_774;
   import alternativa.physics.name_660;
   import alternativa.physics.name_889;
   import alternativa.tanks.vehicles.tanks.Tank;
   import alternativa.tanks.vehicles.tanks.TankBody;
   import package_298.BoxBoxCollider;
   import package_298.BoxRectCollider;
   import package_298.BoxSphereCollider;
   import package_298.BoxTriangleCollider;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_61.name_124;
   import package_61.name_767;
   
   public class TanksCollisionDetector implements name_1083
   {
      
      private static const const_373:Number = 0.01;
       
      
      private const const_371:Object = {};
      
      private const const_372:name_124 = new name_124();
      
      private const const_367:name_1169 = new name_1169();
      
      private const const_369:Vector3 = new Vector3();
      
      private const const_366:Vector3 = new Vector3();
      
      private const const_370:name_124 = new name_124();
      
      private const const_365:name_767 = new name_767();
      
      private const const_368:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private var var_475:CollisionKdTree;
      
      private var threshold:Number = 0.0001;
      
      private var var_474:Vector.<TankBody>;
      
      private var var_476:name_660;
      
      public function TanksCollisionDetector()
      {
         this.var_475 = new CollisionKdTree();
         this.var_474 = new Vector.<TankBody>();
         super();
         this.method_700(name_774.name_1166,name_774.name_1166,new BoxBoxCollider(0.000001));
         this.method_700(name_774.name_1166,name_774.name_1180,new BoxRectCollider(0.000001));
         this.method_700(name_774.name_1166,name_774.name_1181,new BoxTriangleCollider(0.000001));
         this.method_700(name_774.name_1166,name_774.name_1179,new BoxSphereCollider());
         this.method_704();
      }
      
      private function method_700(param1:int, param2:int, param3:name_1172) : void
      {
         this.const_371[param1 | param2] = param3;
      }
      
      private function method_704() : void
      {
         this.var_476 = new name_660(1,new Matrix3(),10000000000);
         this.var_476.var_317 = false;
      }
      
      public function name_754(param1:Vector.<name_774>, param2:name_767 = null) : void
      {
         var _loc3_:name_774 = null;
         for each(_loc3_ in param1)
         {
            _loc3_.name_787 = this.var_476;
         }
         this.var_475.createTree(param1,param2);
      }
      
      public function method_709(param1:TankBody) : void
      {
         param1.name_1168 = false;
         this.var_474.push(param1);
      }
      
      public function method_711(param1:TankBody) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.var_474.indexOf(param1);
         if(_loc3_ > -1)
         {
            _loc2_ = this.var_474.length - 1;
            this.var_474[_loc3_] = this.var_474[_loc2_];
            this.var_474.length = _loc2_;
         }
      }
      
      public function method_697() : Vector.<TankBody>
      {
         return this.var_474;
      }
      
      public function method_696(param1:Vector.<BodyContact>) : void
      {
         var _loc2_:TankBody = null;
         var _loc3_:Tank = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(this.var_474.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = this.var_474[_loc6_];
            _loc2_.name_1175 = _loc2_.name_1168;
            _loc3_ = _loc2_.name_787.tank;
            _loc2_.name_1168 = _loc3_.name_180().name_1178();
            _loc2_.name_1171.length = 0;
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = this.var_474[_loc6_];
            _loc4_ = int(param1.length);
            this.method_706(_loc2_,param1);
            if(_loc4_ != param1.length)
            {
               _loc2_.name_1168 = true;
            }
            _loc4_ = int(param1.length);
            this.method_705(_loc2_,_loc6_ + 1,param1);
            _loc6_++;
         }
      }
      
      public function method_712(param1:name_774, param2:Vector.<ShapeContact>) : void
      {
         return this.method_699(this.var_475.name_1164,param1,param2);
      }
      
      private function method_706(param1:TankBody, param2:Vector.<BodyContact>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:BodyContact = null;
         if(!param1.name_787.var_319)
         {
            _loc3_ = int(param1.name_1174.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.method_699(this.var_475.name_1164,param1.name_1174[_loc4_],this.const_368);
               _loc4_++;
            }
            if(this.const_368.length > 0)
            {
               _loc5_ = BodyContact.create();
               _loc5_.body1 = param1.name_787;
               _loc5_.body2 = this.var_476;
               _loc5_.name_1173(this.const_368);
               this.const_368.length = 0;
               param2[param2.length] = _loc5_;
            }
         }
      }
      
      private function method_705(param1:TankBody, param2:int, param3:Vector.<BodyContact>) : void
      {
         var _loc4_:TankBody = null;
         var _loc5_:name_660 = null;
         var _loc6_:name_660 = null;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:BodyContact = null;
         var _loc11_:int = 0;
         var _loc12_:ShapeContact = null;
         var _loc13_:int = int(this.var_474.length);
         var _loc14_:int = param2;
         while(_loc14_ < _loc13_)
         {
            _loc4_ = this.var_474[_loc14_];
            _loc5_ = param1.name_787;
            _loc6_ = _loc4_.name_787;
            if(!(_loc5_.var_319 && _loc6_.var_319) && _loc5_.var_308.name_1170(_loc6_.var_308,0.01))
            {
               this.method_694(param1.name_908,_loc4_.name_908,this.const_368);
               _loc7_ = int(this.const_368.length);
               if(_loc7_ > 0)
               {
                  _loc8_ = _loc5_.name_169 == null || Boolean(_loc5_.name_169.method_157(_loc5_,_loc6_));
                  _loc9_ = _loc6_.name_169 == null || Boolean(_loc6_.name_169.method_157(_loc6_,_loc5_));
                  if(_loc8_ && _loc9_)
                  {
                     _loc10_ = BodyContact.create();
                     _loc10_.body1 = _loc5_;
                     _loc10_.body2 = _loc6_;
                     _loc10_.name_1173(this.const_368);
                     param3[param3.length] = _loc10_;
                     param1.name_1171.push(_loc6_);
                     _loc4_.name_1171.push(_loc5_);
                  }
                  else
                  {
                     _loc11_ = 0;
                     while(_loc11_ < _loc7_)
                     {
                        _loc12_ = this.const_368[_loc11_];
                        _loc12_.dispose();
                        _loc11_++;
                     }
                  }
                  this.const_368.length = 0;
               }
            }
            _loc14_++;
         }
      }
      
      public function method_694(param1:name_774, param2:name_774, param3:Vector.<ShapeContact>) : void
      {
         if((param1.collisionGroup & param2.collisionGroup) == 0)
         {
            return;
         }
         if(param1.name_787 == param2.name_787)
         {
            return;
         }
         if(!param1.var_308.name_1170(param2.var_308,0.01))
         {
            return;
         }
         var _loc4_:name_1172 = this.const_371[param1.type | param2.type];
         _loc4_.method_694(param1,param2,param3);
      }
      
      public function method_698(param1:name_774, param2:name_774) : Boolean
      {
         if((param1.collisionGroup & param2.collisionGroup) == 0)
         {
            return false;
         }
         if(param1.name_787 == param2.name_787)
         {
            return false;
         }
         if(!param1.var_308.name_1170(param2.var_308,0.01))
         {
            return false;
         }
         var _loc3_:name_1172 = this.const_371[param1.type | param2.type];
         return _loc3_.name_1176(param1,param2);
      }
      
      public function raycast(param1:Vector3, param2:Vector3, param3:int, param4:Number, param5:name_1160, param6:name_124) : Boolean
      {
         var _loc7_:Boolean = this.name_251(param1,param2,param3,param4,param5,param6);
         var _loc8_:Boolean = this.method_707(param1,param2,param3,param4,param5,this.const_370);
         if(!(_loc8_ || _loc7_))
         {
            return false;
         }
         if(_loc8_ && _loc7_)
         {
            if(param6.t > this.const_370.t)
            {
               param6.copy(this.const_370);
            }
            this.const_370.clear();
            return true;
         }
         if(_loc7_)
         {
            this.const_370.clear();
            return true;
         }
         param6.copy(this.const_370);
         this.const_370.clear();
         return true;
      }
      
      public function name_251(param1:Vector3, param2:Vector3, param3:int, param4:Number, param5:name_1160, param6:name_124) : Boolean
      {
         if(!this.method_703(param1,param2,this.var_475.name_1164.name_1177,this.const_367))
         {
            return false;
         }
         if(this.const_367.max < 0 || this.const_367.min > param4)
         {
            return false;
         }
         if(this.const_367.min <= 0)
         {
            this.const_367.min = 0;
            this.const_366.x = param1.x;
            this.const_366.y = param1.y;
            this.const_366.z = param1.z;
         }
         else
         {
            this.const_366.x = param1.x + this.const_367.min * param2.x;
            this.const_366.y = param1.y + this.const_367.min * param2.y;
            this.const_366.z = param1.z + this.const_367.min * param2.z;
         }
         if(this.const_367.max > param4)
         {
            this.const_367.max = param4;
         }
         var _loc7_:Boolean = this.method_702(this.var_475.name_1164,param1,this.const_366,param2,param3,this.const_367.min,this.const_367.max,param5,param6);
         return _loc7_ ? Boolean(param6.t <= param4) : Boolean(false);
      }
      
      public function method_695(param1:Vector3, param2:Vector3, param3:int, param4:Number, param5:name_1160 = null) : Boolean
      {
         var _loc6_:Boolean = this.name_251(param1,param2,param3,param4,param5,this.const_372);
         this.const_372.clear();
         return _loc6_;
      }
      
      private function method_699(param1:name_1161, param2:name_774, param3:Vector.<ShapeContact>) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Vector.<name_774> = null;
         var _loc7_:Vector.<int> = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(param1.indices != null)
         {
            _loc6_ = this.var_475.name_1167;
            _loc7_ = param1.indices;
            _loc8_ = int(_loc7_.length);
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               this.method_694(param2,_loc6_[_loc7_[_loc9_]],param3);
               _loc9_++;
            }
         }
         if(param1.axis == -1)
         {
            return;
         }
         switch(param1.axis)
         {
            case 0:
               _loc4_ = param2.var_308.name_714;
               _loc5_ = param2.var_308.name_738;
               break;
            case 1:
               _loc4_ = param2.var_308.name_699;
               _loc5_ = param2.var_308.name_739;
               break;
            case 2:
               _loc4_ = param2.var_308.minZ;
               _loc5_ = param2.var_308.name_760;
         }
         if(_loc4_ < param1.coord)
         {
            this.method_699(param1.name_1162,param2,param3);
         }
         if(_loc5_ > param1.coord)
         {
            this.method_699(param1.name_1163,param2,param3);
         }
         if(param1.name_1165 != null && _loc4_ < param1.coord && _loc5_ > param1.coord)
         {
            this.method_699(param1.name_1165.name_1164,param2,param3);
         }
      }
      
      private function method_701(param1:name_774, param2:name_1161) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Vector.<name_774> = null;
         var _loc6_:Vector.<int> = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(param2.indices != null)
         {
            _loc5_ = this.var_475.name_1167;
            _loc6_ = param2.indices;
            _loc7_ = int(_loc6_.length);
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               if(this.method_698(param1,_loc5_[_loc6_[_loc8_]]))
               {
                  return true;
               }
               _loc8_++;
            }
         }
         if(param2.axis == -1)
         {
            return false;
         }
         switch(param2.axis)
         {
            case 0:
               _loc3_ = param1.var_308.name_714;
               _loc4_ = param1.var_308.name_738;
               break;
            case 1:
               _loc3_ = param1.var_308.name_699;
               _loc4_ = param1.var_308.name_739;
               break;
            case 2:
               _loc3_ = param1.var_308.minZ;
               _loc4_ = param1.var_308.name_760;
         }
         if(param2.name_1165 != null && _loc3_ < param2.coord && _loc4_ > param2.coord)
         {
            if(this.method_701(param1,param2.name_1165.name_1164))
            {
               return true;
            }
         }
         if(_loc3_ < param2.coord)
         {
            if(this.method_701(param1,param2.name_1162))
            {
               return true;
            }
         }
         if(_loc4_ > param2.coord)
         {
            if(this.method_701(param1,param2.name_1163))
            {
               return true;
            }
         }
         return false;
      }
      
      private function method_707(param1:Vector3, param2:Vector3, param3:int, param4:Number, param5:name_1160, param6:name_124) : Boolean
      {
         var _loc19_:name_889 = null;
         var _loc7_:TankBody = null;
         var _loc8_:name_660 = null;
         var _loc9_:name_767 = null;
         var _loc11_:name_774 = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = param1.x + param2.x * param4;
         var _loc14_:Number = param1.y + param2.y * param4;
         var _loc15_:Number = param1.z + param2.z * param4;
         if(_loc13_ < param1.x)
         {
            this.const_365.name_714 = _loc13_;
            this.const_365.name_738 = param1.x;
         }
         else
         {
            this.const_365.name_714 = param1.x;
            this.const_365.name_738 = _loc13_;
         }
         if(_loc14_ < param1.y)
         {
            this.const_365.name_699 = _loc14_;
            this.const_365.name_739 = param1.y;
         }
         else
         {
            this.const_365.name_699 = param1.y;
            this.const_365.name_739 = _loc14_;
         }
         if(_loc15_ < param1.z)
         {
            this.const_365.minZ = _loc15_;
            this.const_365.name_760 = param1.z;
         }
         else
         {
            this.const_365.minZ = param1.z;
            this.const_365.name_760 = _loc15_;
         }
         var _loc16_:Number = param4 + 1;
         var _loc17_:int = int(this.var_474.length);
         var _loc18_:int = 0;
         while(_loc18_ < _loc17_)
         {
            _loc7_ = this.var_474[_loc18_];
            _loc8_ = _loc7_.name_787;
            _loc9_ = _loc8_.var_308;
            if(!(this.const_365.name_738 < _loc9_.name_714 || this.const_365.name_714 > _loc9_.name_738 || this.const_365.name_739 < _loc9_.name_699 || this.const_365.name_699 > _loc9_.name_739 || this.const_365.name_760 < _loc9_.minZ || this.const_365.minZ > _loc9_.name_760))
            {
               _loc19_ = _loc8_.var_302.head;
               while(_loc19_ != null)
               {
                  _loc11_ = _loc19_.name_899;
                  if((_loc11_.collisionGroup & param3) != 0)
                  {
                     _loc9_ = _loc11_.var_308;
                     if(!(this.const_365.name_738 < _loc9_.name_714 || this.const_365.name_714 > _loc9_.name_738 || this.const_365.name_739 < _loc9_.name_699 || this.const_365.name_699 > _loc9_.name_739 || this.const_365.name_760 < _loc9_.minZ || this.const_365.minZ > _loc9_.name_760))
                     {
                        if(!(param5 != null && !param5.considerBody(_loc8_)))
                        {
                           _loc12_ = _loc11_.raycast(param1,param2,this.threshold,this.const_369);
                           if(_loc12_ >= 0 && _loc12_ < _loc16_)
                           {
                              _loc16_ = _loc12_;
                              param6.var_81 = _loc11_;
                              param6.normal.x = this.const_369.x;
                              param6.normal.y = this.const_369.y;
                              param6.normal.z = this.const_369.z;
                           }
                        }
                     }
                  }
                  _loc19_ = _loc19_.next;
               }
            }
            _loc18_++;
         }
         if(_loc16_ > param4)
         {
            return false;
         }
         param6.position.x = param1.x + param2.x * _loc16_;
         param6.position.y = param1.y + param2.y * _loc16_;
         param6.position.z = param1.z + param2.z * _loc16_;
         param6.t = _loc16_;
         return true;
      }
      
      private function method_703(param1:Vector3, param2:Vector3, param3:name_767, param4:name_1169) : Boolean
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         param4.min = -1;
         param4.max = 1e+308;
         var _loc7_:int = 0;
         for(; _loc7_ < 3; _loc7_++)
         {
            switch(_loc7_)
            {
               case 0:
                  if(!(param2.x < this.threshold && param2.x > -this.threshold))
                  {
                     _loc5_ = (param3.name_714 - param1.x) / param2.x;
                     _loc6_ = (param3.name_738 - param1.x) / param2.x;
                     break;
                  }
                  if(param1.x < param3.name_714 || param1.x > param3.name_738)
                  {
                     return false;
                  }
                  continue;
               case 1:
                  if(!(param2.y < this.threshold && param2.y > -this.threshold))
                  {
                     _loc5_ = (param3.name_699 - param1.y) / param2.y;
                     _loc6_ = (param3.name_739 - param1.y) / param2.y;
                     break;
                  }
                  if(param1.y < param3.name_699 || param1.y > param3.name_739)
                  {
                     return false;
                  }
                  continue;
               case 2:
                  if(!(param2.z < this.threshold && param2.z > -this.threshold))
                  {
                     _loc5_ = (param3.minZ - param1.z) / param2.z;
                     _loc6_ = (param3.name_760 - param1.z) / param2.z;
                     break;
                  }
                  if(param1.z < param3.minZ || param1.z > param3.name_760)
                  {
                     return false;
                  }
                  continue;
            }
            if(_loc5_ < _loc6_)
            {
               if(_loc5_ > param4.min)
               {
                  param4.min = _loc5_;
               }
               if(_loc6_ < param4.max)
               {
                  param4.max = _loc6_;
               }
            }
            else
            {
               if(_loc6_ > param4.min)
               {
                  param4.min = _loc6_;
               }
               if(_loc5_ < param4.max)
               {
                  param4.max = _loc5_;
               }
            }
            if(param4.max < param4.min)
            {
               return false;
            }
         }
         return true;
      }
      
      private function method_702(param1:name_1161, param2:Vector3, param3:Vector3, param4:Vector3, param5:int, param6:Number, param7:Number, param8:name_1160, param9:name_124) : Boolean
      {
         var _loc10_:Number = NaN;
         var _loc11_:name_1161 = null;
         var _loc12_:Boolean = false;
         var _loc13_:name_1161 = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:name_774 = null;
         if(param1.indices != null && this.method_708(param2,param4,param5,this.var_475.name_1167,param1.indices,param8,param9))
         {
            return true;
         }
         if(param1.axis == -1)
         {
            return false;
         }
         switch(param1.axis)
         {
            case 0:
               if(param4.x > -this.threshold && param4.x < this.threshold)
               {
                  _loc10_ = param7 + 1;
               }
               else
               {
                  _loc10_ = (param1.coord - param2.x) / param4.x;
               }
               _loc11_ = param3.x < param1.coord ? param1.name_1162 : param1.name_1163;
               break;
            case 1:
               if(param4.y > -this.threshold && param4.y < this.threshold)
               {
                  _loc10_ = param7 + 1;
               }
               else
               {
                  _loc10_ = (param1.coord - param2.y) / param4.y;
               }
               _loc11_ = param3.y < param1.coord ? param1.name_1162 : param1.name_1163;
               break;
            case 2:
               if(param4.z > -this.threshold && param4.z < this.threshold)
               {
                  _loc10_ = param7 + 1;
               }
               else
               {
                  _loc10_ = (param1.coord - param2.z) / param4.z;
               }
               _loc11_ = param3.z < param1.coord ? param1.name_1162 : param1.name_1163;
         }
         if(_loc10_ < param6 || _loc10_ > param7)
         {
            return this.method_702(_loc11_,param2,param3,param4,param5,param6,param7,param8,param9);
         }
         _loc12_ = this.method_702(_loc11_,param2,param3,param4,param5,param6,_loc10_,param8,param9);
         if(_loc12_)
         {
            return true;
         }
         this.const_366.x = param2.x + _loc10_ * param4.x;
         this.const_366.y = param2.y + _loc10_ * param4.y;
         this.const_366.z = param2.z + _loc10_ * param4.z;
         if(param1.name_1165 != null)
         {
            _loc13_ = param1.name_1165.name_1164;
            while(_loc13_ != null && _loc13_.axis != -1)
            {
               switch(_loc13_.axis)
               {
                  case 0:
                     _loc13_ = this.const_366.x < _loc13_.coord ? _loc13_.name_1162 : _loc13_.name_1163;
                     break;
                  case 1:
                     _loc13_ = this.const_366.y < _loc13_.coord ? _loc13_.name_1162 : _loc13_.name_1163;
                     break;
                  case 2:
                     _loc13_ = this.const_366.z < _loc13_.coord ? _loc13_.name_1162 : _loc13_.name_1163;
                     break;
               }
            }
            if(_loc13_ != null && _loc13_.indices != null)
            {
               _loc14_ = int(_loc13_.indices.length);
               _loc15_ = 0;
               while(_loc15_ < _loc14_)
               {
                  _loc16_ = this.var_475.name_1167[_loc13_.indices[_loc15_]];
                  if((_loc16_.collisionGroup & param5) != 0)
                  {
                     if(!(param8 != null && !param8.considerBody(_loc16_.name_787)))
                     {
                        param9.t = _loc16_.raycast(param2,param4,this.threshold,param9.normal);
                        if(param9.t >= 0)
                        {
                           param9.position.vCopy(this.const_366);
                           param9.var_81 = _loc16_;
                           return true;
                        }
                     }
                  }
                  _loc15_++;
               }
            }
         }
         return this.method_702(_loc11_ == param1.name_1162 ? param1.name_1163 : param1.name_1162,param2,this.const_366,param4,param5,_loc10_,param7,param8,param9);
      }
      
      private function method_708(param1:Vector3, param2:Vector3, param3:int, param4:Vector.<name_774>, param5:Vector.<int>, param6:name_1160, param7:name_124) : Boolean
      {
         var _loc8_:name_774 = null;
         var _loc9_:Number = NaN;
         var _loc10_:int = int(param5.length);
         var _loc11_:Number = 1e+308;
         var _loc12_:int = 0;
         while(_loc12_ < _loc10_)
         {
            _loc8_ = param4[param5[_loc12_]];
            if((_loc8_.collisionGroup & param3) != 0)
            {
               if(!(param6 != null && !param6.considerBody(_loc8_.name_787)))
               {
                  _loc9_ = _loc8_.raycast(param1,param2,this.threshold,this.const_369);
                  if(_loc9_ > 0 && _loc9_ < _loc11_)
                  {
                     _loc11_ = _loc9_;
                     param7.var_81 = _loc8_;
                     param7.normal.x = this.const_369.x;
                     param7.normal.y = this.const_369.y;
                     param7.normal.z = this.const_369.z;
                  }
               }
            }
            _loc12_++;
         }
         if(_loc11_ == 1e+308)
         {
            return false;
         }
         param7.position.x = param1.x + param2.x * _loc11_;
         param7.position.y = param1.y + param2.y * _loc11_;
         param7.position.z = param1.z + param2.z * _loc11_;
         param7.t = _loc11_;
         return true;
      }
      
      public function method_710(param1:name_774) : Boolean
      {
         return this.method_701(param1,this.var_475.name_1164);
      }
      
      public function destroy() : void
      {
         var _loc1_:TankBody = null;
         this.var_475.destroyTree();
         this.var_475 = null;
         for each(_loc1_ in this.var_474)
         {
            _loc1_.destroy();
         }
         this.var_474.length = 0;
         this.var_476 = null;
      }
   }
}
