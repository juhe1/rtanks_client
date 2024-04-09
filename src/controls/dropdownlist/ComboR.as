package controls.dropdownlist
{
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   
   public class ComboR extends ComboBoxRenderer
   {
       
      
      public function ComboR()
      {
         super();
      }
      
      override protected function method_2586(param1:Object) : Sprite
      {
         var _loc2_:LabelBase = null;
         var _loc3_:SmallRankIcon = null;
         var _loc4_:Sprite = new Sprite();
         _loc2_ = new LabelBase();
         _loc2_.autoSize = TextFieldAutoSize.NONE;
         _loc2_.color = 16777215;
         _loc2_.alpha = param1.rang > 0 ? Number(0.5) : Number(1);
         _loc2_.text = param1.gameName;
         _loc2_.height = 20;
         _loc2_.width = _width - 20;
         _loc2_.y = 0;
         if(param1.rang > 0)
         {
            _loc3_ = new SmallRankIcon(param1.rang);
            _loc3_.x = -2;
            _loc3_.y = 2;
            _loc4_.addChild(_loc3_);
            _loc2_.x = 12;
         }
         else
         {
            _loc2_.x = -3;
         }
         _loc4_.addChild(_loc2_);
         return _loc4_;
      }
   }
}
