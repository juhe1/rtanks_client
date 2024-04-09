package alternativa.tanks.gui.clanmanagement.clanmemberlist
{
   import base.class_122;
   import controls.base.LabelBase;
   import controls.base.name_2016;
   import controls.base.DefaultButtonBase;
   import controls.name_2015;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.name_1139;
   import package_13.Long;
   import package_207.name_561;
   import package_218.name_637;
   import package_254.name_2013;
   import package_280.name_2014;
   import package_54.name_102;
   
   public class name_584 extends class_122 implements name_1973
   {
      
      public static var localeService:name_102;
      
      public static var blurService:name_637;
      
      public static var userPropertiesService:name_561;
      
      private static const const_1550:int = 600;
       
      
      private var var_1333:name_2016;
      
      private var var_1336:LabelBase;
      
      private var var_1334:DefaultButtonBase;
      
      private var var_1335:name_2015;
      
      private var var_1340:uint;
      
      private var var_1337:String;
      
      private var var_1338:Boolean;
      
      private var var_1345:Long;
      
      private var var_1341:String;
      
      private var var_1344:String;
      
      private var var_1342:String;
      
      private var var_1343:String;
      
      private var var_1339:name_569;
      
      private var _width:Number;
      
      public function name_584(param1:name_569, param2:String, param3:String, param4:String, param5:String)
      {
         super();
         this.var_1339 = param1;
         this.var_1341 = param2;
         this.var_1342 = param3;
         this.var_1344 = param4;
         this.var_1343 = param5;
         param1.method_1522(this);
         this.init();
      }
      
      private function init() : void
      {
         this.var_1333 = new name_2016();
         this.var_1333.maxChars = 20;
         this.var_1333.restrict = "0-9.a-zA-z_ \\-*";
         addChild(this.var_1333);
         this.var_1336 = new LabelBase();
         addChild(this.var_1336);
         this.var_1336.mouseEnabled = false;
         this.var_1336.color = name_1139.name_2023;
         this.var_1336.text = this.var_1341;
         this.var_1335 = new name_2015();
         addChild(this.var_1335);
         this.var_1334 = new DefaultButtonBase();
         this.var_1334.width = 120;
         addChild(this.var_1334);
         this.var_1334.label = this.var_1342;
         this.var_1334.enable = false;
         this.resize(100);
         this.show();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.resize(this._width);
      }
      
      public function resize(param1:Number) : void
      {
         this.var_1333.width = param1 - this.var_1334.width - 11;
         this.var_1333.x = 0;
         this.var_1336.x = this.var_1333.x + 3;
         this.var_1336.y = this.var_1333.y + 7;
         this.var_1335.x = this.var_1333.x + this.var_1333.width - this.var_1335.width - 15;
         this.var_1335.y = this.var_1333.y + 7;
         this.var_1334.x = this.var_1333.width;
      }
      
      public function hide() : void
      {
         clearTimeout(this.var_1340);
         this.method_1476();
         this.method_1564();
         this.visible = false;
      }
      
      private function method_1476() : void
      {
         this.var_1334.removeEventListener(MouseEvent.CLICK,this.method_1562);
         this.var_1333.removeEventListener(FocusEvent.FOCUS_IN,this.method_1563);
         this.var_1333.removeEventListener(FocusEvent.FOCUS_OUT,this.method_1566);
         this.var_1333.removeEventListener(name_2014.name_2020,this.method_1567);
         this.var_1333.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      public function show() : void
      {
         this.visible = true;
         this.method_1568();
         this.var_1333.value = "";
         this.method_1565();
      }
      
      private function method_1568() : void
      {
         this.var_1334.addEventListener(MouseEvent.CLICK,this.method_1562);
         this.var_1333.addEventListener(FocusEvent.FOCUS_IN,this.method_1563);
         this.var_1333.addEventListener(FocusEvent.FOCUS_OUT,this.method_1566);
         this.var_1333.addEventListener(name_2014.name_2020,this.method_1567);
         this.var_1333.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      private function method_1562(param1:MouseEvent = null) : void
      {
         if(this.var_1338 && this.var_1337 != null)
         {
            this.var_1339.method_1520(this.var_1337);
            this.method_1564();
         }
      }
      
      private function method_1564() : void
      {
         this.var_1333.value = "";
         this.var_1334.enable = false;
         this.var_1335.name_2024();
         this.var_1338 = false;
         this.var_1337 = null;
      }
      
      private function method_1563(param1:FocusEvent) : void
      {
         this.var_1336.visible = false;
      }
      
      private function method_1566(param1:FocusEvent) : void
      {
         this.method_1565();
      }
      
      private function method_1565() : void
      {
         if(this.var_1333.value.length == 0)
         {
            this.var_1336.visible = true;
            this.var_1335.name_2024();
            this.var_1333.validValue = true;
         }
      }
      
      private function method_1567(param1:name_2014) : void
      {
         this.var_1338 = false;
         this.var_1334.enable = false;
         this.var_1335.method_285();
         this.var_1335.y = this.var_1333.y + 5;
         if(this.var_1333.value.length > 0)
         {
            this.var_1336.visible = false;
         }
         clearTimeout(this.var_1340);
         this.var_1340 = setTimeout(this.method_1569,600);
      }
      
      private function method_1569() : void
      {
         if(this.var_1333.value.length == 0)
         {
            this.var_1335.name_2024();
            this.var_1333.validValue = true;
            name_2013.hide();
         }
         else
         {
            this.var_1337 = this.var_1333.value;
            this.var_1339.method_1521(this.var_1337);
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.method_1562();
         }
      }
      
      public function name_1978() : void
      {
         name_2013.hide();
         this.var_1333.validValue = true;
         this.var_1335.name_2027();
         this.var_1335.y = this.var_1333.y + 7;
         if(userPropertiesService.userName.toLowerCase() != this.var_1337.toLowerCase())
         {
            this.var_1338 = true;
            this.var_1334.enable = true;
         }
      }
      
      public function name_1981() : void
      {
         name_2013.hide();
         this.var_1337 = null;
         this.method_1561();
      }
      
      public function name_1977(param1:String) : void
      {
         name_2013.name_2019(param1,this.var_1333,this);
         this.method_1561();
      }
      
      private function method_1561() : void
      {
         this.var_1333.validValue = false;
         this.var_1335.name_2017();
         this.var_1335.y = this.var_1333.y + 7;
         this.var_1334.enable = false;
      }
      
      public function method_1560(param1:String) : void
      {
         name_2013.name_2019(param1,this.var_1333,this);
         this.method_1561();
      }
      
      public function name_1974(param1:String) : void
      {
         name_2013.name_2019(param1,this.var_1333,this);
         this.method_1561();
      }
      
      public function name_1975(param1:Long, param2:String) : void
      {
         this.var_1345 = param1;
         name_2013.name_2019(param2,this.var_1333,this);
         this.method_1561();
      }
      
      public function name_1976(param1:String) : void
      {
         this.method_1561();
         name_2013.name_2019(param1,this.var_1333,this);
      }
      
      public function method_1559(param1:String) : void
      {
         this.method_1561();
         name_2013.name_2019(param1,this.var_1333,this);
      }
      
      public function method_349(param1:String) : void
      {
         this.method_1561();
         name_2013.name_2019(param1,this.var_1333,this);
      }
      
      public function name_1982(param1:String) : void
      {
         this.method_1561();
         name_2013.name_2019(param1,this.var_1333,this);
      }
      
      public function set enable(param1:Boolean) : void
      {
         this.var_1334.enable = param1;
         this.var_1333.enable = param1;
         if(param1)
         {
            this.var_1334.label = this.var_1342;
            this.var_1336.text = this.var_1341;
         }
         else
         {
            this.var_1334.label = this.var_1343;
            this.var_1336.text = this.var_1344;
         }
      }
      
      public function get method_1570() : DefaultButtonBase
      {
         return this.var_1334;
      }
   }
}
