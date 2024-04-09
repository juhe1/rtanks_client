package forms.battlelist
{
   import assets.name_2295;
   import controls.BigButton;
   import controls.base.LabelBase;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import utils.name_1986;
   
   public class name_2923 extends BigButton
   {
       
      
      private var var_2994:name_2295;
      
      private var var_2359:LabelBase;
      
      private var var_2995:int = 0;
      
      public function name_2923()
      {
         this.var_2994 = new name_2295();
         this.var_2359 = new LabelBase();
         super();
         addChild(this.var_2994);
         addChild(this.var_2359);
         this.var_2994.visible = this.var_2359.visible = false;
         label = "";
         _label.sharpness = name_1986.name_1988;
         _label.thickness = name_1986.name_1987;
         var_2222.sharpness = name_1986.name_1988;
         var_2222.thickness = name_1986.name_1987;
         this.var_2994.filters = this.var_2359.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
      }
      
      override public function set width(param1:Number) : void
      {
         _width = int(param1);
         var_1238.width = var_1239.width = var_1235.width = var_1237.width = _width;
         var_2222.width = _label.width = _width - 4;
         if(_icon.bitmapData != null)
         {
            _icon.x = 6;
            _icon.y = int(25 - _icon.height / 2);
            _label.width = _width - 8 - _icon.width;
            _label.x = _icon.width + 4;
            _label.y = this.var_2995 == 0 ? 16 : 6;
         }
         if(this.var_2995 > 0)
         {
            this.var_2994.visible = this.var_2359.visible = true;
            this.var_2994.x = _icon.width + 4 + (_label.width - _label.textWidth) / 2;
            this.var_2994.y = 26;
            this.var_2359.y = 22;
            this.var_2359.text = String(this.var_2995);
            this.var_2359.x = this.var_2994.x + this.var_2994.width;
         }
         else
         {
            this.var_2994.visible = this.var_2359.visible = false;
         }
      }
      
      public function set name_2928(param1:int) : void
      {
         this.var_2995 = param1;
         this.width = _width;
      }
      
      override protected function method_1470(param1:MouseEvent) : void
      {
         if(var_1240)
         {
            switch(param1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  setState(2);
                  _label.y = this.var_2995 == 0 ? 16 : 6;
                  this.var_2994.y = 26;
                  this.var_2359.y = 22;
                  break;
               case MouseEvent.MOUSE_OUT:
                  setState(1);
                  _label.y = this.var_2995 == 0 ? 16 : 6;
                  this.var_2994.y = 26;
                  this.var_2359.y = 22;
                  break;
               case MouseEvent.MOUSE_DOWN:
                  setState(3);
                  _label.y = this.var_2995 == 0 ? 17 : 7;
                  this.var_2994.y = 26;
                  this.var_2359.y = 23;
                  break;
               case MouseEvent.MOUSE_UP:
                  setState(1);
                  _label.y = this.var_2995 == 0 ? 16 : 6;
                  this.var_2994.y = 26;
                  this.var_2359.y = 22;
            }
            if(_icon != null)
            {
               _icon.y = int(25 - _icon.height / 2) + (param1.type == MouseEvent.MOUSE_DOWN ? 1 : 0);
            }
         }
      }
   }
}
