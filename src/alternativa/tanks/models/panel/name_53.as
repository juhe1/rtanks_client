package alternativa.tanks.models.panel
{
   import flash.events.EventDispatcher;
   import flash.utils.setTimeout;
   import package_207.name_561;
   import package_25.RestrictionJoinClanEvent;
   import package_27.ClanPanelNotificationEvent;
   import package_27.name_56;
   import package_31.PanelModel;
   import package_31.name_115;
   
   public class name_53 extends EventDispatcher implements name_56
   {
      
      public static var userPropertiesService:name_561;
      
      public static var panel:name_115;
       
      
      private var var_236:int = 0;
      
      private var var_237:int;
      
      private var var_238:Boolean;
      
      public function name_53()
      {
         super();
      }
      
      public function remove() : void
      {
         --this.var_236;
         if(this.var_236 < 0)
         {
            this.var_236 = 0;
         }
         this.method_337();
      }
      
      public function add() : void
      {
         ++this.var_236;
         this.method_337();
      }
      
      public function init(param1:int) : void
      {
         this.var_236 = param1;
         this.method_337();
      }
      
      public function method_336() : int
      {
         return this.var_236;
      }
      
      private function method_337() : void
      {
         dispatchEvent(new ClanPanelNotificationEvent(ClanPanelNotificationEvent.UPDATE,this.var_236));
      }
      
      public function set restrictionTimeJoinClanInSec(param1:int) : void
      {
         this.var_237 = param1;
         dispatchEvent(new RestrictionJoinClanEvent(RestrictionJoinClanEvent.UPDATE));
         if(param1 > 0)
         {
            setTimeout(this.method_338,param1 * 1000);
         }
      }
      
      private function method_338() : void
      {
         this.var_237 = 0;
         dispatchEvent(new RestrictionJoinClanEvent(RestrictionJoinClanEvent.UPDATE));
      }
      
      public function get restrictionTimeJoinClanInSec() : int
      {
         return this.var_237;
      }
      
      public function get clanButtonVisible() : Boolean
      {
         return this.var_238;
      }
      
      public function set clanButtonVisible(param1:Boolean) : void
      {
         this.var_238 = param1;
         if(PanelModel(panel).getPanel() != null)
         {
            if(this.var_238)
            {
               PanelModel(panel).getPanel().buttonBar.showClanButton();
            }
            else
            {
               PanelModel(panel).getPanel().buttonBar.hideClanButton();
            }
         }
      }
   }
}
