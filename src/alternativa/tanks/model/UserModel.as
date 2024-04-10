package alternativa.tanks.model
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.name_2422;
   import alternativa.tanks.gui.name_2435;
   import alternativa.tanks.gui.name_2436;
   import alternativa.tanks.loader.name_13;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import forms.Alert;
   import forms.RegisterForm;
   import forms.name_2428;
   import forms.name_2433;
   import forms.name_358;
   import package_1.Main;
   import package_102.Command;
   import package_102.Type;
   import package_124.name_42;
   import package_13.Long;
   import package_171.name_528;
   import package_280.name_1011;
   import package_280.name_2014;
   import package_281.name_986;
   import package_306.LoginByHashModel;
   import package_4.ClientObject;
   import package_419.class_172;
   import package_419.class_173;
   import package_419.name_2425;
   import package_419.name_2426;
   import package_419.name_2427;
   import package_420.StartExternalEntranceEvent;
   import package_54.name_102;
   import package_60.TextConst;
   import package_7.name_28;
   import package_95.IStorageService;
   import platform.client.fp10.core.registry.name_29;
   import scpacker.networking.Network;
   import scpacker.networking.class_6;
   import scpacker.networking.INetworker;
   
   public class UserModel extends class_172 implements class_173, class_11, class_6
   {
       
      
      private var var_1796:name_28;
      
      private var var_1804:name_528;
      
      private var clientObject:ClientObject;
      
      private var var_83:DisplayObjectContainer;
      
      private var var_2053:name_2433;
      
      private var var_2055:Alert;
      
      private var var_814:Alert;
      
      private var var_2054:name_2435;
      
      private var var_2063:int = -1;
      
      private var var_2064:int = -1;
      
      private const const_1792:int = 250;
      
      private const const_1793:int = 3000;
      
      private const const_1796:int = 1;
      
      private const const_1794:int = 2;
      
      private const const_1795:int = 3;
      
      private var state:int = 0;
      
      private var var_2060:String = "-_.";
      
      private var hash:String;
      
      private var var_2058:String;
      
      private var up:String;
      
      private var emailConfirmHash:String;
      
      private var email:String;
      
      private var emailChangeHash:String;
      
      private var var_2056:name_2436;
      
      private var var_2059:Boolean;
      
      private var var_2062:Boolean;
      
      private var params:Dictionary;
      
      private var var_2057:Timer;
      
      private const const_1791:int = 500;
      
      private var localeService:name_102;
      
      private var network:Network;
      
      private var modelRegister:name_29;
      
      private var var_2061:Boolean;
      
      public function UserModel()
      {
         super();
         _interfaces.push(IModel);
         _interfaces.push(class_173);
         _interfaces.push(class_11);
         this.localeService = name_102(Main.osgi.getService(name_102));
         this.var_83 = Main.contentUILayer;
         this.var_2056 = new name_2436();
         this.var_1796 = Main.osgi.getService(name_28) as name_28;
         this.var_1804 = Main.osgi.getService(name_528) as name_528;
         this.modelRegister = Main.osgi.getService(name_29) as name_29;
      }
      
      public function initObject(param1:ClientObject, param2:Boolean, param3:Boolean) : void
      {
         this.var_2059 = param3;
         this.var_2062 = param2;
         this.var_2053 = new name_2433(param2);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:name_13 = null;
         var _loc9_:name_13 = null;
         Main.method_8("USER MODEL","objectLoaded");
         this.clientObject = param1;
         var _loc2_:SharedObject = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         var _loc3_:SharedObject = IStorageService(Main.osgi.getService(IStorageService)).getAccountsStorage();
         this.network = Main.osgi.getService(INetworker) as Network;
         this.network.addListener(this);
         if(this.var_1796 != null)
         {
            _loc4_ = String(this.var_1796.getValue());
            _loc5_ = _loc4_.split("&");
            this.params = new Dictionary();
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               _loc7_ = (_loc5_[_loc6_] as String).split("=");
               this.params[_loc7_[0]] = _loc7_[1];
               _loc6_++;
            }
            this.hash = this.params["hash"];
            this.emailConfirmHash = this.params["emailConfirmHash"];
            this.email = this.params["userEmail"];
            this.emailChangeHash = this.params["emailChangeHash"];
         }
         Main.method_8("USER MODEL","hassssssh: %1",this.hash);
         if(!(this.hash != null && this.hash != ""))
         {
            this.hash = _loc2_.data.userHash;
         }
         if(this.email != null && this.email != "")
         {
            _loc2_.data.userEmail = this.email;
         }
         else
         {
            this.email = _loc2_.data.userEmail;
         }
         this.var_2058 = _loc2_.data.userName;
         this.up = _loc2_.data.up;
         Main.method_9("USER MODEL","   hash: %1",this.hash);
         Main.method_9("USER MODEL","   email: %1",this.email);
         Main.method_9("USER MODEL","   emailConfirmHash: %1",this.emailConfirmHash);
         if(this.emailConfirmHash != null)
         {
            _loc8_ = Main.osgi.getService(name_13) as name_13;
            _loc8_.hideForcibly();
            this.var_814 = new Alert(Alert.const_1667);
            this.var_83.addChild(this.var_814);
            this.var_814.addEventListener(name_1011.ALERT_BUTTON_PRESSED,this.method_201);
         }
         else if(this.emailChangeHash != null)
         {
            _loc9_ = Main.osgi.getService(name_13) as name_13;
            _loc9_.hideForcibly();
         }
         else
         {
            this.enter();
         }
      }
      
      public function onData(param1:Command) : void
      {
         var _loc2_:Vector.<String> = null;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:SharedObject = null;
         var _loc6_:Alert = null;
         if(param1.type == Type.REGISTRATON)
         {
            switch(param1.name_319[0])
            {
               case "check_name_result":
                  this.method_2158(null,param1.name_319[1] == "not_exist" ? true : false);
                  break;
               case "info_done":
                  IStorageService(Main.osgi.getService(IStorageService)).getStorage().data.alreadyPlayedTanks = true;
                  this.objectUnloaded(this.clientObject);
                  name_13(Main.osgi.getService(name_13)).show();
                  (Main.osgi.getService(ILobby) as Lobby).beforeAuth();
                  break;
               case "set_free_uids":
                  _loc2_ = new Vector.<String>();
                  _loc3_ = JSON.parse(param1.name_319[1]);
                  for each(_loc4_ in _loc3_)
                  {
                     _loc2_.push(_loc4_);
                  }
                  this.var_2053.name_2423.name_2456(_loc2_);
            }
         }
         else if(param1.type == Type.AUTH)
         {
            switch(param1.name_319[0])
            {
               case "accept":
                  this.objectUnloaded(this.clientObject);
                  name_13(Main.osgi.getService(name_13)).show();
                  (Main.osgi.getService(ILobby) as Lobby).beforeAuth();
                  break;
               case "remember_hash":
                  _loc5_ = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
                  _loc5_.data.userName = param1.name_319[1];
                  LoginByHashModel(this.modelRegister.getModel(Long.getLong(1662174151,-1895153624))).rememberAccount(param1.name_319[2]);
                  break;
               case "denied":
                  this.method_2155(null);
                  break;
               case "not_exist":
                  this.method_2155(null);
                  break;
               case "ban":
                  this.method_2162(param1.name_319[1],true);
                  break;
               case "recovery_account_done":
                  this.var_83.addChild(new name_986(this.localeService.getText(TextConst.name_1000),this.method_554));
                  break;
               case "recovery_account_result":
                  if(param1.name_319[1] == "false")
                  {
                     this.method_2143(null,false,this.localeService.getText(TextConst.const_219));
                  }
                  break;
               case "wrong_captcha":
                  this.method_2165(null);
                  break;
               case "recovery_account_code":
                  if(param1.name_319[1] == "true")
                  {
                     this.method_2161(null,name_2425.OK);
                     this.method_2166(null,param1.name_319[2]);
                     break;
                  }
                  _loc6_ = new Alert();
                  _loc6_.showAlert(this.localeService.getText(TextConst.const_319),[name_358.OK]);
                  this.var_83.addChild(_loc6_);
                  break;
               case "enable_captcha":
                  this.var_2053.name_2461(param1.name_319[1],param1.name_319[2]);
                  break;
               case "update_captcha":
                  this.var_2053.name_2448(param1.name_319[1],param1.name_319[2]);
                  break;
               case "open_url":
                  navigateToURL(new URLRequest(param1.name_319[1]),"_self");
                  break;
               case "recovery_account":
                  if(param1.name_319[1] == "false")
                  {
                     this.method_2143(null,false,this.localeService.getText(TextConst.const_219));
                     break;
                  }
                  this.method_2143(null,true,this.localeService.getText(TextConst.const_215));
                  break;
            }
         }
      }
      
      private function method_554(param1:String) : void
      {
         Network(Main.osgi.getService(INetworker)).send("auth;confirm_email_code;" + param1);
      }
      
      public function method_2166(param1:ClientObject, param2:String) : void
      {
         this.var_2054 = new name_2435();
         this.var_2054.email = param2;
         this.var_2054.addEventListener(name_2422.name_2438,this.method_2144);
         this.var_2054.addEventListener(name_2422.name_2434,this.method_2147);
         this.var_83.addChild(this.var_2054);
         this.method_2153(null);
         Main.stage.addEventListener(Event.RESIZE,this.method_2153);
         this.hideWindow();
      }
      
      public function method_2178(param1:ClientObject) : void
      {
         var _loc2_:Alert = new Alert();
         _loc2_.showAlert(this.localeService.getText(TextConst.SETTINGS_CHANGE_PASSWORD_WRONG_LINK_TEXT),[name_358.OK]);
         this.var_83.addChild(_loc2_);
         _loc2_.addEventListener(name_1011.ALERT_BUTTON_PRESSED,this.method_2160);
      }
      
      private function method_2160(param1:name_1011) : void
      {
         this.enter();
      }
      
      private function enter() : void
      {
         var _loc1_:String = null;
         if(this.hash != null)
         {
            Main.method_8("USER MODEL","loginByHash: " + this.hash);
            LoginByHashModel(this.modelRegister.getModel(Long.getLong(1662174151,-1895153624))).loginByHash(this.hash);
         }
         else if(this.var_2058 != null && this.var_2058 != "" && this.up != null && this.up != "")
         {
            _loc1_ = this.var_2058 + ";" + this.up;
            this.network.send("auth;" + _loc1_);
         }
         else if(this.var_2059)
         {
            this.method_2151();
         }
         else
         {
            this.method_2146();
         }
      }
      
      private function method_2146() : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         this.var_2057 = new Timer(500,1);
         this.var_2057.addEventListener(TimerEvent.TIMER_COMPLETE,this.onCallsignCheckTimerComplete);
         this.showWindow();
         var _loc1_:SharedObject = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         var _loc2_:Boolean = Boolean(_loc1_.data.alreadyPlayedTanks);
         Main.method_8("USER MODEL","VasyaWasHere: %1",_loc2_);
         if(_loc2_)
         {
            this.state = 1;
            this.var_2053.loginState = true;
            _loc3_ = String(_loc1_.data.userName);
            _loc4_ = String(_loc1_.data.up);
            Main.method_8("USER MODEL","userName: %1",_loc3_);
            Main.method_8("USER MODEL","rememberUserFlag: %1",_loc1_.data.rememberUserFlag);
            if(_loc3_ != null)
            {
               this.var_2053.callSign = _loc3_;
            }
            if(Boolean(_loc1_.data.rememberUserFlag))
            {
               this.var_2053.remember = _loc1_.data.rememberUserFlag;
            }
            _loc5_ = String(this.var_1804.params["user"]);
            if(_loc5_ != null)
            {
               this.var_2053.callSign = _loc5_;
            }
            _loc5_ = String(this.var_1804.params["password"]);
            if(_loc5_ != null)
            {
               this.var_2053.name_2424.password = _loc5_;
            }
         }
         else
         {
            this.state = 2;
            this.var_2053.loginState = false;
            this.network.send("registration;state");
            if(this.var_1796 != null)
            {
               if(this.var_1804.params["partner"] != null)
               {
                  this.var_1796.setValue("registration/partner=" + this.var_1804.params["partner"]);
               }
               else
               {
                  this.var_1796.setValue("registration");
               }
            }
         }
      }
      
      private function method_201(param1:name_1011) : void
      {
      }
      
      public function method_2172(param1:ClientObject, param2:name_2427) : void
      {
         switch(param2)
         {
            case name_2427.ERROR:
               this.enter();
               break;
            case name_2427.OK:
               this.enter();
               break;
            case name_2427.name_2451:
               this.package_393();
         }
      }
      
      private function package_393(param1:name_1011 = null) : void
      {
         navigateToURL(new URLRequest("http://alternativaplatform.com/ru/"),"_self");
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:name_13 = Main.osgi.getService(name_13) as name_13;
         var _loc3_:SharedObject = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         _loc3_.data.alreadyPlayedTanks = true;
         if(this.var_2057 != null)
         {
            this.var_2057.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onCallsignCheckTimerComplete);
            this.var_2057 = null;
         }
         if(this.state != 0)
         {
            this.var_2053.hide();
            this.hideWindow();
         }
         this.network.removeListener(this);
         this.var_2053 = null;
         this.clientObject = null;
      }
      
      public function method_2176(param1:ClientObject) : void
      {
         Main.method_8("USER MODEL","hashLoginFailed!");
         var _loc2_:name_13 = Main.osgi.getService(name_13) as name_13;
         _loc2_.hideForcibly();
         if(this.var_2059)
         {
            this.method_2151();
         }
         else
         {
            this.method_2146();
         }
      }
      
      public function method_2165(param1:ClientObject) : void
      {
         this.method_2142(Alert.const_1669);
         this.var_2053.name_2423.name_2429.enable = true;
         this.var_2053.name_2424.name_2429.enable = true;
         this.var_2053.name_2431.name_2437.enable = true;
      }
      
      public function method_2155(param1:ClientObject) : void
      {
         Main.method_8("USER MODEL","passwdLoginFailed!");
         this.showWindow();
         this.state = 1;
         var _loc2_:SharedObject = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         var _loc3_:String = String(_loc2_.data.userName);
         this.var_2053.loginState = true;
         if(_loc3_ != null)
         {
            this.var_2053.callSign = _loc3_;
         }
         if(Boolean(_loc2_.data.rememberUserFlag))
         {
            this.var_2053.remember = _loc2_.data.rememberUserFlag;
         }
         this.method_2142(Alert.ERROR_PASSWORD_INCORRECT);
         this.var_2053.name_2455();
         this.var_2053.name_2423.name_2429.enable = true;
         this.var_2053.name_2424.name_2429.enable = true;
         this.var_2053.name_2431.name_2437.enable = true;
      }
      
      public function method_2170(param1:ClientObject, param2:name_2426) : void
      {
         Main.method_8("USER MODEL","registerStatus: " + param2);
         switch(param2)
         {
            case name_2426.name_2452:
               this.method_2142(Alert.const_1668);
               break;
            case name_2426.name_2458:
               this.method_2142(Alert.ERROR_EMAIL_INVALID);
               break;
            case name_2426.name_2457:
               this.method_2142(Alert.const_1661);
         }
         this.var_2053.name_2423.name_2429.enable = true;
         this.var_2053.name_2424.name_2429.enable = true;
         this.var_2053.name_2431.name_2437.enable = true;
      }
      
      public function method_2169(param1:ClientObject, param2:String) : void
      {
         Main.method_8("USER MODEL","setHash: " + param2);
         var _loc3_:SharedObject = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         _loc3_.data.userHash = param2;
         _loc3_.data.alreadyPlayedTanks = true;
         var _loc4_:String = _loc3_.flush();
         Main.method_8("USER MODEL","setHash result: " + _loc4_);
      }
      
      public function method_2161(param1:ClientObject, param2:name_2425) : void
      {
         switch(param2)
         {
            case name_2425.OK:
               Main.method_8("USER MODEL","restorePasswordStatus: OK");
               this.var_2053.name_2441();
               this.state = 1;
               break;
            case name_2425.name_2454:
               Main.method_8("USER MODEL","restorePasswordStatus: MAIL_NOT_FOUND");
               this.var_2053.name_2453();
               this.method_2142(Alert.const_1663);
               break;
            case name_2425.name_2450:
               Main.method_8("USER MODEL","restorePasswordStatus: MAIL_NOT_SEND");
               this.var_2053.name_2441();
               this.method_2142(Alert.const_1659);
         }
      }
      
      public function method_2177(param1:ClientObject, param2:String) : void
      {
         Main.method_8("USER MODEL","setLicenseText: " + param2);
         var _loc3_:name_2428 = new name_2428();
         this.var_83.addChild(_loc3_);
         _loc3_.text = param2;
      }
      
      public function method_2175(param1:ClientObject, param2:String) : void
      {
         var _loc3_:name_2428 = new name_2428();
         this.var_83.addChild(_loc3_);
         _loc3_.text = param2;
      }
      
      public function method_2173(param1:ClientObject) : void
      {
         this.method_2150();
         this.method_2146();
      }
      
      public function method_2171(param1:ClientObject, param2:String) : void
      {
         this.method_2150();
         var _loc3_:SharedObject = IStorageService(Main.osgi.getService(IStorageService)).getStorage();
         this.showWindow();
         this.state = 1;
         this.var_2053.loginState = true;
         this.var_2053.callSign = param2;
         if(Boolean(_loc3_.data.rememberUserFlag))
         {
            this.var_2053.remember = _loc3_.data.rememberUserFlag;
         }
      }
      
      public function method_2168(param1:ClientObject) : void
      {
         this.var_2056.name_2460();
      }
      
      public function method_2158(param1:ClientObject, param2:Boolean) : void
      {
         Main.method_8("USER MODEL","nameUnique result: %1",param2);
         this.var_2053.name_2423.name_2432 = param2 ? RegisterForm.name_2449 : RegisterForm.name_2443;
         this.var_2061 = param2;
      }
      
      private function showWindow() : void
      {
         Main.method_8("USER MODEL","showWindow");
         if(!this.var_83.contains(this.var_2053))
         {
            this.var_83.addChild(this.var_2053);
         }
         this.var_2053.addEventListener(name_2014.name_2440,this.method_2154);
         this.var_2053.addEventListener(name_2014.name_2439,this.method_2156);
         this.var_2053.addEventListener(name_2014.CHANGE_STATE,this.method_1960);
         this.var_2053.addEventListener(name_2014.name_2446,this.onLoginRestore);
         this.var_2053.name_2424.name_2445.addEventListener(MouseEvent.CLICK,this.onRestoreClick);
         this.var_2053.addEventListener(name_2014.name_2444,this.method_2148);
         Main.method_8("USER MODEL","   callSign.addEventListener(LoginFormEvent.TEXT_CHANGED)");
         this.var_2053.name_2423.callSign.addEventListener(name_2014.name_2020,this.onCallsignChanged);
         this.var_2053.name_2424.addEventListener(StartExternalEntranceEvent.START_LOGIN,this.method_2152);
      }
      
      private function hideWindow() : void
      {
         Main.method_8("USER MODEL","hideWindow");
         if(this.var_83.contains(this.var_2053))
         {
            this.var_83.removeChild(this.var_2053);
         }
         this.var_2053.removeEventListener(name_2014.name_2440,this.method_2154);
         this.var_2053.removeEventListener(name_2014.name_2439,this.method_2156);
         this.var_2053.removeEventListener(name_2014.CHANGE_STATE,this.method_1960);
         this.var_2053.removeEventListener(name_2014.name_2446,this.onLoginRestore);
         this.var_2053.name_2424.name_2445.removeEventListener(MouseEvent.CLICK,this.onRestoreClick);
         this.var_2053.removeEventListener(name_2014.name_2444,this.method_2148);
         Main.method_8("USER MODEL","   callSign.removeEventListener(LoginFormEvent.TEXT_CHANGED)");
         this.var_2053.name_2423.callSign.removeEventListener(name_2014.name_2020,this.onCallsignChanged);
         this.var_2053.name_2424.removeEventListener(StartExternalEntranceEvent.START_LOGIN,this.method_2152);
      }
      
      private function method_2152(param1:StartExternalEntranceEvent) : void
      {
         this.network.send("auth;externalLogin;" + param1.name_2104);
      }
      
      private function onCallsignChanged(param1:name_2014) : void
      {
         Main.method_8("USER MODEL","onCallsignChanged");
         this.var_2057.reset();
         this.var_2057.start();
      }
      
      private function onCallsignCheckTimerComplete(param1:TimerEvent) : void
      {
         Main.method_8("USER MODEL","onCallsignCheckTimerComplete");
         var _loc2_:RegExp = /^[a-z0-9](([\.\-\w](?!(-|_|\.){2,}))*[a-z0-9])?$/i;
         var _loc3_:Array = this.var_2053.name_2423.callSign.value.match(_loc2_);
         if(_loc3_ != null)
         {
            this.var_2053.name_2423.name_2432 = RegisterForm.name_2297;
            this.network.send("registration;check_name;" + this.var_2053.name_2423.callSign.value);
         }
         else
         {
            this.var_2053.name_2423.name_2432 = RegisterForm.name_2443;
         }
      }
      
      private function method_2142(param1:int) : void
      {
         this.var_2055 = new Alert(param1);
         if(!this.var_83.contains(this.var_2055))
         {
            this.var_83.addChild(this.var_2055);
            Main.stage.focus = this.var_2055.name_983;
         }
      }
      
      public function method_2162(param1:String, param2:Boolean) : void
      {
         name_42(OSGi.getInstance().getService(name_42)).showAlert(param1,Vector.<String>(["Ok"]));
      }
      
      private function method_2151() : void
      {
         if(!this.var_83.contains(this.var_2056))
         {
            this.var_83.addChild(this.var_2056);
            this.method_2145();
            Main.stage.addEventListener(Event.RESIZE,this.method_2145);
            this.var_2056.addEventListener(Event.COMPLETE,this.method_2149);
         }
      }
      
      private function method_2150() : void
      {
         if(this.var_83.contains(this.var_2056))
         {
            this.var_83.removeChild(this.var_2056);
            Main.stage.removeEventListener(Event.RESIZE,this.method_2145);
            this.var_2056.removeEventListener(Event.COMPLETE,this.method_2149);
         }
      }
      
      private function method_2145(param1:Event = null) : void
      {
         this.var_2056.x = Math.round((Main.stage.stageWidth - this.var_2056.width) * 0.5);
         this.var_2056.y = Math.round((Main.stage.stageHeight - this.var_2056.height) * 0.5);
      }
      
      private function method_2149(param1:Event) : void
      {
      }
      
      private function method_2148(param1:name_2014) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         switch(this.state)
         {
            case 1:
               Main.method_8("USER MODEL","onPlayPressed STATE_LOGIN");
               Main.method_8("USER MODEL","   callSign: " + this.var_2053.callSign);
               Main.method_8("USER MODEL","   mainPassword: " + this.var_2053.name_2447);
               if(this.var_2053.hash != null)
               {
                  LoginByHashModel(this.modelRegister.getModel(Long.getLong(1662174151,-1895153624))).loginByHash(this.var_2053.hash);
                  break;
               }
               this.method_2163(this.var_2053.callSign,this.var_2053.name_2447,this.var_2053.remember,this.var_2053.name_2424.name_2430 == null ? "" : this.var_2053.name_2424.name_2430.input.value);
               break;
            case 2:
               Main.method_8("USER MODEL","onPlayPressed STATE_REGISTER");
               if(this.var_2053.callSign.length >= 2)
               {
                  if(this.var_2060.indexOf(this.var_2053.callSign.charAt(0)) != -1)
                  {
                     this.method_2142(Alert.const_1665);
                     break;
                  }
                  if(this.var_2053.callSign.indexOf("__") != -1 || this.var_2053.callSign.indexOf("--") != -1 || this.var_2053.callSign.indexOf("..") != -1)
                  {
                     this.method_2142(Alert.const_1664);
                     break;
                  }
                  if(this.var_2060.indexOf(this.var_2053.callSign.charAt(this.var_2053.callSign.length - 1)) != -1)
                  {
                     this.method_2142(Alert.const_1662);
                     break;
                  }
                  if(this.var_2053.pass1.length < 2)
                  {
                     this.method_2142(Alert.ERROR_PASSWORD_LENGTH);
                     break;
                  }
                  if(this.var_2061)
                  {
                     _loc2_ = this.var_1796 != null ? String(this.var_1796.getBaseURL()) : "";
                     _loc3_ = this.params != null ? String(this.params["friend"]) : "";
                     this.method_2167(this.var_2053.callSign,this.var_2053.pass1,this.var_2053.email,this.var_2053.remember,true,this.var_2053.name_2423.name_2430 == null ? "" : this.var_2053.name_2423.name_2430.input.value);
                     break;
                  }
                  this.method_2142(Alert.const_1661);
                  break;
               }
               this.method_2142(Alert.ERROR_CALLSIGN_LENGTH);
               break;
         }
      }
      
      private function method_2163(param1:String, param2:String, param3:Boolean, param4:String) : void
      {
         var _loc5_:String = param1 + ";" + param2 + ";" + param3 + ";";
         if(param4 != null && param4 != "")
         {
            _loc5_ += param4;
         }
         this.network.send("auth;" + _loc5_);
      }
      
      private function method_2167(param1:String, param2:String, param3:String, param4:Boolean, param5:Boolean, param6:String) : void
      {
         var _loc7_:String = param1 + ";" + param2 + ";";
         var _loc8_:SharedObject = Main.osgi.getService(IStorageService).getStorage() as SharedObject;
         if(_loc8_.data.emailUser == null)
         {
            _loc8_.setProperty("emailUser",param3);
         }
         if(param6 != null && param6 != "")
         {
            _loc7_ += param6;
         }
         this.network.send("registration;" + _loc7_);
      }
      
      private function method_1960(param1:name_2014) : void
      {
         if(this.var_2053.loginState)
         {
            this.state = 1;
            if(this.var_1796 != null)
            {
            }
            this.network.send("auth;state");
         }
         else
         {
            this.state = 2;
            if(this.var_1796 != null)
            {
               if(this.var_1804.params["partner"] != null)
               {
                  this.var_1796.setValue("registration/partner=" + this.var_1804.params["partner"]);
               }
               else
               {
                  this.var_1796.setValue("registration");
               }
            }
            this.network.send("registration;state");
         }
         Main.method_8("USER MODEL","onStateChanged: " + this.state);
      }
      
      private function method_2154(param1:name_2014) : void
      {
      }
      
      private function method_2156(param1:name_2014) : void
      {
      }
      
      private function onRestoreClick(param1:MouseEvent) : void
      {
         Main.method_8("USER MODEL","onRestoreClick");
         this.state = 3;
         this.var_2053.name_2459();
         this.network.send("auth;restore_state");
      }
      
      private function onLoginRestore(param1:name_2014) : void
      {
         Main.method_8("USER MODEL","onLoginRestore");
         Main.method_8("USER MODEL","restoreEmail: " + this.var_2053.name_2442);
         this.method_2159(this.var_2053.name_2442);
      }
      
      private function method_2159(param1:String) : void
      {
         if(param1 == null || param1 == "")
         {
            return;
         }
         Network(Main.osgi.getService(INetworker)).send("auth;recovery_account;" + param1 + ";" + this.var_2053.name_2431.name_2430.input.value);
      }
      
      private function method_2147(param1:name_2422) : void
      {
         this.var_2054.removeEventListener(name_2422.name_2434,this.method_2147);
         this.var_2054.removeEventListener(name_2422.name_2438,this.method_2144);
         this.var_83.removeChild(this.var_2054);
         this.enter();
      }
      
      private function method_2144(param1:name_2422) : void
      {
         this.method_2157(this.var_2054.name_2462,this.var_2054.email);
      }
      
      private function method_2157(param1:String, param2:String) : void
      {
         Network(Main.osgi.getService(INetworker)).send("auth;change_pass_email;" + param1 + ";" + param2);
      }
      
      private function method_2153(param1:Event) : void
      {
         this.var_2054.x = Math.round((Main.stage.stageWidth - this.var_2054.width) * 0.5);
         this.var_2054.y = Math.round((Main.stage.stageHeight - this.var_2054.height) * 0.5) - 10;
      }
      
      public function method_2143(param1:ClientObject, param2:Boolean, param3:String) : void
      {
         var _loc4_:Alert = null;
         var _loc5_:Alert = null;
         if(param2 == true)
         {
            this.showWindow();
            if(this.var_83.contains(this.var_2054))
            {
               this.var_2054.removeEventListener(name_2422.name_2434,this.method_2147);
               this.var_2054.removeEventListener(name_2422.name_2438,this.method_2144);
               this.var_83.removeChild(this.var_2054);
               _loc4_ = new Alert();
               _loc4_.showAlert(param3,[name_358.OK]);
               this.var_83.addChild(_loc4_);
               _loc4_.addEventListener(name_1011.ALERT_BUTTON_PRESSED,this.method_2164);
            }
         }
         else
         {
            _loc5_ = new Alert();
            _loc5_.showAlert(param3,[name_358.OK]);
            this.var_83.addChild(_loc5_);
         }
      }
      
      private function method_2164(param1:Event) : void
      {
         this.enter();
      }
      
      public function method_1998(param1:ClientObject) : void
      {
         this.var_2055 = new Alert();
         this.var_2055.showAlert(this.localeService.getText(TextConst.SERVER_IS_RESTARTING_LOGIN_TEXT),[name_358.OK]);
         if(!Main.noticesLayer.contains(this.var_2055))
         {
            Main.noticesLayer.addChild(this.var_2055);
            Main.stage.focus = this.var_2055.name_983;
         }
      }
      
      public function method_2174(param1:ClientObject) : void
      {
         this.var_2055 = new Alert();
         this.var_2055.showAlert("кик нахуй",[name_358.OK]);
         if(!Main.noticesLayer.contains(this.var_2055))
         {
            Main.noticesLayer.addChild(this.var_2055);
            Main.stage.focus = this.var_2055.name_983;
         }
      }
   }
}
