package package_276
{
   import alternativa.physics.Body;
   import package_37.Vector3;
   
   public class Track
   {
       
      
      public var name_787:Body;
      
      public var name_2090:Vector.<name_2088>;
      
      public var name_2092:int;
      
      public var name_2089:int;
      
      public var var_1713:name_906;
      
      public var name_924:Number = 0;
      
      public var var_2721:int;
      
      public const const_2101:Vector3 = new Vector3();
      
      public function Track(param1:Body, param2:int, param3:Vector3, param4:Number, param5:name_906, param6:int)
      {
         super();
         this.name_787 = param1;
         this.var_2721 = param6;
         this.method_2589(param2,param3,param4,param5);
      }
      
      private static function name_1420(param1:Body) : Boolean
      {
         return param1 != null && param1.tank != null;
      }
      
      private function method_2589(param1:int, param2:Vector3, param3:Number, param4:name_906) : void
      {
         var _loc5_:Vector3 = null;
         this.name_2092 = param1;
         this.var_1713 = param4;
         this.name_2090 = new Vector.<name_2088>(param1);
         var _loc6_:Number = param3 / (param1 - 1);
         var _loc7_:int = 0;
         while(_loc7_ < param1)
         {
            _loc5_ = new Vector3(param2.x,param2.y + 0.5 * param3 - _loc7_ * _loc6_,param2.z);
            this.name_2090[_loc7_] = new name_2088(this.name_787,_loc5_,Vector3.DOWN,param4);
            _loc7_++;
         }
      }
      
      public function name_939(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.name_2092)
         {
            name_2088(this.name_2090[_loc2_]).collisionGroup = param1;
            _loc2_++;
         }
      }
      
      public function name_1168() : Boolean
      {
         var _loc1_:name_2088 = null;
         for each(_loc1_ in this.name_2090)
         {
            if(_loc1_.name_2181 && !name_1420(_loc1_.var_397.var_81.name_787))
            {
               return true;
            }
         }
         return false;
      }
      
      public function method_1885(param1:Number) : void
      {
         var _loc2_:Vector3 = null;
         var _loc3_:name_2088 = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         this.name_2089 = 0;
         this.const_2101.x = 0;
         this.const_2101.y = 0;
         this.const_2101.z = 0;
         _loc2_ = this.name_787.state.name_187;
         var _loc7_:int = 0;
         while(_loc7_ < this.name_2092)
         {
            _loc3_ = this.name_2090[_loc7_];
            _loc3_.update(param1);
            if(_loc3_.name_2181)
            {
               ++this.name_2089;
               this.name_787.method_432(_loc3_.name_2091(),_loc3_.name_2794(),-_loc3_.name_2793);
               this.const_2101.x += _loc3_.name_2183.x;
               this.const_2101.y += _loc3_.name_2183.y;
               this.const_2101.z += _loc3_.name_2183.z;
               _loc4_ = _loc2_.x - _loc3_.name_2183.x;
               _loc5_ = _loc2_.y - _loc3_.name_2183.y;
               _loc6_ = _loc2_.z - _loc3_.name_2183.z;
               _loc3_.speed = Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_);
            }
            else
            {
               _loc3_.speed = 0;
            }
            _loc7_++;
         }
         if(this.name_2089 > 1)
         {
            this.const_2101.x /= this.name_2089;
            this.const_2101.y /= this.name_2089;
            this.const_2101.z /= this.name_2089;
         }
      }
      
      public function method_2590(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         if(this.name_924 < param1)
         {
            _loc3_ = this.name_924 + param2;
            this.name_924 = _loc3_ > param1 ? Number(param1) : Number(_loc3_);
         }
         else if(this.name_924 > param1)
         {
            _loc3_ = this.name_924 - param2;
            this.name_924 = _loc3_ < param1 ? Number(param1) : Number(_loc3_);
         }
      }
   }
}
