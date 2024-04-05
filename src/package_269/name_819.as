package package_269
{
   import alternativa.tanks.services.objectpool.name_118;
   import package_238.ObjectPool;
   
   public class name_819 implements name_118
   {
       
      
      private var var_1604:ObjectPool;
      
      public function name_819()
      {
         this.var_1604 = new ObjectPool();
         super();
      }
      
      public function get objectPool() : ObjectPool
      {
         return this.var_1604;
      }
      
      public function clear() : void
      {
         this.var_1604.clear();
      }
   }
}
