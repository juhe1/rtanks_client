package package_211
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_13.Long;
   import package_215.DeleteIndicator;
   import package_215.class_147;
   import package_26.name_62;
   import package_27.ClanMembersListEvent;
   
   public class name_620 extends class_147
   {
      
      public static var clanService:name_62;
       
      
      public function name_620(param1:Long)
      {
         super();
         var_1370 = method_1595(param1);
         addChild(var_1370);
         var_1369 = new DeleteIndicator(false);
         addChild(var_1369);
         var_1369.visible = false;
         var_1369.addEventListener(MouseEvent.CLICK,this.method_1600,false,0,true);
         this.onResize();
      }
      
      private function method_1600(param1:MouseEvent) : void
      {
         dispatchEvent(new ClanMembersListEvent(ClanMembersListEvent.REVOKE_USER,Long.getLong(0,0),var_1367.uid,true,true));
      }
      
      override protected function onResize(param1:Event = null) : void
      {
         var_1370.x = 10;
         var_1370.y = 1;
         var_1370.width = width - 2 * 10;
         var_1369.x = width - var_1369.width - 6;
         var_1369.y = 1;
         method_1596();
      }
   }
}
