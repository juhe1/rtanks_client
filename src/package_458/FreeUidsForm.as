package package_458
{
   import controls.base.name_1134;
   import controls.dropdownlist.DPLBackground;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import package_1.Main;
   import package_12.name_24;
   import package_12.name_529;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class FreeUidsForm extends Sprite
   {
      
      public static var display:name_529 = Main.osgi.name_6(name_24) as name_529;
      
      public static var localeService:name_102 = Main.osgi.name_6(name_102) as name_102;
      
      public static const const_1475:int = 200;
      
      public static const const_2723:int = 137;
      
      public static const const_2720:int = 6;
      
      public static const const_2721:int = 3;
      
      public static const const_2722:int = 36;
       
      
      private var var_1445:DPLBackground;
      
      private var _label:name_1134;
      
      private var _items:Array;
      
      private var var_3515:int = -1;
      
      private var _width:int = 200;
      
      public function FreeUidsForm()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.visible = false;
         this._items = [];
         this.var_1445 = new DPLBackground(this._width,137);
         addChild(this.var_1445);
         this._label = new name_1134();
         this._label.width = this._width;
         this._label.text = localeService.getText(TextConst.const_339);
         this._label.x = 6;
         this._label.y = 3;
         addChild(this._label);
      }
      
      public function create(param1:Vector.<String>) : void
      {
         var _loc2_:name_3469 = null;
         this.destroy();
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = new name_3469(this._width,_loc4_,param1[_loc4_]);
            if(_loc4_ == 0)
            {
               _loc2_.y = 36;
            }
            else
            {
               _loc2_.y = this._items[_loc4_ - 1].y + this._items[_loc4_ - 1].height;
            }
            _loc2_.addEventListener(MouseEvent.ROLL_OVER,this.method_3152);
            _loc2_.addEventListener(MouseEvent.ROLL_OUT,this.method_3155);
            _loc2_.addEventListener(MouseEvent.CLICK,this.method_3153);
            addChild(_loc2_);
            this._items.push(_loc2_);
            _loc4_++;
         }
         this.selectedItemIndex = 0;
         this.show();
      }
      
      private function method_3152(param1:MouseEvent) : void
      {
         this.selectedItemIndex = name_3469(param1.currentTarget).index;
      }
      
      private function method_3155(param1:MouseEvent) : void
      {
         this.method_3154();
      }
      
      private function method_3153(param1:MouseEvent) : void
      {
         var _loc2_:FreeUidsFormEvent = new FreeUidsFormEvent(FreeUidsFormEvent.CLICK_ITEM);
         _loc2_.uid = name_3469(param1.currentTarget).uid;
         dispatchEvent(_loc2_);
      }
      
      public function destroy() : void
      {
         var _loc1_:name_3469 = null;
         this.hide();
         var _loc2_:int = int(this._items.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this._items[_loc3_];
            _loc1_.removeEventListener(MouseEvent.ROLL_OVER,this.method_3152);
            _loc1_.removeEventListener(MouseEvent.ROLL_OUT,this.method_3155);
            _loc1_.removeEventListener(MouseEvent.CLICK,this.method_3153);
            removeChild(_loc1_);
            _loc3_++;
         }
         this.var_3515 = -1;
         this._items = [];
      }
      
      public function show() : void
      {
         this.visible = true;
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:FreeUidsFormEvent = null;
         if(param1.keyCode == Keyboard.TAB || param1.keyCode == Keyboard.ESCAPE)
         {
            dispatchEvent(new FreeUidsFormEvent(FreeUidsFormEvent.FOCUS_OUT));
         }
         if(param1.keyCode == Keyboard.DOWN)
         {
            this.method_3157();
         }
         if(param1.keyCode == Keyboard.UP)
         {
            this.method_3156();
         }
         if(param1.keyCode == Keyboard.ENTER && this.method_3150())
         {
            _loc2_ = new FreeUidsFormEvent(FreeUidsFormEvent.CLICK_ITEM);
            _loc2_.uid = this._items[this.var_3515].uid;
            dispatchEvent(_loc2_);
         }
      }
      
      private function method_3157() : void
      {
         if(this.method_3150())
         {
            ++this.selectedItemIndex;
         }
         else
         {
            this.selectedItemIndex = 0;
         }
      }
      
      private function method_3156() : void
      {
         if(this.method_3150())
         {
            --this.selectedItemIndex;
         }
         else
         {
            this.selectedItemIndex = this.method_3151();
         }
      }
      
      public function hide() : void
      {
         this.visible = false;
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      public function get selectedItemIndex() : int
      {
         return this.var_3515;
      }
      
      public function set selectedItemIndex(param1:int) : void
      {
         if(this._items.length == 0 || this.var_3515 == param1)
         {
            return;
         }
         this.method_3154();
         if(param1 > this.method_3151())
         {
            this.var_3515 = 0;
         }
         else
         {
            this.var_3515 = param1;
         }
         if(this.var_3515 < 0)
         {
            this.var_3515 = this.method_3151();
         }
         this._items[this.var_3515].setSelected(true);
      }
      
      private function method_3154() : void
      {
         if(this.method_3150())
         {
            this._items[this.var_3515].setSelected(false);
            this.var_3515 = -1;
         }
      }
      
      private function method_3150() : Boolean
      {
         return this.var_3515 != -1;
      }
      
      private function method_3151() : int
      {
         return this._items.length - 1;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.var_1445.width = this._width;
         this._label.width = this._width;
      }
   }
}
