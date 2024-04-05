package package_211
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.name_1139;
   import package_13.Long;
   import package_215.DeleteIndicator;
   import package_215.class_147;
   import package_26.ClanNotificationsManager;
   import package_26.name_62;
   import package_27.ClanMembersListEvent;
   import package_394.name_2045;
   import package_395.name_2050;
   import package_395.name_2051;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_598 extends class_147
   {
      
      public static var clanService:name_62;
      
      public static var localeService:name_102;
       
      
      public var newIndicator:name_2051;
      
      private var userId:Long;
      
      public function name_598(param1:Long)
      {
         super();
         this.userId = param1;
         var_1370 = method_1595(param1);
         addChild(var_1370);
         var_1369 = new DeleteIndicator();
         addChild(var_1369);
         var_1369.visible = false;
         var_1368 = new name_2045();
         addChild(var_1368);
         var_1368.visible = false;
         var_1369.addEventListener(MouseEvent.CLICK,this.method_1600,false,0,true);
         var_1368.addEventListener(MouseEvent.CLICK,this.method_1604,false,0,true);
         this.newIndicator = this.method_1599();
         ClanNotificationsManager.name_1878(this.newIndicator);
         this.newIndicator.updateNotifications();
         addChild(this.newIndicator);
         this.onResize();
      }
      
      private function method_1599() : name_2050
      {
         var _loc1_:name_2050 = new name_2050(this.userId);
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.align = TextFormatAlign.LEFT;
         _loc1_.color = name_1139.name_1894;
         _loc1_.text = localeService.getText(name_390.const_1330);
         _loc1_.mouseEnabled = false;
         return _loc1_;
      }
      
      private function method_1604(param1:MouseEvent) : void
      {
         dispatchEvent(new ClanMembersListEvent(ClanMembersListEvent.ACCEPTED_USER,Long.getLong(0,0),var_1367.uid,true,true));
      }
      
      private function method_1600(param1:MouseEvent) : void
      {
         ClanNotificationsManager.name_1917(Long.getLong(0,0));
         dispatchEvent(new ClanMembersListEvent(ClanMembersListEvent.REJECT_USER,Long.getLong(0,0),var_1367.uid,true,true));
      }
      
      override protected function onResize(param1:Event = null) : void
      {
         var_1370.x = 10;
         var_1370.y = 1;
         var_1370.width = width - 2 * 10;
         var_1369.x = width - var_1369.width - 6;
         var_1369.y = 1;
         var_1368.x = var_1369.x - var_1368.width - 2;
         var_1368.y = 1;
         this.newIndicator.x = width - this.newIndicator.width - 8;
         method_1596();
      }
   }
}
