package projects.tanks.client.clans.user
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class name_1964
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2660:Long;
      
      private var var_2664:name_860;
      
      private var var_2657:Long;
      
      private var var_2663:name_860;
      
      private var var_2655:Long;
      
      private var var_2666:name_860;
      
      private var var_2659:Long;
      
      private var var_2665:name_860;
      
      private var var_2654:Long;
      
      private var var_2662:name_860;
      
      private var var_2658:Long;
      
      private var var_2656:Long;
      
      private var var_2661:name_860;
      
      private var model:name_66;
      
      public function name_1964(param1:name_66)
      {
         this.var_2660 = Long.getLong(1768627069,1892741997);
         this.var_2657 = Long.getLong(18682727,195142564);
         this.var_2655 = Long.getLong(890566910,1534882553);
         this.var_2659 = Long.getLong(1690954694,-2009525540);
         this.var_2654 = Long.getLong(1768627069,-1913474556);
         this.var_2658 = Long.getLong(1489758230,1514479363);
         this.var_2656 = Long.getLong(1768627069,-1913107221);
         super();
         this.model = param1;
      }
      
      public function accept(param1:name_70) : void
      {
         Network(OSGi.getInstance().getService(name_2)).send("clan;accept;" + param1.id);
      }
      
      public function add(param1:name_70) : void
      {
         Network(OSGi.getInstance().getService(name_2)).send("clan;add;" + param1.id);
      }
      
      public function name_1980(param1:String) : void
      {
         Network(OSGi.getInstance().getService(name_2)).send("clan;addInClanByName;" + param1);
      }
      
      public function name_1979(param1:String) : void
      {
         Network(OSGi.getInstance().getService(name_2)).send("clan;checkClanName;" + param1);
      }
      
      public function method_1410(param1:name_70) : void
      {
         Network(OSGi.getInstance().getService(name_2)).send("clan;reject;" + param1.id);
      }
      
      public function method_1411() : void
      {
         Network(OSGi.getInstance().getService(name_2)).send("clan;rejectAll");
      }
      
      public function method_1413(param1:name_70) : void
      {
         Network(OSGi.getInstance().getService(name_2)).send("clan;revoke;" + param1.id);
      }
   }
}
