package platform.client.fp10.core.registry.impl
{
   import package_13.Long;
   import platform.client.fp10.core.registry.name_33;
   import platform.client.fp10.core.type.name_202;
   
   public class SpaceRegistryImpl implements name_33
   {
       
      
      private var var_214:Vector.<name_202>;
      
      private var var_215:name_202;
      
      public function SpaceRegistryImpl()
      {
         this.var_214 = new Vector.<name_202>();
         super();
      }
      
      public function addSpace(param1:name_202) : void
      {
         this.var_214.push(param1);
      }
      
      public function method_255(param1:name_202) : void
      {
         var _loc2_:int = this.var_214.indexOf(param1);
         if(_loc2_ < 0)
         {
            throw new Error("Space not found: " + param1.id);
         }
         this.var_214.splice(_loc2_,1);
         if(this.var_215 == param1)
         {
            this.var_215 = null;
         }
      }
      
      public function get spaces() : Vector.<name_202>
      {
         return this.var_214;
      }
      
      public function getSpace(param1:Long) : name_202
      {
         var _loc2_:name_202 = null;
         for each(_loc2_ in this.var_214)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get currentSpace() : name_202
      {
         return this.var_215;
      }
      
      public function set currentSpace(param1:name_202) : void
      {
         this.var_215 = param1;
      }
   }
}
