package forms
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.chat.ChangeChatChannelEvent;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.DefaultButton;
   import controls.base.LabelBase;
   import controls.base.name_2016;
   import controls.chat.ChatOutput;
   import controls.chat.name_2508;
   import controls.chat.name_2520;
   import controls.TankWindowInner;
   import fl.events.ScrollEvent;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.net.SharedObject;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import package_1.Main;
   import package_280.name_2014;
   import package_280.name_2512;
   import package_423.ChatAddressMode;
   import package_423.MessageType;
   import package_424.NewsTab;
   import package_424.NewsTabNewsItemAddedEvent;
   import package_424.name_2513;
   import package_425.name_2511;
   import package_425.name_2514;
   import package_425.name_2515;
   import package_426.name_2509;
   import package_54.name_102;
   import package_60.TextConst;
   import package_90.ContextMenuServiceEvent;
   import package_90.name_308;
   import package_95.IStorageService;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class LobbyChat extends Sprite
   {
      
      public static var contextMenuService:name_308 = Main.osgi.getService(name_308) as name_308;
      
      public static var storageService:IStorageService = Main.osgi.getService(IStorageService) as IStorageService;
      
      private static const const_1857:int = 1000;
      
      private static const const_1859:String = "lobbyChatLastMessageKey";
      
      private static const const_1858:String = "lastChatChannelKey";
      
      public static var var_2191:SharedObject;
       
      
      private var bg:Sprite;
      
      private var var_2197:TankWindowWithHeader;
      
      private var var_1182:TankWindowInner;
      
      private var var_632:name_2016;
      
      private var input:TextField;
      
      private var var_2194:LabelBase;
      
      private var format:TextFormat;
      
      private var var_2214:Sprite;
      
      private var addressed:Boolean;
      
      private var var_1044:name_2520;
      
      private var var_2213:int;
      
      private var var_2200:String;
      
      private var var_2210:String;
      
      private var var_2215:Boolean = true;
      
      private var var_2202:Timer;
      
      private var lang:String;
      
      private var localeService:name_102;
      
      private var var_2209:Boolean = false;
      
      private var var_2193:Boolean = false;
      
      public var var_633:ChatOutput;
      
      public var var_1844:DefaultButton;
      
      private var var_2196:name_2514;
      
      private var var_2192:name_2509;
      
      private var var_2195:NewsTab;
      
      private var var_2201:NewsChangedIndicator;
      
      private var var_851:String;
      
      private var var_2212:Boolean;
      
      private var var_2208:Timer;
      
      private var var_2204:Number = 0;
      
      private var var_856:int = 176;
      
      private var var_2211:int = 880;
      
      private var var_2205:TextFormat;
      
      private var var_2207:TextFormat;
      
      private var var_2203:Boolean = false;
      
      private var var_2206:Boolean = true;
      
      private var channels:Vector.<String>;
      
      private var var_2198:String;
      
      private var var_2199:Array;
      
      public function LobbyChat()
      {
         this.bg = new Sprite();
         this.var_1182 = new TankWindowInner(100,100,TankWindowInner.GREEN);
         this.var_632 = new name_2016();
         this.var_2194 = new LabelBase();
         this.var_2214 = new Sprite();
         this.localeService = OSGi.getInstance().getService(name_102) as name_102;
         this.var_633 = new ChatOutput();
         this.var_1844 = new DefaultButton();
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         addEventListener(Event.ADDED_TO_STAGE,this.method_1436);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_2069);
      }
      
      public static function get method_2261() : Array
      {
         var _loc1_:Array = null;
         if(var_2191 == null)
         {
            var_2191 = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         }
         _loc1_ = var_2191.data.blocklist;
         if(_loc1_ == null)
         {
            _loc1_ = new Array();
         }
         return _loc1_;
      }
      
      public static function name_2155(param1:String) : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:int = -1;
         var_2191 = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         _loc2_ = var_2191.data.blocklist;
         if(_loc2_ == null)
         {
            _loc2_ = new Array();
         }
         _loc3_ = _loc2_.indexOf(param1);
         if(_loc3_ > -1)
         {
            _loc2_.splice(_loc3_,1);
         }
         _loc2_.push(param1);
         var_2191.data.blocklist = _loc2_;
         var_2191.flush();
         return true;
      }
      
      public static function name_2153(param1:String) : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:int = -1;
         var_2191 = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         _loc2_ = var_2191.data.blocklist;
         if(_loc2_ == null)
         {
            _loc2_ = new Array();
         }
         _loc3_ = _loc2_.indexOf(param1);
         if(_loc3_ > -1)
         {
            _loc2_.splice(_loc3_,1);
         }
         var_2191.data.blocklist = _loc2_;
         var_2191.flush();
         return true;
      }
      
      public static function unblockall() : Boolean
      {
         var_2191 = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         var_2191.data.blocklist = new Array();
         var_2191.flush();
         return true;
      }
      
      public static function blocked(param1:String) : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var_2191 = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         _loc2_ = var_2191.data.blocklist;
         if(_loc2_ == null)
         {
            _loc2_ = new Array();
            var_2191.data.blocklist = _loc2_;
            var_2191.flush();
         }
         _loc3_ = _loc2_.indexOf(param1);
         return _loc3_ > -1;
      }
      
      public function set selfName(param1:String) : void
      {
         this.var_851 = param1;
         this.var_633.selfName = this.var_851;
      }
      
      public function get inputText() : String
      {
         return this.input.text;
      }
      
      public function set inputText(param1:String) : void
      {
         this.input.text = param1;
      }
      
      private function method_1436(param1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function method_2069(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
         var _loc2_:NewsTab = this.var_2195;
         _loc2_.removeEventListener(NewsTabNewsItemAddedEvent.NEWS_ITEM_ADDED,this.method_2251);
         _loc2_.destroy();
      }
      
      public function method_2068(param1:Event) : void
      {
         var _loc4_:Object = null;
         this.input = this.var_632.textField;
         this.input.maxChars = 299;
         removeEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         this.var_2201 = new NewsChangedIndicator();
         this.var_2197 = new TankWindowWithHeader(this.localeService.getText(name_390.const_651));
         addChild(this.var_2197);
         addChild(this.var_1182);
         this.var_1182.x = 11;
         this.var_1182.y = 45;
         this.var_1182.showBlink = true;
         this.lang = this.localeService.getText(TextConst.GUI_LANG);
         this.input.addEventListener(KeyboardEvent.KEY_DOWN,this.method_2256);
         this.input.addEventListener(KeyboardEvent.KEY_UP,this.method_2263);
         this.var_1844.addEventListener(MouseEvent.CLICK,this.sendMessage);
         contextMenuService.addEventListener(ContextMenuServiceEvent.WRITE_IN_CHAT,this.method_2257);
         addChild(this.var_632);
         addChild(this.var_2194);
         this.var_2194.mouseEnabled = false;
         this.var_2194.color = 10987948;
         this.var_2194.text = this.localeService.getText(name_390.const_813);
         addChild(this.var_633);
         this.var_633.move(15,this.var_1182.y + 4);
         this.method_2266();
         this.var_633.addEventListener(ScrollEvent.SCROLL,this.method_2249);
         this.var_632.addEventListener(name_2014.name_2020,this.method_2262);
         this.var_1844.x = 272;
         this.var_1844.width = 80;
         this.var_1844.label = this.localeService.getText(TextConst.CHAT_PANEL_BUTTON_SEND);
         addChild(this.var_1844);
         this.var_2208 = new Timer(1000);
         this.var_2208.addEventListener(TimerEvent.TIMER,this.method_2270);
         this.var_2208.start();
         this.method_2254();
         this.var_2205 = new TextFormat();
         this.var_2205.color = 16728642;
         this.var_2207 = new TextFormat();
         this.var_2207.color = 16777215;
         this.var_2196 = new name_2514(name_2511.NEWS_TAB,this.localeService.getText(name_390.const_1256),name_2515.name_2521);
         this.var_2196.width = 102;
         addChild(this.var_2196);
         this.var_2196.y = 11;
         this.var_2196.x = 11;
         this.var_2192 = new name_2509(name_2511.CHAT_TAB);
         var _loc2_:int = 0;
         var _loc3_:String = null;
         while(_loc2_ < this.channels.length)
         {
            _loc3_ = this.channels[_loc2_];
            _loc4_ = {
               "gameName":_loc3_,
               "rang":0
            };
            this.var_2192.addItem(_loc4_);
            _loc2_++;
         }
         this.var_2192.name_1962("gameName",this.var_2198);
         this.var_2192.addEventListener(Event.CHANGE,this.method_2253);
         this.var_2192.width = 102;
         this.var_2192.enabled = true;
         addChild(this.var_2192);
         this.var_2192.x = this.var_2196.width + this.var_2196.x + 5;
         this.var_2192.y = 11;
         this.var_2196.addEventListener(MouseEvent.CLICK,this.method_2258);
         this.var_2192.addEventListener(MouseEvent.CLICK,this.method_2248);
         this.method_2264();
         this.var_2195 = new NewsTab();
         this.var_2195.x = 11;
         this.var_2195.y = this.var_1182.y + 0;
         this.var_2195.visible = false;
         addChild(this.var_2195);
         this.var_2195.addEventListener(name_2513.NEWS_ITEM_INITED,this.method_2251);
         this.method_2248(null);
         if(Boolean(storageService.getStorage().data["lobbyChatLastMessageKey"]))
         {
            this.var_2204 = storageService.getStorage().data["lobbyChatLastMessageKey"];
         }
         else
         {
            this.var_2204 = 0;
         }
      }
      
      private function method_2264() : void
      {
         this.var_2201.y = 11 >> 1;
         this.var_2201.x = 102;
         this.var_2201.visible = false;
         addChild(this.var_2201);
      }
      
      private function method_2251(param1:name_2513) : void
      {
         this.var_2201.name_2517(param1.news);
      }
      
      private function method_2258(param1:MouseEvent) : void
      {
         this.var_2196.enabled = false;
         this.var_2192.enabled = true;
         this.var_633.visible = false;
         this.var_1844.visible = false;
         this.var_632.visible = false;
         this.var_2195.visible = true;
         this.onResize(null);
         this.var_2201.name_2523();
      }
      
      private function method_2248(param1:MouseEvent) : void
      {
         this.var_1844.visible = true;
         this.var_2196.enabled = true;
         this.var_2192.enabled = false;
         this.var_632.visible = true;
         this.var_633.visible = true;
         this.var_2195.visible = false;
         this.onResize(null);
      }
      
      private function method_2270(param1:TimerEvent) : void
      {
         this.method_2246();
      }
      
      private function method_2257(param1:ContextMenuServiceEvent) : void
      {
         this.method_2265(param1.uid);
      }
      
      private function method_2265(param1:String) : void
      {
         this.var_633.name_2510(param1);
         var _loc2_:String = this.input.text;
         if(_loc2_.indexOf(": ") > 0)
         {
            _loc2_ = param1 + ": " + _loc2_.slice(_loc2_.indexOf(": ") + 2,_loc2_.length);
         }
         else
         {
            _loc2_ = param1 + ": " + _loc2_.slice(_loc2_.indexOf(": ") + 1,_loc2_.length);
         }
         this.input.text = _loc2_;
         stage.focus = this.input;
         this.input.setSelection(this.input.length,this.input.length);
         this.addressed = true;
         this.var_2200 = param1;
         if(this.var_2209)
         {
            _loc2_ = "/ban " + param1 + " ";
            this.input.text = _loc2_;
            stage.focus = this.input;
            this.input.setSelection(this.input.length,this.input.length);
            this.addressed = true;
            this.var_2200 = param1;
         }
         this.method_2246();
      }
      
      private function method_2263(param1:KeyboardEvent) : void
      {
         this.var_2209 = false;
      }
      
      private function method_2249(param1:ScrollEvent) : void
      {
         this.var_633.name_2519 = 18;
         this.var_633.setSize(this.var_1182.width + 1,this.var_1182.height - 8);
         this.var_633.removeEventListener(ScrollEvent.SCROLL,this.method_2249);
         this.var_633.name_2516 = false;
      }
      
      private function method_2262(param1:Event) : void
      {
         var _loc2_:RegExp = /^[a-z0-9](([\.\-\w](?!(-|_|\.){2,}))*[a-z0-9])\: /i;
         var _loc3_:int = this.input.text.search(_loc2_);
         var _loc4_:String = this.input.text.slice(0,this.input.text.indexOf(": "));
         if(_loc3_ == 0)
         {
            if(!this.addressed || _loc4_ != this.var_2210)
            {
               this.var_2210 = this.var_2200 = _loc4_;
               this.addressed = true;
               this.var_633.name_2510(this.var_2200);
            }
         }
         else if(this.addressed)
         {
            this.addressed = false;
            this.var_633.name_2510("");
         }
         this.method_2246();
      }
      
      private function method_2266() : void
      {
         this.var_633.setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         this.var_633.setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         this.var_633.setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         this.var_633.setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         this.var_633.setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         this.var_633.setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         this.var_633.setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         this.var_633.setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         this.var_633.setStyle("trackUpSkin",ScrollTrackGreen);
         this.var_633.setStyle("trackDownSkin",ScrollTrackGreen);
         this.var_633.setStyle("trackOverSkin",ScrollTrackGreen);
         this.var_633.setStyle("trackDisabledSkin",ScrollTrackGreen);
         this.var_633.setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         this.var_633.setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         this.var_633.setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         this.var_633.setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
      }
      
      private function method_2256(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.send();
         }
         this.var_2209 = param1.ctrlKey && param1.shiftKey;
      }
      
      private function sendMessage(param1:MouseEvent) : void
      {
         this.send();
      }
      
      private function method_2272(param1:String) : Boolean
      {
         var _loc2_:RegExp = /(can write to chat again|was banned for a)/;
         return param1.search(_loc2_) > -1;
      }
      
      private function send() : void
      {
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:Boolean = false;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc1_:String = this.input.text;
         var _loc2_:String = _loc1_;
         var _loc3_:RegExp = /(^(\/block|\/unblock) ([a-z0-9](([\.\-\w](?!(-|_|\.){2,}))*[a-z0-9])))$/i;
         var _loc4_:RegExp = /^(\/unblockall|\/blocklist)$/;
         var _loc5_:int = _loc2_.search(_loc3_);
         var _loc6_:int = _loc2_.search(_loc4_);
         if(_loc5_ > -1)
         {
            _loc7_ = _loc2_.replace(_loc3_,"$2");
            _loc8_ = _loc2_.replace(_loc3_,"$3");
            if(_loc7_ == "/block")
            {
               LobbyChat.name_2155(_loc8_);
               _loc9_ = TextConst.method_687(this.localeService.getText(TextConst.CHAT_PANEL_COMMAND_BLOCK,_loc8_));
               this.addMessage("System",0,0,false,_loc9_,"",0,0,"",true);
            }
            else
            {
               LobbyChat.name_2153(_loc8_);
               _loc9_ = TextConst.method_687(this.localeService.getText(TextConst.CHAT_PANEL_COMMAND_UNBLOCK,_loc8_));
               this.addMessage("System",0,0,false,_loc9_,"",0,0,"",true);
            }
            this.input.text = _loc7_ + " ";
            return;
         }
         if(_loc6_ > -1)
         {
            _loc7_ = _loc2_.replace(_loc3_,"$1");
            if(_loc7_ == "/unblockall")
            {
               LobbyChat.unblockall();
               _loc9_ = String(this.localeService.getText(TextConst.CHAT_PANEL_COMMAND_UNBLOCK_ALL));
               this.addMessage("System",0,0,false,_loc9_,"",0,0,"",true);
            }
            else
            {
               _loc11_ = LobbyChat.method_2261;
               if(_loc11_.length > 0)
               {
                  _loc9_ = String(this.localeService.getText(TextConst.CHAT_PANEL_COMMAND_BLOCK_LIST));
                  _loc1_ = "\n" + _loc9_ + "\n—————————————\n";
                  while(_loc12_ < _loc11_.length)
                  {
                     _loc1_ += String(_loc12_ + 1) + ": " + _loc11_[_loc12_] + "\n";
                     _loc12_++;
                  }
               }
               else
               {
                  _loc1_ = "...";
               }
               this.addMessage("System",0,0,false,_loc1_,"",0,0,"",true);
            }
            _loc10_ = false;
            this.input.text = "";
            return;
         }
         if(_loc1_ != "")
         {
            if(this.addressed)
            {
               _loc1_ = _loc1_.slice(_loc1_.indexOf(": ") + 2,_loc1_.length);
               this.input.text = _loc1_;
               dispatchEvent(new name_2512(this.var_2213,this.var_2200));
               this.input.text = this.var_2200 + ": ";
            }
            else
            {
               dispatchEvent(new name_2512());
               this.input.text = "";
            }
            this.input.setSelection(0,0);
            this.input.setSelection(this.input.length,this.input.length);
            this.var_633.name_2522();
         }
      }
      
      private function onResize(param1:Event) : void
      {
         var _loc2_:int = int(Math.max(1000,stage.stageWidth));
         this.var_2197.width = _loc2_ / 3;
         this.var_2197.height = Math.max(stage.stageHeight - 60,530);
         x = 0;
         y = 60;
         this.var_1182.width = this.var_2197.width - 22;
         this.var_1182.height = this.var_2197.height - 90;
         this.var_1844.y = this.var_2197.height - 42;
         this.var_1844.x = this.var_2197.width - this.var_1844.width - 11;
         this.var_632.x = 11;
         this.var_632.y = this.var_2197.height - 42;
         this.var_632.width = this.var_1844.x - 16;
         this.var_2194.x = this.var_632.x + 3;
         this.var_2194.y = this.var_632.y + 7;
         this.var_633.setSize(this.var_1182.width + 1,this.var_1182.height - 8);
         this.var_2195.resize(this.var_1182.width,this.var_1182.height + 33);
         if(this.var_2202 == null)
         {
            this.var_2202 = new Timer(200,1);
            this.var_2202.addEventListener(TimerEvent.TIMER,this.method_2252);
         }
         this.var_2202.reset();
         this.var_2202.start();
      }
      
      private function method_2252(param1:TimerEvent = null) : void
      {
         this.var_633.setSize(this.var_1182.width + 1,this.var_1182.height - 8);
         this.var_2202.removeEventListener(TimerEvent.TIMER,this.method_2252);
         this.var_2202 = null;
      }
      
      private function method_2254() : void
      {
         this.var_2199 = [this.localeService.getText(TextConst.const_270).split("|"),this.localeService.getText(TextConst.CHAT_SHARP_RULES).split("|"),this.localeService.getText(TextConst.CHAT_SHARP_PLANS).split("|"),this.localeService.getText(TextConst.CHAT_SHARP_RANKS).split("|"),this.localeService.getText(TextConst.CHAT_SHARP_CLANS).split("|"),this.localeService.getText(TextConst.CHAT_SHARP_FORUM).split("|"),this.localeService.getText(TextConst.CHAT_SHARP_UPDATES).split("|"),this.localeService.getText(TextConst.CHAT_SHARP_FEEDBACK).split("|"),this.localeService.getText(TextConst.CHAT_SHARP_THEFT).split("|")];
         var _loc1_:int = 0;
         while(_loc1_ < this.var_2199.length)
         {
            this.var_2199[_loc1_][0] = new RegExp("#" + this.var_2199[_loc1_][0],"gi");
            _loc1_++;
         }
      }
      
      private function method_2269(param1:String) : String
      {
         var _loc5_:RegExp = null;
         var _loc2_:int = 0;
         var _loc3_:String = param1;
         var _loc4_:int = 0;
         while(_loc4_ < this.var_2199.length)
         {
            _loc5_ = this.var_2199[_loc4_][0];
            _loc2_ = _loc3_.search(_loc5_);
            if(_loc2_ > -1)
            {
               _loc3_ = _loc3_.replace(_loc5_,"<u><a href=\'" + this.var_2199[_loc4_][2] + "\' target=\'_blank\'>" + this.var_2199[_loc4_][1] + "</a></u>");
               this.var_2193 = true;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function method_2271(param1:String) : String
      {
         var _loc4_:int = 0;
         var _loc2_:RegExp = /((http:\/\/)?(forum.tankionline.com)([-a-zA-Z0-9@:%_\+.~#?&\/]+)?(;jsessionid=([A-F0-9]+))?)/g;
         var _loc3_:RegExp = /((http:\/\/)?(blog.tankionline.com)((\/[-a-zA-Z0-9@:%_\+.~#?&]+){1,3}([-a-zA-Z0-9@:%_\+.~#?&\/]+)))/g;
         _loc4_ = param1.search(_loc2_);
         if(_loc4_ > -1)
         {
            param1 = param1.replace(_loc2_,"$2forumlink$4");
            this.var_2193 = true;
         }
         _loc4_ = param1.search(_loc3_);
         if(_loc4_ > -1)
         {
            param1 = param1.replace(_loc3_,"$2bloglink$4");
            this.var_2193 = true;
         }
         return param1;
      }
      
      public function method_2279(param1:String, param2:int, param3:int, param4:Boolean, param5:String, param6:int = 0, param7:int = 0, param8:String = "", param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:uint = 8454016) : void
      {
         this.addMessage(param1,param2,param3,param4,param5,this.var_2198,param6,param7,param8,param9,param10,param11,param12);
      }
      
      public function addMessage(param1:String, param2:int, param3:int, param4:Boolean, param5:String, param6:String, param7:int = 0, param8:int = 0, param9:String = "", param10:Boolean = false, param11:Boolean = false, param12:Boolean = false, param13:uint = 8454016) : void
      {
         var _loc21_:name_2508 = null;
         var _loc22_:name_2508 = null;
         var _loc23_:ChatAddressMode = null;
         var _loc24_:MessageType = null;
         var _loc14_:RegExp = /(<)(.*?)(>)/gi;
         var _loc15_:RegExp = /((^|\s)(http(s)?:\/\/)?(www\.)?((([a-z0-9]+)\.){1,4})([a-z]{2,10})(\/[a-z0-9\.\%\-\/\?=\:&]*)?(#([a-z0-9\.\%\-\/\?=\:&]*))?($|\s))/gi;
         var _loc16_:RegExp = /((mailto: ?)?(([\w\-\.]+)@((?:[\w]+\.)+)([a-zA-Z]{2,4})))/gi;
         var _loc17_:RegExp = /((http:\/\/)?(forumlink)([-a-zA-Z0-9@:%_\+.~#?&\/]+)?(;jsessionid=([A-F0-9]+))?)/g;
         var _loc18_:RegExp = /((http:\/\/)?(bloglink)((\/[-a-zA-Z0-9@:%_\+.~#?&]+){1,3}([-a-zA-Z0-9@:%_\+.~#?&\/]+)))/g;
         var _loc19_:RegExp = /#battle\|(.*?)\|([0-9a-f]{16})/gi;
         var _loc20_:int = 0;
         this.var_2193 = false;
         _loc20_ = param5.search(_loc14_);
         if(_loc20_ > -1)
         {
            param5 = param5.replace(_loc14_,"&lt;$2&gt;");
            this.var_2193 = true;
         }
         param5 = this.method_2271(param5);
         _loc20_ = param5.search(_loc15_);
         if(_loc20_ > -1)
         {
            param5 = param5.replace(_loc15_," <u><a href=\'event:http$4://$6$9$10$11\'>$&</a></u> ");
            this.var_2193 = true;
         }
         _loc20_ = param5.search(_loc16_);
         if(_loc20_ > -1)
         {
            param5 = param5.replace(_loc16_," <u><a href=\'mailto:$3\'>$3</a></u> ");
            this.var_2193 = true;
         }
         _loc20_ = param5.search(_loc19_);
         if(_loc20_ > -1)
         {
            param5 = param5.replace(_loc19_,"<u><a href=\'event:$2\'>$1</a></u>");
            this.var_2193 = true;
         }
         _loc20_ = param5.search(_loc17_);
         if(_loc20_ > -1)
         {
            param5 = param5.replace(_loc17_,"<u><a href=\'http://forum.tankionline.com$4\' target=\'_blank\'>http://forum...$4</a></u>");
            this.var_2193 = true;
         }
         _loc20_ = param5.search(_loc18_);
         if(_loc20_ > -1)
         {
            param5 = param5.replace(_loc18_,"<u><a href=\'http://blog.tankionline.com$4\' target=\'_blank\'>http://blog/...$6</a></u>");
            this.var_2193 = true;
         }
         param5 = this.method_2269(param5);
         if(!blocked(param1))
         {
            if(name != "" && param2 != 0)
            {
               _loc21_ = new name_2508(param3,param2,param1,"/127.0.0.1");
            }
            else
            {
               _loc21_ = new name_2508();
            }
            if(param9 != "" && param7 != 0)
            {
               _loc22_ = new name_2508(param8,param7,param9);
            }
            else
            {
               _loc22_ = new name_2508();
            }
            _loc23_ = _loc22_.rankIndex > 0 ? ChatAddressMode.PUBLIC_ADDRESSED : ChatAddressMode.PUBLIC_TO_ALL;
            _loc24_ = param11 ? MessageType.SYSTEM : (param12 ? MessageType.WARNING : MessageType.USER);
            this.var_633.addMessage(_loc21_,_loc22_,_loc23_,param6,param5,_loc24_,this.var_2193);
            if(this.addressed)
            {
               this.var_633.name_2510(this.var_2200);
            }
         }
      }
      
      public function hide() : void
      {
      }
      
      public function method_2260(param1:String, param2:String) : void
      {
         this.var_633.method_2260(param1,param2);
      }
      
      public function method_2255(param1:String) : void
      {
         this.var_633.method_2255(param1);
      }
      
      public function method_2278(param1:Boolean) : void
      {
         this.var_633.visible = param1;
         if(!param1)
         {
            this.var_632.value = "";
         }
         this.var_2203 = param1;
         this.method_2250();
         this.method_2267();
      }
      
      private function method_2250() : void
      {
         if(this.var_2203 && !this.var_2206)
         {
            this.var_1844.enable = false;
         }
         else
         {
            this.var_1844.label = this.localeService.getText(name_390.const_807);
            this.var_1844.enable = this.var_2203;
         }
      }
      
      private function method_2267() : void
      {
         if(this.var_2203 && !this.var_2206)
         {
            this.var_2194.text = this.localeService.getText(name_390.const_541);
            this.var_2194.visible = true;
            this.var_632.enable = false;
         }
         else
         {
            this.var_2194.text = this.localeService.getText(name_390.const_813);
            this.var_632.enable = this.var_2203;
            this.var_2194.visible = !this.var_2203;
         }
      }
      
      private function method_2246() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         if(!this.var_2212)
         {
            return;
         }
         var _loc3_:String = this.input.text;
         var _loc4_:int = _loc3_.length * this.var_856 + this.var_2211;
         var _loc5_:Number = new Date().getTime();
         var _loc6_:Number = this.var_2204 + _loc4_;
         if(!this.method_2268(_loc3_) && _loc5_ < _loc6_)
         {
            _loc1_ = _loc6_ - _loc5_;
            this.var_1844.label = this.method_2259(_loc1_);
            this.var_1844.enable = false;
            _loc2_ = _loc1_ / this.var_856;
            if(_loc2_ >= _loc3_.length)
            {
               this.input.setTextFormat(this.var_2205);
            }
            else if(_loc2_ != 0)
            {
               this.input.setTextFormat(this.var_2207);
               this.input.setTextFormat(this.var_2205,_loc3_.length - _loc2_,_loc3_.length);
            }
            this.var_2206 = false;
         }
         else
         {
            this.input.setTextFormat(this.var_2207);
            this.var_2206 = true;
         }
         this.method_2250();
      }
      
      private function method_2259(param1:Number) : String
      {
         var _loc2_:Number = int(param1 / 1000);
         var _loc3_:Number = int(_loc2_ / 60);
         var _loc4_:Number = _loc2_ % 60;
         var _loc5_:String = _loc4_.toString();
         if(_loc5_.length < 2)
         {
            _loc5_ = "0" + _loc5_;
         }
         return _loc3_.toString() + ":" + _loc5_;
      }
      
      public function method_2275(param1:int, param2:int) : void
      {
         this.var_856 = param1;
         this.var_2211 = param2;
         this.method_2246();
      }
      
      public function set method_2273(param1:Boolean) : *
      {
         this.var_2212 = param1;
      }
      
      public function set method_2280(param1:Number) : void
      {
         this.var_2204 = param1;
         storageService.getStorage().data["lobbyChatLastMessageKey"] = param1;
         this.method_2246();
      }
      
      private function method_2268(param1:String) : Boolean
      {
         var _loc2_:RegExp = /^\s*\//i;
         var _loc3_:int = param1.search(_loc2_);
         return _loc3_ > -1;
      }
      
      public function method_2281() : String
      {
         return this.var_2198;
      }
      
      public function method_2247(param1:String) : void
      {
         this.var_2198 = param1;
         this.var_633.name_2518(true,this.var_2198);
         this.var_633.name_2510(this.var_2200);
      }
      
      public function method_2277() : Vector.<String>
      {
         return this.channels;
      }
      
      public function method_2276(param1:Vector.<String>) : void
      {
         this.channels = param1;
      }
      
      public function method_2253(param1:Event) : void
      {
         this.method_2247((param1.target as name_2509).selectedItem.gameName);
         storageService.getStorage().data["lastChatChannelKey"] = this.var_2198;
      }
      
      public function method_2274() : void
      {
         var _loc1_:String = String(storageService.getStorage().data["lastChatChannelKey"]);
         var _loc2_:int = 0;
         while(_loc2_ < this.channels.length)
         {
            if(_loc1_ == this.channels[_loc2_])
            {
               this.method_2247(_loc1_);
               dispatchEvent(new ChangeChatChannelEvent(this.var_2198));
               return;
            }
            _loc2_++;
         }
         this.method_2247(this.channels[0]);
         storageService.getStorage().data["lastChatChannelKey"] = this.var_2198;
         dispatchEvent(new ChangeChatChannelEvent(this.var_2198));
      }
   }
}
