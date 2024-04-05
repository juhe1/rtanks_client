package package_7
{
   import alternativa.model.name_66;
   import flash.utils.IDataInput;
   import package_4.ClientObject;
   
   public interface name_32
   {
       
      
      function register(param1:String, param2:String) : void;
      
      function add(param1:name_66) : void;
      
      function remove(param1:String) : void;
      
      function method_258(param1:String, param2:Class) : void;
      
      function method_257(param1:String) : Class;
      
      function invoke(param1:ClientObject, param2:String, param3:IDataInput, param4:Object) : void;
      
      function getModel(param1:String) : name_66;
      
      function getModelsByInterface(param1:Class) : Vector.<name_66>;
      
      function method_260(param1:ClientObject, param2:Class) : name_66;
      
      function getModelsForObject(param1:ClientObject, param2:Class) : Vector.<name_66>;
      
      function method_259(param1:String) : Vector.<Class>;
      
      function get method_256() : Vector.<name_66>;
   }
}
