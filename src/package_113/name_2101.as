package package_113
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import platform.client.fp10.core.model.name_66;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class name_2101
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2767:Long;
      
      private var var_2768:name_860;
      
      private var model:name_66;
      
      public function name_2101(param1:name_66)
      {
         this.var_2767 = Long.getLong(1574515206,794016557);
         super();
         this.model = param1;
      }
      
      public function name_2105(param1:String) : void
      {
         Network(OSGi.getInstance().name_6(name_2)).send("lobby;removeLink;" + param1);
      }
   }
}
