package package_8
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.command.name_43;
   import alternativa.tanks.gui.*;
   import alternativa.tanks.gui.clanmanagement.ClanEditProfileDialog;
   import alternativa.tanks.gui.clanmanagement.ClanIncomingRequestsDialog;
   import alternativa.tanks.gui.clanmanagement.ClanPermissionsManager;
   import alternativa.tanks.gui.clanmanagement.ClanTopManagementPanel;
   import alternativa.tanks.gui.clanmanagement.ClanUsersWindow;
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.*;
   import alternativa.tanks.gui.clanmanagement.name_563;
   import alternativa.tanks.gui.clanmanagement.name_566;
   import alternativa.tanks.gui.clanmanagement.name_594;
   import alternativa.tanks.gui.notinclan.dialogs.name_573;
   import alternativa.tanks.gui.notinclan.dialogs.name_578;
   import alternativa.tanks.gui.notinclan.dialogs.name_597;
   import alternativa.tanks.gui.notinclan.name_568;
   import alternativa.tanks.gui.notinclan.name_643;
   import alternativa.tanks.loader.name_13;
   import alternativa.tanks.models.clan.*;
   import alternativa.tanks.models.panel.*;
   import alternativa.tanks.models.user.*;
   import package_11.IBundleActivator;
   import package_12.name_24;
   import package_124.name_42;
   import package_128.name_636;
   import package_190.*;
   import package_191.*;
   import package_192.*;
   import package_193.*;
   import package_194.*;
   import package_195.*;
   import package_196.*;
   import package_197.*;
   import package_198.*;
   import package_199.*;
   import package_200.*;
   import package_201.*;
   import package_202.*;
   import package_203.*;
   import package_204.*;
   import package_205.*;
   import package_206.*;
   import package_207.name_561;
   import package_208.name_576;
   import package_208.name_586;
   import package_208.name_588;
   import package_209.ClanInfoLabel;
   import package_209.ClansDataProvider;
   import package_209.ClansList;
   import package_209.ClansListHeader;
   import package_209.name_641;
   import package_210.ForeignClanWindow;
   import package_211.HeaderClanCandidateList;
   import package_211.name_598;
   import package_211.name_620;
   import package_212.name_587;
   import package_212.name_604;
   import package_213.ClanMemberItem;
   import package_213.ClanMembersList;
   import package_213.HeaderClanMemberList;
   import package_214.FlagsDropDownList;
   import package_214.name_634;
   import package_215.DeleteIndicator;
   import package_216.name_644;
   import package_217.name_623;
   import package_218.name_637;
   import package_219.name_605;
   import package_220.name_626;
   import package_221.name_642;
   import package_222.name_618;
   import package_223.name_638;
   import package_224.name_615;
   import package_225.name_610;
   import package_226.name_622;
   import package_227.name_606;
   import package_228.name_613;
   import package_229.name_607;
   import package_230.name_627;
   import package_231.name_621;
   import package_232.name_645;
   import package_233.name_625;
   import package_234.name_633;
   import package_235.name_635;
   import package_236.name_611;
   import package_237.name_640;
   import package_25.*;
   import package_26.name_60;
   import package_26.name_62;
   import package_27.name_56;
   import package_27.name_59;
   import package_28.*;
   import package_29.*;
   import package_30.*;
   import package_31.name_115;
   import package_54.name_102;
   import package_90.name_308;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   import platform.client.fp10.core.registry.name_29;
   import projects.tanks.client.clans.clan.name_619;
   import projects.tanks.client.clans.user.name_614;
   import projects.tanks.client.clans.user.name_650;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
       
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var _loc2_:OSGi = param1;
         osgi = _loc2_;
         osgi.name_40(name_24,name_649,"display");
         osgi.name_40(name_62,ClanEditProfileDialog,"clanService");
         osgi.name_40(name_63,ClanEditProfileDialog,"createClanService");
         osgi.name_40(name_102,ClanEditProfileDialog,"localeService");
         osgi.name_40(name_55,ClanIncomingRequestsDialog,"clanFunctionsService");
         osgi.name_40(name_102,ClanIncomingRequestsDialog,"localeService");
         osgi.name_40(name_42,name_563,"alertService");
         osgi.name_40(name_59,name_563,"clanFriendsService");
         osgi.name_40(name_62,name_563,"clanService");
         osgi.name_40(name_43,name_563,"commandService");
         osgi.name_40(name_24,name_563,"display");
         osgi.name_40(name_102,name_563,"localeService");
         osgi.name_40(name_55,name_594,"clanFunctionsService");
         osgi.name_40(name_102,name_594,"localeService");
         osgi.name_40(name_64,ClanPermissionsManager,"clanMembersDataService");
         osgi.name_40(name_62,ClanPermissionsManager,"clanService");
         osgi.name_40(name_52,ClanPermissionsManager,"clanUserInfoService");
         osgi.name_40(name_24,ClanPermissionsManager,"display");
         osgi.name_40(name_64,name_566,"clanMembersData");
         osgi.name_40(name_62,name_566,"clanService");
         osgi.name_40(name_52,name_566,"clanUserInfoService");
         osgi.name_40(name_102,name_566,"localeService");
         osgi.name_40(name_42,ClanTopManagementPanel,"alertService");
         osgi.name_40(name_55,ClanTopManagementPanel,"clanFunctionsService");
         osgi.name_40(name_64,ClanTopManagementPanel,"clanMembersService");
         osgi.name_40(name_62,ClanTopManagementPanel,"clanService");
         osgi.name_40(name_52,ClanTopManagementPanel,"clanUserInfoService");
         osgi.name_40(name_65,ClanTopManagementPanel,"clanUserService");
         osgi.name_40(name_102,ClanTopManagementPanel,"localeService");
         osgi.name_40(name_561,ClanTopManagementPanel,"userPropertiesService");
         osgi.name_40(name_52,name_566,"clanUserInfoService");
         osgi.name_40(name_42,ClanUsersWindow,"alertService");
         osgi.name_40(name_55,ClanUsersWindow,"clanFunctionsService");
         osgi.name_40(name_64,ClanUsersWindow,"clanMembersData");
         osgi.name_40(name_62,ClanUsersWindow,"clanService");
         osgi.name_40(name_52,ClanUsersWindow,"clanUserInfoService");
         osgi.name_40(name_102,ClanUsersWindow,"localeService");
         osgi.name_40(name_64,ContextMenuPermissionLabel,"clanMembersData");
         osgi.name_40(name_62,ContextMenuPermissionLabel,"clanService");
         osgi.name_40(name_52,ContextMenuPermissionLabel,"clanUserInfoService");
         osgi.name_40(name_57,ContextMenuPermissionLabel,"foreignClanService");
         osgi.name_40(name_102,ContextMenuPermissionLabel,"localeService");
         osgi.name_40(name_637,name_584,"blurService");
         osgi.name_40(name_102,name_584,"localeService");
         osgi.name_40(name_561,name_584,"userPropertiesService");
         osgi.name_40(name_62,name_598,"clanService");
         osgi.name_40(name_102,name_598,"localeService");
         osgi.name_40(name_62,name_620,"clanService");
         osgi.name_40(name_102,HeaderClanCandidateList,"localeService");
         osgi.name_40(name_64,DeleteIndicator,"clanMembersData");
         osgi.name_40(name_52,DeleteIndicator,"clanUserInfoService");
         osgi.name_40(name_57,DeleteIndicator,"foreignClanService");
         osgi.name_40(name_102,ClanMemberItem,"localeService");
         osgi.name_40(name_64,ClanMembersList,"clanMembersData");
         osgi.name_40(name_102,HeaderClanMemberList,"localeService");
         osgi.name_40(name_62,name_587,"clanService");
         osgi.name_40(name_52,name_587,"clanUserInfoService");
         osgi.name_40(name_62,name_604,"clanService");
         osgi.name_40(name_52,name_604,"clanUserInfoService");
         osgi.name_40(name_63,name_634,"clanCreateService");
         osgi.name_40(name_63,FlagsDropDownList,"clanCreateService");
         osgi.name_40(name_102,FlagsDropDownList,"localeService");
         osgi.name_40(name_42,ForeignClanWindow,"alertService");
         osgi.name_40(name_63,ForeignClanWindow,"createClanService");
         osgi.name_40(name_57,ForeignClanWindow,"foreignClanService");
         osgi.name_40(name_102,ForeignClanWindow,"localeService");
         osgi.name_40(name_561,ForeignClanWindow,"userPropertyService");
         osgi.name_40(name_102,name_643,"localeService");
         osgi.name_40(name_42,name_568,"alertService");
         osgi.name_40(name_52,name_568,"clanUserInfoService");
         osgi.name_40(name_65,name_568,"clanUserService");
         osgi.name_40(name_102,name_568,"localeService");
         osgi.name_40(name_52,ClanInfoLabel,"clanUserInfoService");
         osgi.name_40(name_65,ClanInfoLabel,"clanUserService");
         osgi.name_40(name_65,ClansDataProvider,"clanUserService");
         osgi.name_40(name_65,ClansList,"clanUserService");
         osgi.name_40(name_102,ClansListHeader,"localeService");
         osgi.name_40(name_102,name_641,"localeService");
         osgi.name_40(name_42,name_578,"alertService");
         osgi.name_40(name_63,name_578,"createClanService");
         osgi.name_40(name_102,name_578,"localeService");
         osgi.name_40(name_62,name_573,"clanService");
         osgi.name_40(name_52,name_573,"clanUserInfoService");
         osgi.name_40(name_102,name_573,"localeService");
         osgi.name_40(name_65,name_597,"clanUserService");
         osgi.name_40(name_102,name_597,"localeService");
         osgi.name_40(name_65,name_586,"clanUserService");
         osgi.name_40(name_102,name_586,"localeService");
         osgi.name_40(name_65,name_588,"clanUserService");
         osgi.name_40(name_102,name_588,"localeService");
         osgi.name_40(name_52,name_576,"clanUserInfoService");
         osgi.name_40(name_65,name_576,"clanUserService");
         osgi.name_40(name_24,name_576,"display");
         osgi.name_40(name_62,name_570,"clanService");
         osgi.name_40(name_52,name_570,"clanUserInfoService");
         osgi.name_40(name_102,name_570,"localeService");
         osgi.name_40(name_62,name_591,"clanService");
         osgi.name_40(name_62,name_599,"clanService");
         osgi.name_40(name_59,name_601,"clanFriendsService");
         osgi.name_40(name_62,ClanInfoModel,"clanService");
         osgi.name_40(name_63,ClanInfoModel,"createClanService");
         osgi.name_40(name_24,ClanInfoModel,"display");
         osgi.name_40(name_64,name_600,"clanMembersService");
         osgi.name_40(name_52,name_603,"clanUserInfoService");
         osgi.name_40(name_63,name_577,"createClanService");
         osgi.name_40(name_57,name_577,"foreignClanService");
         osgi.name_40(name_65,name_593,"clanUserService");
         osgi.name_40(name_52,name_567,"clanUserInfoService");
         osgi.name_40(name_65,name_567,"clanUserService");
         osgi.name_40(name_561,name_567,"userPropertyService");
         osgi.name_40(name_56,name_562,"clanPanelNotification");
         osgi.name_40(name_62,name_562,"clanService");
         osgi.name_40(name_308,name_562,"contextMenuService");
         osgi.name_40(name_115,name_562,"panel");
         osgi.name_40(name_561,name_562,"userPropertiesService");
         osgi.name_40(name_56,name_590,"clanPanelNotificationService");
         osgi.name_40(name_115,name_53,"panel");
         osgi.name_40(name_561,name_53,"userPropertiesService");
         osgi.name_40(name_62,name_595,"clanService");
         osgi.name_40(name_63,name_602,"createClanService");
         osgi.name_40(name_102,ClanCreateServiceImpl,"localeService");
         osgi.name_40(name_62,name_60,"clanService");
         osgi.name_40(name_62,name_564,"clanService");
         osgi.name_40(name_52,name_564,"clanUserInfoService");
         osgi.name_40(name_65,name_564,"clanUserService");
         osgi.name_40(name_13,name_564,"loaderWindowService");
         osgi.name_40(name_115,name_564,"panelView");
         osgi.name_40(name_62,name_565,"clanService");
         osgi.name_40(name_52,name_565,"clanUserInfoService");
         osgi.name_40(name_65,name_565,"clanUserService");
         osgi.name_40(name_102,name_565,"localeService");
         osgi.name_40(name_561,name_565,"userPropertiesService");
         osgi.name_40(name_56,ClanUserAcceptedNotificatorModel,"clanPanelNotificationService");
         osgi.name_40(name_65,name_592,"clanUserService");
         osgi.name_40(name_65,name_589,"clanUserService");
         osgi.name_40(name_65,name_596,"clanUserService");
         var _loc3_:name_29 = osgi.getService(name_29) as name_29;
         _loc3_.name_275(name_569,name_624);
         _loc3_.name_270(name_569,ISourceDataEvents);
         var _loc4_:name_29 = osgi.getService(name_29) as name_29;
         _loc4_.add(new name_570(),Vector.<Class>([name_619,name_572,name_569,name_287,name_141]));
         _loc3_.name_275(name_572,name_647);
         _loc3_.name_270(name_572,IClanModelEvents);
         _loc4_.add(new name_591(),Vector.<Class>([name_579,name_626]));
         _loc3_.name_275(name_579,name_628);
         _loc3_.name_270(name_579,IClanAcceptedModelEvents);
         _loc4_.add(new name_630(),Vector.<Class>([name_170,name_287,name_605]));
         _loc4_.add(new name_599(),Vector.<Class>([name_606]));
         _loc4_.add(new name_601(),Vector.<Class>([name_635,name_170,name_287]));
         _loc4_.add(new name_609(),Vector.<Class>([name_625,name_581,name_170]));
         _loc3_.name_275(name_581,name_646);
         _loc3_.name_270(name_581,IClanIncomingModelEvents);
         _loc4_.add(new name_648(),Vector.<Class>([name_170,name_287,name_638]));
         _loc4_.add(new ClanInfoModel(),Vector.<Class>([name_611,name_571,name_170,name_287]));
         _loc3_.name_275(name_571,name_631);
         _loc3_.name_270(name_571,IClanInfoModelEvents);
         _loc4_.add(new name_600(),Vector.<Class>([name_623,name_170]));
         _loc4_.add(new ClanOutgoingModel(),Vector.<Class>([name_622,name_585,name_170]));
         _loc3_.name_275(name_585,name_616);
         _loc3_.name_270(name_585,IClanOutgoingModelEvents);
         _loc4_.add(new name_603(),Vector.<Class>([name_575,name_613,name_170]));
         _loc3_.name_275(name_575,name_632);
         _loc3_.name_270(name_575,IClanPermissionsModelEvents);
         _loc4_.add(new name_577(),Vector.<Class>([name_610,name_170,name_287]));
         _loc4_.add(new name_593(),Vector.<Class>([name_615,name_170]));
         _loc4_.add(new name_567(),Vector.<Class>([name_636,name_170]));
         _loc4_.add(new name_562(),Vector.<Class>([name_607,name_170,name_287]));
         _loc4_.add(new name_590(),Vector.<Class>([name_618,name_170]));
         _loc4_.add(new name_595(),Vector.<Class>([name_633,name_582,name_170,name_287]));
         _loc3_.name_275(name_582,name_608);
         _loc3_.name_270(name_582,IClanPanelModelEvents);
         _loc4_.add(new name_602(),Vector.<Class>([name_642,name_170,name_287]));
         _loc4_.add(new name_564(),Vector.<Class>([name_650,name_141,name_287]));
         _loc4_.add(new name_565(),Vector.<Class>([name_614,name_580,name_170,name_141,name_569]));
         _loc3_.name_275(name_580,name_612);
         _loc3_.name_270(name_580,IClanUserModelEvents);
         _loc4_.add(new name_617(),Vector.<Class>([name_640]));
         _loc4_.add(new ClanUserAcceptedNotificatorModel(),Vector.<Class>([name_621,name_170,name_287]));
         _loc4_.add(new name_592(),Vector.<Class>([name_644,name_170,name_574]));
         _loc3_.name_275(name_574,name_639);
         _loc3_.name_270(name_574,IClanUserIncomingModelEvents);
         _loc4_.add(new name_589(),Vector.<Class>([name_170,name_287,name_645]));
         _loc4_.add(new name_596(),Vector.<Class>([name_627,name_170,name_287,name_583]));
         _loc3_.name_275(name_583,name_629);
         _loc3_.name_270(name_583,IClanUserOutgoingModelEvents);
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}
