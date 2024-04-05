package package_1
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.dump.name_524;
   import alternativa.tanks.model.quest.challenge.name_547;
   import alternativa.tanks.model.quest.common.gui.window.QuestWindow;
   import alternativa.tanks.model.quest.common.name_551;
   import alternativa.tanks.model.quest.daily.name_548;
   import controls.PlayerInfo;
   import package_11.name_23;
   import package_111.name_347;
   import package_111.name_406;
   import package_119.UserDataModel;
   import package_120.UserInfoService;
   import package_120.name_408;
   import package_123.name_339;
   import package_123.name_543;
   import package_133.name_360;
   import package_133.name_546;
   import package_134.name_357;
   import package_134.name_545;
   import package_174.name_534;
   import package_174.name_535;
   import package_175.NotificationService;
   import package_175.name_539;
   import package_176.name_538;
   import package_176.name_549;
   import package_177.DialogsService;
   import package_177.name_550;
   import package_178.QuestNotifierServiceImpl;
   import package_178.name_542;
   import package_179.name_540;
   import package_179.name_541;
   import package_180.SocialNetworkPanelService;
   import package_180.name_544;
   import package_181.BannerModel;
   import package_182.BonusModel;
   import package_183.AntiAddictionAlertModel;
   import package_184.ReferalsModel;
   import package_185.EntranceAlertModel;
   import package_186.PaymentModel;
   import package_25.name_52;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_31.name_537;
   import package_7.name_32;
   import package_90.name_308;
   import package_90.name_536;
   
   public class name_4 implements name_23
   {
      
      public static var osgi:OSGi;
       
      
      private var panelModel:PanelModel;
      
      private var var_95:UserDataModel;
      
      private var var_101:PaymentModel;
      
      private var var_74:BonusModel;
      
      private var var_99:BannerModel;
      
      private var var_98:ReferalsModel;
      
      private var var_94:AntiAddictionAlertModel;
      
      private var var_97:EntranceAlertModel;
      
      private var newsModel:name_347;
      
      private var userInfo:UserInfoService;
      
      private var contextMenu:name_536;
      
      private var var_104:name_539;
      
      private var var_93:name_534;
      
      private var var_103:name_339;
      
      private var var_102:DialogsService;
      
      private var var_100:name_538;
      
      private var var_96:name_537;
      
      public function name_4()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         name_4.osgi = param1;
         param1.name_1(name_542,new QuestNotifierServiceImpl());
         this.var_93 = new name_535();
         param1.name_1(name_534,this.var_93);
         var _loc2_:name_32 = name_32(param1.name_6(name_32));
         this.var_103 = new name_543();
         param1.name_1(name_339,this.var_103);
         this.var_104 = new NotificationService();
         param1.name_1(name_539,this.var_104);
         this.panelModel = new PanelModel();
         _loc2_.add(this.panelModel);
         param1.name_1(name_115,this.panelModel);
         this.var_95 = new UserDataModel();
         _loc2_.add(this.var_95);
         this.var_74 = new BonusModel();
         _loc2_.add(this.var_74);
         this.var_99 = new BannerModel();
         _loc2_.add(this.var_99);
         this.var_98 = new ReferalsModel();
         _loc2_.add(this.var_98);
         this.var_94 = new AntiAddictionAlertModel();
         _loc2_.add(this.var_94);
         this.var_97 = new EntranceAlertModel();
         _loc2_.add(this.var_97);
         this.newsModel = new name_347();
         param1.name_1(name_406,this.newsModel);
         this.userInfo = new UserInfoService();
         param1.name_1(name_408,this.userInfo);
         this.contextMenu = new name_536();
         param1.name_1(name_308,this.contextMenu);
         this.var_93 = new name_535();
         param1.name_1(name_534,this.var_93);
         this.var_102 = new DialogsService();
         param1.name_1(name_550,this.var_102);
         this.var_100 = new name_538();
         param1.name_1(name_549,this.var_100);
         param1.name_40(name_52,PlayerInfo,"clanUserInfoService");
         param1.name_1(name_544,new SocialNetworkPanelService());
         param1.name_1(name_541,new name_540());
         param1.name_1(name_360,new name_546());
         var _loc3_:QuestWindow = new QuestWindow();
         param1.name_1(name_551,_loc3_);
         param1.name_1(name_548,_loc3_.name_552());
         param1.name_1(name_547,_loc3_.name_553());
         param1.name_1(name_357,new name_545());
         this.var_96 = new name_537();
         name_524(param1.name_6(name_524)).registerDumper(this.var_96);
      }
      
      public function stop(param1:OSGi) : void
      {
         var _loc2_:name_32 = name_32(param1.name_6(name_32));
         _loc2_.remove(this.panelModel.id);
         this.panelModel = null;
         _loc2_.remove(this.var_95.id);
         this.var_95 = null;
         _loc2_.remove(this.var_101.id);
         this.var_101 = null;
         _loc2_.remove(this.var_74.id);
         this.var_74 = null;
         _loc2_.remove(this.var_99.id);
         this.var_99 = null;
         _loc2_.remove(this.var_98.id);
         this.var_98 = null;
         _loc2_.remove(this.var_94.id);
         this.var_94 = null;
         _loc2_.remove(this.var_97.id);
         this.var_97 = null;
         this.newsModel = null;
         name_524(param1.name_6(name_524)).unregisterDumper(this.var_96.dumperName);
         this.var_96 = null;
         name_4.osgi = null;
      }
   }
}
