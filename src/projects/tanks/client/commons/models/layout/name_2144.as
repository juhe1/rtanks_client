package projects.tanks.client.commons.models.layout
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import platform.client.fp10.core.model.name_66;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class name_2144
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var var_2803:Long;
      
      private var var_2804:name_860;
      
      private var var_2798:Long;
      
      private var var_2797:Long;
      
      private var var_2799:Long;
      
      private var var_2805:name_860;
      
      private var var_2802:Long;
      
      private var var_2616:Long;
      
      private var var_2801:Long;
      
      private var var_2800:Long;
      
      private var model:name_66;
      
      public function name_2144(param1:name_66)
      {
         this.var_2803 = Long.getLong(1387513260,693463006);
         this.var_2798 = Long.getLong(73829140,-1375051077);
         this.var_2797 = Long.getLong(1138854804,134191231);
         this.var_2799 = Long.getLong(1012623991,419219676);
         this.var_2802 = Long.getLong(1126321820,-1868105487);
         this.var_2616 = Long.getLong(1992372558,39777135);
         this.var_2801 = Long.getLong(885385769,533734050);
         this.var_2800 = Long.getLong(1835349208,-421772949);
         super();
         this.model = param1;
      }
      
      public function exitFromBattle(param1:LayoutState) : void
      {
         trace("exitFromBattle");
      }
      
      public function exitFromBattleToBattleLobby() : void
      {
         trace("exitFromBattleToBattleLobby");
      }
      
      public function returnToBattle() : void
      {
         trace("returnToBattle");
         Network(OSGi.getInstance().getService(name_2)).send("lobby;return_to_battle");
      }
      
      public function setBattleLobbyLayout(param1:Boolean) : void
      {
         trace("setBattleLobbyLayout");
      }
      
      public function showBattleSelect() : void
      {
         trace("showBattleSelect");
         Network(OSGi.getInstance().getService(name_2)).send("lobby;get_data_init_battle_select");
      }
      
      public function showClan() : void
      {
         trace("showClan");
      }
      
      public function showGarage() : void
      {
         trace("showGarage");
         Network(OSGi.getInstance().getService(name_2)).send("lobby;get_garage_data");
      }
      
      public function showMatchmaking() : void
      {
         trace("showMatchmaking");
      }
   }
}
