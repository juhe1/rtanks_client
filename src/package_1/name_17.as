package package_1
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.tank.TankEventDispatcher;
   import alternativa.tanks.models.tank.name_103;
   import alternativa.tanks.service.settings.name_108;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.tanks.services.objectpool.name_118;
   import flash.net.SharedObject;
   import package_11.name_23;
   import package_269.name_819;
   import package_270.name_820;
   import package_95.name_298;
   
   public class name_17 implements name_23
   {
       
      
      public function name_17()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var _loc3_:name_100 = null;
         var _loc2_:SharedObject = name_298(param1.name_6(name_298)).getStorage();
         _loc3_ = new name_820(param1);
         var _loc4_:name_108 = name_108(param1.name_6(name_108));
         _loc3_.useMipMapping = _loc4_.mipMapping;
         param1.name_1(name_100,_loc3_);
         param1.name_1(name_118,new name_819());
         param1.name_1(name_103,new TankEventDispatcher());
      }
      
      public function stop(param1:OSGi) : void
      {
         param1.name_48(name_100);
         param1.name_48(name_118);
         param1.name_48(name_103);
      }
   }
}
