package package_231
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_389.name_1884;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class ClanUserAcceptedNotificatorModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1942;
      
      private var client:name_621;
      
      private var var_25:Long;
      
      private var var_1175:Long;
      
      private var var_1248:name_860;
      
      private var var_1176:Long;
      
      private var var_1249:name_860;
      
      public function ClanUserAcceptedNotificatorModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_621(this);
         this.var_25 = Long.getLong(1233534043,-1972982554);
         this.var_1175 = Long.getLong(1928764250,-1868285925);
         this.var_1176 = Long.getLong(337850372,-157499174);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1942(name_66(this));
      }
      
      protected function method_771() : name_1884
      {
         return name_1884(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1175:
               this.client.method_1409(Long(this.var_1248.decode(param2)));
               break;
            case this.var_1176:
               this.client.method_1408(Long(this.var_1249.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
