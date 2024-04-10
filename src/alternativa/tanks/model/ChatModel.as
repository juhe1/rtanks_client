package alternativa.tanks.model
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.tanks.gui.chat.name_1632;
   import alternativa.tanks.gui.chat.name_2654;
   import alternativa.tanks.utils.Antiflood;
   import flash.display.DisplayObjectContainer;
   import flash.events.TextEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import forms.LobbyChat;
   import package_1.Main;
   import package_112.name_356;
   import package_114.ChatModeratorLevel;
   import package_119.name_361;
   import package_120.name_408;
   import package_13.Long;
   import package_14.name_36;
   import package_189.CacheURLLoader;
   import package_280.name_2512;
   import package_339.ChatModelBase;
   import package_339.name_400;
   import package_4.ClientObject;
   import package_7.name_32;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class ChatModel extends ChatModelBase implements name_400, class_11
   {
      
      public static var clientLog:name_36;
      
      public static var userInfoService:name_408;
      
      private static const const_1991:String = "chat";
       
      
      private var clientObject:ClientObject;
      
      private var var_83:DisplayObjectContainer;
      
      public var name_379:LobbyChat;
      
      private var var_2401:String;
      
      private var linksWhiteList:Array;
      
      private var var_95:name_361;
      
      private var var_2403:Vector.<name_356>;
      
      private var var_2402:Vector.<Long>;
      
      private var var_2400:Boolean;
      
      private var var_2397:Boolean;
      
      private var chatModeratorLevel:ChatModeratorLevel;
      
      private var var_2399:Boolean = false;
      
      private var var_2398:name_1632;
      
      private var link:String;
      
      public function ChatModel()
      {
         super();
         _interfaces.push(IModel);
         _interfaces.push(name_400);
         _interfaces.push(class_11);
         this.var_83 = Main.contentUILayer;
         var _loc1_:name_32 = Main.osgi.getService(name_32) as name_32;
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:String = null;
         this.clientObject = param1;
         this.var_2403 = new Vector.<name_356>();
         this.var_2402 = new Vector.<Long>();
         this.var_2400 = method_771().admin;
         this.var_2397 = method_771().antifloodEnabled;
         if(LobbyChat(Main.osgi.getService(LobbyChat)) != null)
         {
            for each(_loc2_ in method_771().channels)
            {
               this.name_391(null,"",_loc2_);
            }
            this.name_379 = LobbyChat(Main.osgi.getService(LobbyChat));
         }
         else
         {
            this.name_379 = new LobbyChat();
            Main.osgi.registerService(LobbyChat,this.name_379);
         }
         this.chatModeratorLevel = method_771().chatModeratorLevel;
         this.name_379.method_2273 = method_771().typingSpeedAntifloodEnabled;
         this.name_379.method_2278(true);
         this.name_379.method_2276(method_771().channels);
         this.name_379.method_2274();
         if(this.var_2397)
         {
            Antiflood.init(method_771().linksWhiteList,method_771().minChar,method_771().minWord,method_771().bufferSize);
         }
         this.name_379.selfName = this.var_2401;
         this.method_535();
         this.method_2400(method_771().symbolCost,method_771().enterCost);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         this.name_379.hide();
         this.method_542();
         this.clientObject = null;
      }
      
      public function initObject(param1:ClientObject, param2:Array, param3:String) : void
      {
         this.var_2401 = param3;
         this.linksWhiteList = param2;
      }
      
      public function name_486(param1:ClientObject, param2:Array) : void
      {
         var _loc4_:name_356 = null;
         var _loc5_:String = null;
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            _loc4_ = param2[_loc3_];
            _loc5_ = null;
            if(_loc4_.warning)
            {
               _loc5_ = "<font color=\"#f4e000\">" + _loc4_.text + "</font>";
            }
            else
            {
               _loc5_ = _loc4_.text;
               if(this.var_2397)
               {
                  Antiflood.name_2656(_loc5_,true);
               }
               clientLog.log("chat","showMessages : %1",_loc4_.text);
            }
            if(_loc4_.channel == null)
            {
               this.name_379.method_2279(_loc4_.name_480.uid,_loc4_.name_480.rankIndex,_loc4_.name_480.chatPermissions,_loc4_.name_480.premium,_loc4_.text,_loc4_.name_423 != null ? _loc4_.name_423.rankIndex : 0,_loc4_.name_423 != null ? _loc4_.name_423.chatPermissions : 0,_loc4_.name_423 != null ? _loc4_.name_423.uid : "",_loc4_.name_423 != null ? _loc4_.name_423.premium : false,_loc4_.system,_loc4_.warning);
            }
            else
            {
               this.name_379.addMessage(_loc4_.name_480.uid,_loc4_.name_480.rankIndex,_loc4_.name_480.chatPermissions,_loc4_.name_480.premium,_loc4_.text,_loc4_.channel,_loc4_.name_423 != null ? _loc4_.name_423.rankIndex : 0,_loc4_.name_423 != null ? _loc4_.name_423.chatPermissions : 0,_loc4_.name_423 != null ? _loc4_.name_423.uid : "",_loc4_.name_423 != null ? _loc4_.name_423.premium : false,_loc4_.system,_loc4_.warning);
            }
            _loc3_++;
         }
         if(_loc3_ > 25)
         {
            this.name_379.var_633.name_2522();
         }
      }
      
      private function method_2396(param1:name_2512) : void
      {
         var _loc2_:String = this.name_379.inputText.replace(/\s{2,}/g," ");
         if(!this.var_2397 || this.var_2400 || Antiflood.name_2657(_loc2_))
         {
            this.sendMessage(param1.nameTo,_loc2_);
            if(this.var_2397)
            {
               Antiflood.name_2656(_loc2_,true);
            }
            this.name_379.method_2280 = new Date().getTime();
         }
         else
         {
            this.name_379.addMessage(userInfoService.localUserInfo.nickname,userInfoService.localUserInfo.rank,this.chatModeratorLevel.value,userInfoService.localUserInfo.premium,_loc2_,this.name_379.method_2281());
            clientLog.log("chat","onSendChatMessage : antiFlood : %1",_loc2_);
         }
      }
      
      public function sendMessage(param1:String, param2:String) : void
      {
         Network(Main.osgi.getService(INetworker)).send("lobby_chat;" + param2 + ";" + this.name_379.method_2281() + ";" + (param1 != null ? "true" : "false") + ";" + (param1 != "" ? param1 : "NULL") + "");
      }
      
      private function method_535() : void
      {
         if(!this.var_83.contains(this.name_379))
         {
            this.var_83.addChild(this.name_379);
            this.name_379.addEventListener(name_2512.name_1345,this.method_2396);
            this.name_379.addEventListener(TextEvent.LINK,this.method_2397);
         }
      }
      
      private function method_542() : void
      {
         if(this.var_83.contains(this.name_379))
         {
            this.var_83.removeChild(this.name_379);
            this.name_379.removeEventListener(name_2512.name_1345,this.method_2396);
         }
      }
      
      public function method_2398(param1:ClientObject, param2:String) : void
      {
         Network(Main.osgi.getService(INetworker)).send("lobby;get_show_battle_info;" + param2);
      }
      
      private function method_2397(param1:TextEvent) : void
      {
         var _loc2_:RegExp = /^([0-9a-f]{16})$/gi;
         this.link = param1.text;
         if(this.link.search(_loc2_) > -1)
         {
            this.method_2398(this.clientObject,this.link);
         }
         else if(this.linksWhiteList.indexOf(this.link) == -1)
         {
            if(!this.var_2399)
            {
               this.method_2399(this.link);
            }
         }
         else if(CacheURLLoader.method_129)
         {
            navigateToURL(new URLRequest(this.method_2401(this.link)),"_blank");
         }
         else
         {
            navigateToURL(new URLRequest(this.link),"_blank");
         }
      }
      
      private function method_2401(param1:String) : String
      {
         return param1.indexOf("%") > 0 ? param1 : encodeURI(param1);
      }
      
      private function method_2399(param1:String) : void
      {
         this.var_2398 = new name_1632(param1);
         this.var_2398.addEventListener(name_2654.name_2655,this.method_2395);
         this.var_2398.show();
         this.var_2399 = true;
      }
      
      private function method_2395(param1:name_2654) : void
      {
         this.var_2399 = false;
         this.var_2398.removeEventListener(name_2654.name_2655,this.method_2395);
      }
      
      public function name_391(param1:ClientObject, param2:String, param3:String) : void
      {
         if(this.name_379 == null)
         {
            return;
         }
         this.name_379.method_2260(param2,param3);
      }
      
      public function name_467(param1:String) : void
      {
         if(this.name_379 == null)
         {
            return;
         }
         this.name_379.method_2255(param1);
      }
      
      public function method_2400(param1:int, param2:int) : void
      {
         this.name_379.method_2275(param1,param2);
      }
   }
}
