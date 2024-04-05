package package_415
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.battlelist.name_2923;
   
   public class ReferralWindowBigButton extends name_2923
   {
      
      private static const const_2287:Class = name_3004;
      
      private static const green:BitmapData = new const_2287().bitmapData;
       
      
      private var var_2996:int;
      
      public function ReferralWindowBigButton()
      {
         super();
         _label.size = 12;
         _label.color = 52238;
         _label.multiline = true;
         _label.align = TextFormatAlign.LEFT;
         _label.autoSize = TextFieldAutoSize.LEFT;
         _label.wordWrap = true;
         this.width = 156;
         var _loc1_:Bitmap = new Bitmap(green);
         _loc1_.y = 7;
         _loc1_.x = 7;
         addChildAt(_loc1_,getChildIndex(_label));
      }
      
      override public function set label(param1:String) : void
      {
         super.label = param1;
         this.var_2996 = 24 - _label.textHeight / 2;
         this.width = _width;
      }
      
      override public function set width(param1:Number) : void
      {
         _width = int(param1);
         var_1238.width = var_1239.width = var_1235.width = var_1237.width = _width;
         if(_icon.bitmapData != null)
         {
            _icon.x = 12;
            _icon.y = int(27 - _icon.height / 2);
            _label.width = _width - 8 - _icon.width;
            _label.x = _icon.width + 14;
            _label.y = this.var_2996;
         }
      }
      
      override protected function method_1470(param1:MouseEvent) : void
      {
         if(var_1240)
         {
            switch(param1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  setState(2);
                  _label.y = this.var_2996;
                  break;
               case MouseEvent.MOUSE_OUT:
                  setState(1);
                  _label.y = this.var_2996;
                  break;
               case MouseEvent.MOUSE_DOWN:
                  setState(3);
                  _label.y = this.var_2996 + 1;
                  break;
               case MouseEvent.MOUSE_UP:
                  setState(1);
                  _label.y = this.var_2996;
            }
            if(_icon != null)
            {
               _icon.y = int(27 - _icon.height / 2) + (param1.type == MouseEvent.MOUSE_DOWN ? 1 : 0);
            }
         }
      }
   }
}
