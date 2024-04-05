package platform.client.fp10.core.resource
{
   import flash.utils.ByteArray;
   import package_13.Long;
   
   public interface IResourceLocalStorageInternal
   {
       
      
      function getResourceData(param1:Long, param2:int, param3:String) : ByteArray;
      
      function setResourceData(param1:Long, param2:int, param3:ByteArray, param4:String, param5:String) : void;
      
      function clearResourceData(param1:Long) : void;
   }
}
