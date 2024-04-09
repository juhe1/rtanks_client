package
{
   import alternativa.model.IModel;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.tables.kits.description.KitsInfoData;
   import alternativa.tanks.loader.name_13;
   import alternativa.tanks.model.GarageModel;
   import alternativa.tanks.model.ItemEffectModel;
   import alternativa.tanks.model.challenge.WeeklyQuestBitmaps;
   import alternativa.tanks.model.friends.FriendsService;
   import alternativa.tanks.model.name_324;
   import alternativa.tanks.model.name_364;
   import alternativa.tanks.model.name_381;
   import alternativa.tanks.services.name_363;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import forms.battlelist.MapTheme;
   import package_1.BattleSelectModelActivator;
   import package_1.GarageModelActivator;
   import package_1.Main;
   import package_1.name_372;
   import package_102.Command;
   import package_102.Type;
   import package_103.name_323;
   import package_103.name_328;
   import package_104.name_327;
   import package_104.name_330;
   import package_104.name_367;
   import package_104.name_376;
   import package_104.name_385;
   import package_105.name_321;
   import package_106.Achievement;
   import package_106.AchievementModel;
   import package_106.IAchievementModel;
   import package_107.name_326;
   import package_107.name_335;
   import package_107.name_368;
   import package_108.name_333;
   import package_108.name_336;
   import package_108.name_355;
   import package_109.name_325;
   import package_110.LootBoxCategory;
   import package_110.name_331;
   import package_110.name_382;
   import package_111.name_342;
   import package_111.name_347;
   import package_111.name_406;
   import package_112.name_334;
   import package_112.name_356;
   import package_113.name_344;
   import package_113.name_362;
   import package_113.name_393;
   import package_114.ChatModeratorLevel;
   import package_115.name_329;
   import package_116.name_340;
   import package_116.name_365;
   import package_117.name_341;
   import package_117.name_404;
   import package_118.QuestLevel;
   import package_119.name_351;
   import package_119.name_361;
   import package_120.UserInfoService;
   import package_120.name_350;
   import package_120.name_408;
   import package_121.name_343;
   import package_121.name_387;
   import package_122.name_337;
   import package_123.name_339;
   import package_124.name_42;
   import package_125.name_366;
   import package_125.name_369;
   import package_126.name_338;
   import package_127.LootBoxModel;
   import package_128.name_354;
   import package_129.name_349;
   import package_13.Long;
   import package_130.name_348;
   import package_131.name_352;
   import package_132.name_359;
   import package_133.name_360;
   import package_134.name_357;
   import package_135.LobbyLayoutNotifyModel;
   import package_136.name_395;
   import package_136.name_407;
   import package_137.name_358;
   import package_138.ServerBonusModel;
   import package_139.name_397;
   import package_140.name_403;
   import package_141.name_400;
   import package_142.name_392;
   import package_143.name_396;
   import package_144.name_465;
   import package_17.name_44;
   import package_20.Space;
   import package_25.name_353;
   import package_25.name_52;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_39.Model;
   import package_41.ItemProperty;
   import package_47.BattleTeamType;
   import package_54.name_102;
   import package_7.name_32;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.registry.name_33;
   import platform.client.fp10.core.registry.name_45;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.name_202;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.battleselect.name_386;
   import projects.tanks.client.battleservice.model.name_370;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.client.panel.model.donationalert.name_388;
   import projects.tanks.clients.fp10.libraries.name_390;
   import scpacker.networking.Network;
   import scpacker.networking.class_6;
   import scpacker.networking.name_2;
   
   public class Lobby implements class_6
   {
      
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
      
      public static var var_72:name_45 = OSGi.getInstance().getService(name_45) as name_45;
      
      public static var modelRegistry:name_29 = OSGi.getInstance().getService(name_29) as name_29;
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
      
      public static var battleTimeLeftService:name_465;
      
      public static var var_77:Boolean = true;
       
      
      public var chat:name_372;
      
      public var battleSelect:BattleSelectModelActivator;
      
      public var garage:GarageModelActivator;
      
      private var networker:Network;
      
      private var space:name_202;
      
      private var var_79:String;
      
      private var var_73:Boolean = false;
      
      private const const_20:uint = 8454016;
      
      private const const_19:uint = 15335168;
      
      private var var_74:ServerBonusModel;
      
      private var modelRegister:name_32;
      
      private var var_75:ItemEffectModel;
      
      private var var_78:name_70;
      
      public var needSelected:String;
      
      private var var_76:Boolean = false;
      
      public function Lobby()
      {
         this.var_74 = new ServerBonusModel();
         super();
         this.chat = new name_372();
         this.battleSelect = new BattleSelectModelActivator();
         this.garage = new GarageModelActivator();
         this.garage.start(Main.osgi);
         this.modelRegister = Main.osgi.getService(name_32) as name_32;
         this.var_75 = (this.modelRegister.getModelsByInterface(name_364) as Vector.<IModel>)[0] as name_364 as ItemEffectModel;
         this.space = new Space(Long.getLong(83525459,4193025),null,null,false);
         name_33(OSGi.getInstance().getService(name_33)).addSpace(this.space);
         name_33(OSGi.getInstance().getService(name_33)).currentSpace = this.space;
         var _loc1_:Vector.<Long> = new Vector.<Long>();
         _loc1_.push(Long.getLong(1543015131,1817260381));
         _loc1_.push(Long.getLong(28163628,1959753058));
         var_72.createClass(Long.getLong(15025,684360),_loc1_);
         _loc1_ = new Vector.<Long>();
         _loc1_.push(Long.getLong(422480254,471726203));
         _loc1_.push(Long.getLong(988366120,-592971316));
         var_72.createClass(Long.getLong(471525,9521360),_loc1_);
         _loc1_ = new Vector.<Long>();
         _loc1_.push(Long.getLong(1332792132,1488384798));
         var_72.createClass(Long.getLong(1332212,88798),_loc1_);
         this.space.name_15(Long.getLong(0,277248872),var_72.getClass(Long.getLong(1332212,88798)),"MountedResistanceModel");
         _loc1_ = new Vector.<Long>();
         _loc1_.push(Long.getLong(1223707112,492148927));
         _loc1_.push(Long.getLong(1481647778,-291699533));
         var_72.createClass(Long.getLong(361949,41936),_loc1_);
         this.space.name_15(Long.getLong(92381,9324110),var_72.getClass(Long.getLong(361949,41936)),"LobbyLayout");
         _loc1_ = new Vector.<Long>();
         _loc1_.push(Long.getLong(1302806391,660914812));
         var_72.createClass(Long.getLong(813761,104629),_loc1_);
         this.space.name_15(Long.getLong(872742,405770),var_72.getClass(Long.getLong(813761,104629)),"DailyQuests");
         _loc1_ = new Vector.<Long>();
         var_72.createClass(Long.getLong(83293,1356719),_loc1_);
         this.space.name_15(Long.getLong(946724,1764762),var_72.getClass(Long.getLong(83293,1356719)),"SocialNetworks");
         _loc1_ = new Vector.<Long>();
         _loc1_.push(Long.getLong(1212548768,-1645485380));
         _loc1_.push(Long.getLong(194373973,-369589677));
         var_72.createClass(Long.getLong(763265,-2356138),_loc1_);
         this.space.name_15(Long.getLong(-87265,4551894),var_72.getClass(Long.getLong(763265,-2356138)),"SkinsItemModel");
      }
      
      public static function getItemProperty(param1:String) : ItemProperty
      {
         switch(param1)
         {
            case "damage":
               return ItemProperty.DAMAGE;
            case "damage_per_second":
               return ItemProperty.DAMAGE_PER_SECOND;
            case "critical_chance":
               return ItemProperty.CRITICAL_CHANCE;
            case "critical_damage":
               return ItemProperty.CRITICAL_DAMAGE;
            case "impact_force":
               return ItemProperty.IMPACT_FORCE;
            case "heating_time":
               return ItemProperty.HEALING_TIME;
            case "aiming_error":
               return ItemProperty.AIMING_ERROR;
            case "cone_angle":
               return ItemProperty.CONE_ANGLE;
            case "shot_area":
               return ItemProperty.SHOT_AREA;
            case "shot_frequency":
               return ItemProperty.SHOT_FREQUENCY;
            case "shot_range":
               return ItemProperty.SHOT_SPEED;
            case "turn_speed":
               return ItemProperty.TURN_SPEED;
            case "power":
               return ItemProperty.POWER;
            case "weight":
               return ItemProperty.WEIGHT;
            case "mech_resistance":
               return ItemProperty.MECH_RESISTANCE;
            case "shotgun_resistance":
               return ItemProperty.SHOTGUN_RESISTANCE;
            case "all_resistance":
               return ItemProperty.ALL_RESISTANCE;
            case "vulcan_resistance":
               return ItemProperty.VULCAN_RESISTANCE;
            case "plasma_resistance":
               return ItemProperty.PLASMA_RESISTANCE;
            case "rail_resistance":
               return ItemProperty.RAIL_RESISTANCE;
            case "mine_resistance":
               return ItemProperty.MINE_RESISTANCE;
            case "vampire_resistance":
               return ItemProperty.VAMPIRE_RESISTANCE;
            case "armor":
               return ItemProperty.ARMOR;
            case "turret_turn_speed":
               return ItemProperty.TURRET_TURN_SPEED;
            case "fire_resistance":
               return ItemProperty.FIRE_RESISTANCE;
            case "thunder_resistance":
               return ItemProperty.THUNDER_RESISTANCE;
            case "freeze_resistance":
               return ItemProperty.FREEZE_RESISTANCE;
            case "ricochet_resistance":
               return ItemProperty.RICOCHET_RESISTANCE;
            case "healing_radius":
               return ItemProperty.HEALING_RADIUS;
            case "heal_rate":
               return ItemProperty.HEAL_RATE;
            case "vampire_rate":
               return ItemProperty.VAMPIRE_RATE;
            case "speed":
               return ItemProperty.SPEED;
            case "shaft_damage":
               return ItemProperty.SHAFT_DAMAGE;
            case "shaft_shot_frequency":
               return ItemProperty.SHAFT_SHOT_FREQUENCY;
            case "shaft_resistance":
               return ItemProperty.SHAFT_RESISTANCE;
            default:
               return null;
         }
      }
      
      private function method_105(param1:int) : ChatModeratorLevel
      {
         switch(param1)
         {
            case 0:
               return ChatModeratorLevel.NONE;
            case 1:
               return ChatModeratorLevel.CANDIDATE;
            case 2:
               return ChatModeratorLevel.MODERATOR;
            case 3:
               return ChatModeratorLevel.ADMINISTRATOR;
            case 4:
               return ChatModeratorLevel.COMMUNITY_MANAGER;
            default:
               return ChatModeratorLevel.NONE;
         }
      }
      
      private function method_96(param1:String) : LayoutState
      {
         switch(param1)
         {
            case "garage":
               return LayoutState.GARAGE;
            case "battleselect":
               return LayoutState.BATTLE_SELECT;
            case "battle":
               return LayoutState.BATTLE;
            case "clan":
               return LayoutState.CLAN;
            default:
               return LayoutState.RELOAD_SPACE;
         }
      }
      
      public function onData(param1:Command) : void
      {
         var parser:Object = null;
         var chatCC:name_349 = null;
         var linksWhiteList:Vector.<String> = null;
         var channels:Vector.<String> = null;
         var link:* = undefined;
         var channel:* = undefined;
         var userObj:Object = null;
         var clanObj:Object = null;
         var userInfo:name_350 = null;
         var clanData:name_354 = null;
         var clanInfo:name_353 = null;
         var invObject:Object = null;
         var message:name_337 = null;
         var userId:String = null;
         var info:name_333 = null;
         var achievementModel:AchievementModel = null;
         var temp:BattleController = null;
         var infos:Vector.<name_341> = null;
         var obj:Object = null;
         var effect:* = undefined;
         var id:String = null;
         var time:Number = NaN;
         var rewards:Vector.<name_331> = null;
         var reward_item:Object = null;
         var model:LootBoxModel = null;
         var reward:name_331 = null;
         var itemObject:name_70 = null;
         var newsModel:name_347 = null;
         var news:Vector.<name_342> = null;
         var news_item:* = undefined;
         var _loc22_:Vector.<name_344> = null;
         var sn:Object = null;
         var _loc18_:name_338 = null;
         var _loc17_:Vector.<name_326> = null;
         var _quest:name_326 = null;
         var _prizes:Vector.<name_329> = null;
         var p:String = null;
         var _tiers:Vector.<name_327> = null;
         var freeItem:Object = null;
         var battlePassItem:Object = null;
         var _loc1_:name_330 = null;
         var _loc2_:name_330 = null;
         var _tier:name_327 = null;
         var toShow:Vector.<name_343> = null;
         var _prize:Object = null;
         var achievements:Vector.<Achievement> = null;
         var achievementId:Object = null;
         var achievement:Achievement = null;
         var resistances:name_70 = null;
         var objects:Vector.<name_70> = null;
         var _loc9_:int = 0;
         var oldItem:name_324 = null;
         var idOldItem:String = null;
         var item:name_324 = null;
         var item_info:name_325 = null;
         var parser1:Object = null;
         var data:Command = param1;
         try
         {
            switch(data.type)
            {
               case Type.LOBBY_CHAT:
                  if(data.name_319[0] == "system")
                  {
                     if(!this.var_73)
                     {
                        this.var_73 = true;
                     }
                     this.chat.name_332.name_379.addMessage("",0,0,false,data.name_319[1],data.name_319[3],0,0,"",false,data.name_319[2] != "yellow" ? true : false,data.name_319[2] == "yellow" ? true : false);
                  }
                  else if(data.name_319[0] != "init_chat")
                  {
                     if(data.name_319[0] == "clear_all")
                     {
                        if(!this.var_73)
                        {
                           this.var_73 = true;
                        }
                        this.chat.name_332.name_391(null,"",data.name_319[1]);
                     }
                     else if(data.name_319[0] == "init_messages")
                     {
                        parser = JSON.parse(data.name_319[1]);
                        chatCC = new name_349();
                        linksWhiteList = new Vector.<String>();
                        channels = new Vector.<String>();
                        chatCC.chatModeratorLevel = this.method_105(parser.chatModeratorLevel);
                        chatCC.admin = parser.admin;
                        chatCC.antifloodEnabled = parser.antifloodEnabled;
                        chatCC.bufferSize = parser.bufferSize;
                        chatCC.chatEnabled = parser.chatEnabled;
                        chatCC.enterCost = parser.enterCost;
                        chatCC.minChar = parser.minChar;
                        chatCC.minWord = parser.minWord;
                        chatCC.selfName = parser.selfName;
                        chatCC.symbolCost = parser.symbolCost;
                        chatCC.typingSpeedAntifloodEnabled = parser.typingSpeedAntifloodEnabled;
                        for each(link in parser.linksWhiteList)
                        {
                           linksWhiteList.push(link);
                        }
                        chatCC.linksWhiteList = linksWhiteList;
                        for each(channel in parser.channels)
                        {
                           channels.push(channel);
                        }
                        chatCC.channels = channels;
                        Main.osgi.registerService(name_400,this.chat.name_332);
                        this.chat.name_332.method_18(chatCC);
                        this.chat.name_332.initObject(Game.getInstance.var_6,["https://rtanks.online/"],(Main.osgi.getService(name_361) as name_351).name);
                        this.chat.name_332.objectLoaded(Game.getInstance.var_6);
                        this.method_108(data.name_319[1]);
                        this.method_109(data.name_319[2]);
                     }
                     else if(data.name_319[0] == "clean_by")
                     {
                        this.chat.name_332.name_391(null,data.name_319[1],null);
                     }
                     else if(data.name_319[0] == "clean_by_text")
                     {
                        this.chat.name_332.name_467(data.name_319[1]);
                     }
                     else
                     {
                        if(!this.var_73)
                        {
                           this.var_73 = true;
                        }
                        this.parseAndAddMessageToChat(data.name_319[0]);
                     }
                  }
                  break;
               case Type.LOBBY:
                  if(data.name_319[0] == "init_panel")
                  {
                     this.parseAndInitPanelInfo(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "set_stars")
                  {
                     name_360(OSGi.getInstance().getService(name_360)).setStars(int(data.name_319[1]));
                  }
                  else if(data.name_319[0] == "add_crystall")
                  {
                     PanelModel(Main.osgi.getService(name_115)).updateCrystal(null,int(data.name_319[1]));
                  }
                  else if(data.name_319[0] == "add_score")
                  {
                     PanelModel(Main.osgi.getService(name_115)).updateScore(null,int(data.name_319[1]));
                  }
                  else if(data.name_319[0] == "update_rang_progress")
                  {
                     PanelModel(Main.osgi.getService(name_115)).updateRankProgress(null,int(data.name_319[1]));
                  }
                  else if(data.name_319[0] == "update_rang")
                  {
                     PanelModel(Main.osgi.getService(name_115)).updateRang(null,int(data.name_319[1]),int(data.name_319[2]));
                  }
                  else if(data.name_319[0] == "change_layout_state")
                  {
                     LobbyLayoutNotifyModel(modelRegistry.getModel(Long.getLong(1481647778,-291699533))).beginLayoutSwitch(this.method_96(data.name_319[1]));
                  }
                  else if(data.name_319[0] == "end_layout_switch")
                  {
                     LobbyLayoutNotifyModel(modelRegistry.getModel(Long.getLong(1481647778,-291699533))).endLayoutSwitch(this.method_96(data.name_319[1]),this.method_96(data.name_319[2]));
                  }
                  else if(data.name_319[0] == "init_battle_select")
                  {
                     if(data.name_319[2] != null && data.name_319[2].length > 1)
                     {
                        this.parseAndInitBattleFormats(data.name_319[2]);
                     }
                     this.parseAndInitBattlesList(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "create_battle")
                  {
                     this.method_102(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "equipment_not_match")
                  {
                     this.battleSelect.battleSelectModel.name_412();
                  }
                  else if(data.name_319[0] == "start_battle")
                  {
                     this.battleSelect.battleSelectModel.name_489();
                  }
                  else if(data.name_319[0] == "start_time_battle")
                  {
                     battleTimeLeftService.startBattle(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "stop_time_battle")
                  {
                     battleTimeLeftService.name_456(data.name_319[1]);
                  }
                  else if(data.name_319[0] != "check_battle_name")
                  {
                     if(data.name_319[0] == "show_battle_info")
                     {
                        this.method_99(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "navigate_url")
                     {
                        navigateToURL(new URLRequest(data.name_319[1]),"_self");
                        PanelModel(Main.osgi.getService(name_115)).unlock();
                     }
                     else if(data.name_319[0] == "update_user_info")
                     {
                        trace("update_user_info " + data.name_319[1]);
                        userObj = JSON.parse(data.name_319[1]);
                        clanObj = userObj.clan_data;
                        if(clanObj != null)
                        {
                           clanData = new name_354();
                           clanData.clanId = new Long(0,clanObj.clanId);
                           clanData.clanMember = true;
                           clanData.clanName = clanObj.clanName;
                           clanData.clanTag = clanObj.clanTag;
                           clanData.minRankForJoinClan = clanObj.minRankForJoinClan;
                           clanData.userId = userObj.nickname;
                           clanInfo = new name_353(clanData);
                           name_52(Main.osgi.getService(name_52)).updateUserClanInfo(clanInfo);
                        }
                        userInfo = new name_350(userObj.nickname,userObj.rank,userObj.premium,userObj.online);
                        UserInfoService(Main.osgi.getService(name_408)).updateUserInfo(userInfo.nickname,userInfo);
                     }
                     else if(data.name_319[0] == "add_to_accepted")
                     {
                        FriendsService.name_476(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "add_to_incoming")
                     {
                        FriendsService.name_446(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "add_to_outcoming")
                     {
                        FriendsService.name_418(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "set_default_state")
                     {
                        FriendsService.name_441(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "add_to_new_accepted")
                     {
                        FriendsService.name_409(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "add_to_new_incoming")
                     {
                        FriendsService.name_485(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "remove_from_new_accepted")
                     {
                        FriendsService.name_431(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "remove_from_new_incoming")
                     {
                        FriendsService.name_454(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "init_friends_service")
                     {
                        FriendsService.name_427(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "init_friends_list")
                     {
                        FriendsService.name_398 = data.name_319[1];
                        PanelModel(Main.osgi.getService(name_115)).openFriends();
                     }
                     else if(data.name_319[0] == "update_friends_list")
                     {
                        FriendsService.name_398 = data.name_319[1];
                        PanelModel(Main.osgi.getService(name_115)).updateFriendsList();
                     }
                     else if(data.name_319[0] == "show_invite")
                     {
                        invObject = JSON.parse(data.name_319[1]);
                        message = this.method_100(invObject);
                        userId = String(invObject.userId);
                        PanelModel(Main.osgi.getService(name_115)).onBattleInvite(userId,message);
                     }
                     else if(data.name_319[0] == "invite_response")
                     {
                        PanelModel(Main.osgi.getService(name_115)).onResponseInviteNotification(data.name_319[1],data.name_319[2]);
                     }
                     else if(data.name_319[0] == "accept_battle_invite")
                     {
                        PanelModel(Main.osgi.getService(name_115)).onAcceptBattleInvite(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "reject_battle_invite")
                     {
                        PanelModel(Main.osgi.getService(name_115)).onRejectBattleInvite(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "update_count_users_in_dm_battle")
                     {
                        try
                        {
                           parser = JSON.parse(data.name_319[1]);
                           this.battleSelect.battleSelectModel.name_416(null,parser.battleId,parser.countPeople,parser.friendsDm);
                        }
                        catch(e:Error)
                        {
                           break;
                        }
                     }
                     else if(data.name_319[0] == "update_count_users_in_team_battle")
                     {
                        parser = JSON.parse(data.name_319[1]);
                        this.battleSelect.battleSelectModel.name_445(null,parser.battleId,parser.redPeople,parser.bluePeople,parser.friendsRed,parser.friendsBlue);
                     }
                     else if(data.name_319[0] == "update_suspicious_battle")
                     {
                        this.battleSelect.battleSelectModel.name_463(data.name_319[1],Boolean(data.name_319[2] == "true"));
                     }
                     else if(data.name_319[0] == "remove_battle")
                     {
                        this.battleSelect.battleSelectModel.name_492(null,data.name_319[1]);
                        battleTimeLeftService.name_438(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "add_player_to_battle")
                     {
                        parser = JSON.parse(data.name_319[1]);
                        if(parser.battleId != this.battleSelect.battleSelectModel.selectedBattleId)
                        {
                           return;
                        }
                        info = new name_333();
                        info.id = parser.id;
                        info.kills = parser.kills;
                        info.name = parser.name;
                        info.rank = parser.rank;
                        info.type = BattleTeamType.getType(parser.type);
                        this.battleSelect.battleSelectModel.name_425(null,info);
                     }
                     else if(data.name_319[0] == "remove_player_from_battle")
                     {
                        parser = JSON.parse(data.name_319[1]);
                        if(parser.battleId != this.battleSelect.battleSelectModel.selectedBattleId)
                        {
                           return;
                        }
                        this.battleSelect.battleSelectModel.name_415(null,parser.id);
                     }
                     else if(data.name_319[0] == "server_message")
                     {
                        name_42(OSGi.getInstance().getService(name_42)).showAlert(data.name_319[1],Vector.<String>([localeService.getText(name_358.OK)]));
                     }
                     else if(data.name_319[0] == "show_bonuses")
                     {
                        this.var_74.name_437(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "show_no_supplies")
                     {
                        this.var_74.name_459();
                     }
                     else if(data.name_319[0] == "show_double_crystalls")
                     {
                        this.var_74.name_430();
                     }
                     else if(data.name_319[0] == "show_crystalls")
                     {
                        this.var_74.name_469(int(data.name_319[1]));
                     }
                     else if(data.name_319[0] == "show_nube_up_score")
                     {
                        name_396(modelRegistry.getModel(Long.getLong(1118509469,-35521391))).showInfoWindow(604800,100,50);
                     }
                     else if(data.name_319[0] == "show_nube_new_rank")
                     {
                        achievementModel = Main.osgi.getService(IAchievementModel) as AchievementModel;
                        achievementModel.name_477();
                     }
                     else if(data.name_319[0] == "init_battlecontroller")
                     {
                        OSGi.clientLog.log("Lobby","init_battlecontroller");
                        try
                        {
                           PanelModel(Main.osgi.getService(name_115)).startBattle(null);
                           if(BattleController(Main.osgi.getService(IBattleController)) == null)
                           {
                              temp = new BattleController();
                              Main.osgi.registerService(IBattleController,temp);
                           }
                           Network(Main.osgi.getService(name_2)).addEventListener(Main.osgi.getService(IBattleController) as BattleController);
                        }
                        catch(e:Error)
                        {
                           OSGi.clientLog.log("Lobby",e.getStackTrace());
                        }
                     }
                     else if(data.name_319[0] == "server_halt")
                     {
                        PanelModel(Main.osgi.getService(name_115)).serverHalt(null,50,0,0,null);
                     }
                     else if(data.name_319[0] == "show_profile")
                     {
                        parser = JSON.parse(data.name_319[1]);
                        PanelModel(Main.osgi.getService(name_115)).openProfile(null,parser.emailNotice,parser.isComfirmEmail,false,"","");
                     }
                     else if(data.name_319[0] == "open_shop")
                     {
                        PanelModel(Main.osgi.getService(name_115)).onShopWindow(JSON.parse(data.name_319[1]));
                        name_13(Main.osgi.getService(name_13)).hideForcibly();
                     }
                     else if(data.name_319[0] == "open_url")
                     {
                        navigateToURL(new URLRequest(data.name_319[1]),"_self");
                     }
                     else if(data.name_319[0] == "donate_successfully")
                     {
                        infos = new Vector.<name_341>();
                        parser = JSON.parse(data.name_319[1]);
                        for each(obj in parser.data)
                        {
                           infos.push(new name_341(obj.count,obj.name));
                        }
                        name_388(modelRegistry.getModel(Long.getLong(790638048,-212453148))).showDonationAlert(new name_404(infos,Long.getLong(0,0)));
                     }
                     else if(data.name_319[0] == "activate_promocode_successfully")
                     {
                        name_369(Main.osgi.getService(name_366)).activatedSuccessfully();
                     }
                     else if(data.name_319[0] == "activate_promocode_failed")
                     {
                        name_369(Main.osgi.getService(name_366)).activatedFailed();
                     }
                     else if(data.name_319[0] == "open_recovery_window")
                     {
                        PanelModel(Main.osgi.getService(name_115)).openRecoveryWindow(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "effect_stopped")
                     {
                        this.var_75.method_36(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "init_effect_model")
                     {
                        parser = JSON.parse(data.name_319[1]);
                        for each(effect in parser.effects)
                        {
                           id = String(effect.id);
                           time = Number(effect.time);
                           this.var_75.name_399(id,time);
                        }
                     }
                     else if(data.name_319[0] == "set_reamining_time")
                     {
                        this.var_75.name_399(data.name_319[1],data.name_319[2]);
                     }
                     else if(data.name_319[0] == "start_premium_account")
                     {
                        PanelModel(Main.osgi.getService(name_115)).openPremiumAlertWindow();
                     }
                     else if(data.name_319[0] == "end_premium_account")
                     {
                        PanelModel(Main.osgi.getService(name_115)).onCompletePremium(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "update_premium_status")
                     {
                        PanelModel(Main.osgi.getService(name_115)).updatePremiumStatus(data.name_319[1]);
                     }
                     else if(data.name_319[0] == "open_lootbox")
                     {
                        rewards = new Vector.<name_331>();
                        parser = JSON.parse(data.name_319[1]);
                        for each(reward_item in parser)
                        {
                           reward = new name_331();
                           reward.category = LootBoxCategory.getCategory(reward_item.category);
                           reward.count = reward_item.count;
                           reward.image = ImageResource(resourceRegistry.getResource(Long.getLong(0,reward_item.image)));
                           reward.name = reward_item.name;
                           rewards.push(reward);
                        }
                        model = LootBoxModel(modelRegistry.getModel(Long.getLong(1543015131,1817260381)));
                        if(model != null)
                        {
                           itemObject = this.space.getObject(Long.getLong(96200,95403));
                           Model.object = itemObject;
                           model.name_422(rewards);
                           Model.method_38();
                        }
                     }
                     else if(data.name_319[0] == "show_news")
                     {
                        parser = JSON.parse(data.name_319[1]);
                        newsModel = Main.osgi.getService(name_406) as name_347;
                        news = new Vector.<name_342>();
                        for each(news_item in parser)
                        {
                           news.push(new name_342(news_item.date,news_item.text,news_item.icon_id));
                        }
                        newsModel.name_413(news);
                     }
                     else if(data.name_319[0] == "init_social_networks")
                     {
                        parser = JSON.parse(data.name_319[1]);
                        Model.object = this.space.getObject(Long.getLong(946724,1764762));
                        _loc22_ = new Vector.<name_344>();
                        for each(sn in parser.socialNetworkParams)
                        {
                           _loc22_.push(new name_344(sn.authorizationUrl,sn.enabled,sn.linkExists,sn.snId));
                        }
                        modelRegistry.getModel(Long.getLong(439695750,646961384)).method_18(new name_393(parser.passwordCreated,_loc22_));
                        name_170(modelRegistry.getModel(Long.getLong(439695750,646961384))).objectLoaded();
                        Model.method_38();
                     }
                     else if(data.name_319[0] == "link_created")
                     {
                        Model.object = this.space.getObject(Long.getLong(946724,1764762));
                        name_362(modelRegistry.getModel(Long.getLong(439695750,646961384))).linkCreated(data.name_319[1]);
                        Model.method_38();
                     }
                     else if(data.name_319[0] == "unlink_success")
                     {
                        Model.object = this.space.getObject(Long.getLong(946724,1764762));
                        name_362(modelRegistry.getModel(Long.getLong(439695750,646961384))).unlinkSuccess(data.name_319[1]);
                        Model.method_38();
                     }
                     else if(data.name_319[0] == "start_event")
                     {
                        name_44(OSGi.getInstance().getService(name_44)).startEvent(int(data.name_319[1]));
                     }
                     else if(data.name_319[0] == "set_battle_pass")
                     {
                        name_357(OSGi.getInstance().getService(name_357)).setState(Boolean(data.name_319[1] == "true"));
                     }
                     else if(data.name_319[0] == "show_empty_quests")
                     {
                        parser = JSON.parse(data.name_319[1]);
                        _loc18_ = new name_338(parser.weeklyLevel,parser.weeklyProgress,parser.completeForToday,WeeklyQuestBitmaps.name_375(parser.weeklyLevel),WeeklyQuestBitmaps.name_380(parser.weeklyLevel));
                        Model.object = this.space.getObject(Long.getLong(872742,405770));
                        modelRegistry.getModel(Long.getLong(1734194361,-1013591761)).method_18(new name_368(parser.completeForToday,parser.timeToNextQuest));
                        name_170(modelRegistry.getModel(Long.getLong(1734194361,-1013591761))).objectLoaded();
                        name_335(modelRegistry.getModel(Long.getLong(1734194361,-1013591761))).openDailyQuest(new Vector.<name_326>(),_loc18_);
                        modelRegistry.getModel(Long.getLong(1504901702,408311149)).method_18(new name_367(new Vector.<name_327>()));
                        name_170(modelRegistry.getModel(Long.getLong(1504901702,408311149))).objectLoaded();
                        Model.method_38();
                     }
                     else if(data.name_319[0] == "show_quests")
                     {
                        Model.object = this.space.getObject(Long.getLong(872742,405770));
                        _loc17_ = new Vector.<name_326>();
                        parser = JSON.parse(data.name_319[1]);
                        for each(obj in parser.challenges)
                        {
                           _quest = new name_326();
                           _quest.canSkipForFree = parser.changeCost <= 0;
                           _quest.description = obj.description;
                           _quest.finishCriteria = obj.target_progress;
                           _quest.image = ImageResource(resourceRegistry.getResource(Long.getLong(0,obj.image)));
                           _quest.progress = obj.progress;
                           _quest.questId = obj.id;
                           _quest.skipCost = parser.changeCost;
                           _prizes = new Vector.<name_329>();
                           for each(p in obj.prizes)
                           {
                              _prizes.push(new name_329(0,p));
                           }
                           _quest.prizes = _prizes;
                           _quest.level = obj.level == "easy" ? QuestLevel.EASY : (obj.level == "normal" ? QuestLevel.NORMAL : QuestLevel.HARD);
                           _loc17_.push(_quest);
                        }
                        _loc18_ = new name_338(parser.weeklyLevel,parser.weeklyProgress,parser.completeForToday,WeeklyQuestBitmaps.name_375(parser.weeklyLevel),WeeklyQuestBitmaps.name_380(parser.weeklyLevel));
                        Model.object = this.space.getObject(Long.getLong(872742,405770));
                        modelRegistry.getModel(Long.getLong(1734194361,-1013591761)).method_18(new name_368(parser.completeForToday,parser.timeToNextQuest));
                        name_170(modelRegistry.getModel(Long.getLong(1734194361,-1013591761))).objectLoaded();
                        name_335(modelRegistry.getModel(Long.getLong(1734194361,-1013591761))).openDailyQuest(_loc17_,_loc18_);
                        modelRegistry.getModel(Long.getLong(1504901702,408311149)).method_18(new name_367(new Vector.<name_327>()));
                        name_170(modelRegistry.getModel(Long.getLong(1504901702,408311149))).objectLoaded();
                        Model.method_38();
                     }
                     else if(data.name_319[0] == "skip_daily_quest")
                     {
                        Model.object = this.space.getObject(Long.getLong(872742,405770));
                        parser = JSON.parse(data.name_319[2]);
                        _quest = new name_326();
                        _quest.canSkipForFree = parser.changeCost <= 0;
                        _quest.description = parser.description;
                        _quest.finishCriteria = parser.target_progress;
                        _quest.image = ImageResource(resourceRegistry.getResource(Long.getLong(0,parser.image)));
                        _quest.progress = parser.progress;
                        _quest.questId = parser.id;
                        _quest.skipCost = parser.changeCost;
                        _prizes = new Vector.<name_329>();
                        for each(p in parser.prizes)
                        {
                           _prizes.push(new name_329(0,p));
                        }
                        _quest.prizes = _prizes;
                        name_335(modelRegistry.getModel(Long.getLong(1734194361,-1013591761))).skipQuest(data.name_319[1],_quest);
                        Model.method_38();
                     }
                     else if(data.name_319[0] == "take_daily_quest_prize")
                     {
                        Model.object = this.space.getObject(Long.getLong(872742,405770));
                        name_335(modelRegistry.getModel(Long.getLong(1734194361,-1013591761))).prizeGiven(data.name_319[1]);
                        Model.method_38();
                     }
                     else if(data.name_319[0] == "send_tier_info")
                     {
                        Model.object = this.space.getObject(Long.getLong(872742,405770));
                        parser = JSON.parse(data.name_319[1]);
                        _tiers = new Vector.<name_327>();
                        for each(obj in parser.tiers)
                        {
                           freeItem = obj.freeItem;
                           battlePassItem = obj.battlePassItem;
                           _loc1_ = null;
                           _loc2_ = null;
                           if(freeItem != null)
                           {
                              _loc1_ = new name_330(freeItem.amount,freeItem.name,ImageResource(resourceRegistry.getResource(Long.getLong(0,freeItem.preview))),freeItem.received);
                           }
                           if(battlePassItem != null)
                           {
                              _loc2_ = new name_330(battlePassItem.amount,battlePassItem.name,ImageResource(resourceRegistry.getResource(Long.getLong(0,battlePassItem.preview))),battlePassItem.received);
                           }
                           _tier = new name_327(_loc2_,_loc1_,battlePassItem != null,obj.stars);
                           _tiers.push(_tier);
                        }
                        name_376(modelRegistry.getModel(Long.getLong(1504901702,408311149))).sendTiersInfo(_tiers);
                        Model.method_38();
                     }
                     else if(data.name_319[0] == "reward_notify")
                     {
                        name_385(modelRegistry.getModel(Long.getLong(142490486,-1012948578))).rewardNotify(int(data.name_319[1]));
                     }
                     else if(data.name_319[0] == "show_quests_bonus")
                     {
                        parser = JSON.parse(data.name_319[1]);
                        toShow = new Vector.<name_343>();
                        for each(_prize in parser.prizes)
                        {
                           toShow.push(new name_343(_prize.count,ImageResource(resourceRegistry.getResource(Long.getLong(0,_prize.nameId)))));
                        }
                        name_387(modelRegistry.getModel(Long.getLong(432617209,-1426923357))).showWeeklyQuestRewardGiven(toShow);
                     }
                     else if(data.name_319[0] == "show_quest_notification")
                     {
                        (Main.osgi.getService(name_339) as name_339).showNotification();
                     }
                     else if(data.name_319[0] == "hide_quest_notification")
                     {
                        (Main.osgi.getService(name_339) as name_339).hideNotification();
                     }
                     else if(data.name_319[0] == "show_achievements")
                     {
                        achievementModel = Main.osgi.getService(IAchievementModel) as AchievementModel;
                        parser = JSON.parse(data.name_319[1]);
                        achievements = new Vector.<Achievement>();
                        for each(achievementId in parser.ids)
                        {
                           achievements.push(Achievement.name_378(achievementId as int));
                        }
                        achievementModel.objectLoaded(achievements);
                     }
                     else if(data.name_319[0] == "complete_achievement")
                     {
                        achievementModel = Main.osgi.getService(IAchievementModel) as AchievementModel;
                        achievement = Achievement.name_378(parseInt(data.name_319[1]));
                        achievementModel.name_449(achievement);
                     }
                  }
                  break;
               case Type.GARAGE:
                  if(data.name_319[0] == "init_garage_items")
                  {
                     this.parseGarageItems(data.name_319[1],data.src);
                  }
                  else if(data.name_319[0] == "init_market")
                  {
                     this.method_107(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "init_item_to_depot")
                  {
                     this.method_103(data.name_319[1]);
                  }
                  else if(data.name_319[0] == "garage_object_loaded")
                  {
                     this.garage.name_322.objectLoaded(Game.getInstance.var_6);
                     resistances = this.space.getObject(Long.getLong(0,277248872));
                     objects = new Vector.<name_70>();
                     parser = JSON.parse(data.name_319[1]);
                     for each(_loc9_ in parser)
                     {
                        objects.push(this.space.getObject(Long.getLong(0,_loc9_)));
                     }
                     Model.object = resistances;
                     modelRegistry.getModel(resistances.gameClass.models[0]).method_18(new name_392(objects));
                     name_141(modelRegistry.getModel(resistances.gameClass.models[0])).objectLoadedPost();
                     Model.method_38();
                  }
                  else if(data.name_319[0] == "mount_item")
                  {
                     oldItem = GarageModel.name_377(data.name_319[1]);
                     if(oldItem.name_373 == name_321.ARMOR)
                     {
                        idOldItem = this.garage.name_322.name_458;
                     }
                     else if(oldItem.name_373 == name_321.WEAPON)
                     {
                        idOldItem = this.garage.name_322.name_470;
                     }
                     else if(oldItem.name_373 == name_321.COLOR)
                     {
                        idOldItem = this.garage.name_322.name_484;
                     }
                     this.garage.name_322.mountItem(null,idOldItem,data.name_319[1],Long.getLong(0,data.name_319[2]));
                  }
                  else if(data.name_319[0] == "update_item")
                  {
                     GarageModel.name_420(data.name_319[1],this.method_97(data.name_319[1]));
                     GarageModel.name_472(data.name_319[1],this.method_97(data.name_319[1]));
                     this.garage.name_322.name_426(null,data.name_319[2] == "" ? this.garage.name_322.name_475 : String(data.name_319[2]),GarageModel.name_383(this.method_97(data.name_319[1])));
                  }
                  else if(data.name_319[0] == "init_mounted_item")
                  {
                     item = GarageModel.name_377(data.name_319[1]);
                     this.garage.name_322.mountItem(null,null,data.name_319[1],Long.getLong(0,data.name_319[2]));
                  }
                  else if(data.name_319[0] == "buy_item")
                  {
                     item_info = GarageModel.name_383(data.name_319[1]);
                     if(item_info == null)
                     {
                        item_info = new name_325();
                     }
                     parser1 = JSON.parse(data.name_319[2]);
                     item_info.count = parser1.count;
                     item_info.itemId = data.name_319[1];
                     item_info.addable = parser1.addable;
                     this.garage.name_322.name_432(null,item_info);
                  }
                  else if(data.name_319[0] == "remove_item_from_market")
                  {
                     this.garage.name_322.name_435(data.name_319[1]);
                  }
            }
         }
         catch(err:Error)
         {
            OSGi.clientLog.log("Lobby",err.getStackTrace());
         }
      }
      
      private function method_109(param1:String) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:Vector.<name_348> = new Vector.<name_348>();
         for each(_loc4_ in _loc2_)
         {
            _loc3_.push(new name_348(_loc4_.date,_loc4_.text,0,_loc4_.header,Long.getLong(0,int(_loc4_.id)),String(_loc4_.icon_id)));
         }
         name_363(OSGi.getInstance().getService(name_363)).setInitialNewsItems(_loc3_);
      }
      
      private function method_108(param1:String) : void
      {
         var _loc5_:Object = null;
         var _loc6_:name_334 = null;
         var _loc7_:name_356 = null;
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:Array = new Array();
         var _loc4_:name_334 = null;
         for each(_loc5_ in _loc2_.messages)
         {
            _loc6_ = new name_334();
            _loc6_.rankIndex = _loc5_.rang;
            _loc6_.chatPermissions = _loc5_.chatPermissions;
            _loc6_.uid = _loc5_.name;
            _loc6_.premium = false;
            if(Boolean(_loc5_.addressed))
            {
               _loc4_ = new name_334();
               _loc4_.uid = _loc5_.nameTo;
               _loc4_.chatPermissions = _loc5_.chatPermissionsTo;
               _loc4_.rankIndex = _loc5_.rangTo;
               _loc4_.premium = false;
            }
            _loc7_ = new name_356();
            _loc7_.name_480 = _loc6_;
            _loc7_.system = _loc5_.system;
            _loc7_.name_423 = _loc4_;
            _loc7_.text = _loc5_.message;
            _loc7_.warning = _loc5_.yellow;
            _loc7_.channel = _loc5_.channel;
            _loc3_.push(_loc7_);
            _loc4_ = null;
         }
         this.chat.name_332.name_486(null,_loc3_);
      }
      
      private function method_99(param1:String) : void
      {
         var _loc4_:Object = null;
         var _loc5_:name_333 = null;
         var _loc2_:Object = JSON.parse(param1);
         if(Boolean(_loc2_.null_battle))
         {
            name_42(OSGi.getInstance().getService(name_42)).showAlert(localeService.getText(name_390.name_429),Vector.<String>([localeService.getText(name_358.OK)]));
            return;
         }
         var _loc3_:Array = new Array();
         for each(_loc4_ in _loc2_.users_in_battle)
         {
            _loc5_ = new name_333();
            _loc5_.id = String(_loc4_.nickname);
            _loc5_.kills = int(_loc4_.kills);
            _loc5_.name = String(_loc4_.nickname);
            _loc5_.rank = int(_loc4_.rank);
            _loc5_.type = BattleTeamType.getType(_loc4_.team_type);
            _loc5_.suspicious = Boolean(_loc4_.suspicious == "true");
            _loc3_.push(_loc5_);
         }
         this.battleSelect.battleSelectModel.showBattleInfo(null,_loc2_.name,_loc2_.maxPeople,name_370.getType(_loc2_.type),_loc2_.battleId,Long.getLong(0,_loc2_.previewId),_loc2_.minRank,_loc2_.maxRank,_loc2_.timeLimit,_loc2_.timeCurrent,_loc2_.killsLimit,_loc2_.scoreRed,_loc2_.scoreBlue,_loc2_.autobalance,_loc2_.frielndyFie,_loc3_,_loc2_.paidBattle,_loc2_.withoutBonuses,_loc2_.withoutInventory,_loc2_.goldBoxesEnabled,_loc2_.reArmorEnabled,_loc2_.userAlreadyPaid,_loc2_.fullCash,_loc2_.clanName != null ? String(_loc2_.clanName) : "",_loc2_.spectator);
         this.battleSelect.battleSelectModel.selectedBattleId = _loc2_.battleId;
      }
      
      private function method_110(param1:name_337) : String
      {
         var _loc2_:String = "Приглашает тебя в битву" + "\n";
         if(param1.availableRank)
         {
            if(param1.availableSlot)
            {
               _loc2_ += "\n" + "Есть свободные места";
            }
            else
            {
               _loc2_ += "\n" + this.method_98("Нет свободных мест");
            }
         }
         else
         {
            _loc2_ += "\n" + this.method_98("Не подходит по званию");
         }
         return _loc2_;
      }
      
      private function method_98(param1:String) : String
      {
         return "<font color=\'#" + "b1b1b1" + "\'>" + param1 + "</font>";
      }
      
      private function method_100(param1:Object) : name_337
      {
         return new name_337(param1.availableRank,param1.availableSlot,param1.battleId,"",param1.mapName,name_370.getType(param1.mode),param1.noSuppliesBattle,param1.privateBattle,param1.remote,param1.serverNumber,param1.url);
      }
      
      private function method_102(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:name_336 = new name_336();
         _loc3_.battleId = _loc2_.battleId;
         _loc3_.mapId = _loc2_.mapId;
         _loc3_.name = _loc2_.name;
         _loc3_.team = _loc2_.team;
         _loc3_.type = _loc2_.type;
         _loc3_.name_384 = _loc2_.redPeople;
         _loc3_.name_389 = _loc2_.bluePeople;
         _loc3_.countPeople = _loc2_.countPeople;
         _loc3_.maxPeople = _loc2_.maxPeople;
         _loc3_.minRank = _loc2_.minRank;
         _loc3_.maxRank = _loc2_.maxRank;
         _loc3_.timeLimit = _loc2_.timeLimit;
         _loc3_.timeLeft = _loc2_.timeLeft;
         _loc3_.scoreLimit = _loc2_.scoreLimit;
         _loc3_.proBattle = _loc2_.proBattle;
         _loc3_.privateBattle = _loc2_.privateBattle;
         _loc3_.formatBattle = _loc2_.formatBattle;
         _loc3_.friendsDm = _loc2_.friendsDm;
         _loc3_.friendsRed = _loc2_.friendsRed;
         _loc3_.friendsBlue = _loc2_.friendsBlue;
         this.battleSelect.battleSelectModel.name_401(null,_loc3_);
         battleTimeLeftService.name_401(_loc3_.battleId,_loc3_.timeLimit * 60,_loc3_.timeLeft);
      }
      
      private function method_106(param1:String) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:name_324 = null;
         var _loc7_:name_325 = null;
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         var _loc10_:Vector.<name_323> = null;
         var _loc11_:name_328 = null;
         var _loc12_:String = null;
         var _loc13_:name_323 = null;
         var _loc14_:name_70 = null;
         var _loc15_:Object = JSON.parse(param1);
         var _loc16_:Array = new Array();
         for each(_loc2_ in _loc15_.items)
         {
            _loc3_ = new Array();
            for each(_loc4_ in _loc2_.modification)
            {
               _loc10_ = new Vector.<name_323>();
               _loc8_ = new Array();
               for each(_loc9_ in _loc4_.properts)
               {
                  _loc13_ = new name_323();
                  _loc13_.property = getItemProperty(_loc9_.property);
                  _loc13_.value = _loc9_.value;
                  _loc8_.push(_loc13_);
                  _loc10_.push(_loc13_);
               }
               _loc11_ = new name_328();
               _loc11_.crystalPrice = _loc4_.price;
               _loc11_.rankId = _loc4_.rank;
               _loc11_.previewId = Long.getLong(0,_loc4_.previewId);
               _loc12_ = String(_loc4_.previewId);
               _loc11_.itemProperties = _loc8_;
               _loc3_.push(_loc11_);
            }
            if(_loc2_.json_kit_info != null)
            {
               this.method_101(_loc2_.id + "_m" + _loc2_.modificationID,_loc2_.json_kit_info,_loc2_.discount);
            }
            _loc5_ = int(_loc2_.modificationID);
            if(this.getTypeItem(_loc2_.type) == name_321.name_374)
            {
               _loc14_ = this.space.name_15(_loc3_[_loc5_].previewId,var_72.getClass(Long.getLong(471525,9521360)),_loc2_.id + "_m" + _loc5_);
               Model.object = _loc14_;
               modelRegistry.getModel(_loc14_.gameClass.models[1]).method_18(new name_359(_loc10_));
               Model.method_38();
            }
            _loc6_ = new name_324(_loc2_.id + "_m" + _loc5_,_loc2_.description,_loc2_.isInventory,_loc2_.index,_loc8_,this.getTypeItem(_loc2_.type),_loc2_.modificationID,_loc2_.name,_loc2_.next_price,null,_loc2_.next_rank,_loc3_[_loc5_].previewId,_loc2_.price,_loc2_.rank,_loc3_,true);
            _loc6_.id = _loc14_;
            _loc7_ = new name_325();
            _loc7_.count = _loc6_.price;
            _loc7_.itemId = _loc6_.baseItemId;
            _loc7_.discount = _loc2_.discount;
            _loc7_.multicounted = _loc2_.multicounted;
            this.garage.name_322.name_371(_loc6_.baseItemId,_loc6_);
            this.garage.name_322.garageWindow.name_483.push(_loc7_);
            this.garage.name_322.method_106(null,[_loc7_]);
            _loc14_ = null;
         }
      }
      
      private function method_101(param1:String, param2:Object, param3:int) : void
      {
         var _loc5_:Object = null;
         var _loc4_:Vector.<name_352> = new Vector.<name_352>();
         for each(_loc5_ in param2.info)
         {
            _loc4_.push(new name_352(_loc5_.count,_loc5_.price,_loc5_.name));
         }
         KitsInfoData.name_452(param1,_loc4_,param3);
         if(param2.image != null)
         {
            KitsInfoData.name_461(param1,ImageResource(resourceRegistry.getResource(Long.getLong(0,param2.image))));
         }
      }
      
      private function method_107(param1:String) : void
      {
         this.method_106(param1);
      }
      
      private function method_97(param1:String) : String
      {
         var _loc2_:String = param1.substring(0,param1.length - 1);
         var _loc3_:int = int(param1.substring(param1.length - 1,param1.length));
         return _loc2_ + (_loc3_ + 1);
      }
      
      public function parseGarageItems(param1:String, param2:String = null) : void
      {
         this.method_104(param1,param2);
      }
      
      private function method_104(param1:String, param2:String = null) : void
      {
         var _mountedSkin:name_70 = null;
         var _skins:Vector.<name_70> = null;
         var skin:Object = null;
         var json:String = param1;
         var src:String = param2;
         var parser:Object = null;
         var items:Array = null;
         var obj:Object = null;
         var modifications:Array = null;
         var obj2:Object = null;
         var id:int = 0;
         var item:name_324 = null;
         var itemObject:name_70 = null;
         var infoItem:name_325 = null;
         var props:Array = null;
         var propsinfo:Vector.<name_323> = null;
         var prop:Object = null;
         var info:name_328 = null;
         var pid:String = null;
         var p:name_323 = null;
         this.garage.name_322.initObject(Game.getInstance.var_6,"russia",1000000,new Long(100,100),this.networker);
         try
         {
            parser = JSON.parse(json);
            items = new Array();
            for each(obj in parser.items)
            {
               modifications = new Array();
               for each(obj2 in obj.modification)
               {
                  propsinfo = new Vector.<name_323>();
                  props = new Array();
                  for each(prop in obj2.properts)
                  {
                     p = new name_323();
                     p.property = getItemProperty(prop.property);
                     p.value = prop.value;
                     props.push(p);
                     propsinfo.push(p);
                  }
                  info = new name_328();
                  info.crystalPrice = obj2.price;
                  info.rankId = obj2.rank;
                  info.previewId = Long.getLong(0,obj2.previewId);
                  pid = String(obj2.previewId);
                  info.itemProperties = props;
                  modifications.push(info);
               }
               id = int(obj.modificationID);
               if(obj.id == "lootbox")
               {
                  itemObject = this.space.name_15(Long.getLong(96200,95403),var_72.getClass(Long.getLong(15025,684360)),"LootBoxModel");
                  Model.object = itemObject;
                  modelRegistry.getModel(itemObject.gameClass.models[0]).method_18(new name_382());
                  modelRegistry.getModel(itemObject.gameClass.models[1]).method_18(new name_403(obj.count == null ? 0 : int(obj.count)));
                  name_397(modelRegistry.getModel(itemObject.gameClass.models[1])).objectLoaded();
                  LootBoxModel(modelRegistry.getModel(itemObject.gameClass.models[0])).objectLoaded();
                  Model.method_38();
               }
               else if(this.getTypeItem(obj.type) == name_321.name_374)
               {
                  itemObject = this.space.name_15(modifications[id].previewId,var_72.getClass(Long.getLong(471525,9521360)),obj.id + "_m" + id);
                  Model.object = itemObject;
                  modelRegistry.getModel(itemObject.gameClass.models[1]).method_18(new name_359(propsinfo));
                  Model.method_38();
               }
               else if(obj.skins != null)
               {
                  itemObject = this.space.name_15(modifications[id].previewId,var_72.getClass(Long.getLong(763265,-2356138)),obj.id);
                  Model.object = itemObject;
                  _mountedSkin = itemObject;
                  _skins = new Vector.<name_70>();
                  for each(skin in obj.skins)
                  {
                     item = new name_324(skin.id,skin.desc,false,-1,null,name_321.name_405,-1,skin.name,0,null,0,Long.getLong(0,skin.preview),0,0,null,false);
                     item.id = this.space.name_15(Long.getLong(0,skin.itemId),null,skin.id);
                     this.garage.name_322.name_471(item.baseItemId,item);
                     _skins.push(item.id);
                     if(Boolean(skin.mounted))
                     {
                        _mountedSkin = item.id;
                     }
                  }
                  modelRegistry.getModel(itemObject.gameClass.models[0]).method_18(new name_407(_skins));
                  modelRegistry.getModel(itemObject.gameClass.models[1]).method_18(new name_395(_mountedSkin));
                  Model.method_38();
               }
               item = new name_324(obj.id + "_m" + id,obj.description,obj.isInventory,obj.index,props,this.getTypeItem(obj.type),obj.modificationID,obj.name,obj.next_price,null,obj.next_rank,modifications[id].previewId,obj.price,obj.rank,modifications,false);
               item.id = itemObject;
               infoItem = new name_325();
               infoItem.count = obj.count;
               infoItem.itemId = item.baseItemId;
               infoItem.discount = obj.discount;
               infoItem.multicounted = obj.multicounted;
               this.garage.name_322.name_371(item.baseItemId,item);
               this.garage.name_322.garageWindow.name_402.push(infoItem);
               this.garage.name_322.name_394(null,[infoItem]);
               itemObject = null;
            }
            Network(Main.osgi.getService(name_2)).send("garage;get_garage_data");
            PanelModel(Main.osgi.getService(name_115)).addListener(this.garage.name_322);
            Main.osgi.registerService(name_381,this.garage.name_322);
            PanelModel(Main.osgi.getService(name_115)).isGarageSelect = true;
         }
         catch(e:Error)
         {
            throw new Error("Error " + e.getStackTrace());
         }
      }
      
      private function method_103(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:name_324 = null;
         var _loc8_:name_325 = null;
         var _loc9_:Array = null;
         var _loc10_:Object = null;
         var _loc11_:name_328 = null;
         var _loc12_:String = null;
         var _loc13_:name_323 = null;
         try
         {
            _loc3_ = new Array();
            for each(_loc4_ in _loc2_.modification)
            {
               _loc9_ = new Array();
               for each(_loc10_ in _loc4_.properts)
               {
                  _loc13_ = new name_323();
                  _loc13_.property = getItemProperty(_loc10_.property);
                  _loc13_.value = _loc10_.value;
                  _loc9_.push(_loc13_);
               }
               _loc11_ = new name_328();
               _loc11_.crystalPrice = _loc4_.price;
               _loc11_.rankId = _loc4_.rank;
               _loc11_.previewId = Long.getLong(0,_loc4_.previewId);
               _loc12_ = String(_loc4_.previewId);
               _loc11_.itemProperties = _loc9_;
               _loc3_.push(_loc11_);
            }
            _loc5_ = int(_loc2_.modificationID);
            _loc6_ = new name_324(_loc2_.id + "_m" + _loc5_,_loc2_.description,_loc2_.isInventory,_loc2_.index,_loc9_,this.getTypeItem(_loc2_.type),_loc2_.modificationID,_loc2_.name,_loc2_.next_price,null,_loc2_.next_rank,_loc3_[_loc5_].previewId,_loc2_.price,_loc2_.rank,_loc3_,false);
            _loc8_ = new name_325();
            _loc8_.count = _loc2_.count;
            _loc8_.itemId = _loc6_.baseItemId;
            _loc8_.discount = _loc2_.discount;
            _loc8_.multicounted = _loc2_.multicounted;
            this.garage.name_322.name_371(_loc6_.baseItemId,_loc6_);
            this.garage.name_322.garageWindow.name_402.push(_loc8_);
            this.garage.name_322.name_394(null,[_loc8_]);
         }
         catch(e:Error)
         {
         }
      }
      
      public function parseAndInitBattleFormats(param1:String) : void
      {
         var _loc4_:Object = null;
         var _loc5_:name_365 = null;
         var _loc6_:name_340 = null;
         var _loc2_:Vector.<name_340> = new Vector.<name_340>();
         var _loc3_:int = 0;
         for each(_loc4_ in JSON.parse(param1))
         {
            _loc6_ = new name_340(_loc3_,_loc4_.mode,localeService.getText(_loc4_.name));
            _loc2_.push(_loc6_);
            _loc3_++;
         }
         _loc5_ = new name_365(_loc2_);
         modelRegistry.getModel(Long.getLong(1124951823,1347902856)).method_18(_loc5_);
         name_170(modelRegistry.getModel(Long.getLong(1124951823,1347902856))).objectLoaded();
      }
      
      public function parseAndInitBattlesList(param1:String) : void
      {
         var maps:Array = null;
         var battles:Array = null;
         var js:Object = null;
         var obj1:Object = null;
         var btl:Object = null;
         var map:name_355 = null;
         var battle:name_336 = null;
         var json:String = param1;
         try
         {
            Main.osgi.registerService(name_386,this.battleSelect.battleSelectModel);
            maps = new Array();
            battles = new Array();
            js = JSON.parse(json);
            for each(obj1 in js.items)
            {
               map = new name_355();
               map.ctf = obj1.ctf;
               map.gameName = obj1.gameName;
               map.id = obj1.id;
               map.maxPeople = obj1.maxPeople;
               map.maxRank = obj1.maxRank;
               map.minRank = obj1.minRank;
               map.name = obj1.name;
               map.previewId = Long.getLong(0,obj1.previewId);
               map.tdm = obj1.tdm;
               map.dom = obj1.dom;
               map.themeName = obj1.themeName;
               map.theme = MapTheme.name_440(obj1.theme);
               maps.push(map);
            }
            for each(btl in js.battles)
            {
               battle = new name_336();
               battle.battleId = btl.battleId;
               battle.mapId = btl.mapId;
               battle.name = btl.name;
               battle.team = btl.team;
               battle.name_384 = btl.redPeople;
               battle.name_389 = btl.bluePeople;
               battle.countPeople = btl.countPeople;
               battle.maxPeople = btl.maxPeople;
               battle.minRank = btl.minRank;
               battle.maxRank = btl.maxRank;
               battle.timeLimit = btl.timeLimit;
               battle.timeLeft = btl.timeLeft;
               battle.scoreLimit = btl.scoreLimit;
               battle.privateBattle = btl.privateBattle;
               battle.proBattle = btl.proBattle;
               battle.suspicious = btl.suspicious;
               battle.formatBattle = btl.formatBattle;
               battle.friendsDm = btl.friendsDm;
               battle.friendsRed = btl.friendsRed;
               battle.friendsBlue = btl.friendsBlue;
               battle.type = btl.type;
               battles.push(battle);
               battleTimeLeftService.name_401(battle.battleId,battle.timeLimit * 60,battle.timeLeft);
            }
            this.battleSelect.battleSelectModel.initObject(null,10,js.haveSubscribe,maps);
            this.battleSelect.battleSelectModel.name_468(null,battles,this.needSelected == null ? String(js.recommendedBattle) : this.needSelected,false);
            this.needSelected = null;
            if(!this.var_76)
            {
               this.var_76 = true;
            }
         }
         catch(e:Error)
         {
            OSGi.clientLog.log("BattlesList","Error parsing battleselect %1",e.getStackTrace());
         }
      }
      
      public function parseAndAddMessageToChat(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         this.chat.name_332.name_379.addMessage(_loc2_.name,_loc2_.rang,_loc2_.chatPermissions,false,_loc2_.message,_loc2_.channel,_loc2_.rangTo,_loc2_.chatPermissionsTo,_loc2_.nameTo == "NULL" ? "" : String(_loc2_.nameTo),false,_loc2_.system,_loc2_.yellow);
      }
      
      public function parseAndInitPanelInfo(param1:String) : void
      {
         var _loc2_:Object = JSON.parse(param1);
         this.initPanel(_loc2_.crystall,_loc2_.email,_loc2_.tester,_loc2_.name,_loc2_.next_score,_loc2_.place,_loc2_.rang,_loc2_.rating,_loc2_.score);
      }
      
      public function initPanel(param1:int, param2:String, param3:Boolean, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int) : void
      {
         var _loc10_:PanelModel = PanelModel(Main.osgi.getService(name_115));
         _loc10_.initObject(Game.getInstance.var_6,param1,param2,param3,param4,param5,param6,param7,param8,param9);
         _loc10_.lock();
         var _loc11_:name_351 = new name_351(param4,param4,param7);
         Main.osgi.registerService(name_361,_loc11_);
         this.init();
      }
      
      public function beforeAuth() : void
      {
         this.networker = Main.osgi.getService(name_2) as Network;
         this.networker.addEventListener(this);
         this.networker.addEventListener(ClansController(Main.osgi.getService(ClansController)));
         Model.object = this.space.getObject(Long.getLong(92381,9324110));
         name_170(modelRegistry.getModel(Long.getLong(1223707112,492148927))).objectLoaded();
         Model.method_38();
      }
      
      private function init() : void
      {
         this.chat.start(Game.getInstance.osgi);
         this.battleSelect.start(Game.getInstance.osgi);
      }
      
      public function getTypeItem(param1:int) : name_321
      {
         switch(param1)
         {
            case 2:
               return name_321.ARMOR;
            case 1:
               return name_321.WEAPON;
            case 3:
               return name_321.COLOR;
            case 4:
               return name_321.INVENTORY;
            case 5:
               return name_321.PLUGIN;
            case 6:
               return name_321.KIT;
            case 7:
               return name_321.name_374;
            case 8:
               return name_321.name_405;
            default:
               return null;
         }
      }
   }
}
