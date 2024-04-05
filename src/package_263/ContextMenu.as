package package_263
{
   import alternativa.tanks.model.friends.FriendsService;
   import controls.base.name_1134;
   import controls.name_1891;
   import controls.name_1922;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.system.System;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.LobbyChat;
   import forms.name_1139;
   import package_1.Main;
   import package_12.name_24;
   import package_120.name_408;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_390.name_1889;
   import package_401.name_2154;
   import package_54.name_102;
   import package_60.TextConst;
   import package_75.name_274;
   import package_90.name_308;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ContextMenu extends Sprite
   {
      
      public static var display:DisplayObjectContainer = (Main.osgi.name_6(name_24) as name_24).noticesLayer as DisplayObjectContainer;
      
      public static var userInfoService:name_408 = Main.osgi.name_6(name_408) as name_408;
      
      public static var contextMenuService:name_308;
      
      public static var localeService:name_102 = Main.osgi.name_6(name_102) as name_102;
      
      public static var battleInfoService:name_274;
      
      private static const const_1598:int = 11;
      
      private static const const_1599:int = 10000;
      
      private static const const_1600:uint = 1723412;
       
      
      private var var_1169:name_1922;
      
      private var var_1568:name_1891;
      
      private var var_1554:name_1134;
      
      private var var_1555:name_1134;
      
      private var var_1562:name_2147;
      
      private var var_1567:name_2147;
      
      private var var_1566:name_2147;
      
      private var var_1565:name_2147;
      
      private var var_1572:name_2147;
      
      private var var_1560:name_2147;
      
      private var var_1559:name_2147;
      
      private var var_1558:name_2147;
      
      private var var_1556:name_2148;
      
      private var var_1564:name_2147;
      
      private var var_1563:name_2147;
      
      private var var_1569:name_2147;
      
      private var var_1553:Vector.<name_2147>;
      
      private var var_1571:Vector.<name_2147>;
      
      private var var_913:String;
      
      private var var_1557:String;
      
      private var var_1550:int;
      
      private var var_1561:SmallRankIcon;
      
      private var var_1570:uint;
      
      private var var_1574:uint;
      
      private var var_1351:Boolean;
      
      private var var_1573:Boolean;
      
      private var var_1575:Boolean;
      
      private var _line:Shape;
      
      public function ContextMenu()
      {
         super();
      }
      
      public function show(param1:int, param2:int, param3:String, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:Boolean, param12:Boolean, param13:Boolean, param14:Boolean) : void
      {
         var _loc15_:Boolean = false;
         if(!this.var_1575)
         {
            this.var_1575 = true;
            this.init();
         }
         this.x = param1;
         this.y = param2;
         this.var_913 = param3;
         this.var_1557 = param5;
         this.var_1550 = param4;
         this.var_1561.name_2152(param4);
         this.var_1554.text = param5;
         this.var_1554.color = param7 ? uint(uint(name_1139.name_2150)) : uint(uint(name_1139.name_1894));
         if(param7)
         {
            this.method_1760();
         }
         this.var_1555.visible = param7;
         this.var_1562.visible = param6;
         this.var_1567.visible = param8;
         this.var_1566.visible = param9;
         this.var_1565.visible = param10;
         this.var_1560.visible = param11;
         if(param14)
         {
            _loc15_ = LobbyChat.blocked(param3);
            this.var_1559.visible = !_loc15_;
            this.var_1558.visible = _loc15_;
         }
         else
         {
            this.var_1559.visible = false;
            this.var_1558.visible = false;
         }
         this.var_1556.visible = param12 && FriendsService.method_1182(param3);
         this.var_1564.visible = param13;
         this.var_1563.visible = battleInfoService.isInBattle();
         this.var_1571.length = 0;
         var _loc16_:int = int(this.var_1553.length);
         var _loc17_:int = 0;
         while(_loc17_ < _loc16_)
         {
            if(this.var_1553[_loc17_].visible)
            {
               this.var_1571.push(this.var_1553[_loc17_]);
            }
            _loc17_++;
         }
         this.resize();
         display.addChild(this);
         clearTimeout(this.var_1570);
         this.var_1570 = setTimeout(this.method_1749,10000);
         clearTimeout(this.var_1574);
         this.var_1574 = setTimeout(this.method_1579,0);
      }
      
      private function method_1760() : void
      {
         var _loc1_:Boolean = Boolean(userInfoService.hasData(this.var_913)) && Boolean(userInfoService.getData(this.var_913).online);
         this.var_1555.color = _loc1_ ? uint(uint(name_1139.name_2151)) : uint(uint(name_1139.name_2149));
         if(_loc1_)
         {
            this.var_1554.color = name_1139.name_2150;
            this.var_1555.color = name_1139.name_2151;
            this.var_1555.text = localeService.getText(TextConst.const_236);
         }
         else
         {
            this.var_1554.color = name_1139.name_2149;
            this.var_1555.color = name_1139.name_2149;
            this.var_1555.text = localeService.getText(TextConst.const_238);
         }
         this.method_1763(_loc1_);
      }
      
      private function method_1763(param1:Boolean) : void
      {
         if(param1)
         {
            this.var_1556.locked = false;
         }
         else
         {
            this.var_1556.locked = true;
         }
      }
      
      private function init() : void
      {
         tabEnabled = false;
         tabChildren = false;
         this.var_1169 = new name_1922();
         addChild(this.var_1169);
         this.var_1568 = new name_1891(0,0,name_1891.name_1428);
         addChild(this.var_1568);
         this.var_1554 = new name_1134();
         this.var_1554.mouseEnabled = false;
         addChild(this.var_1554);
         this.var_1561 = new SmallRankIcon();
         addChild(this.var_1561);
         this.var_1555 = new name_1134();
         addChild(this.var_1555);
         this.var_1553 = new Vector.<name_2147>();
         this.var_1571 = new Vector.<name_2147>();
         this.var_1562 = new name_2147();
         this.var_1562.text = localeService.getText(TextConst.const_256);
         addChild(this.var_1562);
         this.var_1567 = new name_2147();
         this.var_1567.text = localeService.getText(TextConst.const_297);
         addChild(this.var_1567);
         this.var_1566 = new name_2147();
         this.var_1566.text = localeService.getText(TextConst.const_226);
         addChild(this.var_1566);
         this.var_1565 = new name_2147();
         this.var_1565.text = localeService.getText(TextConst.const_187);
         addChild(this.var_1565);
         this.var_1572 = new name_2147();
         this.var_1572.text = localeService.getText(TextConst.const_245);
         addChild(this.var_1572);
         this.var_1560 = new name_2147();
         this.var_1560.text = localeService.getText(TextConst.const_220);
         addChild(this.var_1560);
         this.var_1559 = new name_2147();
         this.var_1559.text = localeService.getText(TextConst.const_268);
         addChild(this.var_1559);
         this.var_1558 = new name_2147();
         this.var_1558.text = localeService.getText(TextConst.const_267);
         addChild(this.var_1558);
         this.var_1556 = new name_2148();
         this.var_1556.text = localeService.getText(TextConst.const_189);
         addChild(this.var_1556);
         this.var_1564 = new name_2147();
         this.var_1564.text = localeService.getText(TextConst.const_298);
         addChild(this.var_1564);
         this.var_1569 = new name_2147();
         this.var_1569.text = localeService.getText(TextConst.const_250);
         addChild(this.var_1569);
         this.var_1563 = new name_2147();
         this.var_1563.text = localeService.getText(name_390.const_942);
         addChild(this.var_1563);
         this.var_1553.push(this.var_1560);
         this.var_1553.push(this.var_1572);
         this.var_1553.push(this.var_1562);
         this.var_1553.push(this.var_1567);
         this.var_1553.push(this.var_1566);
         this.var_1553.push(this.var_1565);
         this.var_1553.push(this.var_1556);
         this.var_1553.push(this.var_1559);
         this.var_1553.push(this.var_1558);
         this.var_1553.push(this.var_1564);
         this.var_1553.push(this.var_1569);
         this.var_1553.push(this.var_1563);
         this._line = new Shape();
         addChild(this._line);
         this.resize();
         display.stage.addEventListener(MouseEvent.CLICK,this.method_1764);
         display.stage.addEventListener(Event.DEACTIVATE,this.method_1489);
      }
      
      private function resize() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:name_2147 = null;
         var _loc4_:int = 0;
         this.var_1561.x = 11 + 7;
         this.var_1561.y = 11 + 8;
         this.var_1554.x = this.var_1561.x + this.var_1561.width;
         this.var_1554.y = 11 + 5;
         this.var_1555.x = 11 + 5;
         this.var_1555.y = this.var_1554.y + this.var_1554.height - 1;
         var _loc5_:int = this.var_1554.x + this.var_1554.width;
         var _loc6_:int = int(this.var_1571.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = this.var_1571[_loc7_];
            _loc3_.x = 11 + 5;
            if(_loc7_ == 0)
            {
               _loc3_.y = this.var_1555.visible ? Number(Number(59)) : Number(Number(42));
            }
            else
            {
               _loc3_.y = this.var_1571[_loc7_ - 1].y + 18;
            }
            _loc1_ = _loc3_.y + 18;
            _loc4_ = _loc3_.x + _loc3_.width;
            if(_loc4_ > _loc5_)
            {
               _loc5_ = _loc4_;
            }
            _loc7_++;
         }
         _loc6_ = int(this.var_1553.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            if(!this.var_1553[_loc8_].visible)
            {
               this.var_1553[_loc8_].y = 0;
            }
            _loc8_++;
         }
         this._line.graphics.clear();
         this._line.graphics.beginFill(1723412,1);
         if(this.var_1555.visible)
         {
            _loc2_ = this.var_1555.y + this.var_1555.height + 5;
         }
         else
         {
            _loc2_ = this.var_1554.y + this.var_1554.height + 4;
         }
         this._line.graphics.drawRect(11 + 7,_loc2_,_loc5_ - 11 - 8,1);
         this._line.graphics.endFill();
         this.var_1169.width = _loc5_ + 11 + 7;
         this.var_1169.height = _loc1_ + 11 + 8;
         this.var_1568.x = 11;
         this.var_1568.y = 11;
         this.var_1568.width = this.var_1169.width - 11 * 2;
         this.var_1568.height = this.var_1169.height - 11 * 2;
         if(this.x + this.var_1169.width > display.stage.stageWidth)
         {
            this.x = display.stage.stageWidth - this.var_1169.width;
         }
         if(this.y + this.var_1169.height > display.stage.stageHeight)
         {
            this.y = display.stage.stageHeight - this.var_1169.height;
         }
      }
      
      private function method_1749() : void
      {
         if(!this.var_1351)
         {
            this.hide();
         }
      }
      
      private function method_1579() : void
      {
         if(!this.var_1573)
         {
            this.var_1573 = true;
            this.var_1562.addEventListener(MouseEvent.CLICK,this.method_1762);
            this.var_1567.addEventListener(MouseEvent.CLICK,this.method_1752);
            this.var_1566.addEventListener(MouseEvent.CLICK,this.method_1756);
            this.var_1565.addEventListener(MouseEvent.CLICK,this.method_1750);
            this.var_1572.addEventListener(MouseEvent.CLICK,this.method_1753);
            this.var_1560.addEventListener(MouseEvent.CLICK,this.method_1761);
            this.var_1559.addEventListener(MouseEvent.CLICK,this.method_1758);
            this.var_1558.addEventListener(MouseEvent.CLICK,this.method_1755);
            this.var_1556.addEventListener(MouseEvent.CLICK,this.method_1754);
            this.var_1564.addEventListener(MouseEvent.CLICK,this.method_1759);
            this.var_1569.addEventListener(MouseEvent.CLICK,this.method_1757);
            this.var_1563.addEventListener(MouseEvent.CLICK,this.method_1751);
            this.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
            this.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         }
      }
      
      private function method_1762(param1:MouseEvent) : void
      {
         contextMenuService.method_849(this.var_913);
         this.hide();
      }
      
      private function method_1752(param1:MouseEvent) : void
      {
         contextMenuService.method_346(this.var_913,this.var_1557);
         this.hide();
      }
      
      private function method_1756(param1:MouseEvent) : void
      {
         contextMenuService.method_371(this.var_913,this.var_1557);
         this.hide();
      }
      
      private function method_1750(param1:MouseEvent) : void
      {
         contextMenuService.method_851(this.var_913,this.var_1557);
         this.hide();
      }
      
      private function method_1757(param1:MouseEvent) : void
      {
      }
      
      private function method_1753(param1:MouseEvent) : void
      {
         System.setClipboard(this.var_1554.text);
         this.hide();
      }
      
      private function method_1761(param1:MouseEvent) : void
      {
         contextMenuService.method_850(this.var_913,this.var_1557);
         this.hide();
      }
      
      private function method_1758(param1:MouseEvent) : void
      {
         LobbyChat.name_2155(this.var_1557);
         this.hide();
      }
      
      private function method_1755(param1:MouseEvent) : void
      {
         LobbyChat.name_2153(this.var_1557);
         this.hide();
      }
      
      private function method_1754(param1:MouseEvent) : void
      {
         PanelModel(Main.osgi.name_6(name_115)).onInviteUser(this.var_913);
         this.hide();
      }
      
      private function method_1759(param1:MouseEvent) : void
      {
         contextMenuService.method_852(this.var_913,this.var_1557);
         this.hide();
      }
      
      private function method_1751(param1:MouseEvent) : *
      {
         contextMenuService.method_854(this.var_913,this.var_1557);
         this.hide();
      }
      
      private function method_1765(param1:name_2154) : void
      {
         this.method_1760();
      }
      
      private function onRollOver(param1:MouseEvent) : void
      {
         this.var_1351 = true;
         clearTimeout(this.var_1570);
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.var_1351 = false;
         clearTimeout(this.var_1570);
         this.var_1570 = setTimeout(this.method_1749,10000);
      }
      
      private function method_1764(param1:MouseEvent) : void
      {
         if(!this.var_1573 || this.var_1351)
         {
            return;
         }
         var _loc2_:name_1889 = param1.target as name_1889;
         if(_loc2_ == null || _loc2_.self)
         {
            this.hide();
         }
      }
      
      private function method_1489(param1:Event) : void
      {
         this.hide();
      }
      
      public function name_1831(param1:name_308) : void
      {
         contextMenuService = param1;
      }
      
      private function hide() : void
      {
         clearTimeout(this.var_1570);
         clearTimeout(this.var_1574);
         if(display.contains(this))
         {
            display.removeChild(this);
         }
         this.method_1476();
      }
      
      private function method_1476() : void
      {
         if(this.var_1573)
         {
            this.var_1573 = false;
            this.var_1562.removeEventListener(MouseEvent.CLICK,this.method_1762);
            this.var_1567.removeEventListener(MouseEvent.CLICK,this.method_1752);
            this.var_1566.removeEventListener(MouseEvent.CLICK,this.method_1756);
            this.var_1565.removeEventListener(MouseEvent.CLICK,this.method_1750);
            this.var_1572.removeEventListener(MouseEvent.CLICK,this.method_1753);
            this.var_1560.removeEventListener(MouseEvent.CLICK,this.method_1761);
            this.var_1559.removeEventListener(MouseEvent.CLICK,this.method_1758);
            this.var_1558.removeEventListener(MouseEvent.CLICK,this.method_1755);
            this.var_1556.removeEventListener(MouseEvent.CLICK,this.method_1754);
            this.var_1564.removeEventListener(MouseEvent.CLICK,this.method_1759);
            this.var_1569.removeEventListener(MouseEvent.CLICK,this.method_1757);
            this.var_1563.removeEventListener(MouseEvent.CLICK,this.method_1751);
            this.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
            this.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         }
      }
   }
}
