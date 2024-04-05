package alternativa.tanks.gui.settings.controls
{
   import flash.display.DisplayObject;
   
   public class GridLayout
   {
       
      
      private var var_3390:int;
      
      private var var_3391:int;
      
      private var columnWidth:int;
      
      private var rowHeight:int;
      
      private var var_3389:int;
      
      public function GridLayout(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         this.var_3390 = param1;
         this.var_3391 = param2;
         this.columnWidth = param3;
         this.rowHeight = param4;
      }
      
      public function layout(param1:Array) : int
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            _loc3_ = param1[_loc6_];
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               if(_loc3_[_loc4_] != null)
               {
                  _loc5_ = _loc3_[_loc4_];
                  _loc5_.x = this.var_3390 + _loc4_ * this.columnWidth;
                  _loc5_.y = this.var_3391 + _loc6_ * this.rowHeight + this.var_3389 * _loc6_;
                  _loc2_ = _loc5_.y + _loc5_.height;
               }
               _loc4_++;
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public function method_3058() : int
      {
         return this.var_3389;
      }
      
      public function method_3059(param1:int) : void
      {
         this.var_3389 = param1;
      }
   }
}
