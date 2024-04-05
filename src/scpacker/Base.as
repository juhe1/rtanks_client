package scpacker
{
   import alternativa.model.name_66;
   import flash.utils.Dictionary;
   import flash.utils.IDataInput;
   import package_4.ClientObject;
   
   public class Base implements name_66
   {
      
      private static var var_24:Object;
      
      private static var objects:Vector.<Object> = new Vector.<Object>();
       
      
      public var var_365:Vector.<Class>;
      
      protected var var_19:Dictionary;
      
      public function Base()
      {
         super();
         this.var_365 = new Vector.<Class>();
         this.var_19 = new Dictionary();
      }
      
      public static function get object() : Object
      {
         return var_24;
      }
      
      public static function set object(param1:Object) : void
      {
         objects.push(var_24);
         var_24 = param1;
      }
      
      public static function method_38() : void
      {
         var_24 = objects.pop();
      }
      
      public function method_305(param1:ClientObject, param2:Object) : void
      {
      }
      
      public function invoke(param1:ClientObject, param2:String, param3:Object, param4:IDataInput, param5:Object) : void
      {
      }
      
      public function get id() : String
      {
         return "";
      }
      
      public function method_18(param1:Object) : void
      {
         this.var_19[object] = param1;
      }
      
      public function method_37() : void
      {
         delete this.var_19[object];
      }
      
      public function get interfaces() : Vector.<Class>
      {
         return this.var_365;
      }
   }
}
