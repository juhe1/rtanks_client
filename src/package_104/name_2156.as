package package_104
{
   import alternativa.osgi.OSGi;
   import flash.utils.ByteArray;
   import package_13.Long;
   import package_38.OptionalMap;
   import package_38.name_69;
   import package_38.name_840;
   import platform.client.fp10.core.model.name_66;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class name_2156
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2809:Long;
      
      private var model:name_66;
      
      public function name_2156(param1:name_66)
      {
         this.var_2809 = Long.getLong(1369735373,-1505616102);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.var_235 = name_840(OSGi.getInstance().getService(name_840));
         this.var_2047 = new name_69(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function method_1766() : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;requestTiersInfo");
      }
   }
}
