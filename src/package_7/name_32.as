package package_7
{
   import alternativa.model.IModel;
   import flash.utils.IDataInput;
   import package_4.ClientObject;
   
   public interface name_32
   {
       
      
      function register(param1:String, param2:String) : void;
      
      function add(param1:IModel) : void;
      
      function remove(param1:String) : void;
      
      function method_258(param1:String, param2:Class) : void;
      
      function method_257(param1:String) : Class;
      
      function invoke(param1:ClientObject, param2:String, param3:IDataInput, param4:Object) : void;
      
      function getModel(param1:String) : IModel;
      
      function getModelsByInterface(param1:Class) : Vector.<IModel>;
      
      function method_260(param1:ClientObject, param2:Class) : IModel;
      
      function getModelsForObject(param1:ClientObject, param2:Class) : Vector.<IModel>;
      
      function method_259(param1:String) : Vector.<Class>;
      
      function get method_256() : Vector.<IModel>;
   }
}
