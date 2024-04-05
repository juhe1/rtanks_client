package alternativa.tanks.gui
{
   import assets.name_2295;
   import controls.DefaultButton;
   import flash.events.MouseEvent;
   
   public class name_2293 extends DefaultButton
   {
      
      private static var var_1841:name_2295 = new name_2295();
       
      
      private var var_2978:int;
      
      private var var_1240:Boolean = true;
      
      public function name_2293()
      {
         super();
         addChild(var_1841);
         var_1841.y = 10;
      }
      
      public function set method_2782(param1:int) : void
      {
         this.var_2978 = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = int(param1);
         var_1238.width = var_1239.width = var_1235.width = var_1237.width = this.width;
         _label.width = this.width - 4 - var_1841.width;
      }
      
      override public function get width() : Number
      {
         return super.width;
      }
      
      override public function set label(param1:String) : void
      {
         super.label = param1;
         var_1841.x = _label.textWidth + (_label.width - _label.textWidth) / 2 + 7;
      }
      
      override protected function method_1470(param1:MouseEvent) : void
      {
         if(this.var_1240)
         {
            switch(param1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  setState(2);
                  _label.y = 6;
                  var_1841.y = 10;
                  break;
               case MouseEvent.MOUSE_OUT:
                  setState(1);
                  _label.y = 6;
                  var_1841.y = 10;
                  break;
               case MouseEvent.MOUSE_DOWN:
                  setState(3);
                  _label.y = 7;
                  var_1841.y = 11;
                  break;
               case MouseEvent.MOUSE_UP:
                  setState(1);
                  _label.y = 6;
                  var_1841.y = 10;
            }
         }
      }
      
      override public function set enable(param1:Boolean) : void
      {
         this.var_1240 = param1;
         if(this.var_1240)
         {
            method_1472();
         }
         else
         {
            method_91();
         }
      }
      
      override public function get enable() : Boolean
      {
         return this.var_1240;
      }
   }
}
