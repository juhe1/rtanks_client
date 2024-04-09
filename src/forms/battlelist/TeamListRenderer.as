package forms.battlelist
{
   import assets.cellrenderer.battlelist.*;
   import controls.base.LabelBase;
   import controls.name_1932;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import forms.name_1139;
   import package_1.Main;
   import package_390.name_1889;
   import package_54.name_102;
   import package_60.TextConst;
   import var_5.name_269;
   
   public class TeamListRenderer extends CellRenderer
   {
       
      
      private var format:TextFormat;
      
      private var var_2684:DisplayObject;
      
      private var var_3474:name_1932;
      
      private var var_3473:name_1932;
      
      private var var_3472:name_1932;
      
      private var var_2939:String;
      
      public function TeamListRenderer()
      {
         this.var_3474 = new class_205();
         this.var_3473 = new name_3418();
         this.var_3472 = new name_3417();
         var _loc1_:name_102 = Main.osgi.getService(name_102) as name_102;
         super();
         this.format = name_269.method_775(13);
         this.format.color = 16777215;
         setStyle("textFormat",this.format);
         setStyle("embedFonts",name_269.method_774());
         this.var_2939 = _loc1_.getText(TextConst.BATTLEINFO_PANEL_NONAME_TEXT);
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:name_1932 = null;
         _data = param1;
         this.mouseChildren = true;
         this.buttonMode = this.useHandCursor = true;
         this.var_2684 = this.method_2586(_data);
         switch(_data.style)
         {
            case "green":
               _loc2_ = this.var_3474;
               break;
            case "red":
               _loc2_ = this.var_3473;
               break;
            case "blue":
               _loc2_ = this.var_3472;
         }
         setStyle("upSkin",_loc2_);
         setStyle("downSkin",_loc2_);
         setStyle("overSkin",_loc2_);
         setStyle("selectedUpSkin",_loc2_);
         setStyle("selectedOverSkin",_loc2_);
         setStyle("selectedDownSkin",_loc2_);
      }
      
      private function method_2586(param1:Object) : Sprite
      {
         var _loc2_:Sprite = null;
         var _loc4_:LabelBase = null;
         _loc2_ = new Sprite();
         var _loc3_:name_1889 = null;
         _loc4_ = null;
         var _loc5_:LabelBase = null;
         if(_width < 0)
         {
            _width = 20;
         }
         if(param1.playerName != "")
         {
            _loc3_ = new name_1889(param1.playerName);
            if(Boolean(param1.suspicious))
            {
               _loc3_.name_2046(name_1139.name_1151,true);
            }
            else
            {
               _loc3_.name_2046(name_1139.name_2012);
            }
            _loc3_.x = -4;
            _loc3_.y = 0;
            _loc2_.addChild(_loc3_);
            _loc4_ = new LabelBase();
            _loc4_.mouseEnabled = false;
            _loc4_.color = 16777215;
            _loc4_.autoSize = TextFieldAutoSize.NONE;
            _loc4_.align = TextFormatAlign.RIGHT;
            _loc4_.text = param1.playerName == "" ? " " : String(param1.kills);
            _loc4_.height = 20;
            _loc4_.width = 120;
            _loc4_.x = _width - 135;
            _loc4_.y = 0;
            _loc2_.addChild(_loc4_);
         }
         else
         {
            (_loc5_ = new LabelBase()).text = this.var_2939;
            _loc5_.alpha = 0.5;
            _loc5_.x = 10;
            _loc2_.addChild(_loc5_);
         }
         return _loc2_;
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = "";
         if(this.var_2684 != null)
         {
            setStyle("icon",this.var_2684);
         }
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
         background.width = width - 4;
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
