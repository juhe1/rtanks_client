package package_9
{
   import alternativa.osgi.OSGi;
   import package_11.IBundleActivator;
   import package_145.name_494;
   import platform.clients.fp10.libraries.alternativapartners.service.name_493;
   
   public class name_14 implements IBundleActivator
   {
       
      
      public function name_14()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var _loc2_:name_493 = new name_494();
         param1.registerService(name_493,_loc2_);
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}
