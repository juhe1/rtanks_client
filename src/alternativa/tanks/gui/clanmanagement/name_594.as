package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.name_569;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.name_584;
   import alternativa.tanks.gui.notinclan.dialogs.name_573;
   import controls.windowinner.WindowInner;
   import fl.controls.List;
   import forms.name_1919;
   import package_13.Long;
   import package_197.name_585;
   import package_211.ClanOutgoingListRenderer;
   import package_211.HeaderClanCandidateList;
   import package_215.ClanMembersDataProvider;
   import package_228.ClanAction;
   import package_25.name_55;
   import package_27.ClanMembersListEvent;
   import package_54.name_102;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   import utils.ScrollStyleUtils;
   
   public class name_594 extends name_573
   {
      
      public static var clanFunctionsService:name_55;
      
      public static var localeService:name_102;
      
      public static const WIDTH:Number = 550;
      
      public static const const_1532:Number = 450;
       
      
      private var var_1182:WindowInner;
      
      private var list:List;
      
      private var dataProvider:ClanMembersDataProvider;
      
      private var var_936:HeaderClanCandidateList;
      
      private var var_1243:name_585;
      
      private var var_1242:name_584;
      
      public function name_594(param1:name_70)
      {
         super();
         this.var_1243 = name_585(param1.name_176(name_585));
         this.var_1243.method_1453(this);
         this.var_1182 = new WindowInner(550,450,WindowInner.name_1428);
         window.addChild(this.var_1182);
         this.var_936 = new HeaderClanCandidateList();
         this.var_1182.addChild(this.var_936);
         this.dataProvider = new ClanMembersDataProvider();
         this.list = new List();
         this.list.rowHeight = 20;
         this.list.setStyle(name_1919.name_1920,ClanOutgoingListRenderer);
         this.list.focusEnabled = true;
         this.list.selectable = false;
         this.list.dataProvider = this.dataProvider;
         ScrollStyleUtils.setGreenStyle(this.list);
         this.var_1182.addChild(this.list);
         var _loc2_:name_569 = name_569(param1.name_176(name_569));
         this.var_1242 = new name_584(_loc2_,localeService.getText(name_390.const_1135),localeService.getText(name_390.const_1297),"","");
         window.addChild(this.var_1242);
         ScrollStyleUtils.setGreenStyle(this.list);
         this.method_1479();
         this.list.addEventListener(ClanMembersListEvent.REVOKE_USER,this.method_1478);
         this.resize();
      }
      
      private function method_1478(param1:ClanMembersListEvent) : void
      {
         clanFunctionsService.method_340(param1.userId);
      }
      
      public function resize() : void
      {
         var _loc1_:int = 450 - name_983.height - 11;
         this.var_1182.x = 11;
         this.var_1182.y = 11;
         this.var_1182.width = 550 - 2 * 11;
         this.var_1182.height = _loc1_ - 2 * 11;
         this.var_936.x = 3;
         this.var_936.y = 3;
         this.var_936.width = this.var_1182.width - 6;
         this.list.x = 3;
         this.list.y = 23;
         this.list.height = this.var_1182.height - 24;
         var _loc2_:Boolean = this.list.maxVerticalScrollPosition > 0;
         this.list.width = _loc2_ ? Number(this.var_1182.width + 2) : Number(this.var_1182.width - 6);
         if(this.var_1242 != null)
         {
            this.var_1242.x = 11;
            this.var_1242.y = 450 - 11 - 30;
            this.var_1242.width = 550 - 2 * 11 - 2 * name_983.width - 17;
         }
      }
      
      public function method_1479() : void
      {
         var _loc1_:Long = null;
         this.dataProvider.removeAll();
         for each(_loc1_ in this.var_1243.method_573())
         {
            this.dataProvider.addItem({"id":_loc1_});
         }
         this.sort();
         this.resize();
      }
      
      private function sort() : void
      {
         this.dataProvider.sortOn(["id"],[Array.NUMERIC]);
      }
      
      public function addUser(param1:Long) : void
      {
         this.dataProvider.addItem({"id":param1});
         this.sort();
         this.resize();
      }
      
      public function removeUser(param1:Long) : void
      {
         var _loc2_:int = this.dataProvider.name_1938(param1);
         if(_loc2_ >= 0)
         {
            this.dataProvider.removeItemAt(_loc2_);
         }
         this.sort();
         this.resize();
      }
      
      override public function method_1459() : void
      {
         if(!clanUserInfoService.method_375(ClanAction.INVITE_TO_CLAN))
         {
            this.destroy();
         }
      }
      
      override public function destroy() : void
      {
         this.var_1242.hide();
         super.destroy();
      }
      
      override public function get height() : Number
      {
         return 450;
      }
      
      override public function get width() : Number
      {
         return 550;
      }
      
      override protected function method_1477() : String
      {
         return name_390.const_1106;
      }
   }
}
