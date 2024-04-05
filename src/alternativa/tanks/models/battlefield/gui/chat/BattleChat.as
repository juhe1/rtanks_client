package alternativa.tanks.models.battlefield.gui.chat
{
   import alternativa.model.name_66;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.class_9;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.class_7;
   import controls.chat.BattleChatInput;
   import controls.chat.name_1338;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import forms.LobbyChat;
   import package_1.Main;
   import package_18.name_34;
   import package_313.BlockCommandHandler;
   import package_313.UnblockCommandHandler;
   import package_313.name_1350;
   import package_32.name_245;
   import package_32.name_665;
   import package_47.BattleTeamType;
   import package_54.name_102;
   import package_7.name_32;
   import projects.tanks.clients.fp10.libraries.name_390;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.name_1022;
   
   public class BattleChat extends Sprite
   {
      
      public static var localeService:name_102;
      
      public static var battleInputLockService:name_245;
      
      public static var fullscreenService:name_34;
       
      
      private const const_421:String = "/block";
      
      private const const_420:String = "/unblock";
      
      private const FULL_SCREEN:String = "fullScreen";
      
      private const FULL_SCREEN_INTERACTIVE_ACCEPTED:String = "fullScreenInteractiveAccepted";
      
      private var var_640:Object;
      
      private var var_637:Boolean;
      
      private var var_632:BattleChatInput;
      
      public var input:TextField;
      
      private var var_634:name_1339;
      
      private var var_633:BattleChatOutput;
      
      private var var_635:Boolean;
      
      private var var_639:Boolean;
      
      private var var_636:Boolean;
      
      private var var_638:BattleTeamType;
      
      public function BattleChat()
      {
         super();
         this.init();
      }
      
      public function set method_891(param1:Boolean) : void
      {
         if(this.var_637 == param1)
         {
            return;
         }
         this.var_637 = param1;
         if(!this.var_635)
         {
            this.var_633.visible = this.var_637;
         }
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_639 = param1;
      }
      
      public function get chatOpened() : Boolean
      {
         return this.var_635;
      }
      
      public function method_892(param1:String, param2:int, param3:int, param4:BattleTeamType, param5:Boolean, param6:String) : void
      {
         if(LobbyChat.blocked(param1))
         {
            return;
         }
         this.var_633.method_223(param2,param3,param1,param4,param5,param6);
         this.onResize();
      }
      
      public function addSpectatorMessage(param1:String, param2:Boolean) : void
      {
         this.var_633.name_1354(param1,param2);
         this.onResize();
      }
      
      public function addSystemMessage(param1:String) : void
      {
         this.var_633.addSystemMessage(param1);
         this.onResize();
      }
      
      public function clear() : void
      {
         this.var_633.clear();
      }
      
      public function method_894() : void
      {
         var _loc3_:int = 0;
         if(this.var_635 || this.var_639)
         {
            return;
         }
         this.var_633.visible = true;
         this.input.addEventListener(FocusEvent.FOCUS_OUT,this.method_883);
         if(fullscreenService.name_49())
         {
            Main.stage.addEventListener("fullScreen",this.method_320);
            Main.stage.addEventListener("fullScreenInteractiveAccepted",this.method_320);
         }
         this.input.text = "";
         this.var_632.visible = true;
         this.var_635 = true;
         if((Main.osgi.name_6(name_83) as BattlefieldModel).spectatorMode == true)
         {
            this.var_634.name_1342("Spectators: " + name_1339.name_1343);
            this.var_634.visible = this.var_634.getText().length > 0;
         }
         else
         {
            this.var_634.name_1342("");
            this.var_634.visible = false;
            this.var_638 = TankModel(Main.osgi.name_6(class_7)).localUserData.teamType;
         }
         Main.stage.focus = this.input;
         this.onResize();
         battleInputLockService.lock(name_665.name_557);
         this.method_884();
         var _loc1_:name_32 = name_32(Main.osgi.name_6(name_32));
         var _loc2_:Vector.<name_66> = _loc1_.getModelsByInterface(class_9);
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.length - 1;
            while(_loc3_ >= 0)
            {
               class_9(_loc2_[_loc3_]).chatOpened();
               _loc3_--;
            }
         }
      }
      
      private function method_884() : void
      {
         if((Main.osgi.name_6(name_83) as BattlefieldModel).spectatorMode)
         {
            if(this.var_636)
            {
               this.var_632.name_1340(name_1338.name_1140);
               this.var_632.name_1341(localeService.getText(name_390.name_1351));
            }
            else
            {
               this.var_632.name_1340(name_1338.name_1346);
               this.var_632.name_1341(localeService.getText(name_390.name_1344));
            }
            return;
         }
         if(this.var_636 && this.var_638 != BattleTeamType.NONE)
         {
            if(this.var_638 == BattleTeamType.BLUE)
            {
               this.var_632.name_1340(name_1338.BLUE);
            }
            else
            {
               this.var_632.name_1340(name_1338.RED);
            }
            this.var_632.name_1341(localeService.getText(name_390.name_1349));
         }
         else
         {
            this.var_632.name_1340(name_1338.name_1346);
            this.var_632.name_1341(localeService.getText(name_390.name_1344));
         }
      }
      
      private function method_888() : void
      {
         this.var_636 = !this.var_636;
         this.method_884();
      }
      
      public function closeChat() : void
      {
         var _loc3_:int = 0;
         if(!this.var_635 || this.var_639)
         {
            return;
         }
         this.var_633.visible = this.var_637;
         if(this.var_632.visible)
         {
            this.input.removeEventListener(FocusEvent.FOCUS_OUT,this.method_883);
            if(fullscreenService.name_49())
            {
               Main.stage.removeEventListener("fullScreen",this.method_320);
               Main.stage.removeEventListener("fullScreenInteractiveAccepted",this.method_320);
            }
            this.var_632.visible = false;
            this.var_634.visible = false;
            this.var_634.name_1342("");
            Main.stage.focus = null;
            this.var_633.name_1353();
            this.var_635 = false;
            this.onResize();
         }
         battleInputLockService.unlock(name_665.name_557);
         dispatchEvent(new name_1337(name_1337.name_1348,null,false));
         var _loc1_:name_32 = name_32(Main.osgi.name_6(name_32));
         var _loc2_:Vector.<name_66> = _loc1_.getModelsByInterface(class_9);
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.length - 1;
            while(_loc3_ >= 0)
            {
               class_9(_loc2_[_loc3_]).chatClosed();
               _loc3_--;
            }
         }
      }
      
      private function init() : void
      {
         this.var_632 = new BattleChatInput();
         this.var_632.tabEnabled = false;
         this.var_632.tabChildren = false;
         this.var_632.x = 10;
         addChild(this.var_632);
         this.input = this.var_632.textField;
         this.input.maxChars = 299;
         this.input.addEventListener(KeyboardEvent.KEY_UP,this.method_236);
         this.input.addEventListener(FocusEvent.FOCUS_IN,this.method_890);
         this.var_633 = new BattleChatOutput();
         this.var_633.tabEnabled = false;
         this.var_633.tabChildren = false;
         this.var_633.x = 10;
         addChild(this.var_633);
         this.var_634 = new name_1339();
         this.var_634.x = 10;
         this.var_634.y = this.var_632.y + 35;
         this.var_634.visible = false;
         this.var_634.name_1342(name_1339.name_1343);
         addChild(this.var_634);
         this.method_889();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_886);
      }
      
      private function method_889() : void
      {
         this.var_640 = {
            "/block":new BlockCommandHandler(this.var_633),
            "/unblock":new UnblockCommandHandler(this.var_633)
         };
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.var_632.visible = false;
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function method_886(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         if(this.var_635)
         {
            this.var_633.name_1355();
         }
         this.var_632.width = int(0.25 * Main.stage.stageWidth);
         this.var_632.y = Main.stage.stageHeight - this.var_632.height - 70;
         _loc2_ = this.var_632.y - this.var_633.height - 10;
         if(_loc2_ < 50)
         {
            while(_loc2_ < 50)
            {
               _loc2_ += this.var_633.height;
               this.var_633.name_1352();
               _loc2_ -= this.var_633.height;
            }
         }
         this.var_633.y = _loc2_;
         this.var_634.name_1347(0.25 * Main.stage.stageWidth);
         this.var_634.y = this.var_632.y + 35;
      }
      
      private function method_236(param1:KeyboardEvent) : void
      {
         if(this.var_632.visible)
         {
            if(param1.keyCode == Keyboard.ENTER)
            {
               if(this.input.text != "")
               {
                  if(!this.method_885(this.input.text) && hasEventListener(name_1337.name_1345))
                  {
                     dispatchEvent(new name_1337(name_1337.name_1345,this.input.text,this.var_636));
                  }
                  this.input.text = "";
               }
               param1.keyCode = 0;
               this.closeChat();
            }
            if(name_1022.name_1036(param1.keyCode))
            {
               param1.keyCode = 0;
               this.closeChat();
            }
            if(param1.keyCode == Keyboard.TAB)
            {
               this.method_888();
            }
         }
      }
      
      private function method_885(param1:String) : Boolean
      {
         if(param1.charAt(0) != "/")
         {
            return false;
         }
         var _loc2_:Array = param1.split(/\s+/);
         if(_loc2_.length == 0)
         {
            return false;
         }
         var _loc3_:String = _loc2_.shift();
         var _loc4_:name_1350 = this.var_640[_loc3_];
         if(_loc4_ == null)
         {
            return false;
         }
         _loc4_.method_885(_loc2_);
         return true;
      }
      
      private function method_890(param1:FocusEvent) : void
      {
         if(!this.var_635)
         {
            this.method_887();
         }
      }
      
      private function method_883(param1:FocusEvent) : void
      {
         if(stage && this.input && this.var_632 && this.var_632.visible)
         {
            stage.focus = this.input;
         }
         else
         {
            this.closeChat();
         }
      }
      
      private function method_887() : void
      {
         if(Main.stage.focus == this.input)
         {
            Main.stage.focus = null;
         }
      }
      
      private function method_320(param1:Event) : void
      {
         if(this.var_635)
         {
            stage.focus = this.input;
         }
      }
      
      private function method_893(param1:KeyboardEvent) : void
      {
         param1.stopPropagation();
      }
   }
}
