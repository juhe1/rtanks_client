package package_212
{
   import alternativa.tanks.gui.clanmanagement.ClanUsersWindow;
   import alternativa.tanks.gui.class_144;
   import package_228.ClanAction;
   import package_26.ClanNotificationsManager;
   
   public class name_2029 extends name_587 implements class_144
   {
      
      private static const const_422:int = 11;
      
      private static const const_1529:int = 7;
       
      
      private var var_1329:name_587;
      
      private var var_1331:ClanUsersWindow;
      
      private var var_2636:name_2772;
      
      public function name_2029(param1:name_587, param2:ClanUsersWindow)
      {
         this.var_2636 = new name_2772();
         super(ClanAction.ADDING_TO_CLAN);
         this.var_1329 = param1;
         this.var_1331 = param2;
         addChild(this.var_2636);
         this.var_2636.y = -6;
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.var_2636.x = width + 3;
      }
      
      override public function method_1459() : void
      {
         super.method_1459();
         this.var_1329.x = (visible ? x : this.var_1331.width - 11) - 7 - this.var_1329.width;
      }
      
      public function updateNotifications() : void
      {
         var _loc1_:int = ClanNotificationsManager.method_1827();
         this.var_2636.count = _loc1_;
      }
   }
}
