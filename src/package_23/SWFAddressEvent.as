package package_23
{
   import flash.events.Event;
   
   public class SWFAddressEvent extends Event
   {
      
      public static const INIT:String = "init";
      
      public static const CHANGE:String = "change";
       
      
      private var _value:String;
      
      private var var_229:String;
      
      private var var_228:Array;
      
      private var var_226:Object;
      
      private var var_227:Array;
      
      public function SWFAddressEvent(param1:String)
      {
         super(param1,false,false);
      }
      
      override public function get currentTarget() : Object
      {
         return SWFAddress;
      }
      
      override public function get type() : String
      {
         return super.type;
      }
      
      override public function get target() : Object
      {
         return SWFAddress;
      }
      
      public function get value() : String
      {
         if(this._value == null)
         {
            this._value = SWFAddress.getValue();
         }
         return this._value;
      }
      
      public function get path() : String
      {
         if(this.var_229 == null)
         {
            this.var_229 = SWFAddress.method_266();
         }
         return this.var_229;
      }
      
      public function get pathNames() : Array
      {
         if(this.var_228 == null)
         {
            this.var_228 = SWFAddress.method_264();
         }
         return this.var_228;
      }
      
      public function get parameters() : Object
      {
         var _loc1_:int = 0;
         if(this.var_226 == null)
         {
            this.var_226 = new Object();
            _loc1_ = 0;
            while(_loc1_ < this.parametersNames.length)
            {
               this.var_226[this.parametersNames[_loc1_]] = SWFAddress.method_262(this.parametersNames[_loc1_]);
               _loc1_++;
            }
         }
         return this.var_226;
      }
      
      public function get parametersNames() : Array
      {
         if(this.var_227 == null)
         {
            this.var_227 = SWFAddress.method_263();
         }
         return this.var_227;
      }
      
      override public function clone() : Event
      {
         return new SWFAddressEvent(this.type);
      }
      
      override public function toString() : String
      {
         return formatToString("SWFAddressEvent","type","bubbles","cancelable","eventPhase","value","path","pathNames","parameters","parametersNames");
      }
   }
}
