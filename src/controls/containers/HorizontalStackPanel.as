package controls.containers
{
   import flash.display.DisplayObject;
   
   public class HorizontalStackPanel extends StackPanel
   {
       
      
      public function HorizontalStackPanel()
      {
         super();
      }
      
      override protected function method_2619(param1:DisplayObject) : void
      {
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         if(items.length < 2)
         {
            height = param1.y + int(param1.height);
            width = param1.x + method_2620(param1);
            return;
         }
         var _loc3_:DisplayObject = items[items.length - 2];
         var _loc4_:int = method_2620(_loc3_);
         _loc5_ = method_2620(param1);
         _loc2_ = param1.x;
         param1.x = _loc3_.x + _loc4_ + method_2622() + _loc2_;
         height = Math.max(int(height),param1.y + int(param1.height));
         width = _loc3_.x + _loc4_ + method_2622() + _loc2_ + _loc5_;
      }
      
      override protected function method_2618(param1:int, param2:DisplayObject) : void
      {
         if(param1 <= 0)
         {
            width = 0;
            height = 0;
            return;
         }
         if(param1 == items.length)
         {
            height = this.method_2624();
            width = items[items.length - 1].x - method_2620(items[items.length - 1]);
            return;
         }
         var _loc3_:int = items[param1].x - param2.x;
         var _loc4_:int = param1;
         while(_loc4_ < items.length)
         {
            items[_loc4_].x -= _loc3_;
            _loc4_++;
         }
         width = items[items.length - 1].x + method_2620(items[items.length - 1]);
         height = this.method_2624();
      }
      
      private function method_2624() : int
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = 0;
         for each(_loc1_ in items)
         {
            _loc2_ = Math.max(_loc2_,_loc1_.y + _loc1_.height);
         }
         return _loc2_;
      }
   }
}
