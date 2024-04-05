package package_316
{
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class PartsListRenderer extends CellRenderer implements IResourceLoadingListener
   {
      
      private static var defaultStyles:Object = {
         "upSkin":null,
         "downSkin":null,
         "overSkin":null,
         "disabledSkin":null,
         "selectedDisabledSkin":null,
         "selectedUpSkin":null,
         "selectedDownSkin":null,
         "selectedOverSkin":null,
         "textFormat":null,
         "disabledTextFormat":null,
         "embedFonts":null,
         "textPadding":5
      };
       
      
      private var var_2684:DisplayObject;
      
      private var var_3477:DisplayObject;
      
      public function PartsListRenderer()
      {
         super();
         this.buttonMode = true;
         this.useHandCursor = true;
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         this.var_2684 = param1.iconNormal;
         this.var_3477 = param1.iconSelected;
      }
      
      override public function set listData(param1:ListData) : void
      {
         var _loc2_:ImageResource = _data.dat.preview as ImageResource;
         if(_loc2_ != null)
         {
            if(_loc2_.data == null)
            {
               _loc2_.loadLazyResource(this);
            }
         }
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
      }
      
      override protected function drawLayout() : void
      {
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
      
      public function onResourceLoadingStart(param1:Resource) : void
      {
      }
      
      public function method_3213(param1:Resource, param2:int) : void
      {
      }
      
      public function onResourceLoadingComplete(param1:Resource) : void
      {
      }
      
      public function onResourceLoadingError(param1:Resource, param2:String) : void
      {
      }
      
      public function onResourceLoadingFatalError(param1:Resource, param2:String) : void
      {
      }
   }
}
