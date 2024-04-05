package package_213
{
   import flash.events.MouseEvent;
   import package_215.class_194;
   
   public class name_2032 extends class_194
   {
       
      
      public function name_2032()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         item = new ClanMemberItem(param1);
         super.data = param1;
      }
      
      override protected function onRollOut(param1:MouseEvent) : void
      {
         item.method_1598.visible = false;
         var _loc2_:ClanMemberItem = ClanMemberItem(item);
         if(!_loc2_)
         {
            super.onRollOut(param1);
            return;
         }
         _loc2_.newIndicator.updateNotifications();
         super.onRollOut(param1);
      }
      
      override protected function onRollOver(param1:MouseEvent) : void
      {
         var _loc2_:ClanMemberItem = ClanMemberItem(item);
         if(!_loc2_)
         {
            super.onRollOver(param1);
            return;
         }
         _loc2_.newIndicator.visible = false;
         super.onRollOver(param1);
      }
   }
}
