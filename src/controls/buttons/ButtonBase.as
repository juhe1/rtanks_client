package controls.buttons
{
   import base.class_122;
   import controls.Label;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.Dictionary;
   import utils.name_1986;
   
   public class ButtonBase extends class_122
   {
       
      
      private var var_1790:int = 15;
      
      private var var_1789:int = 24;
      
      private var var_1788:int = 14;
      
      private var _enabled:Boolean;
      
      private var var_1791:DisplayObject;
      
      private var var_1786:DisplayObject;
      
      private var var_1785:DisplayObject;
      
      private var var_1787:DisplayObject;
      
      protected var _label:Label;
      
      protected var var_1783:class_122;
      
      private var var_1782:Dictionary;
      
      private var var_1784:name_2255;
      
      public function ButtonBase(param1:DisplayObject, param2:DisplayObject, param3:DisplayObject, param4:DisplayObject)
      {
         this._label = new Label();
         this.var_1783 = new class_122();
         this.var_1782 = new Dictionary();
         this.var_1784 = name_2255.UP;
         super();
         this.var_1791 = param1;
         this.var_1786 = param2;
         this.var_1785 = param3;
         this.var_1787 = param4;
         this._enabled = true;
         addChild(param1);
         addChild(param2);
         addChild(param3);
         addChild(param4);
         addChild(this.var_1783);
         this.var_1783.addChild(this._label);
         this.var_1783.mouseEnabled = false;
         this.var_1783.mouseChildren = false;
         this._label.align = TextFormatAlign.CENTER;
         this._label.autoSize = TextFieldAutoSize.NONE;
         this._label.selectable = false;
         this._label.x = 2;
         this._label.y = this.var_1790;
         this._label.height = this.var_1789;
         this._label.size = this.var_1788;
         this._label.mouseEnabled = false;
         this._label.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
         this._label.sharpness = name_1986.name_1988;
         this._label.thickness = name_1986.name_1987;
         param1.visible = true;
         param2.visible = false;
         param3.visible = false;
         param4.visible = false;
         this.var_1782[name_2255.UP] = param1;
         this.var_1782[name_2255.DOWN] = param3;
         this.var_1782[name_2255.OVER] = param2;
         this.var_1782[name_2255.name_2256] = param4;
         addEventListener(MouseEvent.MOUSE_OVER,this.method_1470);
         addEventListener(MouseEvent.MOUSE_OUT,this.method_1470);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_1470);
         addEventListener(MouseEvent.MOUSE_UP,this.method_1470);
         this.width = 120;
      }
      
      override public function set width(param1:Number) : void
      {
         param1 = int(param1);
         this.var_1791.width = param1;
         this.var_1786.width = param1;
         this.var_1785.width = param1;
         this.var_1787.width = param1;
         this._label.width = param1 - 4;
      }
      
      public function set label(param1:String) : void
      {
         this._label.text = param1;
      }
      
      public function get label() : String
      {
         return this._label.text;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
         buttonMode = this._enabled;
         mouseEnabled = this._enabled;
         mouseChildren = this._enabled;
         if(this._enabled)
         {
            this.setState(name_2255.UP);
            this.onEnable();
         }
         else
         {
            this.setState(name_2255.name_2256);
            this.onDisable();
         }
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function setState(param1:name_2255) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:DisplayObject = null;
         if(this.var_1784 != param1)
         {
            _loc2_ = this.var_1782[this.var_1784];
            _loc3_ = this.var_1782[param1];
            this.var_1784 = param1;
            _loc3_.visible = true;
            _loc2_.visible = false;
            this.method_1960();
         }
      }
      
      protected function method_1470(param1:MouseEvent) : void
      {
         if(this._enabled)
         {
            switch(param1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  this.setState(name_2255.OVER);
                  break;
               case MouseEvent.MOUSE_OUT:
               case MouseEvent.MOUSE_UP:
                  this.setState(name_2255.UP);
                  break;
               case MouseEvent.MOUSE_DOWN:
                  this.setState(name_2255.DOWN);
            }
         }
      }
      
      public function method_1174() : name_2255
      {
         return this.var_1784;
      }
      
      protected function method_1960() : void
      {
         this.var_1783.y = this.method_1174() == name_2255.DOWN || !this.enabled ? Number(1) : Number(0);
      }
      
      protected function onEnable() : void
      {
      }
      
      protected function onDisable() : void
      {
      }
      
      public function set method_1963(param1:int) : void
      {
         this.var_1790 = param1;
         this._label.y = param1;
      }
      
      public function set method_1962(param1:int) : void
      {
         this.var_1789 = param1;
         this._label.height = param1;
      }
      
      public function set method_1961(param1:int) : void
      {
         this.var_1788 = param1;
         this._label.size = param1;
      }
   }
}
