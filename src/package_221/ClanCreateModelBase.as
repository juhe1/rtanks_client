package package_221
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class ClanCreateModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1912;
      
      private var client:name_642;
      
      private var var_25:Long;
      
      private var var_1214:Long;
      
      private var var_1209:Long;
      
      private var var_1210:Long;
      
      private var var_1215:Long;
      
      private var var_1212:Long;
      
      private var var_1211:Long;
      
      private var var_1216:Long;
      
      private var var_1213:Long;
      
      public function ClanCreateModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().name_6(name_840));
         this.client = name_642(this);
         this.var_25 = Long.getLong(1406824912,-478599334);
         this.var_1214 = Long.getLong(224690586,33129736);
         this.var_1209 = Long.getLong(661618191,747527866);
         this.var_1210 = Long.getLong(255752141,-162666891);
         this.var_1215 = Long.getLong(1686179352,1619108917);
         this.var_1212 = Long.getLong(2117528051,-1228799124);
         this.var_1211 = Long.getLong(899591349,1207281551);
         this.var_1216 = Long.getLong(255677344,1199269997);
         this.var_1213 = Long.getLong(180626480,535638748);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1912(name_66(this));
      }
      
      protected function method_771() : name_1911
      {
         return name_1911(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1214:
               this.client.method_383();
               break;
            case this.var_1209:
               this.client.method_380();
               break;
            case this.var_1210:
               this.client.method_382();
               break;
            case this.var_1215:
               this.client.method_1428();
               break;
            case this.var_1212:
               this.client.method_381();
               break;
            case this.var_1211:
               this.client.method_387();
               break;
            case this.var_1216:
               this.client.method_385();
               break;
            case this.var_1213:
               this.client.method_1429();
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
