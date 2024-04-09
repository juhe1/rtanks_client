package package_307
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class class_174 extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2463;
      
      private var client:name_1224;
      
      private var var_25:Long;
      
      private var var_2066:Long;
      
      private var var_2067:Long;
      
      private var var_2065:Long;
      
      private var var_2070:name_860;
      
      private var var_2068:Long;
      
      private var var_2069:name_860;
      
      public function class_174()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_1224(this);
         this.var_25 = Long.getLong(1662174151,-1895153624);
         this.var_2066 = Long.getLong(2026019693,504774578);
         this.var_2067 = Long.getLong(1347129984,911924633);
         this.var_2065 = Long.getLong(1836812020,986666173);
         this.var_2068 = Long.getLong(55211289,-1109675316);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2463(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_2066:
               this.client.method_2140();
               break;
            case this.var_2067:
               this.client.method_2141();
               break;
            case this.var_2065:
               this.client.rememberAccount(String(this.var_2070.decode(param2)));
               break;
            case this.var_2068:
               this.client.method_2139(String(this.var_2069.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
