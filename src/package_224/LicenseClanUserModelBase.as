package package_224
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class LicenseClanUserModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1983;
      
      private var client:name_615;
      
      private var var_25:Long;
      
      private var var_1307:Long;
      
      private var var_1306:Long;
      
      public function LicenseClanUserModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().name_6(name_840));
         this.client = name_615(this);
         this.var_25 = Long.getLong(1978103354,1644120870);
         this.var_1307 = Long.getLong(742414901,491655143);
         this.var_1306 = Long.getLong(521749674,-1882127080);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1983(name_66(this));
      }
      
      protected function method_771() : name_1984
      {
         return name_1984(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1307:
               this.client.method_1443();
               break;
            case this.var_1306:
               this.client.method_1444();
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
