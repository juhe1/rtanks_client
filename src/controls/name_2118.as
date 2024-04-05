package controls
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   
   public class name_2118 extends DefaultButton
   {
       
      
      protected var _icon:Bitmap;
      
      private var var_2780:BitmapData;
      
      private var var_2782:BitmapData;
      
      private var var_2781:BitmapData;
      
      public function name_2118(param1:BitmapData, param2:BitmapData, param3:BitmapData)
      {
         super();
         this.icon = param1;
         this.var_2780 = param1;
         this.var_2782 = param2;
         this.var_2781 = param3;
         this.width = 70;
         removeChild(var_1237);
         removeChild(var_1238);
         removeChild(var_1239);
         removeChild(var_1235);
      }
      
      public function set icon(param1:BitmapData) : void
      {
         this._icon = new Bitmap(param1);
         addChild(this._icon);
         this._icon.x = 3;
         this._icon.y = 3;
         this.width = _width;
      }
      
      override public function set width(param1:Number) : void
      {
         _width = int(param1);
         var_1238.width = var_1239.width = var_1235.width = var_1237.width = _width;
         if(this._icon != null)
         {
            _label.x = 20;
            _label.width = _width - 22;
         }
         else
         {
            _label.x = 2;
            _label.width = _width - 4;
         }
      }
      
      override protected function method_1470(param1:MouseEvent) : void
      {
         if(enable)
         {
            switch(param1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  setState(2);
                  this.icon = this.var_2782;
                  break;
               case MouseEvent.MOUSE_OUT:
                  setState(1);
                  this.icon = this.var_2780;
                  break;
               case MouseEvent.MOUSE_DOWN:
                  setState(3);
                  this.icon = this.var_2781;
                  break;
               case MouseEvent.MOUSE_UP:
                  setState(1);
                  this.icon = this.var_2780;
            }
         }
      }
   }
}
