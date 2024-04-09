package package_217
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class ClanMembersDataModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1909;
      
      private var client:name_623;
      
      private var var_25:Long;
      
      private var var_1179:Long;
      
      private var var_1180:name_860;
      
      public function ClanMembersDataModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_623(this);
         this.var_25 = Long.getLong(1647741962,-1293471250);
         this.var_1179 = Long.getLong(264735719,2108782023);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1909(name_66(this));
      }
      
      protected function method_771() : name_1910
      {
         return name_1910(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1179:
               this.client.method_1430(name_351(this.var_1180.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
