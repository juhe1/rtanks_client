package package_136
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class name_2668
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_3279:Long;
      
      private var var_3280:name_860;
      
      private var model:name_66;
      
      public function name_2668(param1:name_66)
      {
         this.var_3279 = Long.getLong(1313185646,-234635884);
         super();
         this.model = param1;
      }
      
      public function name_2669(param1:name_70) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;try_mount_skin;" + param1.name);
      }
   }
}
