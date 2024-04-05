package alternativa.tanks.gui.notinclan.dialogs
{
   import controls.base.name_1134;
   import controls.base.name_1890;
   import controls.base.name_2016;
   import controls.checkbox.name_2018;
   import controls.checkbox.name_2021;
   import controls.name_2015;
   import controls.windowinner.WindowInner;
   import flash.display.Bitmap;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import forms.name_1139;
   import package_124.AlertServiceEvent;
   import package_124.name_42;
   import package_214.FlagsDropDownList;
   import package_254.name_2013;
   import package_254.name_791;
   import package_280.name_2014;
   import package_30.CreateClanServiceEvent;
   import package_30.name_63;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_578 extends name_573
   {
      
      public static var createClanService:name_63;
      
      public static var var_815:name_791;
      
      public static var alertService:name_42;
      
      public static var localeService:name_102;
      
      public static const WIDTH:Number = 550;
      
      public static const const_1532:Number = 331;
       
      
      private const const_1549:int = 500;
      
      private var var_1323:Class;
      
      private var var_1321:Bitmap;
      
      private var var_1251:WindowInner;
      
      private var var_1319:Timer;
      
      private var var_1322:Timer;
      
      private var var_1318:Boolean;
      
      private var var_1320:Boolean;
      
      private var var_1272:name_2016;
      
      private var var_1271:name_2016;
      
      private var var_1312:name_2021;
      
      private var var_1317:name_1134;
      
      private var createButton:name_1890;
      
      private var var_1314:name_2015;
      
      private var var_1313:name_2015;
      
      private var var_1316:name_1134;
      
      private var var_1315:name_1134;
      
      private var var_1277:FlagsDropDownList;
      
      public function name_578()
      {
         this.var_1323 = name_2026;
         this.var_1321 = new this.var_1323() as Bitmap;
         this.var_1251 = new WindowInner(0,0,WindowInner.name_1428);
         this.var_1277 = new FlagsDropDownList();
         super();
         this.method_1544();
         this.method_1546();
      }
      
      private function method_1544() : void
      {
         this.var_1251.x = 11;
         this.var_1251.y = 11;
         this.var_1251.width = 550 - 2 * 11;
         this.var_1272 = new name_2016();
         this.var_1272.addEventListener(FocusEvent.FOCUS_IN,this.method_1545);
         this.var_1272.addEventListener(FocusEvent.FOCUS_OUT,this.method_1543);
         this.var_1272.addEventListener(name_2014.name_2020,this.method_1538);
         this.var_1272.tabIndex = 2;
         this.var_1271 = new name_2016();
         this.var_1271.addEventListener(FocusEvent.FOCUS_IN,this.method_1548);
         this.var_1271.addEventListener(FocusEvent.FOCUS_OUT,this.method_1542);
         this.var_1271.addEventListener(name_2014.name_2020,this.method_1547);
         this.var_1271.tabIndex = 1;
         this.var_1312 = new name_2021();
         this.var_1312.addEventListener(name_2018.name_2025,this.method_1535);
         this.var_1312.tabIndex = 3;
         this.var_1317 = new name_1134();
         this.var_1317.htmlText = localeService.getText(name_390.const_606);
         this.createButton = new name_1890();
         this.createButton.name_1342(localeService.getText(name_390.const_1269));
         this.createButton.enabled = false;
         this.createButton.addEventListener(MouseEvent.CLICK,this.method_1537);
         this.createButton.tabIndex = 4;
         this.var_1314 = new name_2015();
         this.var_1313 = new name_2015();
         this.var_1319 = new Timer(500,1);
         this.var_1319.addEventListener(TimerEvent.TIMER_COMPLETE,this.method_1539);
         this.var_1322 = new Timer(500,1);
         this.var_1322.addEventListener(TimerEvent.TIMER_COMPLETE,this.method_1541);
         this.var_1315 = new name_1134();
         this.var_1315.text = localeService.getText(name_390.const_1379);
         this.var_1315.mouseEnabled = false;
         this.var_1315.color = name_1139.name_2023;
         this.var_1316 = new name_1134();
         this.var_1316.text = localeService.getText(name_390.const_667);
         this.var_1316.mouseEnabled = false;
         this.var_1316.color = name_1139.name_2023;
         createClanService.addEventListener(CreateClanServiceEvent.NOT_UNIQUE_NAME,this.method_1540);
         createClanService.addEventListener(CreateClanServiceEvent.NOT_UNIQUE_TAG,this.method_1536);
         createClanService.addEventListener(CreateClanServiceEvent.CORRECT_NAME,this.method_1513);
         createClanService.addEventListener(CreateClanServiceEvent.INCORRECT_NAME,this.method_1512);
         createClanService.addEventListener(CreateClanServiceEvent.CORRECT_TAG,this.method_1515);
         createClanService.addEventListener(CreateClanServiceEvent.INCORRECT_TAG,this.method_1511);
         createClanService.addEventListener(CreateClanServiceEvent.OTHER_ERROR,this.method_1406);
         createClanService.addEventListener(CreateClanServiceEvent.ALREADY_IN_CLAN,this.name_1976);
         this.createButton.x = 550 - this.createButton.width >> 1;
         this.createButton.y = 331 - this.createButton.height - 11;
         this.var_1312.x = 11;
         this.var_1312.y = this.createButton.y - this.var_1312.height - 11 - 7;
         this.var_1271.x = 11;
         this.var_1271.y = this.var_1312.y - this.var_1271.height - 11;
         this.var_1271.width = 100;
         this.var_1272.x = this.var_1271.x + this.var_1271.width;
         this.var_1272.y = this.var_1271.y;
         this.var_1272.width = this.var_1251.width - this.var_1271.width - 70 - 11;
         this.var_1277.x = this.var_1272.x + this.var_1272.width;
         this.var_1277.y = this.var_1272.y;
         this.var_1316.x = this.var_1271.x + 3;
         this.var_1316.y = this.var_1271.y + 7;
         this.var_1315.x = this.var_1272.x + 3;
         this.var_1315.y = this.var_1272.y + 7;
         this.var_1317.x = this.var_1312.x + this.var_1312.name_2022.x + this.var_1312.name_2022.width;
         this.var_1317.y = this.var_1312.y + this.var_1312.name_2022.y;
         this.var_1314.x = this.var_1272.x + this.var_1272.width - 33;
         this.var_1314.y = this.var_1272.y + 7;
         this.var_1313.x = this.var_1271.x + this.var_1271.width - 33;
         this.var_1313.y = this.var_1271.y + 7;
         this.var_1251.height = this.var_1272.y - 7 - 11;
         this.var_1321.y = 11;
         this.var_1321.x = (this.width - this.var_1321.width) / 2;
      }
      
      private function method_1546() : void
      {
         addChild(this.var_1251);
         addChild(this.var_1272);
         addChild(this.var_1315);
         addChild(this.var_1271);
         addChild(this.var_1316);
         addChild(this.var_1312);
         addChild(this.var_1317);
         addChild(this.createButton);
         addChild(this.var_1314);
         addChild(this.var_1313);
         addChild(this.var_1277);
         addChild(this.var_1321);
      }
      
      protected function method_1537(param1:MouseEvent) : void
      {
         if(this.var_1312.checked)
         {
            createClanService.method_386(this.var_1272.value,this.var_1271.value,"",this.var_1277.flag.country);
         }
      }
      
      private function method_1535(param1:name_2018) : void
      {
         this.method_1533();
      }
      
      private function method_1538(param1:name_2014) : void
      {
         if(this.var_1272.value.length == 0)
         {
            this.var_1314.name_2024();
         }
         this.var_1319.reset();
         this.var_1319.start();
      }
      
      private function method_1547(param1:name_2014) : void
      {
         if(this.var_1271.value.length == 0)
         {
            this.var_1313.name_2024();
         }
         this.var_1322.reset();
         this.var_1322.start();
      }
      
      private function method_1539(param1:TimerEvent) : void
      {
         if(this.var_1272.value.length > 0)
         {
            this.var_1314.method_285();
            createClanService.method_384(this.var_1272.value);
         }
         else
         {
            this.method_1533();
         }
      }
      
      private function method_1541(param1:TimerEvent) : void
      {
         if(this.var_1271.value.length > 0)
         {
            this.var_1313.method_285();
            createClanService.method_378(this.var_1271.value);
         }
         else
         {
            this.method_1533();
         }
      }
      
      private function method_1533() : void
      {
         var _loc1_:String = this.var_1272.value;
         var _loc2_:String = this.var_1271.value;
         this.createButton.enabled = false;
         if(this.var_1312.checked && _loc1_ != null && _loc1_.length > 0 && _loc2_ != null && _loc2_.length > 0 && this.var_1320 && this.var_1318)
         {
            this.createButton.enabled = true;
         }
         if(_loc1_.length == 0 && _loc2_.length == 0)
         {
            name_2013.hide();
         }
      }
      
      override protected function method_1476() : void
      {
         createClanService.removeEventListener(CreateClanServiceEvent.NOT_UNIQUE_NAME,this.method_1540);
         createClanService.removeEventListener(CreateClanServiceEvent.NOT_UNIQUE_TAG,this.method_1536);
         createClanService.removeEventListener(CreateClanServiceEvent.CORRECT_NAME,this.method_1513);
         createClanService.removeEventListener(CreateClanServiceEvent.INCORRECT_NAME,this.method_1512);
         createClanService.removeEventListener(CreateClanServiceEvent.CORRECT_TAG,this.method_1515);
         createClanService.removeEventListener(CreateClanServiceEvent.INCORRECT_TAG,this.method_1511);
         createClanService.removeEventListener(CreateClanServiceEvent.ALREADY_IN_CLAN,this.name_1976);
         this.createButton.removeEventListener(MouseEvent.CLICK,this.method_1537);
         this.var_1272.removeEventListener(name_2014.name_2020,this.method_1538);
         this.var_1319.removeEventListener(TimerEvent.TIMER_COMPLETE,this.method_1539);
         this.var_1312.removeEventListener(name_2018.name_2025,this.method_1535);
      }
      
      private function method_1513(param1:CreateClanServiceEvent) : void
      {
         name_2013.hide();
         this.var_1318 = true;
         this.var_1314.name_2027();
         this.method_1533();
      }
      
      private function method_1515(param1:CreateClanServiceEvent) : void
      {
         name_2013.hide();
         this.var_1320 = true;
         this.var_1313.name_2027();
         this.method_1533();
      }
      
      private function method_1406(param1:CreateClanServiceEvent) : void
      {
         this.var_1318 = false;
         this.var_1314.name_2017();
         this.var_1320 = false;
         this.var_1313.name_2017();
         this.method_1533();
      }
      
      private function method_1512(param1:CreateClanServiceEvent) : void
      {
         name_2013.name_2019(localeService.getText(name_390.const_1162),this.var_1272,this);
         this.var_1318 = false;
         this.var_1314.name_2017();
         this.method_1533();
      }
      
      private function method_1511(param1:CreateClanServiceEvent) : void
      {
         name_2013.name_2019(localeService.getText(name_390.const_756),this.var_1271,this);
         this.var_1320 = false;
         this.var_1313.name_2017();
         this.method_1533();
      }
      
      private function method_1540(param1:CreateClanServiceEvent) : void
      {
         name_2013.name_2019(localeService.getText(name_390.const_1277),this.var_1272,this);
         this.var_1318 = false;
         this.var_1314.name_2017();
         this.method_1533();
      }
      
      private function method_1536(param1:CreateClanServiceEvent) : void
      {
         name_2013.name_2019(localeService.getText(name_390.const_881),this.var_1271,this);
         this.var_1320 = false;
         this.var_1313.name_2017();
         this.method_1533();
      }
      
      private function method_1545(param1:FocusEvent) : void
      {
         this.var_1315.visible = false;
      }
      
      private function method_1543(param1:FocusEvent) : void
      {
         if(this.var_1272.value.length == 0)
         {
            this.var_1315.visible = true;
         }
      }
      
      private function method_1548(param1:FocusEvent) : void
      {
         this.var_1316.visible = false;
      }
      
      private function method_1542(param1:FocusEvent) : void
      {
         if(this.var_1271.value.length == 0)
         {
            this.var_1316.visible = true;
         }
      }
      
      override public function get height() : Number
      {
         return 331;
      }
      
      override public function get width() : Number
      {
         return 550;
      }
      
      private function name_1976(param1:CreateClanServiceEvent) : void
      {
         alertService.method_1143(localeService.getText(name_390.const_1222));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1534);
      }
      
      private function method_1534(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.method_1534);
         destroy();
      }
      
      override protected function method_1477() : String
      {
         return name_390.const_701;
      }
   }
}
