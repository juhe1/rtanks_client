package controls
{
   import assets.icons.name_2294;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.GridFitType;
   
   [Embed(source="/_assets/assets.swf", symbol="controls.name_2021")]
   public class name_2021 extends MovieClip
   {
      
      public static const const_2089:int = 1;
      
      public static const const_2092:int = 2;
      
      public static const const_2096:int = 3;
      
      public static const const_2087:int = 4;
      
      public static const const_2091:int = 5;
      
      public static const const_2093:int = 6;
      
      public static const INVENTORY:int = 7;
       
      
      public var _typeIcon:name_2294;
      
      private var var_2679:name_2294;
      
      private var var_2425:int;
      
      private var var_2681:Boolean = false;
      
      private var _label:Label;
      
      private var var_1240:Boolean = true;
      
      public function name_2021()
      {
         super();
         this.var_2679 = getChildByName("_typeIcon") as name_2294;
         this.type = 4;
         tabEnabled = false;
         this.method_530();
         gotoAndStop(1);
         this.enable = true;
         this._label = new Label();
         this._label.x = 29;
         this._label.y = 7;
         this._label.gridFitType = GridFitType.SUBPIXEL;
         addChild(this._label);
      }
      
      public function get checked() : Boolean
      {
         return this.var_2681;
      }
      
      public function set checked(param1:Boolean) : void
      {
         this.var_2681 = param1;
         this.method_530();
      }
      
      public function set enable(param1:Boolean) : void
      {
         this.var_1240 = param1;
         if(this.var_1240)
         {
            this.method_1472();
         }
         else
         {
            this.method_91();
         }
      }
      
      public function set label(param1:String) : void
      {
         this._label.text = param1;
      }
      
      private function method_1472() : void
      {
         gotoAndStop(1);
         buttonMode = true;
         mouseEnabled = true;
         addEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         addEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         addEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      private function method_91() : void
      {
         gotoAndStop(4);
         buttonMode = false;
         mouseEnabled = false;
         removeEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         removeEventListener(MouseEvent.MOUSE_UP,this.method_1470);
      }
      
      public function set type(param1:int) : void
      {
         this.var_2425 = param1;
         this.var_2679.type = this.var_2425;
      }
      
      private function method_1470(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               gotoAndStop(2);
               this.var_2679.y = 0;
               break;
            case MouseEvent.MOUSE_OUT:
               gotoAndStop(1);
               this.var_2679.y = 0;
               break;
            case MouseEvent.MOUSE_DOWN:
               gotoAndStop(3);
               this.var_2679.y = 1;
               break;
            case MouseEvent.MOUSE_UP:
               gotoAndStop(2);
               this.var_2681 = !this.var_2681;
               this.method_530();
               this.var_2679.y = 0;
         }
      }
      
      private function method_530() : void
      {
         this.var_2679.visible = this.var_2681;
      }
   }
}
