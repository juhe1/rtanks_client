package platform.client.fp10.core.resource
{
   import package_13.Long;
   
   public class ResourceInfo
   {
       
      
      public var type:int;
      
      public var id:Long;
      
      public var version:Long;
      
      public var isLazy:Boolean;
      
      public var resourceParams:Object;
      
      public function ResourceInfo(param1:int, param2:Long, param3:Long, param4:Boolean, param5:Object = null)
      {
         super();
         this.type = param1;
         this.id = param2;
         this.version = param3;
         this.isLazy = param4;
         this.resourceParams = param5;
      }
      
      public function toString() : String
      {
         return "[ResourceInfo type=" + this.type + ", id=" + this.id + ", version=" + this.version + ", isLazy=" + this.isLazy + "]";
      }
   }
}
