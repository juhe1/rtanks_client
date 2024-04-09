package package_222
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class ClanPanelNotificationModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1899;
      
      private var client:name_618;
      
      private var var_25:Long;
      
      private var var_1194:Long;
      
      private var var_1193:Long;
      
      private var var_1192:Long;
      
      private var var_1195:name_860;
      
      public function ClanPanelNotificationModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_618(this);
         this.var_25 = Long.getLong(606942677,1590617894);
         this.var_1194 = Long.getLong(1587343137,-1916924187);
         this.var_1193 = Long.getLong(723365112,-1678221051);
         this.var_1192 = Long.getLong(1322847239,424158635);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1899(name_66(this));
      }
      
      protected function method_771() : name_1898
      {
         return name_1898(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1194:
               this.client.added();
               break;
            case this.var_1193:
               this.client.removed();
               break;
            case this.var_1192:
               this.client.name_1900(int(this.var_1195.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
