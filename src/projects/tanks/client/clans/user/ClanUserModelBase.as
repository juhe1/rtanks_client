package projects.tanks.client.clans.user
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class ClanUserModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1964;
      
      private var client:name_614;
      
      private var var_25:Long;
      
      private var var_1289:Long;
      
      private var var_1303:name_860;
      
      private var var_1214:Long;
      
      private var var_1199:Long;
      
      private var var_1297:name_860;
      
      private var var_1304:name_860;
      
      private var var_1197:Long;
      
      private var var_1298:name_860;
      
      private var var_1301:name_860;
      
      private var var_1296:Long;
      
      private var var_1302:name_860;
      
      private var var_1196:Long;
      
      private var var_1290:Long;
      
      private var var_1288:Long;
      
      private var var_1292:Long;
      
      private var var_1293:Long;
      
      private var var_1294:Long;
      
      private var var_1285:Long;
      
      private var var_1300:name_860;
      
      private var var_1286:Long;
      
      private var var_1291:Long;
      
      private var var_1295:Long;
      
      private var var_1299:name_860;
      
      private var var_1287:Long;
      
      public function ClanUserModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_614(this);
         this.var_25 = Long.getLong(259670316,1522052296);
         this.var_1289 = Long.getLong(57363867,1237781863);
         this.var_1214 = Long.getLong(618126442,-725356522);
         this.var_1199 = Long.getLong(1671975780,-1329402274);
         this.var_1197 = Long.getLong(57363920,-817863194);
         this.var_1296 = Long.getLong(57363960,-848977620);
         this.var_1196 = Long.getLong(325235064,-2121980921);
         this.var_1290 = Long.getLong(1693514433,32146500);
         this.var_1288 = Long.getLong(944293305,-1852342578);
         this.var_1292 = Long.getLong(1492352330,720837769);
         this.var_1293 = Long.getLong(1273341198,-1482111631);
         this.var_1294 = Long.getLong(193176875,2068732989);
         this.var_1285 = Long.getLong(193176886,893937818);
         this.var_1286 = Long.getLong(1136230800,538530230);
         this.var_1291 = Long.getLong(2062667168,-2002974215);
         this.var_1295 = Long.getLong(1570177194,1280257195);
         this.var_1287 = Long.getLong(321756128,1414681448);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1964(name_66(this));
      }
      
      protected function method_771() : name_788
      {
         return name_788(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1289:
               this.client.name_1966(String(this.var_1303.decode(param2)));
               break;
            case this.var_1214:
               this.client.method_383();
               break;
            case this.var_1199:
               this.client.method_350(String(this.var_1297.decode(param2)),name_70(this.var_1304.decode(param2)));
               break;
            case this.var_1197:
               this.client.method_342(String(this.var_1298.decode(param2)),name_70(this.var_1301.decode(param2)));
               break;
            case this.var_1296:
               this.client.name_1970(String(this.var_1302.decode(param2)));
               break;
            case this.var_1196:
               this.client.method_349();
               break;
            case this.var_1290:
               this.client.clanExist();
               break;
            case this.var_1288:
               this.client.name_1965();
               break;
            case this.var_1292:
               this.client.clanNotExist();
               break;
            case this.var_1293:
               this.client.name_1971();
               break;
            case this.var_1294:
               this.client.name_863();
               break;
            case this.var_1285:
               this.client.name_1968(int(this.var_1300.decode(param2)));
               break;
            case this.var_1286:
               this.client.name_1972();
               break;
            case this.var_1291:
               this.client.method_1508();
               break;
            case this.var_1295:
               this.client.name_1967(Boolean(this.var_1299.decode(param2)));
               break;
            case this.var_1287:
               this.client.name_1969();
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
