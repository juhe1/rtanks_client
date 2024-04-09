package alternativa.tanks.models.battlefield.gui.chat
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.name_193;
   import alternativa.tanks.service.settings.IBattleSettings;
   import flash.display.DisplayObjectContainer;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import package_1.Main;
   import package_119.name_1829;
   import package_13.Long;
   import package_141.ChatModelBase;
   import package_141.name_400;
   import package_31.class_1;
   import package_4.ClientObject;
   import package_47.BattleTeamType;
   import package_7.name_32;
   import package_90.ContextMenuServiceEvent;
   import package_90.name_308;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   import utils.KeyboardBinder;
   
   public class ChatModel extends ChatModelBase implements name_400, class_11, class_1, IChatBattle
   {
      
      public static var contextMenuService:name_308 = OSGi.getInstance().getService(name_308) as name_308;
       
      
      private var var_63:name_193;
      
      private var var_1145:ClientObject;
      
      private var contentLayer:DisplayObjectContainer;
      
      private var var_1146:Boolean;
      
      private var var_1141:BattleChat;
      
      private var var_136:int;
      
      private const const_1528:* = "/vote ";
      
      private var var_1142:Vector.<String>;
      
      private var var_1144:KeyboardBinder;
      
      private var var_1143:int = -1;
      
      public function ChatModel()
      {
         this.var_1142 = new Vector.<String>();
         super();
         _interfaces.push(IModel,name_400,class_11,name_1829,class_1);
         this.contentLayer = Main.contentUILayer;
         this.var_1141 = new BattleChat();
         Main.osgi.registerService(IChatBattle,this);
      }
      
      public function getChat() : BattleChat
      {
         return this.var_1141;
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         this.var_1145 = param1;
         this.var_1141.clear();
         this.contentLayer.addChild(this.var_1141);
         this.var_1141.addEventListener(name_1337.name_1345,this.method_1388);
         this.var_1141.addEventListener(name_1337.name_1348,this.method_1389);
         Main.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         var _loc2_:name_32 = Main.osgi.getService(name_32) as name_32;
         this.var_1141.method_891 = this.method_1391().showChat;
         contextMenuService.addEventListener(ContextMenuServiceEvent.VOTE_USER,this.method_1390);
         this.var_1144 = new KeyboardBinder(this.var_1141.input);
         this.var_1144.name_1865("UP",this.method_1392);
         this.var_1144.name_1865("DOWN",this.method_1393);
         this.var_1144.enable();
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         this.var_1141.removeEventListener(name_1337.name_1345,this.method_1388);
         this.var_1141.removeEventListener(name_1337.name_1348,this.method_1389);
         this.var_1141.clear();
         this.contentLayer.removeChild(this.var_1141);
         Main.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         contextMenuService.removeEventListener(ContextMenuServiceEvent.VOTE_USER,this.method_1390);
         this.var_1145 = null;
         this.var_1144.name_1866();
         this.var_1144.disable();
      }
      
      public function method_22() : void
      {
         this.method_44(1);
      }
      
      public function method_25() : void
      {
         this.method_44(-1);
      }
      
      public function method_26() : void
      {
         this.method_44(1);
      }
      
      public function method_27() : void
      {
         this.method_44(-1);
      }
      
      public function method_1397() : void
      {
         this.method_44(1);
      }
      
      public function method_1394() : void
      {
         this.method_44(-1);
      }
      
      public function method_1396() : void
      {
         this.method_44(1);
      }
      
      public function method_1395() : void
      {
         this.method_44(-1);
      }
      
      public function method_21() : void
      {
         this.method_44(-1);
         this.var_1141.method_891 = this.method_1391().showChat;
      }
      
      public function method_20() : void
      {
         this.method_44(1);
      }
      
      public function method_24() : void
      {
         this.method_44(-1);
      }
      
      public function method_23(param1:Boolean) : void
      {
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.var_1141.method_894();
         }
      }
      
      private function method_1389(param1:name_1337) : void
      {
         this.var_1143 = -1;
      }
      
      private function method_1390(param1:ContextMenuServiceEvent) : void
      {
         this.sendMessage(null,"/vote " + param1.uid,false);
      }
      
      private function method_1388(param1:name_1337) : void
      {
         this.sendMessage(this.var_1145,param1.message,param1.var_1146);
      }
      
      private function sendMessage(param1:ClientObject, param2:String, param3:Boolean) : void
      {
         if(this.var_1142.length == 0 || this.var_1142[this.var_1142.length - 1] != param2)
         {
            this.var_1142.push(param2);
         }
         this.var_1143 = -1;
         var _loc4_:RegExp = /;/g;
         var _loc5_:RegExp = /~/g;
         param2 = param2.replace(_loc4_," ").replace(_loc5_," ");
         Network(Main.osgi.getService(name_2)).send("battle;chat;" + param2 + ";" + param3);
      }
      
      private function method_1392(param1:Boolean) : void
      {
         if(!param1 || this.var_1142.length == 0 || !this.var_1141.chatOpened)
         {
            return;
         }
         this.var_1143 = Math.min(this.var_1143 + 1,this.var_1142.length - 1);
         this.var_1141.input.text = this.var_1142[this.var_1142.length - 1 - this.var_1143];
      }
      
      private function method_1393(param1:Boolean) : void
      {
         if(!param1 || this.var_1142.length == 0 || !this.var_1141.chatOpened)
         {
            return;
         }
         this.var_1143 = Math.max(this.var_1143 - 1,0);
         this.var_1141.input.text = this.var_1142[this.var_1142.length - 1 - this.var_1143];
      }
      
      public function addMessage(param1:ClientObject, param2:Long, param3:String, param4:BattleTeamType, param5:Boolean, param6:String = null, param7:int = 0, param8:int = 0) : void
      {
         var _loc9_:String = param6;
         var _loc10_:int = param7;
         this.var_1141.method_892(_loc9_,_loc10_,param8,param4,param5,param3 + "\n");
      }
      
      public function addSpectatorMessage(param1:String, param2:Boolean) : void
      {
         this.var_1141.addSpectatorMessage(param1 + "\n",param2);
      }
      
      public function addSystemMessage(param1:ClientObject, param2:String) : void
      {
         this.var_1141.addSystemMessage(param2);
      }
      
      private function method_44(param1:int) : void
      {
         this.var_136 += param1;
         if(this.var_1145 != null)
         {
            if(this.var_136 > 0)
            {
               this.var_1141.closeChat();
               this.var_1141.locked = true;
            }
            else
            {
               this.var_1141.locked = false;
            }
         }
      }
      
      private function method_1391() : IBattleSettings
      {
         return IBattleSettings(Main.osgi.getService(IBattleSettings));
      }
   }
}

import package_13.Long;
import package_47.BattleTeamType;

class ExpectingMessage
{
    
   
   public var messageLabel:String;
   
   public var userID:Long;
   
   public var message:String;
   
   public var type:BattleTeamType;
   
   public function ExpectingMessage(param1:String, param2:Long, param3:BattleTeamType, param4:String)
   {
      super();
      this.messageLabel = param1;
      this.userID = param2;
      this.message = param4;
      this.type = param3;
   }
}
