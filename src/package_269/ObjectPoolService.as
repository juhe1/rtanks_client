package package_269
{
   import alternativa.tanks.services.objectpool.IObjectPoolService;
   import package_238.ObjectPool;
   
   public class ObjectPoolService implements IObjectPoolService
   {
       
      
      private var var_1604:ObjectPool;
      
      public function ObjectPoolService()
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
