package package_101
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import platform.client.fp10.core.model.name_66;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class name_1215
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2044:Long;
      
      private var var_2048:name_860;
      
      private var var_2045:Long;
      
      private var var_2046:Long;
      
      private var model:name_66;
      
      public function name_1215(param1:name_66)
      {
         this.var_2044 = Long.getLong(1443484043,-561920205);
         this.var_2045 = Long.getLong(2144265951,599870378);
         this.var_2046 = Long.getLong(372821902,-499897363);
         super();
         this.model = param1;
      }
      
      public function method_2131(param1:int) : void
      {
      }
      
      public function method_2130() : void
      {
         Network(OSGi.getInstance().getService(name_2)).send("battle;ready_to_spawn");
      }
      
      public function setReadyToPlace() : void
      {
         Network(OSGi.getInstance().getService(name_2)).send("battle;ready_to_place");
      }
   }
}
