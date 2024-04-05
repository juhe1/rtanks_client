package package_390
{
   import alternativa.tanks.model.friends.FriendsService;
   import flash.events.MouseEvent;
   import package_1.Main;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_347.name_1666;
   
   public class name_3078 extends ChatUserLabel
   {
       
      
      public function name_3078(param1:String, param2:int, param3:int)
      {
         var_1557 = param1;
         var_1550 = param2;
         var_2590 = true;
         var_2591 = true;
         var_2589 = true;
         inviteBattleEnable = true;
         var_845 = param3;
         super(param1);
      }
      
      override protected function method_2561() : void
      {
         method_2554(var_1557);
         name_122(var_1550);
         method_2558(FriendsService.method_1174(var_913));
      }
      
      override protected function method_2555(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         if(PanelModel(Main.osgi.name_6(name_115)).userName == var_913)
         {
            dispatchEvent(new UserLabelEvent(UserLabelEvent.CLICK_WITH_CTRL,var_1557,true));
            return;
         }
         if(param1.ctrlKey)
         {
            dispatchEvent(new UserLabelEvent(UserLabelEvent.CLICK_WITH_CTRL,var_1557,true));
         }
         else
         {
            switch(var_2579)
            {
               case name_1666.name_1669:
                  _loc3_ = true;
                  break;
               case name_1666.INCOMING:
                  _loc4_ = true;
                  _loc5_ = true;
                  break;
               case name_1666.OUTGOING:
                  _loc6_ = true;
                  break;
               default:
                  _loc2_ = true;
            }
            contextMenuService.show(stage.mouseX,stage.mouseY,var_913,var_1550,var_1557,_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,var_2590,inviteBattleEnable,false,var_2589);
         }
      }
   }
}
