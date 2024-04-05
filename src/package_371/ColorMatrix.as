package package_371
{
   public class ColorMatrix extends DynamicMatrix
   {
      
      protected static const const_2797:Number = 0.3086;
      
      protected static const const_2798:Number = 0.6094;
      
      protected static const const_2796:Number = 0.082;
       
      
      public function ColorMatrix()
      {
         super(5,5);
         method_3245();
      }
      
      public function name_3289(param1:Number) : void
      {
         if(!var_3624)
         {
            return;
         }
         var_3624[0][4] = param1;
         var_3624[1][4] = param1;
         var_3624[2][4] = param1;
      }
      
      public function name_3291(param1:Number) : void
      {
         if(!var_3624)
         {
            return;
         }
         var _loc2_:Number = 0.5 * (127 - param1);
         param1 /= 127;
         var_3624[0][0] = param1;
         var_3624[1][1] = param1;
         var_3624[2][2] = param1;
         var_3624[0][4] = _loc2_;
         var_3624[1][4] = _loc2_;
         var_3624[2][4] = _loc2_;
      }
      
      public function name_3292(param1:Number) : void
      {
         if(!var_3624)
         {
            return;
         }
         var _loc2_:Number = 1 - param1;
         var _loc3_:Number = _loc2_ * 0.3086;
         var_3624[0][0] = _loc3_ + param1;
         var_3624[1][0] = _loc3_;
         var_3624[2][0] = _loc3_;
         _loc3_ = _loc2_ * 0.6094;
         var_3624[0][1] = _loc3_;
         var_3624[1][1] = _loc3_ + param1;
         var_3624[2][1] = _loc3_;
         _loc3_ = _loc2_ * 0.082;
         var_3624[0][2] = _loc3_;
         var_3624[1][2] = _loc3_;
         var_3624[2][2] = _loc3_ + param1;
      }
      
      public function name_3290(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(!var_3624)
         {
            return;
         }
         method_3245();
         var _loc3_:DynamicMatrix = new DynamicMatrix(3,3);
         var _loc4_:DynamicMatrix = new DynamicMatrix(3,3);
         var _loc5_:DynamicMatrix = new DynamicMatrix(3,3);
         var _loc6_:Number = Math.cos(param1);
         var _loc7_:Number = Math.sin(param1);
         _loc3_.method_3241(0,0,0.213);
         _loc3_.method_3241(1,0,0.213);
         _loc3_.method_3241(2,0,0.213);
         _loc3_.method_3241(0,1,0.715);
         _loc3_.method_3241(1,1,0.715);
         _loc3_.method_3241(2,1,0.715);
         _loc3_.method_3241(0,2,0.072);
         _loc3_.method_3241(1,2,0.072);
         _loc3_.method_3241(2,2,0.072);
         _loc4_.method_3241(0,0,1 - 0.213);
         _loc4_.method_3241(1,0,-0.213);
         _loc4_.method_3241(2,0,-0.213);
         _loc4_.method_3241(0,1,-0.715);
         _loc4_.method_3241(1,1,1 - 0.715);
         _loc4_.method_3241(2,1,-0.715);
         _loc4_.method_3241(0,2,-0.072);
         _loc4_.method_3241(1,2,-0.072);
         _loc4_.method_3241(2,2,1 - 0.072);
         _loc4_.method_3247(_loc6_);
         _loc5_.method_3241(0,0,-0.213);
         _loc5_.method_3241(1,0,0.143);
         _loc5_.method_3241(2,0,-(1 - 0.213));
         _loc5_.method_3241(0,1,-0.715);
         _loc5_.method_3241(1,1,0.14);
         _loc5_.method_3241(2,1,0.715);
         _loc5_.method_3241(0,2,1 - 0.072);
         _loc5_.method_3241(1,2,-0.283);
         _loc5_.method_3241(2,2,0.072);
         _loc5_.method_3247(_loc7_);
         _loc3_.method_3246(_loc4_);
         _loc3_.method_3246(_loc5_);
         var _loc8_:int = 0;
         while(_loc8_ < 3)
         {
            _loc2_ = 0;
            while(_loc2_ < 3)
            {
               var_3624[_loc8_][_loc2_] = _loc3_.method_3239(_loc8_,_loc2_);
               _loc2_++;
            }
            _loc8_++;
         }
      }
      
      public function name_3293() : Array
      {
         var _loc1_:int = 0;
         if(!var_3624)
         {
            return null;
         }
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < 4)
         {
            _loc1_ = 0;
            while(_loc1_ < 5)
            {
               _loc2_[_loc3_] = var_3624[_loc4_][_loc1_];
               _loc3_++;
               _loc1_++;
            }
            _loc4_++;
         }
         return _loc2_;
      }
   }
}

class XFormData
{
    
   
   public var ox:Number;
   
   public var oy:Number;
   
   public var oz:Number;
   
   public function XFormData()
   {
      super();
   }
}
