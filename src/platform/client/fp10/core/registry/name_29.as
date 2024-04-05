package platform.client.fp10.core.registry
{
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_860;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public interface name_29
   {
       
      
      function register(param1:Long, param2:Long) : void;
      
      function add(param1:name_66, param2:Vector.<Class>) : void;
      
      function remove(param1:Long) : void;
      
      function method_335(param1:Long, param2:name_860) : void;
      
      function method_334(param1:Long) : name_860;
      
      function invoke(param1:name_70, param2:Long, param3:name_69) : void;
      
      function getModel(param1:Long) : name_66;
      
      function name_275(param1:Class, param2:Class) : void;
      
      function name_270(param1:Class, param2:Class) : void;
      
      function name_856(param1:Class) : Class;
      
      function name_857(param1:Class) : Class;
      
      function getModelsByInterface(param1:Class) : Vector.<name_66>;
      
      function method_260(param1:name_70, param2:Class) : name_66;
      
      function getModelsForObject(param1:name_70, param2:Class) : Vector.<name_66>;
      
      function method_259(param1:Long) : Vector.<Class>;
      
      function get models() : Vector.<name_66>;
   }
}
