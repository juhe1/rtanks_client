package package_142
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.GarageModel;
   import alternativa.tanks.model.name_381;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class MountedResistancesModelServer
   {
       
      
      public function MountedResistancesModelServer(param1:name_66)
      {
         super();
      }
      
      public function method_2967(param1:name_70, param2:int, param3:Object) : void
      {
      }
      
      public function mount(param1:int, param2:name_70) : void
      {
         var _loc3_:* = GarageModel(OSGi.getInstance().getService(name_381)).getObjectItemParams(param2);
         Network(OSGi.getInstance().getService(name_2)).send("garage;try_mount_resistance;" + _loc3_.baseItemId);
      }
      
      public function name_1370(param1:name_70) : void
      {
         var _loc2_:* = GarageModel(OSGi.getInstance().getService(name_381)).getObjectItemParams(param1);
         Network(OSGi.getInstance().getService(name_2)).send("garage;try_unmount_resistance;" + _loc2_.baseItemId);
      }
   }
}
