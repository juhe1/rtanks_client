package package_243
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class name_673
   {
       
      
      private var var_1436:ImageResource;
      
      private var var_1432:ImageResource;
      
      private var var_1433:ImageResource;
      
      private var var_1435:ImageResource;
      
      private var var_1431:ImageResource;
      
      private var var_1434:ImageResource;
      
      public function name_673(param1:ImageResource = null, param2:ImageResource = null, param3:ImageResource = null, param4:ImageResource = null, param5:ImageResource = null, param6:ImageResource = null)
      {
         super();
         this.var_1436 = param1;
         this.var_1432 = param2;
         this.var_1433 = param3;
         this.var_1435 = param4;
         this.var_1431 = param5;
         this.var_1434 = param6;
      }
      
      public function get back() : ImageResource
      {
         return this.var_1436;
      }
      
      public function set back(param1:ImageResource) : void
      {
         this.var_1436 = param1;
      }
      
      public function get bottom() : ImageResource
      {
         return this.var_1432;
      }
      
      public function set bottom(param1:ImageResource) : void
      {
         this.var_1432 = param1;
      }
      
      public function get front() : ImageResource
      {
         return this.var_1433;
      }
      
      public function set front(param1:ImageResource) : void
      {
         this.var_1433 = param1;
      }
      
      public function get left() : ImageResource
      {
         return this.var_1435;
      }
      
      public function set left(param1:ImageResource) : void
      {
         this.var_1435 = param1;
      }
      
      public function get right() : ImageResource
      {
         return this.var_1431;
      }
      
      public function set right(param1:ImageResource) : void
      {
         this.var_1431 = param1;
      }
      
      public function get top() : ImageResource
      {
         return this.var_1434;
      }
      
      public function set top(param1:ImageResource) : void
      {
         this.var_1434 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "SkyboxSides [";
         _loc1_ += "back = " + this.back + " ";
         _loc1_ += "bottom = " + this.bottom + " ";
         _loc1_ += "front = " + this.front + " ";
         _loc1_ += "left = " + this.left + " ";
         _loc1_ += "right = " + this.right + " ";
         _loc1_ += "top = " + this.top + " ";
         return _loc1_ + "]";
      }
   }
}
