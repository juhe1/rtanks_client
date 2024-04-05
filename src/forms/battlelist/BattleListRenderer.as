package forms.battlelist
{
   import controls.cellrenderer.name_2766;
   import controls.cellrenderer.name_3432;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import package_476.name_3431;
   import package_476.name_3433;
   import package_477.name_2765;
   import package_478.name_3430;
   
   public class BattleListRenderer extends CellRenderer
   {
       
      
      private var var_3478:Boolean = true;
      
      private var var_2684:DisplayObject;
      
      private var var_3477:DisplayObject;
      
      private var isFull:Boolean;
      
      public function BattleListRenderer()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         this.var_3478 = param1.accessible;
         this.var_2684 = param1.iconNormal;
         this.var_3477 = param1.iconSelected;
         this.isFull = param1.isFull;
         this.method_3124();
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = _listData.label;
         if(this.var_2684 != null && this.var_3477 != null)
         {
            setStyle("icon",this.var_2684);
            setStyle("selectedUpIcon",this.var_3477);
            setStyle("selectedOverIcon",this.var_3477);
            setStyle("selectedDownIcon",this.var_3477);
         }
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
      
      private function method_3124() : void
      {
         if(this.var_3478)
         {
            if(this.isFull)
            {
               setStyle("upSkin",name_3433);
               setStyle("overSkin",name_3433);
               setStyle("downSkin",name_3433);
               setStyle("selectedUpSkin",name_3431);
               setStyle("selectedOverSkin",name_3431);
               setStyle("selectedDownSkin",name_3431);
            }
            else
            {
               setStyle("upSkin",name_2766);
               setStyle("overSkin",name_2766);
               setStyle("downSkin",name_2766);
               setStyle("selectedUpSkin",name_2765);
               setStyle("selectedOverSkin",name_2765);
               setStyle("selectedDownSkin",name_2765);
            }
         }
         else
         {
            setStyle("upSkin",name_3432);
            setStyle("overSkin",name_3432);
            setStyle("downSkin",name_3432);
            setStyle("selectedUpSkin",name_3430);
            setStyle("selectedOverSkin",name_3430);
            setStyle("selectedDownSkin",name_3430);
         }
      }
   }
}
