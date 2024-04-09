package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.gui.notinclan.dialogs.name_573;
   import controls.base.DefaultButtonBase;
   import controls.windowinner.WindowInner;
   import fl.controls.List;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import forms.name_1919;
   import package_13.Long;
   import package_196.name_581;
   import package_211.ClanIncomingListRenderer;
   import package_211.HeaderClanCandidateList;
   import package_215.ClanMembersDataProvider;
   import package_228.ClanAction;
   import package_25.name_55;
   import package_26.ClanNotificationsManager;
   import package_27.ClanMembersListEvent;
   import package_54.name_102;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   import utils.ScrollStyleUtils;
   
   public class ClanIncomingRequestsDialog extends name_573
   {
      
      public static var clanFunctionsService:name_55;
      
      public static var localeService:name_102;
      
      public static const WIDTH:Number = 550;
      
      public static const const_1532:Number = 450;
       
      
      private var var_1221:Dictionary;
      
      private var var_1182:WindowInner;
      
      private var list:List;
      
      private var dataProvider:ClanMembersDataProvider;
      
      private var var_936:HeaderClanCandidateList;
      
      private var var_1259:DefaultButtonBase;
      
      private var var_1260:name_581;
      
      public function ClanIncomingRequestsDialog(param1:name_70)
      {
         super();
         this.var_1221 = new Dictionary();
         this.var_1260 = name_581(param1.name_176(name_581));
         this.var_1260.method_1442(this);
         this.var_1182 = new WindowInner(550,450,WindowInner.name_1428);
         window.addChild(this.var_1182);
         this.var_936 = new HeaderClanCandidateList();
         this.var_1182.addChild(this.var_936);
         this.dataProvider = new ClanMembersDataProvider();
         this.dataProvider.getItemAtHandler = this.method_1461;
         this.list = new List();
         this.list.rowHeight = 20;
         this.list.setStyle(name_1919.name_1920,ClanIncomingListRenderer);
         this.list.focusEnabled = true;
         this.list.selectable = false;
         this.list.dataProvider = this.dataProvider;
         ScrollStyleUtils.setGreenStyle(this.list);
         this.var_1182.addChild(this.list);
         ScrollStyleUtils.setGreenStyle(this.list);
         this.method_1479();
         this.var_1259 = new DefaultButtonBase();
         this.var_1259.label = localeService.getText(name_390.const_759);
         window.addChild(this.var_1259);
         this.list.addEventListener(ClanMembersListEvent.REJECT_USER,this.method_1500);
         this.list.addEventListener(ClanMembersListEvent.ACCEPTED_USER,this.method_1502);
         this.var_1259.addEventListener(MouseEvent.CLICK,this.method_1501);
         this.resize();
      }
      
      private function method_1461(param1:Object) : void
      {
         if(!this.method_1161(param1))
         {
            this.method_1462(param1);
         }
      }
      
      public function method_1465() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this.var_1221)
         {
            ClanNotificationsManager.name_1917(_loc1_.id);
         }
      }
      
      protected function method_1161(param1:Object) : Boolean
      {
         return param1 in this.var_1221;
      }
      
      protected function method_1462(param1:Object) : void
      {
         this.var_1221[param1] = true;
      }
      
      private function method_1501(param1:MouseEvent) : void
      {
         clanFunctionsService.method_370();
      }
      
      private function method_1502(param1:ClanMembersListEvent) : void
      {
         clanFunctionsService.method_346(param1.userId);
      }
      
      private function method_1500(param1:ClanMembersListEvent) : void
      {
         clanFunctionsService.method_371(param1.userId);
      }
      
      public function resize() : void
      {
         this.var_1182.x = 11;
         this.var_1182.y = 11;
         this.var_1182.width = 550 - 2 * 11;
         this.var_1182.height = name_983.y - 11 - 7;
         this.var_936.x = 3;
         this.var_936.y = 3;
         this.var_936.width = this.var_1182.width - 6;
         this.list.x = 3;
         this.list.y = 23;
         this.list.height = this.var_1182.height - 24;
         var _loc1_:Boolean = this.list.maxVerticalScrollPosition > 0;
         this.list.width = _loc1_ ? Number(this.var_1182.width + 2) : Number(this.var_1182.width - 6);
         if(this.var_1259 != null)
         {
            this.var_1259.x = 11;
            this.var_1259.y = this.height - 11 - this.var_1259.height;
         }
      }
      
      public function method_1479() : void
      {
         var _loc1_:Long = null;
         var _loc2_:Object = null;
         this.dataProvider.removeAll();
         for each(_loc1_ in this.var_1260.method_573())
         {
            _loc2_ = {};
            _loc2_.id = _loc1_;
            _loc2_.isNew = ClanNotificationsManager.name_1949(_loc1_);
            _loc2_.uid = _loc1_;
            this.dataProvider.addItem(_loc2_);
         }
         this.sort();
         this.resize();
      }
      
      private function sort() : void
      {
         this.dataProvider.sortOn(["isNew","uid"],[Array.NUMERIC | Array.DESCENDING,Array.CASEINSENSITIVE]);
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
      
      override protected function method_1475(param1:MouseEvent) : void
      {
         this.method_1465();
         super.method_1475(param1);
      }
      
      override public function method_1459() : void
      {
         if(!clanUserInfoService.method_375(ClanAction.ADDING_TO_CLAN))
         {
            destroy();
         }
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
