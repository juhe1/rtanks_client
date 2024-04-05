package controls.dropdownlist
{
   import controls.base.name_1134;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   
   public class AccountsRenderer extends ComboR
   {
      
      private static var var_3748:Class = name_3729;
      
      private static var var_3749:BitmapData = new var_3748().bitmapData;
       
      
      public function AccountsRenderer()
      {
         super();
      }
      
      override protected function method_2586(param1:Object) : Sprite
      {
         var _loc2_:name_1134 = null;
         var _loc3_:Sprite = null;
         _loc2_ = null;
         _loc3_ = new Sprite();
         _loc2_ = new name_1134();
         _loc2_.autoSize = TextFieldAutoSize.NONE;
         _loc2_.color = 16777215;
         _loc2_.alpha = param1.rang > 0 ? Number(0.5) : Number(1);
         _loc2_.text = param1.gameName;
         _loc2_.height = AccountsList.name_2570;
         _loc2_.width = _width - 20;
         _loc2_.x -= 5;
         _loc3_.addChild(_loc2_);
         var _loc4_:DeleteIndicator = new DeleteIndicator(param1);
         _loc4_.x = _loc3_.width - _loc4_.width + 5;
         _loc3_.addChild(_loc4_);
         tabEnabled = false;
         mouseEnabled = false;
         mouseChildren = true;
         return _loc3_;
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:Bitmap = new Bitmap(new BitmapData(1,1,true,0));
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginBitmapFill(var_3749);
         _loc3_.graphics.drawRect(0,0,1,18);
         _loc3_.graphics.endFill();
         _data = param1;
         setStyle("upSkin",_loc2_);
         setStyle("downSkin",_loc3_);
         setStyle("overSkin",_loc3_);
         setStyle("selectedUpSkin",_loc2_);
         setStyle("selectedOverSkin",_loc3_);
         setStyle("selectedDownSkin",_loc3_);
      }
   }
}
