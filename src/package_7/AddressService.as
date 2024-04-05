package package_7
{
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import package_23.SWFAddress;
   
   public class AddressService implements name_28
   {
       
      
      public function AddressService()
      {
         super();
      }
      
      public function reload() : void
      {
         var _loc1_:String = SWFAddress.getBaseURL().split("?")[0] + "?" + "rnd=" + Math.random().toString() + "#" + SWFAddress.getValue();
         var _loc2_:URLRequest = new URLRequest(_loc1_);
         navigateToURL(_loc2_,"_self");
      }
      
      public function back() : void
      {
         SWFAddress.back();
      }
      
      public function forward() : void
      {
         SWFAddress.forward();
      }
      
      public function up() : void
      {
         SWFAddress.up();
      }
      
      public function go(param1:int) : void
      {
         SWFAddress.go(param1);
      }
      
      public function href(param1:String, param2:String = "_self") : void
      {
         SWFAddress.href(param1,param2);
      }
      
      public function popup(param1:String, param2:String = "popup", param3:String = "\"\"", param4:String = "") : void
      {
         SWFAddress.popup(param1,param2,param3,param4);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         SWFAddress.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function removeEventListener(param1:String, param2:Function) : void
      {
         SWFAddress.removeEventListener(param1,param2);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return SWFAddress.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return SWFAddress.hasEventListener(param1);
      }
      
      public function getBaseURL() : String
      {
         return SWFAddress.getBaseURL();
      }
      
      public function getStrict() : Boolean
      {
         return SWFAddress.getStrict();
      }
      
      public function setStrict(param1:Boolean) : void
      {
         SWFAddress.setStrict(param1);
      }
      
      public function getHistory() : Boolean
      {
         return SWFAddress.getHistory();
      }
      
      public function setHistory(param1:Boolean) : void
      {
         SWFAddress.setHistory(param1);
      }
      
      public function getTracker() : String
      {
         return SWFAddress.getTracker();
      }
      
      public function setTracker(param1:String) : void
      {
         SWFAddress.setTracker(param1);
      }
      
      public function getTitle() : String
      {
         return SWFAddress.getTitle();
      }
      
      public function setTitle(param1:String) : void
      {
         SWFAddress.setTitle(param1);
      }
      
      public function getStatus() : String
      {
         return SWFAddress.getStatus();
      }
      
      public function setStatus(param1:String) : void
      {
         SWFAddress.setStatus(param1);
      }
      
      public function resetStatus() : void
      {
         SWFAddress.resetStatus();
      }
      
      public function getValue() : String
      {
         return SWFAddress.getValue();
      }
      
      public function setValue(param1:String) : void
      {
         SWFAddress.setValue(param1);
      }
      
      public function method_266() : String
      {
         return SWFAddress.method_266();
      }
      
      public function method_264() : Array
      {
         return SWFAddress.method_264();
      }
      
      public function method_265() : String
      {
         return SWFAddress.method_265();
      }
      
      public function method_262(param1:String) : String
      {
         return SWFAddress.method_262(param1);
      }
      
      public function method_263() : Array
      {
         return SWFAddress.method_263();
      }
   }
}
