package package_23
{
   import flash.errors.IllegalOperationError;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   
   public class SWFAddress
   {
      
      private static var var_1632:Boolean = false;
      
      private static var var_1634:Boolean = false;
      
      private static var var_1633:Boolean = true;
      
      private static var _value:String = "";
      
      private static var var_598:Timer = null;
      
      private static var var_1630:Boolean = ExternalInterface.available;
      
      private static var var_1631:EventDispatcher = new EventDispatcher();
      
      public static var onInit:Function;
      
      public static var onChange:Function;
      
      private static var var_1635:Boolean = method_1821();
       
      
      public function SWFAddress()
      {
         super();
         throw new IllegalOperationError("SWFAddress cannot be instantiated.");
      }
      
      private static function method_1821() : Boolean
      {
         if(var_1630)
         {
            ExternalInterface.addCallback("getSWFAddressValue",function():String
            {
               return _value;
            });
            ExternalInterface.addCallback("setSWFAddressValue",method_1820);
         }
         if(var_598 == null)
         {
            var_598 = new Timer(200);
            var_598.addEventListener(TimerEvent.TIMER,method_1819);
         }
         var_598.start();
         return true;
      }
      
      private static function method_1819(param1:TimerEvent) : void
      {
         if((typeof SWFAddress["onInit"] == "function" || var_1631.hasEventListener("init")) && !var_1632)
         {
            SWFAddress.method_1818(method_1817());
            SWFAddress.var_1632 = true;
         }
         if(typeof SWFAddress["onChange"] == "function" || var_1631.hasEventListener("change"))
         {
            SWFAddress.var_1632 = true;
            SWFAddress.method_1818(method_1817());
         }
      }
      
      private static function method_1816(param1:String, param2:Boolean) : String
      {
         if(SWFAddress.getStrict())
         {
            if(param2)
            {
               if(param1.substr(0,1) != "/")
               {
                  param1 = "/" + param1;
               }
            }
            else if(param1 == "")
            {
               param1 = "/";
            }
         }
         return param1;
      }
      
      private static function method_1817() : String
      {
         var _loc1_:String = null;
         var _loc3_:Array = null;
         var _loc2_:String = null;
         if(var_1630)
         {
            _loc1_ = ExternalInterface.call("SWFAddress.getValue") as String;
            _loc3_ = ExternalInterface.call("SWFAddress.getIds") as Array;
            if(_loc3_ != null)
            {
               _loc2_ = String(_loc3_.toString());
            }
         }
         if(_loc2_ == null || !var_1630)
         {
            _loc1_ = SWFAddress._value;
         }
         else if(_loc1_ == "undefined" || _loc1_ == null)
         {
            _loc1_ = "";
         }
         return method_1816(_loc1_ || "",false);
      }
      
      private static function method_1818(param1:String) : void
      {
         var _loc2_:Boolean = param1 != SWFAddress._value;
         SWFAddress._value = param1;
         if(!var_1632)
         {
            method_1815(SWFAddressEvent.INIT);
         }
         else if(_loc2_)
         {
            method_1815(SWFAddressEvent.CHANGE);
         }
         var_1634 = true;
      }
      
      private static function method_1820(param1:String) : void
      {
         if(param1 == "undefined" || param1 == null)
         {
            param1 = "";
         }
         if(SWFAddress._value == param1 && SWFAddress.var_1632)
         {
            return;
         }
         if(!SWFAddress.var_1634)
         {
            return;
         }
         SWFAddress._value = param1;
         if(!var_1632)
         {
            SWFAddress.var_1632 = true;
            if(typeof SWFAddress["onInit"] == "function" || var_1631.hasEventListener("init"))
            {
               method_1815(SWFAddressEvent.INIT);
            }
         }
         method_1815(SWFAddressEvent.CHANGE);
      }
      
      private static function method_1815(param1:String) : void
      {
         if(var_1631.hasEventListener(param1))
         {
            var_1631.dispatchEvent(new SWFAddressEvent(param1));
         }
         param1 = param1.substr(0,1).toUpperCase() + param1.substring(1);
         if(typeof SWFAddress["on" + param1] == "function")
         {
            SWFAddress["on" + param1]();
         }
      }
      
      public static function back() : void
      {
         if(var_1630)
         {
            ExternalInterface.call("SWFAddress.back");
         }
      }
      
      public static function forward() : void
      {
         if(var_1630)
         {
            ExternalInterface.call("SWFAddress.forward");
         }
      }
      
      public static function up() : void
      {
         var _loc1_:String = SWFAddress.method_266();
         SWFAddress.setValue(_loc1_.substr(0,_loc1_.lastIndexOf("/",_loc1_.length - 2) + (_loc1_.substr(_loc1_.length - 1) == "/" ? 1 : 0)));
      }
      
      public static function go(param1:int) : void
      {
         if(var_1630)
         {
            ExternalInterface.call("SWFAddress.go",param1);
         }
      }
      
      public static function href(param1:String, param2:String = "_self") : void
      {
         if(var_1630 && Capabilities.playerType == "ActiveX")
         {
            ExternalInterface.call("SWFAddress.href",param1,param2);
            return;
         }
         navigateToURL(new URLRequest(param1),param2);
      }
      
      public static function popup(param1:String, param2:String = "popup", param3:String = "\"\"", param4:String = "") : void
      {
         if(var_1630 && (Capabilities.playerType == "ActiveX" || ExternalInterface.call("asual.util.Browser.isSafari")))
         {
            ExternalInterface.call("SWFAddress.popup",param1,param2,param3,param4);
            return;
         }
         navigateToURL(new URLRequest("javascript:popup=window.open(\"" + param1 + "\",\"" + param2 + "\"," + param3 + ");" + param4 + ";void(0);"),"_self");
      }
      
      public static function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var_1631.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public static function removeEventListener(param1:String, param2:Function) : void
      {
         var_1631.removeEventListener(param1,param2,false);
      }
      
      public static function dispatchEvent(param1:Event) : Boolean
      {
         return var_1631.dispatchEvent(param1);
      }
      
      public static function hasEventListener(param1:String) : Boolean
      {
         return var_1631.hasEventListener(param1);
      }
      
      public static function getBaseURL() : String
      {
         var _loc1_:String = null;
         if(var_1630)
         {
            _loc1_ = String(ExternalInterface.call("SWFAddress.getBaseURL"));
         }
         return _loc1_ == null || _loc1_ == "null" || !var_1630 ? "" : _loc1_;
      }
      
      public static function getStrict() : Boolean
      {
         var _loc1_:String = null;
         if(var_1630)
         {
            _loc1_ = ExternalInterface.call("SWFAddress.getStrict") as String;
         }
         return _loc1_ == null ? var_1633 : _loc1_ == "true";
      }
      
      public static function setStrict(param1:Boolean) : void
      {
         if(var_1630)
         {
            ExternalInterface.call("SWFAddress.setStrict",param1);
         }
         var_1633 = param1;
      }
      
      public static function getHistory() : Boolean
      {
         return var_1630 ? ExternalInterface.call("SWFAddress.getHistory") as Boolean : false;
      }
      
      public static function setHistory(param1:Boolean) : void
      {
         if(var_1630)
         {
            ExternalInterface.call("SWFAddress.setHistory",param1);
         }
      }
      
      public static function getTracker() : String
      {
         return var_1630 ? ExternalInterface.call("SWFAddress.getTracker") as String : "";
      }
      
      public static function setTracker(param1:String) : void
      {
         if(var_1630)
         {
            ExternalInterface.call("SWFAddress.setTracker",param1);
         }
      }
      
      public static function getTitle() : String
      {
         var _loc1_:String = var_1630 ? ExternalInterface.call("SWFAddress.getTitle") as String : "";
         if(_loc1_ == "undefined" || _loc1_ == null)
         {
            _loc1_ = "";
         }
         return _loc1_;
      }
      
      public static function setTitle(param1:String) : void
      {
         if(var_1630)
         {
            ExternalInterface.call("SWFAddress.setTitle",param1);
         }
      }
      
      public static function getStatus() : String
      {
         var _loc1_:String = var_1630 ? ExternalInterface.call("SWFAddress.getStatus") as String : "";
         if(_loc1_ == "undefined" || _loc1_ == null)
         {
            _loc1_ = "";
         }
         return _loc1_;
      }
      
      public static function setStatus(param1:String) : void
      {
         if(var_1630)
         {
            ExternalInterface.call("SWFAddress.setStatus",param1);
         }
      }
      
      public static function resetStatus() : void
      {
         if(var_1630)
         {
            ExternalInterface.call("SWFAddress.resetStatus");
         }
      }
      
      public static function getValue() : String
      {
         return method_1816(_value || "",false);
      }
      
      public static function setValue(param1:String) : void
      {
         if(param1 == "undefined" || param1 == null)
         {
            param1 = "";
         }
         param1 = method_1816(param1,true);
         if(SWFAddress._value == param1)
         {
            return;
         }
         SWFAddress._value = param1;
         if(var_1630 && SWFAddress.var_1632)
         {
            ExternalInterface.call("SWFAddress.setValue",param1);
         }
         method_1815(SWFAddressEvent.CHANGE);
      }
      
      public static function method_266() : String
      {
         var _loc1_:String = SWFAddress.getValue();
         if(_loc1_.indexOf("?") != -1)
         {
            return _loc1_.split("?")[0];
         }
         return _loc1_;
      }
      
      public static function method_264() : Array
      {
         var _loc1_:String = SWFAddress.method_266();
         var _loc2_:Array = _loc1_.split("/");
         if(_loc1_.substr(0,1) == "/" || _loc1_.length == 0)
         {
            _loc2_.splice(0,1);
         }
         if(_loc1_.substr(_loc1_.length - 1,1) == "/")
         {
            _loc2_.splice(_loc2_.length - 1,1);
         }
         return _loc2_;
      }
      
      public static function method_265() : String
      {
         var _loc1_:String = SWFAddress.getValue();
         var _loc2_:Number = _loc1_.indexOf("?");
         if(_loc2_ != -1 && _loc2_ < _loc1_.length)
         {
            return _loc1_.substr(_loc2_ + 1);
         }
         return "";
      }
      
      public static function method_262(param1:String) : String
      {
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Number = NaN;
         var _loc2_:String = SWFAddress.getValue();
         var _loc3_:Number = _loc2_.indexOf("?");
         if(_loc3_ != -1)
         {
            _loc2_ = _loc2_.substr(_loc3_ + 1);
            _loc4_ = _loc2_.split("&");
            _loc6_ = _loc4_.length;
            while(Boolean(_loc6_--))
            {
               _loc5_ = _loc4_[_loc6_].split("=");
               if(_loc5_[0] == param1)
               {
                  return _loc5_[1];
               }
            }
         }
         return "";
      }
      
      public static function method_263() : Array
      {
         var _loc4_:Array = null;
         var _loc5_:Number = NaN;
         var _loc1_:String = SWFAddress.getValue();
         var _loc2_:Number = _loc1_.indexOf("?");
         var _loc3_:Array = new Array();
         if(_loc2_ != -1)
         {
            _loc1_ = _loc1_.substr(_loc2_ + 1);
            if(_loc1_ != "" && _loc1_.indexOf("=") != -1)
            {
               _loc4_ = _loc1_.split("&");
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc3_.push(_loc4_[_loc5_].split("=")[0]);
                  _loc5_++;
               }
            }
         }
         return _loc3_;
      }
   }
}
