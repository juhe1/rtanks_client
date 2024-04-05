package package_324
{
   import flash.errors.IllegalOperationError;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class Signal implements class_184, class_182
   {
       
      
      protected var var_2318:Array;
      
      protected var listeners:Array;
      
      protected var var_2319:Dictionary;
      
      protected var var_2320:Boolean = false;
      
      public function Signal(... rest)
      {
         super();
         this.listeners = [];
         this.var_2319 = new Dictionary();
         if(rest.length == 1 && rest[0] is Array)
         {
            rest = rest[0];
         }
         this.valueClasses = rest;
      }
      
      public function get valueClasses() : Array
      {
         return this.var_2318;
      }
      
      public function set valueClasses(param1:Array) : void
      {
         this.var_2318 = Boolean(param1) ? param1.slice() : [];
         var _loc2_:int = int(this.var_2318.length);
         while(Boolean(_loc2_--))
         {
            if(!(this.var_2318[_loc2_] is Class))
            {
               throw new ArgumentError("Invalid valueClasses argument: item at index " + _loc2_ + " should be a Class but was:<" + this.var_2318[_loc2_] + ">." + getQualifiedClassName(this.var_2318[_loc2_]));
            }
         }
      }
      
      public function get method_2347() : uint
      {
         return this.listeners.length;
      }
      
      public function add(param1:Function) : Function
      {
         this.method_2348(param1);
         return param1;
      }
      
      public function name_1861(param1:Function) : Function
      {
         this.method_2348(param1,true);
         return param1;
      }
      
      public function remove(param1:Function) : Function
      {
         var _loc2_:int = this.listeners.indexOf(param1);
         if(_loc2_ == -1)
         {
            return param1;
         }
         if(this.var_2320)
         {
            this.listeners = this.listeners.slice();
            this.var_2320 = false;
         }
         this.listeners.splice(_loc2_,1);
         delete this.var_2319[param1];
         return param1;
      }
      
      public function removeAll() : void
      {
         var _loc1_:uint = this.listeners.length;
         while(Boolean(_loc1_--))
         {
            this.remove(this.listeners[_loc1_] as Function);
         }
      }
      
      public function name_1473(... rest) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Class = null;
         var _loc4_:Function = null;
         var _loc5_:int = int(this.var_2318.length);
         if(rest.length < _loc5_)
         {
            throw new ArgumentError("Incorrect number of arguments. Expected at least " + _loc5_ + " but received " + rest.length + ".");
         }
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(!((_loc2_ = rest[_loc6_]) === null || _loc2_ is (_loc3_ = this.var_2318[_loc6_])))
            {
               throw new ArgumentError("Value object <" + _loc2_ + "> is not an instance of <" + _loc3_ + ">.");
            }
            _loc6_++;
         }
         if(!this.listeners.length)
         {
            return;
         }
         this.var_2320 = true;
         switch(rest.length)
         {
            case 0:
               for each(_loc4_ in this.listeners)
               {
                  if(Boolean(this.var_2319[_loc4_]))
                  {
                     this.remove(_loc4_);
                  }
                  _loc4_();
               }
               break;
            case 1:
               for each(_loc4_ in this.listeners)
               {
                  if(Boolean(this.var_2319[_loc4_]))
                  {
                     this.remove(_loc4_);
                  }
                  _loc4_(rest[0]);
               }
               break;
            default:
               for each(_loc4_ in this.listeners)
               {
                  if(Boolean(this.var_2319[_loc4_]))
                  {
                     this.remove(_loc4_);
                  }
                  _loc4_.apply(null,rest);
               }
         }
         this.var_2320 = false;
      }
      
      protected function method_2348(param1:Function, param2:Boolean = false) : void
      {
         var _loc3_:String = null;
         if(param1.length < this.var_2318.length)
         {
            _loc3_ = param1.length == 1 ? "argument" : "arguments";
            throw new ArgumentError("Listener has " + param1.length + " " + _loc3_ + " but it needs at least " + this.var_2318.length + " to match the given value classes.");
         }
         if(!this.listeners.length)
         {
            this.listeners[0] = param1;
            if(param2)
            {
               this.var_2319[param1] = true;
            }
            return;
         }
         if(this.listeners.indexOf(param1) >= 0)
         {
            if(Boolean(this.var_2319[param1]) && !param2)
            {
               throw new IllegalOperationError("You cannot addOnce() then add() the same listener without removing the relationship first.");
            }
            if(!this.var_2319[param1] && param2)
            {
               throw new IllegalOperationError("You cannot add() then addOnce() the same listener without removing the relationship first.");
            }
            return;
         }
         if(this.var_2320)
         {
            this.listeners = this.listeners.slice();
            this.var_2320 = false;
         }
         this.listeners[this.listeners.length] = param1;
         if(param2)
         {
            this.var_2319[param1] = true;
         }
      }
   }
}
