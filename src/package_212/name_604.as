package package_212
{
   import alternativa.tanks.gui.clanmanagement.ClanStateButton;
   import alternativa.tanks.gui.class_144;
   import flash.display.Bitmap;
   import package_25.RestrictionJoinClanEvent;
   import package_25.name_52;
   import package_26.ClanNotificationsManager;
   import package_26.name_62;
   
   public class name_604 extends ClanStateButton implements class_144
   {
      
      public static var var_1309:Class = name_1998;
      
      public static var clanService:name_62;
      
      public static var clanUserInfoService:name_52;
       
      
      private var var_1308:Bitmap;
      
      public function name_604()
      {
         this.var_1308 = new var_1309() as Bitmap;
         super();
         addChild(this.var_1308);
         this.var_1308.y = -6;
         clanUserInfoService.addEventListener(RestrictionJoinClanEvent.UPDATE,this.method_1524);
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.var_1308.x = width - 10;
      }
      
      override public function set enable(param1:Boolean) : void
      {
         super.enable = param1;
         this.updateNotifications();
      }
      
      public function updateNotifications() : void
      {
         this.var_1308.visible = ClanNotificationsManager.name_1999() > 0 && this.enable;
      }
      
      private function method_1524(param1:RestrictionJoinClanEvent) : void
      {
         this.updateNotifications();
      }
   }
}
