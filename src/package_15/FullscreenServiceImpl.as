package package_15
{
   import flash.display.StageDisplayState;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import package_12.name_24;
   import package_18.name_34;
   import package_273.name_851;
   
   public class FullscreenServiceImpl implements name_34
   {
      
      private static const const_50:String = "mouseLock";
      
      private static const const_49:String = "StandAlone";
      
      private static const const_51:String = "Desktop";
       
      
      private var var_203:name_24;
      
      private var var_206:name_851;
      
      private var var_205:Boolean;
      
      private var var_204:Boolean;
      
      public function FullscreenServiceImpl(param1:name_24, param2:name_851)
      {
         super();
         this.var_203 = param1;
         this.var_206 = param2;
         this.var_205 = this.method_296();
         this.var_204 = Capabilities.playerType == "StandAlone" || Capabilities.playerType == "Desktop";
      }
      
      public function method_288() : void
      {
         if(this.var_203.stage.displayState == StageDisplayState.NORMAL)
         {
            this.activate();
         }
         else
         {
            this.deactivate();
         }
      }
      
      private function activate() : void
      {
         if(this.name_49())
         {
            this.var_203.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
         }
      }
      
      private function deactivate() : void
      {
         this.var_203.stage.displayState = StageDisplayState.NORMAL;
      }
      
      public function name_49() : Boolean
      {
         var _loc1_:Array = this.method_295();
         return int(_loc1_[0]) == 11 && int(_loc1_[1]) >= 3 || int(_loc1_[0]) > 11;
      }
      
      public function method_292() : void
      {
         if(this.method_289() && this.name_49() && !this.method_293())
         {
            this.var_203.stage["mouseLock"] = true;
         }
      }
      
      public function method_289() : Boolean
      {
         return this.var_203.stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE;
      }
      
      public function method_293() : Boolean
      {
         return this.var_205;
      }
      
      private function method_296() : Boolean
      {
         var _loc1_:Object = null;
         var _loc2_:String = this.method_294();
         var _loc3_:String = Capabilities.os;
         if(this.var_204)
         {
            return false;
         }
         var _loc4_:int = 0;
         while(_loc4_ < name_849.name_850.length)
         {
            _loc1_ = name_849.name_850[_loc4_];
            if(_loc2_.indexOf(_loc1_.browser) > -1 && _loc3_.indexOf(_loc1_.os) > -1)
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      private function method_294() : String
      {
         var userAgent:String = null;
         var browser:String = null;
         if(!ExternalInterface.available)
         {
            return "[No ExternalInterface]";
         }
         try
         {
            userAgent = ExternalInterface.call("window.navigator.userAgent.toString");
            browser = "[Unknown Browser]";
            if(userAgent.indexOf("Safari") != -1)
            {
               browser = "Safari";
            }
            if(userAgent.indexOf("Firefox") != -1)
            {
               browser = "Firefox";
            }
            if(userAgent.indexOf("Chrome") != -1)
            {
               browser = "Chrome";
            }
            if(userAgent.indexOf("MSIE") != -1)
            {
               browser = "IE";
            }
            if(userAgent.indexOf("Opera") != -1)
            {
               browser = "Opera";
            }
            if(userAgent.indexOf("YaBrowser") != -1)
            {
               browser = "Yandex";
            }
         }
         catch(e:Error)
         {
            return "[No ExternalInterface]";
         }
         return browser;
      }
      
      private function method_295() : Array
      {
         return Capabilities.version.substr(Capabilities.version.indexOf(" ") + 1).split(",");
      }
      
      public function method_291() : Boolean
      {
         return this.method_297() ? Boolean(this.var_203.stage["mouseLock"]) : Boolean(false);
      }
      
      private function method_297() : Boolean
      {
         return this.var_203.stage.displayState != StageDisplayState.NORMAL;
      }
      
      public function method_290() : Boolean
      {
         return this.var_204;
      }
   }
}
