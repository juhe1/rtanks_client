package controls.dropdownlist
{
   import assets.combo.name_2780;
   import controls.base.name_1134;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   
   public class ComboBoxRenderer extends CellRenderer
   {
       
      
      private var var_2684:DisplayObject;
      
      private var var_2685:Bitmap;
      
      private var var_2683:name_2780;
      
      public function ComboBoxRenderer()
      {
         this.var_2683 = new name_2780();
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         this.var_2685 = new Bitmap(new BitmapData(1,1,true,0));
         _data = param1;
         setStyle("upSkin",this.var_2685);
         setStyle("downSkin",this.var_2683);
         setStyle("overSkin",this.var_2683);
         setStyle("selectedUpSkin",this.var_2685);
         setStyle("selectedOverSkin",this.var_2683);
         setStyle("selectedDownSkin",this.var_2683);
      }
      
      protected function method_2586(param1:Object) : Sprite
      {
         var _loc2_:Sprite = null;
         var _loc3_:name_1134 = null;
         _loc2_ = null;
         _loc3_ = null;
         _loc2_ = new Sprite();
         _loc3_ = new name_1134();
         _loc3_.autoSize = TextFieldAutoSize.NONE;
         _loc3_.color = 16777215;
         _loc3_.alpha = 1;
         _loc3_.text = param1.gameName;
         _loc3_.height = 20;
         _loc3_.width = _width - 20;
         _loc3_.x = -3;
         _loc3_.y = 0;
         _loc2_.addChild(_loc3_);
         return _loc2_;
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = "";
         this.var_2684 = this.method_2586(_data);
         if(this.var_2684 != null)
         {
            setStyle("icon",this.var_2684);
         }
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
         background.width = width - 6;
         background.height = height;
      }
      
      override protected function drawIcon() : void
      {
         var _loc1_:DisplayObject = icon;
         var _loc2_:String = enabled ? mouseState : "disabled";
         if(selected)
         {
            _loc2_ = "selected" + _loc2_.substr(0,1).toUpperCase() + _loc2_.substr(1);
         }
         _loc2_ += "Icon";
         var _loc3_:Object = getStyleValue(_loc2_);
         if(_loc3_ == null)
         {
            _loc3_ = getStyleValue("icon");
         }
         if(_loc3_ != null)
         {
            icon = getDisplayObjectInstance(_loc3_);
         }
         if(icon != null)
         {
            addChildAt(icon,1);
         }
         if(_loc1_ != null && _loc1_ != icon && _loc1_.parent == this)
         {
            removeChild(_loc1_);
         }
      }
   }
}
