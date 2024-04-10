package package_307
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import platform.client.fp10.core.model.name_66;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class name_2463
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_3091:Long;
      
      private var var_3093:name_860;
      
      private var var_3092:Long;
      
      private var var_3094:name_860;
      
      private var model:name_66;
      
      public function name_2463(param1:name_66)
      {
         this.var_3091 = Long.getLong(1858366980,-248573911);
         this.var_3092 = Long.getLong(1965965606,772378898);
         super();
         this.model = param1;
      }
      
      public function loginByHash(param1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("auth;login_by_hash;" + param1);
      }
      
      public function method_2138(param1:String) : void
      {
         trace("loginBySingleUseHash " + param1);
      }
   }
}
