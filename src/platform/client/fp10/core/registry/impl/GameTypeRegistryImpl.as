package platform.client.fp10.core.registry.impl
{
   import flash.utils.Dictionary;
   import package_13.Long;
   import package_20.GameClass;
   import platform.client.fp10.core.registry.name_45;
   import platform.client.fp10.core.type.name_178;
   
   public class GameTypeRegistryImpl implements name_45
   {
       
      
      private var var_209:Dictionary;
      
      public function GameTypeRegistryImpl()
      {
         super();
         this.var_209 = new Dictionary();
      }
      
      public function createClass(param1:Long, param2:Vector.<Long>) : GameClass
      {
         var _loc3_:GameClass = new GameClass(param1,param2);
         this.var_209[param1] = _loc3_;
         return _loc3_;
      }
      
      public function method_302(param1:Long) : void
      {
         this.var_209[param1] = null;
      }
      
      public function getClass(param1:Long) : name_178
      {
         return this.var_209[param1];
      }
      
      public function get method_303() : Dictionary
      {
         return this.var_209;
      }
   }
}
