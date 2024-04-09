package alternativa.tanks.services.objectpool
{
   import package_238.ObjectPool;
   
   public interface IObjectPoolService
   {
       
      
      function get objectPool() : ObjectPool;
      
      function clear() : void;
   }
}
