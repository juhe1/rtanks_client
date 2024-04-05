package package_211
{
   import flash.events.MouseEvent;
   import package_215.class_194;
   
   public class ClanIncomingListRenderer extends class_194
   {
       
      
      public function ClanIncomingListRenderer()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         item = new name_598(param1.id);
         super.data = param1;
      }
      
      override protected function onRollOut(param1:MouseEvent) : void
      {
         item.method_1598.visible = false;
         item.method_1597.visible = false;
         name_598(item).newIndicator.show();
         name_598(item).newIndicator.updateNotifications();
         super.onRollOut(param1);
      }
      
      override protected function onRollOver(param1:MouseEvent) : void
      {
         item.method_1597.visible = true;
         name_598(item).newIndicator.hide();
         name_598(item).newIndicator.updateNotifications();
         super.onRollOver(param1);
      }
   }
}
