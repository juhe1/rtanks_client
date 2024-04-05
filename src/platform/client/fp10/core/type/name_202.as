package platform.client.fp10.core.type
{
   import package_13.Long;
   import platform.client.fp10.core.network.name_836;
   
   public interface name_202
   {
       
      
      function get id() : Long;
      
      function get commandSender() : name_836;
      
      function getObject(param1:Long) : name_70;
      
      function get rootObject() : name_70;
      
      function name_15(param1:Long, param2:name_178, param3:String) : name_70;
      
      function name_188(param1:Long) : void;
      
      function get objects() : Vector.<name_70>;
      
      function close() : void;
      
      function addEventListener(param1:name_835) : void;
      
      function removeEventListener(param1:name_835) : void;
   }
}
