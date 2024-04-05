package projects.tanks.client.panel.model.dailyquest
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import platform.client.fp10.core.model.name_66;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class name_2129
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2783:Long;
      
      private var var_2788:name_860;
      
      private var var_2786:name_860;
      
      private var var_2785:Long;
      
      private var var_2789:name_860;
      
      private var var_2784:Long;
      
      private var var_2787:name_860;
      
      private var model:name_66;
      
      public function name_2129(param1:name_66)
      {
         this.var_2783 = Long.getLong(721193585,-108838556);
         this.var_2785 = Long.getLong(898481927,1112991605);
         this.var_2784 = Long.getLong(663591737,-831307794);
         super();
         this.model = param1;
      }
      
      public function name_2131(param1:String, param2:int) : void
      {
         Network(OSGi.getInstance().name_6(name_2)).send("lobby;change_quest;" + param1 + ";" + param2);
      }
      
      public function name_2130(param1:String) : void
      {
         Network(OSGi.getInstance().name_6(name_2)).send("lobby;change_quest;" + param1 + ";" + 0);
      }
      
      public function takePrize(param1:String) : void
      {
         Network(OSGi.getInstance().name_6(name_2)).send("lobby;quest_take_prize;" + param1);
      }
   }
}
