package controls.dropdownlist
{
   import base.class_122;
   import controls.ComboButton;
   import controls.base.name_1134;
   import fl.controls.List;
   import fl.data.DataProvider;
   import fl.events.ListEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import package_1.Main;
   import package_12.name_24;
   import package_12.name_529;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_1022;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   import utils.name_1915;
   
   public class DropDownList extends class_122
   {
      
      public static var display:name_529 = Main.osgi.name_6(name_24) as name_529;
       
      
      protected var button:ComboButton;
      
      protected var var_1353:DPLBackground;
      
      protected var list:List;
      
      protected var var_1347:DataProvider;
      
      private var _label:name_1134;
      
      private var var_1350:TextField;
      
      protected var var_1348:Object;
      
      protected var var_1352:int = 0;
      
      private var _width:int;
      
      private var var_1354:int;
      
      private var _height:int = 151;
      
      protected var _value:Object;
      
      private var var_1114:Boolean;
      
      private var var_1351:Boolean;
      
      private var var_1349:String;
      
      public function DropDownList(param1:String = "gameName")
      {
         this.button = new ComboButton();
         this.list = new List();
         this.var_1347 = new DataProvider();
         super();
         this.var_1349 = param1;
         this.init();
      }
      
      protected function init() : void
      {
         this.var_1350 = new TextField();
         this.var_1350.visible = false;
         this.var_1350.type = TextFieldType.INPUT;
         this._label = new name_1134();
         this._label.x = -10;
         this._label.y = 7;
         addChild(this.listBg);
         addChild(this.list);
         addChild(this.button);
         addChild(this._label);
         this.listBg.y = 5;
         this.list.y = 33;
         this.list.x = 3;
         this.list.setSize(144,241);
         this.list.rowHeight = 20;
         this.list.dataProvider = this.var_1347;
         this.method_1578(ComboR);
         name_1915.name_2035(this.list);
         this.list.focusEnabled = false;
         this.list.visible = false;
         this.listBg.visible = false;
         this.button.addEventListener(MouseEvent.CLICK,this.method_1582);
      }
      
      public function method_1578(param1:Class) : void
      {
         this.list.setStyle("cellRenderer",param1);
      }
      
      protected function method_1582(param1:MouseEvent) : void
      {
         if(this.name_1065)
         {
            this.close();
         }
         else
         {
            this.open();
         }
      }
      
      protected function open() : void
      {
         if(!this.name_1065)
         {
            this.method_1579();
            this.list.visible = true;
            this.listBg.visible = true;
            display.stage.focus = this.var_1350;
            display.stage.addChild(this.var_1350);
            this.var_1114 = true;
            this.var_1351 = true;
            dispatchEvent(new Event(Event.OPEN));
         }
      }
      
      public function get name_1065() : Boolean
      {
         return this.var_1114;
      }
      
      private function method_1579() : void
      {
         this.list.addEventListener(ListEvent.ITEM_CLICK,this.method_1577);
         this.var_1350.addEventListener(KeyboardEvent.KEY_UP,this.method_1576);
         display.stage.addEventListener(MouseEvent.CLICK,this.method_1575);
         this.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
      }
      
      private function method_1575(param1:MouseEvent) : void
      {
         if(!this.var_1351)
         {
            this.close();
         }
      }
      
      private function onRollOver(param1:MouseEvent) : void
      {
         this.var_1351 = true;
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.var_1351 = false;
      }
      
      protected function close() : void
      {
         if(this.name_1065)
         {
            this.method_1476();
            this.list.visible = false;
            this.listBg.visible = false;
            removeDisplayObject(this.var_1350);
            this.method_740();
            this.var_1114 = false;
         }
      }
      
      private function method_1476() : void
      {
         this.var_1350.removeEventListener(KeyboardEvent.KEY_UP,this.method_1576);
         this.list.removeEventListener(ListEvent.ITEM_CLICK,this.method_1577);
         display.stage.removeEventListener(MouseEvent.CLICK,this.method_1575);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
      }
      
      private function method_740() : void
      {
         if(display.stage.focus == this.var_1350)
         {
            display.stage.focus = null;
         }
      }
      
      public function get selectedItem() : Object
      {
         return this.var_1348;
      }
      
      public function set selectedItem(param1:Object) : void
      {
         if(param1 == null)
         {
            this.var_1348 = null;
            this.button.label = "";
         }
         else
         {
            this.var_1352 = this.var_1347.getItemIndex(param1);
            this.var_1348 = this.var_1347.getItemAt(this.var_1352);
            this.button.label = param1[this.var_1349];
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get selectedIndex() : int
      {
         return this.var_1352;
      }
      
      public function set label(param1:String) : void
      {
         this._label.text = param1;
         this._label.autoSize = TextFieldAutoSize.RIGHT;
      }
      
      public function method_1584() : int
      {
         return this._label.width;
      }
      
      protected function method_1577(param1:ListEvent) : void
      {
         var _loc2_:Object = param1.item;
         this.var_1352 = param1.index;
         if(_loc2_.rang == 0)
         {
            this.button.label = _loc2_[this.var_1349];
            this.var_1348 = _loc2_;
         }
         this.close();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function addItem(param1:Object) : void
      {
         var _loc2_:Object = null;
         this.var_1347.addItem(param1);
         _loc2_ = this.var_1347.getItemAt(0);
         this.var_1348 = _loc2_;
         this.button.label = _loc2_[this.var_1349];
      }
      
      public function replaceItemAt(param1:Object, param2:int) : void
      {
         this.var_1347.replaceItemAt(param1,param2);
      }
      
      public function sortOn(param1:Object, param2:Object = null) : void
      {
         var _loc3_:Object = null;
         this.var_1347.sortOn(param1,param2);
         if(this.var_1347.length > 0)
         {
            _loc3_ = this.var_1347.getItemAt(0);
            this.var_1348 = _loc3_;
            this._value = this.var_1348[this.var_1349];
            this.button.label = _loc3_[this.var_1349];
         }
      }
      
      public function clear() : void
      {
         this.var_1347 = new DataProvider();
         this.list.dataProvider = this.var_1347;
         this.button.label = "";
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.draw();
      }
      
      public function set method_1585(param1:Number) : void
      {
         this.var_1354 = param1;
         this.draw();
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         this.draw();
      }
      
      protected function draw() : void
      {
         this.listBg.width = this._width + this.var_1354;
         this.listBg.height = this._height - 2;
         this.button.width = this._width;
         this.list.setSize(this._width + this.var_1354,this._height - 34);
         this.list.invalidate();
      }
      
      public function set value(param1:Object) : void
      {
         var _loc2_:Object = null;
         this._value = "";
         this.button.label = this._value.toString();
         this.var_1348 = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1347.length)
         {
            _loc2_ = this.var_1347.getItemAt(_loc3_);
            if(_loc2_[this.var_1349] == param1)
            {
               this.var_1348 = _loc2_;
               this._value = this.var_1348[this.var_1349];
               this.button.label = this._value.toString();
               this.list.selectedIndex = _loc3_;
               this.list.scrollToSelected();
            }
            _loc3_++;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function name_1962(param1:String, param2:Object) : void
      {
         var _loc3_:int = this.method_1581(param1,param2);
         if(_loc3_ != -1)
         {
            this.var_1348 = this.var_1347.getItemAt(_loc3_);
            this._value = this.var_1348[this.var_1349];
            this.button.label = this._value.toString();
            this.list.selectedIndex = _loc3_;
            this.list.scrollToSelected();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function name_1963(param1:int) : void
      {
         if(param1 >= this.var_1347.length)
         {
            return;
         }
         this.var_1348 = this.var_1347.getItemAt(param1);
         this._value = this.var_1348[this.var_1349];
         this.button.label = this._value.toString();
         this.list.selectedIndex = param1;
         this.list.scrollToSelected();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function method_1581(param1:String, param2:Object) : int
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         while(_loc4_ < this.var_1347.length)
         {
            _loc3_ = this.var_1347.getItemAt(_loc4_);
            if(_loc3_[param1] == param2)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public function get value() : Object
      {
         return this._value;
      }
      
      private function method_1576(param1:KeyboardEvent) : void
      {
         if(name_1022.name_1036(param1.keyCode))
         {
            this.close();
         }
         else
         {
            this.method_1580(this.var_1350.text.substr(0,1));
            this.var_1350.text = "";
         }
      }
      
      public function method_1580(param1:String) : Object
      {
         var _loc2_:Object = null;
         var _loc3_:uint = this.var_1347.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_1347.getItemAt(_loc4_);
            if(_loc2_[this.var_1349].substr(0,1).toLowerCase() == param1.toLowerCase())
            {
               this.var_1348 = _loc2_;
               this._value = this.var_1348[this.var_1349];
               this.button.label = this._value.toString();
               this.list.selectedIndex = _loc4_;
               this.list.verticalScrollPosition = _loc4_ * 20;
               dispatchEvent(new Event(Event.CHANGE));
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      protected function get listBg() : DPLBackground
      {
         if(!this.var_1353)
         {
            this.var_1353 = new DPLBackground(100,275);
         }
         return this.var_1353;
      }
      
      public function get rowHeight() : Number
      {
         return this.list.rowHeight;
      }
      
      protected function method_1583() : List
      {
         return this.list;
      }
   }
}
