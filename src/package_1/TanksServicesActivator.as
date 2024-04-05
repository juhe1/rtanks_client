package package_1
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.loader.LoaderTips;
   import alternativa.tanks.loader.LoaderWindow;
   import alternativa.tanks.loader.name_13;
   import alternativa.tanks.loader.name_499;
   import alternativa.tanks.model.quest.daily.name_798;
   import alternativa.tanks.service.name_554;
   import package_104.name_376;
   import package_104.name_385;
   import package_106.AchievementModel;
   import package_106.name_345;
   import package_107.name_335;
   import package_11.name_23;
   import package_113.name_362;
   import package_12.name_24;
   import package_121.name_387;
   import package_124.name_42;
   import package_135.ILobbyLayoutNotifyEvents;
   import package_135.LobbyLayoutNotifyModel;
   import package_135.name_793;
   import package_135.name_809;
   import package_137.AlertService;
   import package_143.name_396;
   import package_176.name_549;
   import package_179.name_541;
   import package_180.name_544;
   import package_188.BackgroundService;
   import package_188.name_560;
   import package_207.name_561;
   import package_207.name_794;
   import package_218.BlurService;
   import package_218.name_637;
   import package_252.DailyQuestEvents;
   import package_252.name_792;
   import package_252.name_797;
   import package_252.name_801;
   import package_252.name_802;
   import package_253.name_789;
   import package_254.HelpService;
   import package_254.name_791;
   import package_255.SocialNetworkPanelModel;
   import package_256.name_806;
   import package_256.name_813;
   import package_257.NewbieUserServiceImpl;
   import package_257.name_811;
   import package_258.name_808;
   import package_258.name_812;
   import package_259.name_795;
   import package_259.name_807;
   import package_260.name_804;
   import package_260.name_816;
   import package_261.name_818;
   import package_262.LobbyLayoutService;
   import package_263.ContextMenu;
   import package_264.name_814;
   import package_265.name_810;
   import package_266.DonationAlertModel;
   import package_267.name_803;
   import package_268.ExternalEntranceService;
   import package_53.name_800;
   import package_53.name_94;
   import package_54.name_102;
   import package_75.name_274;
   import package_75.name_817;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   import platform.client.fp10.core.model.name_805;
   import platform.client.fp10.core.registry.name_29;
   import platform.clients.fp10.libraries.alternativapartners.service.name_493;
   import projects.tanks.client.commons.models.layout.name_815;
   import projects.tanks.client.panel.model.dailyquest.name_796;
   import projects.tanks.client.panel.model.donationalert.name_388;
   import projects.tanks.clients.flash.commons.models.layout.ILobbyLayoutEvents;
   import projects.tanks.clients.flash.commons.models.layout.LobbyLayoutModel;
   import projects.tanks.clients.flash.commons.models.layout.name_790;
   import projects.tanks.clients.flash.commons.models.layout.name_799;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class TanksServicesActivator implements name_23
   {
      
      public static var osgi:OSGi;
       
      
      private var var_168:LoaderWindow;
      
      public function TanksServicesActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         TanksServicesActivator.osgi = param1;
         var _loc2_:name_29 = param1.name_6(name_29) as name_29;
         var _loc3_:name_560 = new BackgroundService();
         param1.name_1(name_560,_loc3_);
         param1.name_1(name_791,new HelpService());
         param1.name_1(name_345,new AchievementModel());
         param1.name_1(name_637,new BlurService());
         param1.name_1(name_561,new name_794());
         param1.name_1(name_812,new name_808());
         param1.name_1(BattleFormatUtil,new BattleFormatUtil());
         param1.name_1(name_807,new name_795());
         param1.name_1(name_816,new name_804());
         param1.name_1(name_42,new AlertService());
         param1.name_1(name_811,new NewbieUserServiceImpl());
         param1.name_1(name_554,new ExternalEntranceService());
         this.var_168 = new LoaderWindow();
         param1.name_1(name_13,this.var_168);
         param1.name_1(name_499,new LoaderTips());
         param1.name_1(name_274,new name_817());
         var _loc4_:name_94 = new LobbyLayoutService();
         param1.name_1(name_94,_loc4_);
         param1.name_1(name_800,_loc4_);
         _loc2_.name_275(name_790,name_799);
         _loc2_.name_270(name_790,ILobbyLayoutEvents);
         _loc2_.add(new LobbyLayoutModel(),Vector.<Class>([name_815,name_790,name_170,name_287]));
         _loc2_.name_275(name_793,name_809);
         _loc2_.name_270(name_793,ILobbyLayoutNotifyEvents);
         _loc2_.add(new LobbyLayoutNotifyModel(),Vector.<Class>([name_814,name_793,name_287]));
         _loc2_.add(new name_818(),Vector.<Class>([name_396,name_287]));
         _loc2_.name_275(name_792,name_797);
         _loc2_.name_270(name_792,DailyQuestEvents);
         _loc2_.add(new name_802(),Vector.<Class>([name_796,name_792]));
         _loc2_.add(new name_801(),Vector.<Class>([name_803,name_141,name_805]));
         _loc2_.add(new name_810(),Vector.<Class>([name_387]));
         _loc2_.add(new name_798(),Vector.<Class>([name_335]));
         _loc2_.add(new name_813(),Vector.<Class>([name_376]));
         _loc2_.add(new name_806(),Vector.<Class>([name_385]));
         _loc2_.add(new DonationAlertModel(),Vector.<Class>([name_388,name_170,name_287]));
         _loc2_.add(new SocialNetworkPanelModel(),Vector.<Class>([name_362,name_170,name_287]));
         _loc3_.showBg();
         param1.name_40(name_544,SocialNetworkPanelModel,"socialNetworkService");
         param1.name_40(name_102,SocialNetworkPanelModel,"localeService");
         param1.name_40(name_42,SocialNetworkPanelModel,"alertService");
         param1.name_40(name_637,AlertService,"blurService");
         param1.name_40(name_549,AlertService,"dialogWindowsDispatcherService");
         param1.name_40(name_24,AlertService,"display");
         param1.name_40(name_102,AlertService,"localeService");
         param1.name_40(name_544,name_789,"socialNetworkService");
         param1.name_40(name_24,name_789,"display");
         param1.name_40(name_493,name_789,"partnersService");
         param1.name_40(name_541,name_789,"validateService");
         param1.name_40(name_791,name_789,"helperService");
         param1.name_40(name_493,name_794,"partnerService");
         param1.name_40(name_274,ContextMenu,"battleInfoService");
      }
      
      public function stop(param1:OSGi) : void
      {
         param1.name_48(name_560);
         param1.name_48(name_791);
         param1.name_48(name_13);
         param1.name_48(name_345);
         this.var_168 = null;
         TanksServicesActivator.osgi = null;
      }
   }
}
