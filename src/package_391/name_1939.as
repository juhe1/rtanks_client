package package_391
{
   import alternativa.tanks.gui.class_144;
   import controls.base.name_1940;
   import package_212.name_2772;
   import package_26.ClanUserNotificationsManager;
   
   public class name_1939 extends name_1940 implements class_144
   {
       
      
      private var var_2636:name_2772;
      
      public function name_1939()
      {
         this.var_2636 = new name_2772();
         super();
         ClanUserNotificationsManager.name_1878(this);
         addChild(this.var_2636);
         this.var_2636.y = -6;
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.var_2636.x = width + 3;
      }
      
      override public function set enable(param1:Boolean) : void
      {
         super.enable = param1;
         this.var_2636.visible = param1 && ClanUserNotificationsManager.name_1941() > 0;
      }
      
      public function updateNotifications() : void
      {
         var _loc1_:int = ClanUserNotificationsManager.name_1941();
         this.var_2636.count = _loc1_;
      }
      
      public function destroy() : void
      {
         ClanUserNotificationsManager.name_1954(this);
      }
   }
}
