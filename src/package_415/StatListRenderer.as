package package_415
{
   import controls.Label;
   import controls.Money;
   import controls.Rank;
   import controls.rangicons.name_2924;
   import controls.statassets.name_3472;
   import controls.statassets.name_3473;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class StatListRenderer extends CellRenderer
   {
       
      
      protected var var_2684:DisplayObject;
      
      private var var_3477:DisplayObject;
      
      public function StatListRenderer()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         var _loc2_:DisplayObject = new name_3472();
         var _loc3_:DisplayObject = new name_3473();
         this.var_2684 = this.method_2586(_data);
         setStyle("upSkin",_loc2_);
         setStyle("downSkin",_loc2_);
         setStyle("overSkin",_loc2_);
         setStyle("selectedUpSkin",_loc3_);
         setStyle("selectedOverSkin",_loc3_);
         setStyle("selectedDownSkin",_loc3_);
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = _listData.label;
         if(this.var_2684 != null)
         {
            setStyle("icon",this.var_2684);
         }
      }
      
      protected function bg(param1:Boolean) : DisplayObject
      {
         return new Sprite();
      }
      
      protected function method_2586(param1:Object) : Sprite
      {
         var _loc2_:Sprite = null;
         var _loc3_:Label = null;
         var _loc4_:name_2924 = null;
         var _loc5_:Label = null;
         var _loc6_:Label = null;
         var _loc7_:Label = null;
         var _loc10_:int = 0;
         _loc2_ = new Sprite();
         _loc3_ = new Label();
         _loc4_ = new name_2924(_data.rank);
         _loc5_ = new Label();
         _loc6_ = new Label();
         _loc3_.autoSize = TextFieldAutoSize.NONE;
         _loc3_.align = TextFormatAlign.RIGHT;
         _loc3_.width = 45;
         _loc3_.text = _data.pos < 0 ? " " : String(_data.pos);
         _loc2_.addChild(_loc3_);
         if(_data.rank > 0)
         {
            _loc4_.y = 3;
            _loc4_.x = 53;
            _loc2_.addChild(_loc4_);
            _loc5_.text = Rank.name(int(_data.rank));
            _loc5_.x = 63;
            _loc2_.addChild(_loc5_);
         }
         _loc6_.autoSize = TextFieldAutoSize.NONE;
         _loc6_.height = 18;
         _loc6_.text = _data.callsign;
         _loc6_.selectable = true;
         _loc6_.x = 178;
         _loc6_.width = _width - 520;
         _loc2_.addChild(_loc6_);
         _loc10_ = int(_width - 375);
         _loc7_ = new Label();
         _loc7_.autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 60;
         _loc7_.x = _loc10_;
         _loc7_.text = _data.score > -1 ? Money.name_876(_data.score,false) : " ";
         _loc2_.addChild(_loc7_);
         _loc10_ += 60;
         _loc7_ = new Label();
         _loc7_.autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 70;
         _loc7_.x = _loc10_;
         _loc7_.text = _data.kills > -1 ? Money.name_876(_data.kills,false) : " ";
         _loc2_.addChild(_loc7_);
         _loc10_ += 70;
         _loc7_ = new Label();
         _loc7_.autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 50;
         _loc7_.x = _loc10_;
         _loc7_.text = _data.deaths > -1 ? Money.name_876(_data.deaths,false) : " ";
         _loc2_.addChild(_loc7_);
         _loc10_ += 50;
         _loc7_ = new Label();
         _loc7_.autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 40;
         _loc7_.x = _loc10_;
         _loc7_.text = _data.ratio > -1 ? Money.name_876(_data.ratio) : (_data.ratio == -11 ? " " : "—");
         _loc2_.addChild(_loc7_);
         _loc10_ += 40;
         _loc7_ = new Label();
         _loc7_.autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 65;
         _loc7_.x = _loc10_;
         _loc7_.htmlText = _data.wealth > -1 ? Money.name_876(_data.wealth,false) : " ";
         _loc2_.addChild(_loc7_);
         _loc10_ += 75;
         _loc7_ = new Label();
         _loc7_.autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 69;
         _loc7_.x = _loc10_;
         _loc7_.text = _data.rating > -1 ? Money.name_876(_data.rating) : " ";
         _loc2_.addChild(_loc7_);
         return _loc2_;
      }
      
      override protected function drawBackground() : void
      {
         var _loc1_:String = enabled ? mouseState : "disabled";
         if(selected)
         {
            _loc1_ = "selected" + _loc1_.substr(0,1).toUpperCase() + _loc1_.substr(1);
         }
         _loc1_ += "Skin";
         var _loc2_:DisplayObject = background;
         background = getDisplayObjectInstance(getStyleValue(_loc1_));
         addChildAt(background,0);
         if(_loc2_ != null && _loc2_ != background)
         {
            removeChild(_loc2_);
         }
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
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
