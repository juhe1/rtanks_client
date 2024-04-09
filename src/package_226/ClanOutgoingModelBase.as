package package_226
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_389.name_1884;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class ClanOutgoingModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1914;
      
      private var client:name_622;
      
      private var var_25:Long;
      
      private var var_1175:Long;
      
      private var var_1177:name_860;
      
      private var var_1176:Long;
      
      private var var_1178:name_860;
      
      public function ClanOutgoingModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_622(this);
         this.var_25 = Long.getLong(1408324582,-1932105818);
         this.var_1175 = Long.getLong(340356364,-824818575);
         this.var_1176 = Long.getLong(1961112713,-2039360050);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1914(name_66(this));
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
               this.client.method_1409(Long(this.var_1177.decode(param2)));
               break;
            case this.var_1176:
               this.client.method_1408(Long(this.var_1178.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
