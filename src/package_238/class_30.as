package package_238
{
   public class class_30
   {
       
      
      protected var objectPool:ObjectPool;
      
      public function class_30(param1:ObjectPool)
      {
         super();
         this.objectPool = param1;
      }
      
      final public function method_584() : void
      {
         this.objectPool.putObject(this.getClass(),this);
      }
      
      protected function getClass() : Class
      {
         throw new Error("Not implemented");
      }
   }
}
