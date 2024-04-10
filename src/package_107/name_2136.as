package package_107
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import platform.client.fp10.core.model.name_66;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class name_2136
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2792:Long;
      
      private var var_2796:name_860;
      
      private var var_2790:Long;
      
      private var var_2783:Long;
      
      private var var_2794:name_860;
      
      private var var_2786:name_860;
      
      private var var_2785:Long;
      
      private var var_2793:name_860;
      
      private var var_2791:Long;
      
      private var var_2795:name_860;
      
      private var model:name_66;
      
      public function name_2136(param1:name_66)
      {
         this.var_2792 = Long.getLong(1508188063,-951132811);
         this.var_2790 = Long.getLong(490759748,732918938);
         this.var_2783 = Long.getLong(745172834,-1601596721);
         this.var_2785 = Long.getLong(1819574530,685112894);
         this.var_2791 = Long.getLong(1625524504,-1691983326);
         super();
         this.model = param1;
      }
      
      public function name_2140(param1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;quest_take_prize;" + param1);
      }
      
      public function openWindow() : void
      {
         trace("openWindow");
      }
      
      public function name_2131(param1:String, param2:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;change_quest;" + param1 + ";" + param2);
      }
      
      public function name_2130(param1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;change_quest;" + param1 + ";" + 0);
      }
      
      public function skipQuestForShowedAds(param1:Long) : void
      {
         trace("skipQuestForShowedAds");
      }
   }
}
