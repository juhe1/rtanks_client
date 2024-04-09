package package_225
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class ForeignClanModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1902;
      
      private var client:name_610;
      
      private var var_25:Long;
      
      private var var_1199:Long;
      
      private var var_1205:name_860;
      
      private var var_1197:Long;
      
      private var var_1202:name_860;
      
      private var var_1196:Long;
      
      private var var_1203:name_860;
      
      private var var_1200:Long;
      
      private var var_1204:name_860;
      
      private var var_1198:Long;
      
      private var var_1206:name_860;
      
      private var var_1201:Long;
      
      public function ForeignClanModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_610(this);
         this.var_25 = Long.getLong(1029456312,194126704);
         this.var_1199 = Long.getLong(2072556979,560987130);
         this.var_1197 = Long.getLong(1821924666,143246274);
         this.var_1196 = Long.getLong(1269926118,-537285713);
         this.var_1200 = Long.getLong(2037318745,22259876);
         this.var_1198 = Long.getLong(1203575776,253980200);
         this.var_1201 = Long.getLong(763277444,804297489);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1902(name_66(this));
      }
      
      protected function method_771() : name_1901
      {
         return name_1901(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1199:
               this.client.method_350(String(this.var_1205.decode(param2)));
               break;
            case this.var_1197:
               this.client.method_342(String(this.var_1202.decode(param2)));
               break;
            case this.var_1196:
               this.client.method_349(String(this.var_1203.decode(param2)));
               break;
            case this.var_1200:
               this.client.method_345(String(this.var_1204.decode(param2)));
               break;
            case this.var_1198:
               this.client.method_341(name_861(this.var_1206.decode(param2)));
               break;
            case this.var_1201:
               this.client.method_339();
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
