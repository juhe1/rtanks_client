package package_266
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.ThanksForPurchaseWindow;
   import alternativa.tanks.service.settings.IBattleSettings;
   import flash.events.Event;
   import flash.utils.setTimeout;
   import package_117.name_341;
   import package_117.name_404;
   import package_13.Long;
   import package_283.LobbyLayoutServiceEvent;
   import package_53.name_94;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.client.panel.model.donationalert.class_152;
   import projects.tanks.client.panel.model.donationalert.name_388;
   
   public class DonationAlertModel extends class_152 implements name_388, name_170, name_287
   {
      
      public static var settingsService:IBattleSettings = OSGi.getInstance().getService(IBattleSettings) as IBattleSettings;
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().getService(name_94) as name_94;
       
      
      private var window:ThanksForPurchaseWindow = null;
      
      private var time:Long = null;
      
      private var var_1476:Long;
      
      private var goods:Vector.<name_341>;
      
      private var var_1475:Boolean = false;
      
      private var var_24:name_70;
      
      public function DonationAlertModel()
      {
         this.goods = new Vector.<name_341>();
         super();
      }
      
      public function objectLoaded() : void
      {
         this.var_24 = object;
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,method_39(this.method_1376));
      }
      
      private function method_1376(param1:LobbyLayoutServiceEvent) : void
      {
         if(param1.state != LayoutState.BATTLE)
         {
            this.method_1677();
         }
      }
      
      public function objectUnloaded() : void
      {
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,method_39(this.method_1376));
         this.var_24 = null;
      }
      
      private function method_1677() : void
      {
         if(this.window == null && this.goods.length > 0 && lobbyLayoutService.getCurrentState() != LayoutState.BATTLE && !lobbyLayoutService.isSwitchInProgress())
         {
            this.window = this.createForm(this.goods,this.var_1475);
            this.var_1476 = this.time;
            this.goods.length = 0;
            this.show();
         }
      }
      
      public function showDonationAlert(param1:name_404) : void
      {
         this.method_1678(param1);
         this.method_1677();
      }
      
      public function method_1099(param1:name_404) : void
      {
         this.var_1475 = true;
         this.method_1678(param1);
         this.method_1677();
      }
      
      public function method_1681(param1:Vector.<name_341>, param2:Boolean) : ThanksForPurchaseWindow
      {
         var form:ThanksForPurchaseWindow = null;
         var items:Vector.<name_341> = param1;
         var requiredEmail:Boolean = param2;
         try
         {
            object = this.var_24;
            form = this.createForm(items,requiredEmail);
         }
         finally
         {
            method_38();
         }
         return form;
      }
      
      private function createForm(param1:Vector.<name_341>, param2:Boolean) : ThanksForPurchaseWindow
      {
         return new ThanksForPurchaseWindow(param1);
      }
      
      private function method_1678(param1:name_404) : void
      {
         var _loc2_:name_341 = null;
         var _loc3_:name_341 = null;
         this.time = param1.time;
         for each(_loc2_ in param1.goods)
         {
            _loc3_ = this.method_1680(_loc2_.name);
            if(_loc3_ == null)
            {
               this.goods.push(_loc2_);
            }
            else
            {
               _loc3_.count += _loc2_.count;
            }
         }
      }
      
      private function method_1680(param1:String) : name_341
      {
         var _loc2_:name_341 = null;
         for each(_loc2_ in this.goods)
         {
            if(param1 == _loc2_.name)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function method_1102(param1:String) : void
      {
      }
      
      public function method_1101(param1:String) : void
      {
      }
      
      public function method_1100(param1:String) : void
      {
      }
      
      private function method_1679(param1:Event) : void
      {
         this.window.removeEventListener(Event.CANCEL,method_39(this.method_1679));
         this.window = null;
         this.var_1475 = false;
         if(this.goods.length > 0)
         {
            setTimeout(method_39(this.method_1677),1000);
         }
      }
      
      private function show() : void
      {
         this.window.name_2099();
         this.window.addEventListener(Event.CANCEL,method_39(this.method_1679));
      }
   }
}
