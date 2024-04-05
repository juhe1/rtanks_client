package package_371
{
   public class DynamicMatrix
   {
      
      public static const const_2795:int = 0;
      
      public static const const_2794:int = 1;
       
      
      protected var var_3625:int;
      
      protected var var_3626:int;
      
      protected var var_3624:Array;
      
      public function DynamicMatrix(param1:int, param2:int)
      {
         super();
         this.Create(param1,param2);
      }
      
      protected function Create(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 > 0 && param2 > 0)
         {
            this.var_3625 = param1;
            this.var_3626 = param2;
            this.var_3624 = new Array(param2);
            _loc3_ = 0;
            while(_loc3_ < param2)
            {
               this.var_3624[_loc3_] = new Array(param1);
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  this.var_3624[_loc3_][_loc4_] = 0;
                  _loc4_++;
               }
               _loc3_++;
            }
         }
      }
      
      protected function method_3242() : void
      {
         this.var_3624 = null;
      }
      
      public function method_3243() : Number
      {
         return this.var_3625;
      }
      
      public function method_3240() : Number
      {
         return this.var_3626;
      }
      
      public function method_3239(param1:int, param2:int) : Number
      {
         var _loc3_:Number = 0;
         if(param1 >= 0 && param1 < this.var_3626 && param2 >= 0 && param2 <= this.var_3625)
         {
            _loc3_ = Number(this.var_3624[param1][param2]);
         }
         return _loc3_;
      }
      
      public function method_3241(param1:int, param2:int, param3:Number) : void
      {
         if(param1 >= 0 && param1 < this.var_3626 && param2 >= 0 && param2 <= this.var_3625)
         {
            this.var_3624[param1][param2] = param3;
         }
      }
      
      public function method_3245() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(Boolean(this.var_3624))
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_3626)
            {
               _loc2_ = 0;
               while(_loc2_ < this.var_3625)
               {
                  if(_loc1_ == _loc2_)
                  {
                     this.var_3624[_loc1_][_loc2_] = 1;
                  }
                  else
                  {
                     this.var_3624[_loc1_][_loc2_] = 0;
                  }
                  _loc2_++;
               }
               _loc1_++;
            }
         }
      }
      
      public function method_3244() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(Boolean(this.var_3624))
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_3626)
            {
               _loc2_ = 0;
               while(_loc2_ < this.var_3625)
               {
                  this.var_3624[_loc1_][_loc2_] = 0;
                  _loc2_++;
               }
               _loc1_++;
            }
         }
      }
      
      public function name_3288(param1:DynamicMatrix, param2:int = 0) : Boolean
      {
         var _loc3_:DynamicMatrix = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(!this.var_3624 || !param1)
         {
            return false;
         }
         var _loc9_:int = param1.method_3240();
         var _loc10_:int = param1.method_3243();
         if(param2 == 1)
         {
            if(this.var_3625 != _loc9_)
            {
               return false;
            }
            _loc3_ = new DynamicMatrix(_loc10_,this.var_3626);
            _loc4_ = 0;
            while(_loc4_ < this.var_3626)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc10_)
               {
                  _loc6_ = 0;
                  _loc7_ = 0;
                  _loc8_ = 0;
                  while(_loc7_ < Math.max(this.var_3626,_loc9_) && _loc8_ < Math.max(this.var_3625,_loc10_))
                  {
                     _loc6_ += param1.method_3239(_loc7_,_loc5_) * this.var_3624[_loc4_][_loc8_];
                     _loc7_++;
                     _loc8_++;
                  }
                  _loc3_.method_3241(_loc4_,_loc5_,_loc6_);
                  _loc5_++;
               }
               _loc4_++;
            }
            this.method_3242();
            this.Create(_loc10_,this.var_3626);
            _loc4_ = 0;
            while(_loc4_ < _loc9_)
            {
               _loc5_ = 0;
               while(_loc5_ < this.var_3625)
               {
                  this.var_3624[_loc4_][_loc5_] = _loc3_.method_3239(_loc4_,_loc5_);
                  _loc5_++;
               }
               _loc4_++;
            }
         }
         else
         {
            if(this.var_3626 != _loc10_)
            {
               return false;
            }
            _loc3_ = new DynamicMatrix(this.var_3625,_loc9_);
            _loc4_ = 0;
            while(_loc4_ < _loc9_)
            {
               _loc5_ = 0;
               while(_loc5_ < this.var_3625)
               {
                  _loc6_ = 0;
                  _loc7_ = 0;
                  _loc8_ = 0;
                  while(_loc7_ < Math.max(_loc9_,this.var_3626) && _loc8_ < Math.max(_loc10_,this.var_3625))
                  {
                     _loc6_ += this.var_3624[_loc7_][_loc5_] * param1.method_3239(_loc4_,_loc8_);
                     _loc7_++;
                     _loc8_++;
                  }
                  _loc3_.method_3241(_loc4_,_loc5_,_loc6_);
                  _loc5_++;
               }
               _loc4_++;
            }
            this.method_3242();
            this.Create(this.var_3625,_loc9_);
            _loc4_ = 0;
            while(_loc4_ < _loc9_)
            {
               _loc5_ = 0;
               while(_loc5_ < this.var_3625)
               {
                  this.var_3624[_loc4_][_loc5_] = _loc3_.method_3239(_loc4_,_loc5_);
                  _loc5_++;
               }
               _loc4_++;
            }
         }
         return true;
      }
      
      public function method_3247(param1:Number) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(!this.var_3624)
         {
            return false;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.var_3626)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_3625)
            {
               _loc3_ = 0;
               _loc3_ = this.var_3624[_loc4_][_loc2_] * param1;
               this.var_3624[_loc4_][_loc2_] = _loc3_;
               _loc2_++;
            }
            _loc4_++;
         }
         return true;
      }
      
      public function method_3246(param1:DynamicMatrix) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(!this.var_3624 || !param1)
         {
            return false;
         }
         var _loc4_:int = param1.method_3240();
         var _loc5_:int = param1.method_3243();
         if(this.var_3625 != _loc5_ || this.var_3626 != _loc4_)
         {
            return false;
         }
         var _loc6_:int = 0;
         while(_loc6_ < this.var_3626)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_3625)
            {
               _loc3_ = 0;
               _loc3_ = this.var_3624[_loc6_][_loc2_] + param1.method_3239(_loc6_,_loc2_);
               this.var_3624[_loc6_][_loc2_] = _loc3_;
               _loc2_++;
            }
            _loc6_++;
         }
         return true;
      }
   }
}
