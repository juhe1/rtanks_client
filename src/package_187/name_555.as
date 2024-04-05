package package_187
{
   import platform.client.fp10.core.resource.Resource;
   
   public class name_555
   {
       
      
      private var var_1149:int;
      
      private var _resources:Vector.<Resource>;
      
      public function name_555(param1:int = 0, param2:Vector.<Resource> = null)
      {
         super();
         this.var_1149 = param1;
         this._resources = param2;
      }
      
      public function get callbackId() : int
      {
         return this.var_1149;
      }
      
      public function set callbackId(param1:int) : void
      {
         this.var_1149 = param1;
      }
      
      public function get resources() : Vector.<Resource>
      {
         return this._resources;
      }
      
      public function set resources(param1:Vector.<Resource>) : void
      {
         this._resources = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ObjectsDependencies [";
         _loc1_ += "callbackId = " + this.callbackId + " ";
         _loc1_ += "resources = " + this.resources + " ";
         return _loc1_ + "]";
      }
   }
}
