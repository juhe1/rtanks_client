package controls.buttons
{
   import controls.buttons.h30px.H30ButtonSkin;
   import flash.display.Bitmap;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class class_201 extends class_163
   {
       
      
      protected var icon:Bitmap;
      
      public function class_201(param1:String, param2:Class)
      {
         super(new name_2717());
         enabled = true;
         method_1961 = H30ButtonSkin.name_2261;
         method_1962 = H30ButtonSkin.name_2260;
         method_1963 = H30ButtonSkin.name_2262;
         _label.align = TextFormatAlign.LEFT;
         _label.autoSize = TextFieldAutoSize.LEFT;
         _label.text = param1;
         this.icon = new param2();
         var_1783.addChild(this.icon);
         this.method_2896();
      }
      
      override public function set width(param1:Number) : void
      {
         if(_label.visible)
         {
            if(Boolean(this.icon) && this.icon.visible)
            {
               _label.x = 21 + (param1 - 21 - _label.width >> 1);
            }
            else
            {
               _label.x = param1 - _label.width >> 1;
            }
         }
         super.width = param1;
      }
      
      protected function method_2896() : void
      {
         this.icon.x = 30 - this.icon.bitmapData.width >> 1;
         this.icon.y = 30 - this.icon.bitmapData.height >> 1;
      }
   }
}
