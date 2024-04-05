package package_434
{
   import base.class_122;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import package_433.ItemViewCategoryEnum;
   
   public class CategoryButtonsList extends class_122
   {
      
      private static const const_2483:int = 5;
       
      
      private var var_2862:ItemViewCategoryEnum;
      
      private var buttons:Vector.<name_3206>;
      
      private var var_3202:Dictionary;
      
      private var var_3203:int;
      
      private var var_3204:int;
      
      private var var_3205:int = 100;
      
      public function CategoryButtonsList()
      {
         this.buttons = new Vector.<name_3206>();
         this.var_3202 = new Dictionary();
         super();
         this.method_2952(ItemViewCategoryEnum.WEAPON);
         this.method_2952(ItemViewCategoryEnum.ARMOR);
         this.method_2952(ItemViewCategoryEnum.RESISTANCE);
         this.method_2952(ItemViewCategoryEnum.PAINT);
         this.method_2952(ItemViewCategoryEnum.INVENTORY);
         this.method_2952(ItemViewCategoryEnum.KIT);
         this.method_2952(ItemViewCategoryEnum.SPECIAL);
         this.buttons[0].enabled = false;
         this.var_2862 = this.buttons[0].getCategory();
         this.method_2825();
      }
      
      public function name_1879(param1:ItemViewCategoryEnum) : void
      {
         this.var_3202[this.var_2862].enabled = true;
         this.var_3202[param1].enabled = false;
         this.var_2862 = param1;
         dispatchEvent(new name_2623(name_2623.name_2632,this.var_2862));
      }
      
      public function name_2200() : ItemViewCategoryEnum
      {
         return this.var_2862;
      }
      
      public function method_2954(param1:ItemViewCategoryEnum, param2:Boolean) : void
      {
         this.var_3202[param1].visible = param2;
         this.method_2825();
      }
      
      public function name_2633(param1:ItemViewCategoryEnum) : Boolean
      {
         return this.var_3202[param1].visible;
      }
      
      public function showNewItemIndicator(param1:ItemViewCategoryEnum) : void
      {
         this.var_3202[param1].showNewItemIndicator();
      }
      
      public function hideNewItemIndicator(param1:ItemViewCategoryEnum) : void
      {
         this.var_3202[param1].hideNewItemIndicator();
      }
      
      public function showDiscountIndicator(param1:ItemViewCategoryEnum) : void
      {
         this.var_3202[param1].showDiscountIndicator();
      }
      
      public function hideDiscountIndicator(param1:ItemViewCategoryEnum) : void
      {
         this.var_3202[param1].hideDiscountIndicator();
      }
      
      private function method_2952(param1:ItemViewCategoryEnum) : void
      {
         var _loc2_:name_3206 = new name_3206(param1);
         this.buttons.push(_loc2_);
         this.var_3202[param1] = _loc2_;
         _loc2_.addEventListener(MouseEvent.CLICK,this.method_1582);
         addChild(_loc2_);
      }
      
      private function method_2825() : void
      {
         var _loc1_:name_3206 = null;
         this.var_3203 = this.var_3204 = 0;
         for each(_loc1_ in this.buttons)
         {
            if(_loc1_.visible)
            {
               _loc1_.name_3207();
               this.var_3203 = Math.max(this.var_3203,_loc1_.width);
               _loc1_.name_3208();
               this.var_3204 = Math.max(this.var_3204,_loc1_.width);
            }
         }
         this.method_2953();
      }
      
      override public function get width() : Number
      {
         return this.var_3205;
      }
      
      override public function set width(param1:Number) : void
      {
         this.var_3205 = param1;
         this.method_2953();
      }
      
      private function method_2953() : void
      {
         var _loc1_:name_3206 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         for each(_loc1_ in this.buttons)
         {
            if(_loc1_.visible)
            {
               _loc4_++;
            }
         }
         _loc2_ = (this.var_3205 - (_loc4_ - 1) * 5) / _loc4_;
         if(_loc2_ >= this.var_3204)
         {
            _loc2_ = Math.min(_loc2_,this.var_3204 + 7);
         }
         else if(_loc2_ >= this.var_3203)
         {
            _loc2_ = Math.min(_loc2_,this.var_3203 + 14);
         }
         for each(_loc1_ in this.buttons)
         {
            if(_loc1_.visible)
            {
               if(this.var_3204 <= _loc2_)
               {
                  _loc1_.name_3208();
                  _loc1_.width = _loc2_;
               }
               else if(this.var_3203 <= _loc2_)
               {
                  _loc1_.name_3207();
                  _loc1_.width = _loc2_;
               }
               else
               {
                  _loc1_.name_3209();
               }
               _loc1_.x = _loc3_;
               _loc3_ += _loc1_.width;
               _loc3_ += 5;
            }
         }
      }
      
      private function method_1582(param1:MouseEvent) : void
      {
         if(param1.target is name_3206)
         {
            this.name_1879(name_3206(param1.target).getCategory());
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:name_3206 = null;
         for each(_loc1_ in this.buttons)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this.method_1582);
         }
         this.buttons = null;
         this.var_3202 = null;
      }
      
      public function name_2635() : ItemViewCategoryEnum
      {
         var _loc1_:name_3206 = null;
         for each(_loc1_ in this.buttons)
         {
            if(_loc1_.visible)
            {
               return _loc1_.getCategory();
            }
         }
         throw new Error("No category to show");
      }
   }
}
