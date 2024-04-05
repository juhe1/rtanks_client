package package_39
{
   import flash.utils.Dictionary;
   import package_13.Long;
   import package_38.name_69;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   import platform.client.fp10.core.type.name_71;
   
   public class Model implements name_66
   {
      
      private static var var_24:name_70;
      
      private static var objects:Vector.<name_70> = new Vector.<name_70>();
       
      
      protected var var_19:Dictionary;
      
      public function Model()
      {
         this.var_19 = new Dictionary();
         super();
      }
      
      public static function get object() : name_70
      {
         return var_24;
      }
      
      public static function set object(param1:name_70) : void
      {
         objects.push(var_24);
         var_24 = param1;
      }
      
      public static function method_38() : void
      {
         var_24 = objects.pop();
      }
      
      public function invoke(param1:Long, param2:name_69) : void
      {
      }
      
      public function get id() : Long
      {
         return null;
      }
      
      public function method_18(param1:Object) : void
      {
         this.var_19[object] = param1;
      }
      
      public function method_37() : void
      {
         delete this.var_19[object];
      }
      
      public function getData(param1:Class) : Object
      {
         return name_71(var_24).getData(this,param1);
      }
      
      public function putData(param1:Class, param2:Object) : void
      {
         name_71(var_24).putData(this,param1,param2);
      }
      
      public function clearData(param1:Class) : Object
      {
         return name_71(var_24).clearData(this,param1);
      }
      
      protected function method_39(param1:Function) : Function
      {
         var wrapper:Function;
         var object:name_70 = null;
         var f:Function = null;
         object = null;
         f = param1;
         var wrappers:Dictionary = this.getData(Model) as Dictionary;
         if(wrappers == null)
         {
            wrappers = new Dictionary();
            this.putData(Model,wrappers);
         }
         wrapper = wrappers[f];
         if(wrapper == null)
         {
            object = Model.object;
            wrapper = function(... rest):void
            {
               Model.object = object;
               f.apply(null,rest);
               Model.method_38();
            };
            wrappers[f] = wrapper;
         }
         return wrapper;
      }
   }
}
