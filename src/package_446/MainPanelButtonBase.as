package package_446
{
   import controls.base.name_1134;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class MainPanelButtonBase extends class_210
   {
      
      private static const const_2637:int = 4;
       
      
      private var var_3412:name_1134;
      
      private var var_3413:BitmapData;
      
      public function MainPanelButtonBase(param1:Class)
      {
         this.var_3413 = new param1().bitmapData;
         _icon = new Bitmap(this.var_3413);
         method_3075(3,2);
         super();
         this.var_3412 = new name_1134();
         this.var_3412.x = 18;
         this.var_3412.y = 4;
         this.var_3412.width = this.width - 18;
         this.var_3412.autoSize = TextFieldAutoSize.CENTER;
         this.var_3412.mouseEnabled = false;
         addChild(this.var_3412);
      }
      
      override public function set label(param1:String) : void
      {
         this.var_3412.text = param1;
      }
      
      override protected function method_1470(param1:MouseEvent) : void
      {
         super.method_1470(param1);
         var _loc2_:int = param1.type == MouseEvent.MOUSE_DOWN ? int(1) : int(0);
         this.var_3412.y = 4 + _loc2_;
      }
   }
}
