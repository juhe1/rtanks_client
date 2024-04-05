package projects.tanks.client.clans.clan
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class class_146 extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2036;
      
      private var client:name_619;
      
      private var var_25:Long;
      
      private var var_1289:Long;
      
      private var var_1364:name_860;
      
      private var var_1214:Long;
      
      private var var_1362:name_860;
      
      private var var_1355:Long;
      
      private var var_1366:name_860;
      
      private var var_1365:name_860;
      
      private var var_1199:Long;
      
      private var var_1360:name_860;
      
      private var var_1359:Long;
      
      private var var_1361:name_860;
      
      private var var_1363:name_860;
      
      private var var_1356:Long;
      
      private var var_1357:Long;
      
      private var var_1287:Long;
      
      private var var_1358:Long;
      
      public function class_146()
      {
         this.var_531 = name_840(OSGi.getInstance().name_6(name_840));
         this.client = name_619(this);
         this.var_25 = Long.getLong(454139398,-2069165154);
         this.var_1289 = Long.getLong(1925555464,-742779729);
         this.var_1214 = Long.getLong(680200609,-1147294464);
         this.var_1355 = Long.getLong(1659309065,-71192762);
         this.var_1199 = Long.getLong(1659309105,-102307188);
         this.var_1359 = Long.getLong(1767156062,-1193480447);
         this.var_1356 = Long.getLong(615510449,-291351864);
         this.var_1357 = Long.getLong(1820972193,-1147714599);
         this.var_1287 = Long.getLong(1902588706,-1770274302);
         this.var_1358 = Long.getLong(1149292226,-49512386);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2036(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1289:
               this.client.name_1966(String(this.var_1364.decode(param2)));
               break;
            case this.var_1214:
               this.client.method_383(String(this.var_1362.decode(param2)));
               break;
            case this.var_1355:
               this.client.name_2040(String(this.var_1366.decode(param2)),Long(this.var_1365.decode(param2)));
               break;
            case this.var_1199:
               this.client.method_350(String(this.var_1360.decode(param2)));
               break;
            case this.var_1359:
               this.client.name_2037(String(this.var_1361.decode(param2)),Long(this.var_1363.decode(param2)));
               break;
            case this.var_1356:
               this.client.maxMembers();
               break;
            case this.var_1357:
               this.client.name_2038();
               break;
            case this.var_1287:
               this.client.name_1969();
               break;
            case this.var_1358:
               this.client.name_2039();
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
