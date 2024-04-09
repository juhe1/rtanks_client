package projects.tanks.client.clans.user
{
   import alternativa.osgi.OSGi;
   import flash.utils.ByteArray;
   import package_13.Long;
   import package_38.OptionalMap;
   import package_38.name_69;
   import package_38.name_840;
   import platform.client.fp10.core.model.name_66;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class name_2033
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2682:Long;
      
      private var var_2616:Long;
      
      private var model:name_66;
      
      public function name_2033(param1:name_66)
      {
         this.var_2682 = Long.getLong(1773660503,-329990730);
         this.var_2616 = Long.getLong(1773660433,-1765075589);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.var_235 = name_840(OSGi.getInstance().getService(name_840));
         this.var_2047 = new name_69(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function name_2034() : void
      {
         Network(OSGi.getInstance().getService(name_2)).send("clan;hideClan");
      }
      
      public function showClan() : void
      {
         Network(OSGi.getInstance().getService(name_2)).send("clan;showClan");
      }
   }
}
