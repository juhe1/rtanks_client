package package_263
{
   import controls.base.name_1134;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import forms.name_1139;
   
   public class name_2147 extends Sprite
   {
       
      
      private var const_1718:GlowFilter;
      
      private var var_2806:Array;
      
      protected var _label:name_1134;
      
      private var var_639:Boolean;
      
      public function name_2147()
      {
         this.const_1718 = new GlowFilter(5898034,0.9,4,4,0);
         this.var_2806 = [this.const_1718];
         super();
         this.init();
      }
      
      protected function init() : void
      {
         this.tabChildren = false;
         this.tabEnabled = false;
         this._label = new name_1134();
         this._label.mouseEnabled = false;
         this._label.autoSize = TextFieldAutoSize.LEFT;
         addChild(this._label);
         useHandCursor = true;
         buttonMode = true;
         this.locked = false;
      }
      
      private function method_1568() : void
      {
         if(!hasEventListener(MouseEvent.MOUSE_OVER))
         {
            addEventListener(MouseEvent.MOUSE_OVER,this.method_1530);
         }
         if(!hasEventListener(MouseEvent.MOUSE_OUT))
         {
            addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
      }
      
      private function method_1476() : void
      {
         if(hasEventListener(MouseEvent.MOUSE_OVER))
         {
            removeEventListener(MouseEvent.MOUSE_OVER,this.method_1530);
         }
         if(hasEventListener(MouseEvent.MOUSE_OUT))
         {
            removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
      }
      
      public function destroy() : void
      {
         this.method_1476();
         if(this._label != null && this.contains(this._label))
         {
            removeChild(this._label);
         }
         this._label = null;
      }
      
      private function method_1530(param1:MouseEvent) : void
      {
         this.const_1718.strength = 1;
         filters = this.var_2806;
      }
      
      private function onMouseOut(param1:MouseEvent = null) : void
      {
         this.const_1718.strength = 0;
         filters = this.var_2806;
      }
      
      public function set text(param1:String) : void
      {
         this._label.text = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_639;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_639 = param1;
         if(this.var_639)
         {
            this.method_1476();
            this.onMouseOut();
         }
         else
         {
            this.method_1568();
         }
         mouseChildren = mouseEnabled = !this.var_639;
         this._label.color = this.var_639 ? uint(uint(name_1139.name_2149)) : uint(uint(name_1139.name_2151));
      }
   }
}
