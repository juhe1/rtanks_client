package package_6
{
   import flash.utils.Dictionary;
   
   public class ClientClass
   {
       
      
      private var var_23:String;
      
      private var var_21:String;
      
      private var _parent:ClientClass;
      
      private var var_290:Vector.<ClientClass>;
      
      private var var_232:Vector.<String>;
      
      private var var_291:Dictionary;
      
      public function ClientClass(param1:String, param2:ClientClass, param3:String, param4:Vector.<String> = null)
      {
         super();
         this.var_21 = param1;
         this._parent = param2;
         this.var_23 = param3;
         this.var_290 = new Vector.<ClientClass>();
         this.var_291 = new Dictionary();
         if(param4 != null)
         {
            this.var_232 = param4;
         }
         else
         {
            this.var_232 = new Vector.<String>();
         }
      }
      
      public function addChild(param1:ClientClass) : void
      {
         this.var_290.push(param1);
      }
      
      public function removeChild(param1:ClientClass) : void
      {
         this.var_290.splice(this.var_290.indexOf(param1),1);
      }
      
      public function get id() : String
      {
         return this.var_21;
      }
      
      public function get parent() : ClientClass
      {
         return this._parent;
      }
      
      public function get method_392() : Vector.<ClientClass>
      {
         return this.var_290;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
      
      public function get models() : Vector.<String>
      {
         return this.var_232;
      }
      
      public function get name_852() : Dictionary
      {
         return this.var_291;
      }
      
      public function name_853(param1:String, param2:Object) : void
      {
         this.var_291[param1] = param2;
      }
      
      public function toString() : String
      {
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc1_:String = "\nClientClass";
         _loc1_ += "\n   id: " + this.var_21;
         _loc1_ += "\n   name: " + this.var_23;
         if(this._parent != null)
         {
            _loc1_ += "\n   parent id: " + this._parent.id;
         }
         if(this.var_290.length > 0)
         {
            _loc1_ += "\n   children id:";
            _loc2_ = 0;
            while(_loc2_ < this.var_290.length)
            {
               _loc1_ += " " + ClientClass(this.var_290[_loc2_]).id;
               _loc2_++;
            }
         }
         if(this.var_232.length > 0)
         {
            _loc1_ += "\n   models: " + this.var_232;
            _loc1_ += "\n   modelParams: \n";
            for(_loc3_ in this.var_291)
            {
               _loc1_ += "\n   " + _loc3_.toString() + ": " + this.var_291[_loc3_];
            }
         }
         return _loc1_ + "\n";
      }
   }
}
