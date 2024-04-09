package alternativa.physics.collision
{
   import package_61.name_767;
   
   public class CollisionKdTree
   {
      
      private static const const_1771:name_767 = new name_767();
      
      private static const splitCoordsX:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsY:Vector.<Number> = new Vector.<Number>();
      
      private static const splitCoordsZ:Vector.<Number> = new Vector.<Number>();
      
      private static const const_1772:Vector.<Number> = new Vector.<Number>(6);
      
      private static const const_1773:Vector.<Number> = new Vector.<Number>(6);
       
      
      public var threshold:Number = 0.1;
      
      public var var_1997:int = 1;
      
      public var name_1164:name_1161;
      
      public var name_1167:Vector.<CollisionPrimitive>;
      
      public var var_1996:int;
      
      public var var_1993:Vector.<name_767>;
      
      private var var_1994:int;
      
      private var var_1992:Number;
      
      private var var_1995:Number;
      
      public function CollisionKdTree()
      {
         this.var_1993 = new Vector.<name_767>();
         super();
      }
      
      public function createTree(param1:Vector.<CollisionPrimitive>, param2:name_767 = null) : void
      {
         var _loc3_:CollisionPrimitive = null;
         var _loc4_:name_767 = null;
         this.name_1167 = param1.concat();
         this.var_1996 = this.name_1167.length;
         this.name_1164 = new name_1161();
         this.name_1164.indices = new Vector.<int>();
         var _loc5_:name_767 = this.name_1164.name_1177 = param2 != null ? param2 : new name_767();
         var _loc6_:int = 0;
         while(_loc6_ < this.var_1996)
         {
            _loc3_ = this.name_1167[_loc6_];
            _loc4_ = this.var_1993[_loc6_] = _loc3_.calculateAABB();
            _loc5_.name_902(_loc4_);
            this.name_1164.indices[_loc6_] = _loc6_;
            _loc6_++;
         }
         this.var_1993.length = this.var_1996;
         this.method_2091(this.name_1164);
         splitCoordsX.length = splitCoordsY.length = splitCoordsZ.length = 0;
      }
      
      private function method_2091(param1:name_1161) : void
      {
         var _loc2_:name_767 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:name_767 = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Vector.<int> = param1.indices;
         var _loc9_:int = int(_loc8_.length);
         if(_loc9_ <= this.var_1997)
         {
            return;
         }
         _loc2_ = param1.name_1177;
         const_1771.name_714 = _loc2_.name_714 + this.threshold;
         const_1771.name_699 = _loc2_.name_699 + this.threshold;
         const_1771.minZ = _loc2_.minZ + this.threshold;
         const_1771.name_738 = _loc2_.name_738 - this.threshold;
         const_1771.name_739 = _loc2_.name_739 - this.threshold;
         const_1771.name_760 = _loc2_.name_760 - this.threshold;
         var _loc10_:Number = this.threshold * 2;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc9_)
         {
            _loc5_ = this.var_1993[_loc8_[_loc3_]];
            if(_loc5_.name_738 - _loc5_.name_714 <= _loc10_)
            {
               if(_loc5_.name_714 <= const_1771.name_714)
               {
                  var _loc18_:* = _loc11_++;
                  splitCoordsX[_loc18_] = _loc2_.name_714;
               }
               else if(_loc5_.name_738 >= const_1771.name_738)
               {
                  _loc18_ = _loc11_++;
                  splitCoordsX[_loc18_] = _loc2_.name_738;
               }
               else
               {
                  _loc18_ = _loc11_++;
                  splitCoordsX[_loc18_] = (_loc5_.name_714 + _loc5_.name_738) * 0.5;
               }
            }
            else
            {
               if(_loc5_.name_714 > const_1771.name_714)
               {
                  _loc18_ = _loc11_++;
                  splitCoordsX[_loc18_] = _loc5_.name_714;
               }
               if(_loc5_.name_738 < const_1771.name_738)
               {
                  _loc18_ = _loc11_++;
                  splitCoordsX[_loc18_] = _loc5_.name_738;
               }
            }
            if(_loc5_.name_739 - _loc5_.name_699 <= _loc10_)
            {
               if(_loc5_.name_699 <= const_1771.name_699)
               {
                  _loc18_ = _loc12_++;
                  splitCoordsY[_loc18_] = _loc2_.name_699;
               }
               else if(_loc5_.name_739 >= const_1771.name_739)
               {
                  _loc18_ = _loc12_++;
                  splitCoordsY[_loc18_] = _loc2_.name_739;
               }
               else
               {
                  _loc18_ = _loc12_++;
                  splitCoordsY[_loc18_] = (_loc5_.name_699 + _loc5_.name_739) * 0.5;
               }
            }
            else
            {
               if(_loc5_.name_699 > const_1771.name_699)
               {
                  _loc18_ = _loc12_++;
                  splitCoordsY[_loc18_] = _loc5_.name_699;
               }
               if(_loc5_.name_739 < const_1771.name_739)
               {
                  _loc18_ = _loc12_++;
                  splitCoordsY[_loc18_] = _loc5_.name_739;
               }
            }
            if(_loc5_.name_760 - _loc5_.minZ <= _loc10_)
            {
               if(_loc5_.minZ <= const_1771.minZ)
               {
                  _loc18_ = _loc13_++;
                  splitCoordsZ[_loc18_] = _loc2_.minZ;
               }
               else if(_loc5_.name_760 >= const_1771.name_760)
               {
                  _loc18_ = _loc13_++;
                  splitCoordsZ[_loc18_] = _loc2_.name_760;
               }
               else
               {
                  _loc18_ = _loc13_++;
                  splitCoordsZ[_loc18_] = (_loc5_.minZ + _loc5_.name_760) * 0.5;
               }
            }
            else
            {
               if(_loc5_.minZ > const_1771.minZ)
               {
                  _loc18_ = _loc13_++;
                  splitCoordsZ[_loc18_] = _loc5_.minZ;
               }
               if(_loc5_.name_760 < const_1771.name_760)
               {
                  _loc18_ = _loc13_++;
                  splitCoordsZ[_loc18_] = _loc5_.name_760;
               }
            }
            _loc3_++;
         }
         this.var_1994 = -1;
         this.var_1995 = 1e+308;
         const_1772[0] = _loc2_.name_714;
         const_1772[1] = _loc2_.name_699;
         const_1772[2] = _loc2_.minZ;
         const_1772[3] = _loc2_.name_738;
         const_1772[4] = _loc2_.name_739;
         const_1772[5] = _loc2_.name_760;
         this.method_2089(param1,0,_loc11_,splitCoordsX,const_1772);
         this.method_2089(param1,1,_loc12_,splitCoordsY,const_1772);
         this.method_2089(param1,2,_loc13_,splitCoordsZ,const_1772);
         if(this.var_1994 < 0)
         {
            return;
         }
         var _loc14_:Boolean = this.var_1994 == 0;
         var _loc15_:Boolean = this.var_1994 == 1;
         param1.axis = this.var_1994;
         param1.coord = this.var_1992;
         param1.name_1162 = new name_1161();
         param1.name_1162.parent = param1;
         param1.name_1162.name_1177 = _loc2_.clone();
         param1.name_1163 = new name_1161();
         param1.name_1163.parent = param1;
         param1.name_1163.name_1177 = _loc2_.clone();
         if(_loc14_)
         {
            param1.name_1162.name_1177.name_738 = param1.name_1163.name_1177.name_714 = this.var_1992;
         }
         else if(_loc15_)
         {
            param1.name_1162.name_1177.name_739 = param1.name_1163.name_1177.name_699 = this.var_1992;
         }
         else
         {
            param1.name_1162.name_1177.name_760 = param1.name_1163.name_1177.minZ = this.var_1992;
         }
         var _loc16_:Number = this.var_1992 - this.threshold;
         var _loc17_:Number = this.var_1992 + this.threshold;
         _loc3_ = 0;
         while(_loc3_ < _loc9_)
         {
            _loc5_ = this.var_1993[_loc8_[_loc3_]];
            _loc6_ = _loc14_ ? Number(_loc5_.name_714) : (_loc15_ ? Number(_loc5_.name_699) : Number(_loc5_.minZ));
            _loc7_ = _loc14_ ? Number(_loc5_.name_738) : (_loc15_ ? Number(_loc5_.name_739) : Number(_loc5_.name_760));
            if(_loc7_ <= _loc17_)
            {
               if(_loc6_ < _loc16_)
               {
                  if(param1.name_1162.indices == null)
                  {
                     param1.name_1162.indices = new Vector.<int>();
                  }
                  param1.name_1162.indices.push(_loc8_[_loc3_]);
                  _loc8_[_loc3_] = -1;
               }
               else
               {
                  if(param1.var_1989 == null)
                  {
                     param1.var_1989 = new Vector.<int>();
                  }
                  param1.var_1989.push(_loc8_[_loc3_]);
                  _loc8_[_loc3_] = -1;
               }
            }
            else if(_loc6_ >= _loc16_)
            {
               if(param1.name_1163.indices == null)
               {
                  param1.name_1163.indices = new Vector.<int>();
               }
               param1.name_1163.indices.push(_loc8_[_loc3_]);
               _loc8_[_loc3_] = -1;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         _loc4_ = 0;
         while(_loc3_ < _loc9_)
         {
            if(_loc8_[_loc3_] >= 0)
            {
               _loc18_ = _loc4_++;
               _loc8_[_loc18_] = _loc8_[_loc3_];
            }
            _loc3_++;
         }
         if(_loc4_ > 0)
         {
            _loc8_.length = _loc4_;
         }
         else
         {
            param1.indices = null;
         }
         if(param1.var_1989 != null)
         {
            param1.name_1165 = new CollisionKdTree2D(this,param1);
            param1.name_1165.createTree();
         }
         if(param1.name_1162.indices != null)
         {
            this.method_2091(param1.name_1162);
         }
         if(param1.name_1163.indices != null)
         {
            this.method_2091(param1.name_1163);
         }
      }
      
      private function method_2089(param1:name_1161, param2:int, param3:int, param4:Vector.<Number>, param5:Vector.<Number>) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Number = NaN;
         var _loc17_:name_767 = null;
         var _loc18_:int = (param2 + 1) % 3;
         var _loc19_:int = (param2 + 2) % 3;
         var _loc20_:Number = (param5[_loc18_ + 3] - param5[_loc18_]) * (param5[_loc19_ + 3] - param5[_loc19_]);
         var _loc21_:int = 0;
         while(_loc21_ < param3)
         {
            _loc6_ = param4[_loc21_];
            if(!isNaN(_loc6_))
            {
               _loc7_ = _loc6_ - this.threshold;
               _loc8_ = _loc6_ + this.threshold;
               _loc9_ = _loc20_ * (_loc6_ - param5[param2]);
               _loc10_ = _loc20_ * (param5[int(param2 + 3)] - _loc6_);
               _loc11_ = 0;
               _loc12_ = 0;
               _loc13_ = false;
               _loc14_ = int(param1.indices.length);
               _loc15_ = 0;
               while(_loc15_ < _loc14_)
               {
                  _loc17_ = this.var_1993[param1.indices[_loc15_]];
                  const_1773[0] = _loc17_.name_714;
                  const_1773[1] = _loc17_.name_699;
                  const_1773[2] = _loc17_.minZ;
                  const_1773[3] = _loc17_.name_738;
                  const_1773[4] = _loc17_.name_739;
                  const_1773[5] = _loc17_.name_760;
                  if(const_1773[param2 + 3] <= _loc8_)
                  {
                     if(const_1773[param2] < _loc7_)
                     {
                        _loc11_++;
                     }
                  }
                  else
                  {
                     if(const_1773[param2] < _loc7_)
                     {
                        _loc13_ = true;
                        break;
                     }
                     _loc12_++;
                  }
                  _loc15_++;
               }
               _loc16_ = _loc9_ * _loc11_ + _loc10_ * _loc12_;
               if(!_loc13_ && _loc16_ < this.var_1995)
               {
                  this.var_1994 = param2;
                  this.var_1995 = _loc16_;
                  this.var_1992 = _loc6_;
               }
               _loc15_ = _loc21_ + 1;
               while(_loc15_ < param3)
               {
                  if(param4[_loc15_] >= _loc6_ - this.threshold && param4[_loc15_] <= _loc6_ + this.threshold)
                  {
                     param4[_loc15_] = NaN;
                  }
                  _loc15_++;
               }
            }
            _loc21_++;
         }
      }
      
      public function method_2092() : void
      {
         this.method_2090("",this.name_1164);
      }
      
      private function method_2090(param1:String, param2:name_1161) : void
      {
         if(param2 == null)
         {
            return;
         }
         trace(param1,param2.axis == -1 ? "end" : (param2.axis == 0 ? "X" : (param2.axis == 1 ? "Y" : "Z")),"splitCoord=" + this.var_1992,"bound",param2.name_1177,"objs:",param2.indices);
         this.method_2090(param1 + "-",param2.name_1162);
         this.method_2090(param1 + "+",param2.name_1163);
      }
      
      public function destroyTree() : void
      {
         if(Boolean(this.name_1164))
         {
            this.name_1164.destroy();
            this.name_1164 = null;
         }
         if(Boolean(this.name_1167))
         {
            this.name_1167.length = 0;
            this.name_1167 = null;
         }
         this.var_1993.length = 0;
      }
   }
}
