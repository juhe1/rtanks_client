package package_1
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.name_295;
   import alternativa.tanks.loader.name_13;
   import alternativa.tanks.models.battlefield.BattleView3D;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.gui.chat.BattleChat;
   import alternativa.tanks.models.battlefield.name_284;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.dom.hud.KeyPointView;
   import alternativa.tanks.models.tank.ITankModelEvents;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.class_12;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.tank.name_315;
   import alternativa.tanks.models.tank.spawn.ITankSpawnerEvents;
   import alternativa.tanks.models.tank.spawn.name_136;
   import alternativa.tanks.models.tank.spawn.name_279;
   import alternativa.tanks.models.tank.spawn.name_294;
   import alternativa.tanks.models.tank.turret.name_111;
   import alternativa.tanks.models.weapon.shaft.ReticleDisplay;
   import alternativa.tanks.models.weapon.shotgun.ShotgunModel;
   import alternativa.tanks.service.settings.IBattleSettings;
   import com.alternativaplatform.projects.tanks.client.models.battlefield.name_306;
   import package_100.name_310;
   import package_101.name_291;
   import package_11.IBundleActivator;
   import package_12.name_24;
   import package_18.name_34;
   import package_31.class_1;
   import package_32.BattleInputServiceImpl;
   import package_32.name_245;
   import package_33.name_276;
   import package_40.class_10;
   import package_43.TankExplosionModel;
   import package_46.BattleEventDispatcherImpl;
   import package_46.name_290;
   import package_46.name_96;
   import package_51.name_309;
   import package_53.name_94;
   import package_54.name_102;
   import package_55.name_101;
   import package_56.TankUsersRegistryServiceImpl;
   import package_56.name_95;
   import package_58.TankResistancesEvents;
   import package_58.TankResistancesModel;
   import package_58.name_112;
   import package_58.name_305;
   import package_62.name_317;
   import package_65.name_160;
   import package_69.name_211;
   import package_69.name_271;
   import package_7.name_32;
   import package_70.DiscreteWeaponEvents;
   import package_70.DiscreteWeaponListenerEvents;
   import package_70.name_273;
   import package_70.name_278;
   import package_70.name_297;
   import package_70.name_301;
   import package_70.name_318;
   import package_71.LaserPointerEvents;
   import package_71.name_277;
   import package_71.name_286;
   import package_71.name_299;
   import package_72.ShotgunAimingEvents;
   import package_72.name_280;
   import package_72.name_314;
   import package_72.name_316;
   import package_73.ShotgunSFXEvents;
   import package_73.name_282;
   import package_73.name_296;
   import package_73.name_302;
   import package_74.LightingEffectsService;
   import package_74.name_272;
   import package_75.name_274;
   import package_76.FollowCameraController;
   import package_77.PlayerCamera;
   import package_77.SpectatorCameraController;
   import package_78.name_281;
   import package_79.CTFModel;
   import package_79.name_313;
   import package_80.InventoryModel;
   import package_81.name_285;
   import package_82.name_292;
   import package_82.name_312;
   import package_83.name_283;
   import package_84.name_300;
   import package_85.ControlsHelper;
   import package_86.ServerBattleMinesModel;
   import package_87.TableStatistics;
   import package_88.BonusRegionService;
   import package_89.ResistanceServiceImpl;
   import package_90.name_308;
   import package_91.name_288;
   import package_92.WeaponCommonModel;
   import package_93.name_303;
   import package_94.name_293;
   import package_95.IStorageService;
   import package_96.name_311;
   import package_97.ParaBonus;
   import package_98.name_304;
   import package_99.BattleMinesModel;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.name_29;
   import projects.tanks.client.battlefield.models.battle.battlefield.billboard.name_307;
   import projects.tanks.client.battlefield.models.tankparts.weapons.shotgun.name_289;
   
   public class BattlefieldModelActivator implements IBundleActivator
   {
       
      
      public var models:Vector.<IModel>;
      
      public var var_71:BattlefieldModel;
      
      public function BattlefieldModelActivator()
      {
         this.models = new Vector.<IModel>();
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var _loc2_:name_32 = param1.getService(name_32) as name_32;
         var _loc3_:name_29 = param1.getService(name_29) as name_29;
         var _loc4_:name_96 = new BattleEventDispatcherImpl();
         param1.registerService(name_96,_loc4_);
         param1.registerService(name_95,new TankUsersRegistryServiceImpl());
         var _loc5_:name_276 = name_276(param1.getService(name_276));
         var _loc6_:name_24 = name_24(param1.getService(name_24));
         param1.name_40(name_34,BattleInputServiceImpl,"fullScreenService");
         param1.name_40(IBattleSettings,BattleInputServiceImpl,"settingsService");
         var _loc7_:BattleInputServiceImpl = new BattleInputServiceImpl(_loc6_.stage,_loc5_);
         param1.registerService(name_245,_loc7_);
         param1.registerService(name_272,new LightingEffectsService());
         param1.name_40(name_272,KeyPointView,"lightingEffectsService");
         param1.name_40(name_272,name_313,"lightingEffectsService");
         param1.name_40(name_272,ParaBonus,"lightingService");
         param1.name_40(ResourceRegistry,ServerBattleMinesModel,"resourceRegistry");
         param1.name_40(name_276,BattlefieldModel,"keysBindingService");
         param1.name_40(name_245,BattlefieldModel,"battleInputService");
         param1.name_40(name_29,BattlefieldModel,"modelRegistry");
         param1.name_40(name_96,BattlefieldModel,"battleEventDispatcher");
         param1.name_40(name_274,BattlefieldModel,"battleInfoService");
         param1.name_40(name_94,BattlefieldModel,"lobbyLayoutService");
         param1.name_40(name_274,name_311,"battleInfoService");
         param1.name_40(name_274,ResistanceServiceImpl,"battleInfoService");
         param1.name_40(name_245,TankModel,"battleInputService");
         param1.name_40(name_245,WeaponCommonModel,"battleInputService");
         param1.name_40(name_245,CTFModel,"battleInputService");
         param1.name_40(name_245,FollowCameraController,"battleInputService");
         param1.name_40(IBattleSettings,FollowCameraController,"settings");
         param1.name_40(name_24,FollowCameraController,"display");
         param1.name_40(IStorageService,FollowCameraController,"storageService");
         param1.name_40(name_245,InventoryModel,"battleInputService");
         param1.name_40(name_274,InventoryModel,"battleInfoService");
         param1.name_40(name_245,name_101,"battleInputService");
         param1.name_40(name_245,name_160,"battleInputService");
         param1.name_40(name_245,name_111,"battleInputService");
         param1.name_40(IBattleSettings,name_111,"settingsService");
         param1.name_40(name_245,name_281,"battleInputService");
         param1.name_40(name_24,name_281,"display");
         param1.name_40(IBattleSettings,name_281,"settings");
         param1.name_40(name_245,BattleChat,"battleInputLockService");
         param1.name_40(name_34,BattleChat,"fullscreenService");
         param1.name_40(name_102,BattleChat,"localeService");
         param1.name_40(name_102,ControlsHelper,"localeService");
         param1.name_40(name_245,TableStatistics,"battleInputService");
         param1.name_40(IBattleSettings,BonusRegionService,"settings");
         _loc3_.add(this.var_71 = new BattlefieldModel(),Vector.<Class>([name_306,IBattleField,class_11,class_1]));
         param1.registerService(IBattleField,this.var_71);
         param1.registerService(name_312,new name_292());
         this.method_17(_loc2_,new TankExplosionModel());
         this.method_17(_loc2_,new CTFModel());
         this.method_17(_loc2_,new BattleMinesModel());
         param1.name_40(name_13,name_271,"loaderWindowService");
         param1.name_40(IBattleField,name_271,"battleSerivce");
         param1.name_40(name_94,name_271,"lobbyLayoutService");
         param1.registerService(name_211,new name_271());
         param1.name_40(name_211,BattlefieldModel,"battleReadinessService");
         param1.name_40(name_211,TankModel,"battleReadinessService");
         param1.name_40(name_24,name_284,"display");
         param1.name_40(IBattleField,name_284,"battleService");
         param1.name_40(IBattleField,ReticleDisplay,"battleService");
         param1.name_40(IBattleField,name_310,"battleService");
         param1.name_40(IBattleField,name_300,"battleService");
         param1.name_40(IBattleField,name_285,"battleService");
         param1.name_40(IBattleField,name_283,"battleService");
         param1.name_40(IBattleField,BattleRunner,"battleService");
         param1.name_40(IBattleField,BattleView3D,"battleService");
         param1.name_40(IBattleField,name_111,"battleService");
         param1.name_40(IBattleField,name_295,"battleService");
         _loc3_.name_275(ITank,name_315);
         _loc3_.name_270(ITank,ITankModelEvents);
         _loc3_.add(new TankModel(),Vector.<Class>([class_10,name_170,name_287,ITank,class_12]));
         _loc3_.name_275(name_277,name_299);
         _loc3_.name_270(name_277,LaserPointerEvents);
         _loc3_.name_275(name_279,name_294);
         _loc3_.name_270(name_279,ITankSpawnerEvents);
         _loc3_.add(new name_136(),Vector.<Class>([name_279,name_291,name_287,name_170,name_290]));
         _loc3_.name_275(name_112,name_305);
         _loc3_.name_270(name_112,TankResistancesEvents);
         _loc3_.add(new TankResistancesModel(),Vector.<Class>([name_309,name_112,name_141]));
         _loc3_.add(new name_286(),Vector.<Class>([name_277,name_317]));
         _loc3_.add(new ShotgunModel(),Vector.<Class>([name_304,name_273]));
         _loc3_.name_275(name_280,name_314);
         _loc3_.name_270(name_280,ShotgunAimingEvents);
         _loc3_.add(new name_316(),Vector.<Class>([name_289,name_280]));
         _loc3_.name_275(name_282,name_302);
         _loc3_.name_270(name_282,ShotgunSFXEvents);
         _loc3_.add(new name_296(),Vector.<Class>([name_288,name_282,name_273]));
         _loc3_.name_275(name_278,name_318);
         _loc3_.name_270(name_278,DiscreteWeaponEvents);
         _loc3_.add(new name_301(),Vector.<Class>([name_303,name_278]));
         _loc3_.name_275(name_273,name_297);
         _loc3_.name_270(name_273,DiscreteWeaponListenerEvents);
         _loc3_.add(new name_283(),Vector.<Class>([name_307,name_141]));
         _loc3_.add(new name_285(),Vector.<Class>([name_293,name_170]));
         param1.name_40(class_12,name_286,"localTankInfoService");
         param1.name_40(class_12,BattleRunner,"localTankInfoService");
         param1.name_40(name_24,SpectatorCameraController,"display");
         param1.name_40(IBattleField,SpectatorCameraController,"battleService");
         param1.name_40(name_245,SpectatorCameraController,"battleInputService");
         param1.name_40(name_308,PlayerCamera,"contextMenuService");
      }
      
      public function stop(param1:OSGi) : void
      {
         var _loc3_:IModel = null;
         var _loc2_:name_32 = param1.getService(name_32) as name_32;
         while(this.models.length > 0)
         {
            _loc3_ = this.models.pop();
            _loc2_.remove(_loc3_.id);
         }
      }
      
      private function method_17(param1:name_32, param2:IModel) : void
      {
         param1.add(param2);
         this.models.push(param2);
      }
   }
}
