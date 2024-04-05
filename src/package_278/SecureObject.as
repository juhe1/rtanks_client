package package_278
{
   import package_404.CheatManager;
   import package_445.name_2867;
   
   public dynamic class SecureObject
   {
       
      
      private var id:String;
      
      private var var_23:String;
      
      public function SecureObject(param1:String = "Unnamed SecureObject", param2:Object = 0)
      {
         super();
         this.var_23 = param1;
         this.objectValue = param2;
         CheatManager.getInstance().addEventListener(name_2867.name_2869,this.method_2662);
      }
      
      public function set objectValue(param1:Object) : void
      {
         if(this.hasOwnProperty(this.id))
         {
            delete this[this.id];
         }
         this.method_2661();
         this[this.id] = param1;
         this["fake"] = param1;
      }
      
      public function get objectValue() : Object
      {
         return this[this.id];
      }
      
      private function method_2661() : void
      {
         var _loc1_:String = this.id;
         while(this.id == _loc1_)
         {
            this.id = String(Math.round(Math.random() * 1048575));
         }
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
      
      private function method_2662(param1:name_2867) : void
      {
         var _loc2_:Object = this.objectValue;
         this.objectValue = _loc2_;
      }
   }
}
