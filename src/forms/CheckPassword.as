package forms
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.service.name_554;
   import controls.DefaultButton;
   import controls.Label;
   import controls.base.LabelBase;
   import controls.base.name_2016;
   import controls.base.name_3489;
   import controls.dropdownlist.AccountsList;
   import controls.name_2021;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.net.SharedObject;
   import package_1.Main;
   import package_280.name_2014;
   import package_420.StartExternalEntranceEvent;
   import package_459.name_3000;
   import package_54.name_102;
   import package_60.TextConst;
   import package_95.IStorageService;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class CheckPassword extends Sprite
   {
      
      public static var storageService:IStorageService = IStorageService(OSGi.getInstance().getService(IStorageService));
      
      public static var var_3560:name_554 = name_554(OSGi.getInstance().getService(name_554));
       
      
      public var callSign:name_2016;
      
      public var name_2445:LabelBase;
      
      public var name_3068:name_3489;
      
      public var name_3070:name_2021;
      
      public var name_2429:DefaultButton;
      
      public var name_3071:LabelBase;
      
      public var name_2430:name_3000;
      
      private var var_3559:AccountsList;
      
      private var var_3562:Boolean = false;
      
      private var var_3561:ExternalEntranceForm;
      
      private var bg:TankWindowWithHeader;
      
      private var label:Label;
      
      private var p:Number = 0.5;
      
      private var var_2991:int = 25;
      
      private var var_2981:int = 372;
      
      private var var_2992:int = 193;
      
      private var var_2984:int = 72;
      
      public function CheckPassword()
      {
         var _loc2_:name_102 = null;
         _loc2_ = Main.osgi.getService(name_102) as name_102;
         this.bg = TankWindowWithHeader.createWindow(_loc2_.getText(name_390.const_882),this.var_2981,this.var_2992);
         super();
         this.name_2445 = new LabelBase();
         this.name_2445.htmlText = _loc2_.getText(TextConst.CHECK_PASSWORD_FORM_RESTORE_LINK_TEXT);
         this.name_2445.x = this.var_2981 - this.name_2445.width - this.var_2991;
         this.name_2445.y = this.var_2991;
         this.bg.addChild(this.name_2445);
         this.callSign = new name_2016();
         this.callSign.label = _loc2_.getText(TextConst.CHECK_PASSWORD_FORM_CALLSIGN);
         this.callSign.maxChars = 20;
         this.name_3068 = new name_3489();
         this.name_3068.label = _loc2_.getText(TextConst.CHECK_PASSWORD_FORM_PASSWORD);
         this.var_2984 = this.var_2991 - 3 + (Math.abs(this.callSign._label.x) > Math.abs(this.name_3068._label.x) ? Math.abs(this.callSign._label.x) : Math.abs(this.name_3068._label.x));
         this.name_3071 = new LabelBase();
         this.name_3071.htmlText = "<a href=\'event:\'><font color=\'#59ff32\'><u>" + _loc2_.getText(TextConst.const_180) + "</u></font></a>";
         this.name_3071.width = Math.max(this.name_3071.width,115);
         this.name_3071.x = this.var_2984;
         this.name_3071.y = this.var_2991;
         this.bg.addChild(this.name_3071);
         this.callSign.width = this.var_2981 - this.var_2984 - this.var_2991;
         this.callSign.x = this.var_2984;
         this.callSign.y = this.var_2991 + this.name_2445.height + this.var_2991 / 3;
         this.callSign.tabIndex = 0;
         this.callSign.restrict = ".0-9a-zA-z_\\-";
         this.callSign.addEventListener(name_2014.name_2020,this.onCallsignChanged);
         this.var_3559 = new AccountsList(this.callSign);
         this.var_3559.tabChildren = false;
         this.var_3559.x = this.callSign.x;
         this.var_3559.y = this.callSign.y + 3;
         this.var_3559.addEventListener(Event.CHANGE,this.method_3182);
         this.var_3559.width = this.var_2981 - this.var_2984 - this.var_2991;
         this.var_3559.name_3491();
         this.name_3068.width = this.var_2981 - this.var_2984 - this.var_2991;
         this.name_3068.x = this.var_2984;
         this.name_3068.y = this.callSign.y + this.callSign.height + this.var_2991 / 3;
         this.name_3068.hidden = true;
         this.name_3068.tabIndex = 1;
         this.bg.addChild(this.name_3068);
         this.name_3070 = new name_2021();
         this.name_3070.x = this.var_2984;
         this.name_3070.y = this.var_2992 - this.name_3070.height - this.var_2991 - 2;
         this.bg.addChild(this.name_3070);
         this.label = new Label();
         this.label.x = this.name_3070.x + this.name_3070.width;
         this.label.y = this.name_3070.y + 5;
         this.label.text = _loc2_.getText(TextConst.CHECK_PASSWORD_FORM_REMEMBER);
         this.bg.addChild(this.label);
         var _loc3_:GlowFilter = new GlowFilter();
         this.name_2429 = new DefaultButton();
         this.name_2429.label = _loc2_.getText(TextConst.CHECK_PASSWORD_FORM_PLAY_BUTTON);
         this.name_2429.addEventListener(MouseEvent.CLICK,this.method_3183);
         this.name_2429.width = this.name_3071.width = Math.max(this.name_2429.width,this.name_3071.width);
         this.name_2429.x = this.var_2981 - this.var_2991 - this.name_2429.width;
         this.name_2429.y = this.var_2992 - this.name_2429.height - this.var_2991;
         this.bg.addChild(this.name_2429);
         this.bg.addChild(this.callSign);
         this.bg.addChild(this.var_3559);
         if(Boolean(var_3560.method_1403) || Boolean(var_3560.method_1402) || Boolean(var_3560.method_1404))
         {
            this.var_3561 = new ExternalEntranceForm(this.var_2981 - 40,85,_loc2_.getText(name_390.const_1147));
            addChild(this.var_3561);
            this.var_3561.y = this.bg.y + this.bg.height - 15;
            this.var_3561.x = this.bg.x + (this.var_2981 - this.var_3561.width) / 2;
            if(var_3560.method_1402)
            {
               this.var_3561.name_3490.addEventListener(MouseEvent.CLICK,this.method_3184);
            }
         }
         addChild(this.bg);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         stage.removeEventListener(Event.RESIZE,this.onResize);
         this.name_2429.removeEventListener(MouseEvent.CLICK,this.method_3183);
         this.var_3559.removeEventListener(Event.CHANGE,this.method_3182);
         this.callSign.removeEventListener(name_2014.name_2020,this.onCallsignChanged);
      }
      
      private function method_3184(param1:MouseEvent) : void
      {
         dispatchEvent(new StartExternalEntranceEvent(StartExternalEntranceEvent.START_LOGIN,"discord",this.name_3070.checked));
      }
      
      private function onCallsignChanged(param1:name_2014) : void
      {
         if(this.var_3562)
         {
            this.name_3068.enable = true;
            this.password = "";
            this.var_3562 = false;
         }
      }
      
      private function method_3183(param1:MouseEvent) : void
      {
         if(this.var_3562)
         {
            this.method_3185();
         }
      }
      
      private function method_3185() : void
      {
         var _loc1_:SharedObject = storageService.getStorage();
         var _loc2_:Object = this.var_3559.selectedItem.data;
         _loc1_.data.userName = _loc2_.userName;
         _loc1_.data.userHash = _loc2_.userHash;
         if(!this.name_3070.checked)
         {
            _loc1_.data.userHash = null;
         }
         _loc1_.flush();
      }
      
      private function method_3182(param1:Event) : void
      {
         if(!this.var_3559.selectedItem)
         {
            this.var_3562 = false;
            if(this.var_3559.length == 0)
            {
               this.callSign.value = "";
               this.password = "";
               this.name_3068.enable = true;
               this.var_3559.visible = false;
               this.var_3559.removeEventListener(Event.CHANGE,this.method_3182);
            }
            else
            {
               this.var_3559.name_1963(0);
            }
            return;
         }
         this.callSign.value = this.var_3559.selectedItem.data.userName;
         this.name_3068.enable = false;
         this.password = "12345678";
         this.var_3562 = true;
      }
      
      public function method_2785(param1:Event = null) : void
      {
         this.x = int((Main.stage.stageWidth - this.var_2981) / 2);
         this.y = int((Main.stage.stageHeight - this.var_2992) / 2);
      }
      
      private function onResize(param1:Event) : void
      {
         this.method_2785(param1);
      }
      
      public function method_2792(param1:Boolean) : void
      {
         if(param1 && this.name_2430 == null)
         {
            this.name_2430 = new name_3000();
            this.bg.addChild(this.name_2430);
            this.name_2430.x = this.var_2984;
            this.name_2430.y = this.name_3068.y + this.name_3068.height + this.var_2991 - 5;
            this.name_2430.width = this.var_2981 - this.var_2984 - this.var_2991;
            this.name_2429.y = this.name_2430.y + this.name_2430.height + this.var_2991 - 5;
            this.name_3070.y = this.name_2429.y + 2;
            this.label.y = this.name_3070.y + 5;
            this.var_2992 = this.var_2992 + this.name_2430.height + this.var_2991 - 5;
            this.bg.height = this.var_2992;
            if(this.var_3561 != null)
            {
               this.var_3561.y = this.bg.y + this.bg.height - 15;
            }
            this.y -= this.name_2430.height / 2;
            this.p = this.y / stage.height;
            this.onResize(null);
            stage.addEventListener(Event.RESIZE,this.onResize);
         }
      }
      
      public function get name_2447() : String
      {
         return this.name_3068.value;
      }
      
      public function set password(param1:String) : void
      {
         this.name_3068.value = param1;
      }
      
      public function get password() : String
      {
         return this.name_3068.value;
      }
      
      public function get hash() : String
      {
         if(this.var_3559.selectedItem == null || !this.var_3562)
         {
            return null;
         }
         return this.var_3559.selectedItem.data.userHash;
      }
   }
}
