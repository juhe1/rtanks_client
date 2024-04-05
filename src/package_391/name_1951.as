package package_391
{
   import alternativa.tanks.gui.class_144;
   import controls.base.name_1890;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import package_26.ClanUserNotificationsManager;
   
   public class name_1951 extends name_1890 implements class_144
   {
      
      public static var var_2639:Class = name_2773;
      
      private static var var_2640:BitmapData = Bitmap(new var_2639()).bitmapData;
       
      
      private var var_1308:Bitmap;
      
      public function name_1951()
      {
         this.var_1308 = new Bitmap(var_2640);
         super();
         addChild(this.var_1308);
         this.var_1308.y = -6;
         ClanUserNotificationsManager.name_1878(this);
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.var_1308.x = width - this.var_1308.width / 2;
      }
      
      public function updateNotifications() : void
      {
         this.var_1308.visible = ClanUserNotificationsManager.name_1941() > 0;
      }
      
      public function destroy() : void
      {
         ClanUserNotificationsManager.name_1954(this);
      }
   }
}
