package package_104
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class ChallengesRewardingModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2156;
      
      private var client:name_376;
      
      private var var_25:Long;
      
      private var var_1576:Long;
      
      private var var_1577:name_860;
      
      public function ChallengesRewardingModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_376(this);
         this.var_25 = Long.getLong(1504901702,408311149);
         this.var_1576 = Long.getLong(139084535,228510069);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2156(name_66(this));
      }
      
      protected function method_771() : name_367
      {
         return name_367(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1576:
               this.client.sendTiersInfo(this.var_1577.decode(param2) as Vector.<name_327>);
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
