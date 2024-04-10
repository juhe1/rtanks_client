package platform.client.core.general.spaces.loading.dispatcher
{
   import alternativa.osgi.OSGi;
   import flash.utils.ByteArray;
   import package_13.Long;
   import package_38.OptionalMap;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import platform.client.fp10.core.model.name_66;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class name_1687
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2428:Long;
      
      private var var_2429:name_860;
      
      private var model:name_66;
      
      public function name_1687(param1:name_66)
      {
         this.var_2428 = Long.getLong(423004956,1791645716);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.var_235 = name_840(OSGi.getInstance().getService(name_840));
         this.var_2047 = new name_69(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function name_1692(param1:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("system;resources_loaded;" + param1);
      }
   }
}
