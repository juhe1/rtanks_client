package package_113
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class SocialNetworkPanelModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2101;
      
      private var client:name_362;
      
      private var var_25:Long;
      
      private var var_1486:Long;
      
      private var var_1488:name_860;
      
      private var var_1487:Long;
      
      private var var_1489:name_860;
      
      private var var_1484:Long;
      
      private var var_1490:name_860;
      
      private var var_1485:Long;
      
      public function SocialNetworkPanelModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_362(this);
         this.var_25 = Long.getLong(439695750,646961384);
         this.var_1486 = Long.getLong(964446817,-340367443);
         this.var_1487 = Long.getLong(455315457,289812863);
         this.var_1484 = Long.getLong(2086735179,-395191971);
         this.var_1485 = Long.getLong(1997552645,-744590077);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2101(name_66(this));
      }
      
      protected function method_771() : name_393
      {
         return name_393(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1486:
               this.client.method_1111(String(this.var_1488.decode(param2)));
               break;
            case this.var_1487:
               this.client.linkCreated(String(this.var_1489.decode(param2)));
               break;
            case this.var_1484:
               this.client.unlinkSuccess(String(this.var_1490.decode(param2)));
               break;
            case this.var_1485:
               this.client.method_1112();
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
