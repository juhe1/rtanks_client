package package_432
{
   import base.class_122;
   import package_466.name_3184;
   
   public class ItemsCategoryViewGrid extends class_122
   {
       
      
      public var columnCount:int = 3;
      
      public var name_2617:int = 3;
      
      public var var_3162:int = 3;
      
      public var items:Vector.<name_3184>;
      
      public function ItemsCategoryViewGrid()
      {
         super();
         this.items = new Vector.<name_3184>();
      }
      
      public function addItem(param1:name_3184) : void
      {
         this.items.push(param1);
         addChild(param1);
      }
      
      public function render() : void
      {
         var _loc1_:name_3184 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         for each(_loc1_ in this.items)
         {
            if(_loc1_.name_3186 || _loc2_ + _loc1_.name_3185 > this.columnCount)
            {
               _loc2_ = 0;
               _loc3_ = 0;
               _loc4_ += this.var_3162 + _loc5_;
               _loc5_ = 0;
            }
            _loc2_ += _loc1_.name_3185;
            _loc1_.x = _loc3_;
            _loc1_.y = _loc4_;
            _loc3_ += _loc1_.width + this.name_2617;
            if(_loc1_.height > _loc5_)
            {
               _loc5_ = _loc1_.height;
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:name_3184 = null;
         for each(_loc1_ in this.items)
         {
            _loc1_.destroy();
         }
         this.items = null;
      }
      
      public function set method_2926(param1:int) : void
      {
         this.name_2617 = param1;
         this.var_3162 = param1;
      }
   }
}
