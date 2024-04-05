package package_110
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
   import scpacker.networking.name_2;
   
   public class name_1579
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2361:Long;
      
      private var var_2362:name_860;
      
      private var model:name_66;
      
      public function name_1579(param1:name_66)
      {
         this.var_2361 = Long.getLong(227613674,-1722353412);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.var_235 = name_840(OSGi.getInstance().name_6(name_840));
         this.var_2047 = new name_69(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function open(param1:int) : void
      {
         Network(OSGi.getInstance().name_6(name_2)).send("lobby;open_lootbox;" + param1);
      }
   }
}
