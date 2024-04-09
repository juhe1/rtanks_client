package alternativa.tanks.gui
{
   import alternativa.model.IModel;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.device.ItemInfoDevicesPanel;
   import alternativa.tanks.gui.tables.kits.description.KitsInfoData;
   import alternativa.tanks.gui.tables.kits.description.name_1591;
   import alternativa.tanks.gui.tables.kits.description.name_3211;
   import alternativa.tanks.gui.tables.kits.name_3215;
   import alternativa.tanks.model.GarageModel;
   import alternativa.tanks.model.name_324;
   import alternativa.tanks.model.name_364;
   import alternativa.tanks.model.name_381;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import base.class_122;
   import controls.Money;
   import controls.NumStepper;
   import controls.base.LabelBase;
   import controls.TankWindowInner;
   import controls.timer.CountDownTimer;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextFieldType;
   import flash.utils.Dictionary;
   import forms.TankWindowWithHeader;
   import package_1.Main;
   import package_103.name_323;
   import package_103.name_328;
   import package_105.name_321;
   import package_109.name_325;
   import package_119.name_351;
   import package_119.name_361;
   import package_13.Long;
   import package_131.name_352;
   import package_31.name_115;
   import package_314.name_1356;
   import package_314.name_1361;
   import package_315.name_1357;
   import package_316.name_1362;
   import package_326.class_55;
   import package_340.name_1634;
   import package_343.ResistancesIcons;
   import package_41.ItemProperty;
   import package_433.ItemViewCategoryEnum;
   import package_53.name_94;
   import package_54.name_102;
   import package_60.TextConst;
   import package_7.name_32;
   import package_75.name_274;
   import package_96.MountedResistancesPanel;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeChildrenFrom;
   
   public class ItemInfoPanel extends Sprite implements IResourceLoadingListener
   {
      
      public static var delayMountCategoryService:name_1357 = OSGi.getInstance().getService(name_1357) as name_1357;
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().getService(name_94) as name_94;
      
      public static var battleInfoService:name_274 = OSGi.getInstance().getService(name_274) as name_274;
      
      private static const const_2489:Class = name_3224;
      
      private static const const_2514:BitmapData = new const_2489().bitmapData;
      
      private static const const_2499:Class = name_3227;
      
      private static const const_2487:BitmapData = new const_2499().bitmapData;
      
      private static const const_2509:Class = name_3213;
      
      private static const const_2496:BitmapData = new const_2509().bitmapData;
      
      private static const const_2516:Class = name_3216;
      
      private static const const_2485:BitmapData = new const_2516().bitmapData;
      
      private static const const_2491:Class = name_3230;
      
      private static const const_2508:BitmapData = new const_2491().bitmapData;
      
      private static const const_2519:Class = name_3220;
      
      private static const const_2512:BitmapData = new const_2519().bitmapData;
      
      private static const const_2529:Class = name_3235;
      
      private static const const_2507:BitmapData = new const_2529().bitmapData;
      
      private static const const_2505:Class = name_3241;
      
      private static const const_2523:BitmapData = new const_2505().bitmapData;
      
      private static const const_2502:Class = name_3228;
      
      private static const const_2484:BitmapData = new const_2502().bitmapData;
      
      private static const const_2530:Class = name_3219;
      
      private static const const_2500:BitmapData = new const_2530().bitmapData;
      
      private static const const_2504:Class = name_3212;
      
      private static const const_2486:BitmapData = new const_2504().bitmapData;
      
      private static const const_2526:Class = name_3223;
      
      private static const const_2522:BitmapData = new const_2526().bitmapData;
      
      private static const const_2524:Class = name_3229;
      
      private static const const_2506:BitmapData = new const_2524().bitmapData;
      
      private static const const_2490:Class = name_3218;
      
      private static const const_2531:BitmapData = new const_2490().bitmapData;
      
      private static const const_2511:Class = name_3238;
      
      private static const const_2528:BitmapData = new const_2511().bitmapData;
      
      private static const const_2488:Class = name_3222;
      
      private static const const_2527:BitmapData = new const_2488().bitmapData;
      
      private static const const_2497:Class = name_3233;
      
      private static const const_2495:BitmapData = new const_2497().bitmapData;
      
      private static const const_2525:Class = name_3231;
      
      private static const const_2520:BitmapData = new const_2525().bitmapData;
      
      private static const const_2510:Class = name_3237;
      
      private static const const_2498:BitmapData = new const_2510().bitmapData;
      
      private static const const_2521:Class = name_3225;
      
      private static const const_2494:BitmapData = new const_2521().bitmapData;
      
      private static const const_2501:Class = name_3239;
      
      private static const const_2515:BitmapData = new const_2501().bitmapData;
      
      private static const const_2517:Class = name_3234;
      
      private static const const_2513:BitmapData = new const_2517().bitmapData;
      
      private static const const_2493:Class = name_3236;
      
      private static const const_2492:BitmapData = new const_2493().bitmapData;
      
      private static const const_2518:Class = name_3217;
      
      private static const const_2503:BitmapData = new const_2518().bitmapData;
      
      public static const const_2532:int = 9999;
      
      public static const const_2533:int = 1;
       
      
      private var modelRegister:name_32;
      
      private var localeService:name_102;
      
      private var panelModel:name_115;
      
      private var window:TankWindowWithHeader;
      
      public var size:Point;
      
      public const var_1750:int = 11;
      
      private const const_1686:int = 64;
      
      private var var_1182:TankWindowInner;
      
      private var preview:Bitmap;
      
      private var var_3259:Boolean;
      
      public var var_3214:LabelBase;
      
      public var var_3207:LabelBase;
      
      public var name_2619:name_1362;
      
      public var name_2621:name_1361;
      
      public var name_2620:name_1362;
      
      public var name_1537:NumStepper;
      
      private const const_1677:Point = new Point(120,50);
      
      public var var_3246:name_3210;
      
      public var var_3248:name_3210;
      
      public var var_3222:name_3210;
      
      public var impactForce:name_3210;
      
      public var var_3237:name_3210;
      
      public var var_3262:name_3210;
      
      public var var_3266:name_3210;
      
      public var var_3229:name_3210;
      
      public var var_3226:name_3210;
      
      public var var_3260:name_3210;
      
      public var var_3261:name_3210;
      
      public var var_3265:name_3210;
      
      public var var_3268:name_3210;
      
      public var var_3267:name_3210;
      
      public var var_3251:name_3210;
      
      public var var_3224:name_3210;
      
      public var var_3249:name_3210;
      
      public var var_3235:name_3210;
      
      public var var_3244:name_3210;
      
      public var var_3238:name_3210;
      
      public var var_3230:name_3210;
      
      public var var_3241:name_3210;
      
      public var var_3231:name_3210;
      
      public var var_3232:name_3210;
      
      public var var_3239:name_3210;
      
      public var var_3245:name_3210;
      
      public var var_3240:name_3210;
      
      public var var_3253:name_3210;
      
      public var var_3250:name_3210;
      
      public var var_3256:name_3210;
      
      public var var_3257:name_3210;
      
      public var var_3252:name_3210;
      
      public var var_3234:name_3210;
      
      public var var_3254:name_3210;
      
      public var var_3243:name_3210;
      
      public var var_3233:name_3210;
      
      public var var_3242:name_3210;
      
      public var var_3236:name_3210;
      
      public var var_3255:name_3210;
      
      public var var_3219:name_3210;
      
      public var var_3220:name_3210;
      
      public var var_3223:name_3210;
      
      private const const_2534:int = 10;
      
      private var var_3206:Array;
      
      private var id:String;
      
      private var params:name_324;
      
      private var info:name_325;
      
      private var type:name_321;
      
      private var var_3269:Array;
      
      private var var_2630:ScrollPane;
      
      private var var_2632:Sprite;
      
      private var var_3208:Sprite;
      
      private var var_3228:Bitmap;
      
      private var var_3221:Bitmap;
      
      private var var_3225:Bitmap;
      
      private var area:Shape;
      
      private var area2:Shape;
      
      private var var_3212:Rectangle;
      
      private var areaRect2:Rectangle;
      
      private var var_3217:int = 12;
      
      private var var_3210:int = 9;
      
      private var const_1944:int = 3;
      
      private var var_3271:int = 0;
      
      private var var_3272:int = 275;
      
      private var var_3211:LabelBase;
      
      public var var_3264:int;
      
      private var var_3209:ModTable;
      
      public var name_2637:Array;
      
      public var name_2627:Dictionary;
      
      private var var_3270:String;
      
      private var var_3218:class_122;
      
      private var var_3227:class_122;
      
      private var var_3215:MountedResistancesPanel;
      
      private var var_3258:Boolean = false;
      
      private var var_3216:ItemInfoDevicesPanel;
      
      private var var_3263:ItemViewCategoryEnum;
      
      private var item:name_70;
      
      private var var_3247:Boolean = false;
      
      private var var_3213:name_3211;
      
      public function ItemInfoPanel()
      {
         super();
         this.var_3218 = new class_122();
         this.var_3227 = new class_122();
         this.modelRegister = Main.osgi.getService(name_32) as name_32;
         this.localeService = Main.osgi.getService(name_102) as name_102;
         this.panelModel = Main.osgi.getService(name_115) as name_115;
         this.var_3213 = new name_3211();
         this.name_2637 = new Array();
         this.name_2627 = new Dictionary();
         this.size = new Point(400,300);
         this.window = new TankWindowWithHeader(this.localeService.getText(name_390.const_624));
         this.window.width = this.size.x;
         this.window.height = this.size.y;
         addChild(this.window);
         this.var_1182 = new TankWindowInner(164,106,TankWindowInner.GREEN);
         this.var_1182.showBlink = true;
         addChild(this.var_1182);
         this.var_1182.x = 11;
         this.var_1182.y = 11;
         this.area = new Shape();
         this.area2 = new Shape();
         this.var_3212 = new Rectangle();
         this.areaRect2 = new Rectangle(this.var_3217,this.var_3210,0,0);
         this.var_3212.width = 412 - 11 * 2 - 2;
         this.areaRect2.width = this.var_3212.width - this.var_3217 * 2;
         this.var_2632 = new Sprite();
         this.var_2632.x = 11 + 1;
         this.var_2632.y = 11 + 1;
         this.var_2632.addChild(this.area);
         this.var_2632.addChild(this.area2);
         this.var_2630 = new ScrollPane();
         addChild(this.var_2630);
         this.method_2266();
         this.var_2630.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.var_2630.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.var_2630.source = this.var_2632;
         this.var_2630.focusEnabled = false;
         this.var_2630.x = 11 + 1;
         this.var_2630.y = 11 + 1 + this.const_1944;
         var _loc1_:name_351 = Main.osgi.getService(name_361) as name_351;
         var _loc2_:String = _loc1_.name;
         this.var_3214 = new LabelBase();
         this.var_3214.type = TextFieldType.DYNAMIC;
         this.var_3214.text = "Hello, " + _loc2_ + "!";
         this.var_3214.size = 18;
         this.var_3214.color = 381208;
         this.var_2632.addChild(this.var_3214);
         this.var_3214.x = this.var_3217 - 3;
         this.var_3214.y = this.var_3210 - 7;
         this.var_3216 = new ItemInfoDevicesPanel();
         this.var_3216.x = this.var_3217;
         this.var_2632.addChild(this.var_3216);
         this.var_3207 = new LabelBase();
         this.var_3207.multiline = true;
         this.var_3207.wordWrap = true;
         this.var_3207.color = 381208;
         this.var_3207.htmlText = "Description";
         this.var_2632.addChild(this.var_3207);
         this.var_3207.x = this.var_3217 - 3;
         this.preview = new Bitmap();
         addChild(this.var_3227);
         this.name_2619 = new name_1362();
         this.name_2621 = new name_1361();
         this.name_2620 = new name_1362();
         this.name_2619.icon = null;
         this.name_2619.label = this.localeService.getText(TextConst.GARAGE_INFO_PANEL_BUTTON_BUY_TEXT);
         this.name_2621.label = this.localeService.getText(TextConst.GARAGE_INFO_PANEL_BUTTON_EQUIP_TEXT);
         this.name_2620.label = this.localeService.getText(TextConst.GARAGE_INFO_PANEL_BUTTON_UPGRADE_TEXT);
         this.var_3227.addChild(this.name_2619);
         this.var_3227.addChild(this.name_2621);
         this.var_3227.addChild(this.name_2620);
         addChild(this.var_3218);
         this.name_1537 = new NumStepper();
         addChild(this.name_1537);
         this.name_1537.value = 1;
         this.name_1537.minValue = 1;
         this.name_1537.maxValue = ItemInfoPanel.const_2532;
         this.name_1537.visible = false;
         this.name_1537.addEventListener(Event.CHANGE,this.inventoryNumChanged);
         this.var_3208 = new Sprite();
         this.var_3228 = new Bitmap(ItemInfoPanelBitmaps.name_3232);
         this.var_3208.addChild(this.var_3228);
         this.var_3221 = new Bitmap(ItemInfoPanelBitmaps.name_3221);
         this.var_3208.addChild(this.var_3221);
         this.var_3225 = new Bitmap(ItemInfoPanelBitmaps.name_3226);
         this.var_3208.addChild(this.var_3225);
         this.var_3221.x = this.var_3228.width;
         this.var_3208.x = this.var_3217;
         this.var_3208.y = Math.round(this.var_3210 * 2 + this.var_3214.textHeight - 7);
         this.method_2957().visible = false;
         addChild(this.method_2957());
         this.var_3246 = new name_3210(const_2514,this.localeService.getText(TextConst.const_332));
         this.var_3248 = new name_3210(const_2485,this.localeService.getText(TextConst.const_323));
         this.var_3222 = new name_3210(const_2487,this.localeService.getText(TextConst.const_323));
         this.impactForce = new name_3210(const_2496,this.localeService.getText(TextConst.const_323));
         this.var_3237 = new name_3210(const_2487,this.localeService.getText(TextConst.const_210));
         this.var_3262 = new name_3210(const_2508,this.localeService.getText(TextConst.const_197));
         this.var_3266 = new name_3210(const_2512,this.localeService.getText(TextConst.const_197));
         this.var_3229 = new name_3210(const_2507,this.localeService.getText(TextConst.const_332));
         this.var_3226 = new name_3210(const_2523,this.localeService.getText(TextConst.const_153));
         this.var_3260 = new name_3210(const_2500,this.localeService.getText(TextConst.const_246));
         this.var_3261 = new name_3210(const_2484,this.localeService.getText(TextConst.const_246));
         this.var_3265 = new name_3210(const_2484,this.localeService.getText(TextConst.const_360));
         this.var_3268 = new name_3210(const_2484,this.localeService.getText(TextConst.const_207));
         this.var_3267 = new name_3210(const_2484,this.localeService.getText(TextConst.const_334));
         this.var_3251 = new name_3210(const_2486,this.localeService.getText(TextConst.const_308));
         this.var_3224 = new name_3210(const_2522,this.localeService.getText(TextConst.const_167));
         this.var_3249 = new name_3210(const_2486,this.localeService.getText(TextConst.const_308));
         this.var_3235 = new name_3210(const_2506,this.localeService.getText(TextConst.const_178));
         this.var_3244 = new name_3210(const_2531,this.localeService.getText(TextConst.const_167));
         this.var_3238 = new name_3210(const_2527,this.localeService.getText(TextConst.const_167));
         this.var_3230 = new name_3210(const_2528,this.localeService.getText(TextConst.const_167));
         this.var_3241 = new name_3210(const_2495,this.localeService.getText(TextConst.const_282));
         this.var_3231 = new name_3210(const_2520,this.localeService.getText(TextConst.const_282));
         this.var_3232 = new name_3210(const_2498,this.localeService.getText(TextConst.const_196));
         this.var_3239 = new name_3210(ResistancesIcons.const_2150,"",ResistancesIcons.name_2360);
         this.var_3250 = new name_3210(ResistancesIcons.const_2138,"",ResistancesIcons.name_2360);
         this.var_3253 = new name_3210(ResistancesIcons.const_2145,"",ResistancesIcons.name_2360);
         this.var_3256 = new name_3210(ResistancesIcons.const_2144,"",ResistancesIcons.name_2360);
         this.var_3252 = new name_3210(ResistancesIcons.const_2148,"",ResistancesIcons.name_2360);
         this.var_3257 = new name_3210(ResistancesIcons.const_2152,"",ResistancesIcons.name_2360);
         this.var_3234 = new name_3210(ResistancesIcons.const_2132,"",ResistancesIcons.name_2360);
         this.var_3254 = new name_3210(ResistancesIcons.const_2133,"",ResistancesIcons.name_2360);
         this.var_3243 = new name_3210(ResistancesIcons.const_2151,"",ResistancesIcons.name_2360);
         this.var_3233 = new name_3210(ResistancesIcons.const_2147,"",ResistancesIcons.name_2360);
         this.var_3242 = new name_3210(ResistancesIcons.const_2146,"",ResistancesIcons.name_2360);
         this.var_3245 = new name_3210(ResistancesIcons.const_2136,"",ResistancesIcons.name_2360);
         this.var_3240 = new name_3210(ResistancesIcons.const_2131,"",ResistancesIcons.name_2360);
         this.var_3236 = new name_3210(const_2494,this.localeService.getText(TextConst.const_332));
         this.var_3255 = new name_3210(const_2515,this.localeService.getText(TextConst.const_210));
         this.var_3219 = new name_3210(const_2513,this.localeService.getText(TextConst.const_210));
         this.var_3220 = new name_3210(const_2492,"hp");
         this.var_3223 = new name_3210(const_2503,"shot/min");
         this.var_3211 = new LabelBase();
         this.var_3211.size = 18;
         this.var_3211.color = 381208;
         this.var_3206 = new Array();
         this.var_3209 = new ModTable(this.areaRect2.width);
         this.var_3209.x = this.var_3217;
      }
      
      public function method_2957() : MountedResistancesPanel
      {
         if(this.var_3215 == null)
         {
            this.var_3215 = new MountedResistancesPanel();
            this.var_3215.visible = false;
         }
         return this.var_3215;
      }
      
      public function hide() : void
      {
         this.modelRegister = null;
         this.panelModel = null;
         this.window = null;
         this.var_1182 = null;
         this.preview = null;
         this.item = null;
         this.var_3214 = null;
         this.var_3207 = null;
         this.var_3206 = null;
         this.id = null;
         this.type = null;
         this.var_3213 = null;
         this.var_3269 = null;
         this.var_2630 = null;
         this.var_2632 = null;
         this.var_3208 = null;
         this.var_3228 = null;
         this.var_3221 = null;
         this.var_3225 = null;
         this.area = null;
         this.area2 = null;
         this.var_3212 = null;
         this.areaRect2 = null;
         this.name_2619 = null;
         this.name_2621 = null;
         this.name_2620 = null;
         this.var_3227 = null;
         this.var_3218 = null;
         if(this.var_3215 != null)
         {
            this.var_3215.destroy();
            this.var_3215 = null;
         }
         if(this.var_3216 != null)
         {
            this.var_3216.destroy();
            this.var_3216 = null;
         }
         this.var_3246 = null;
         this.var_3248 = null;
         this.var_3222 = null;
         this.impactForce = null;
         this.var_3237 = null;
         this.var_3262 = null;
         this.var_3266 = null;
         this.var_3229 = null;
         this.var_3226 = null;
         this.var_3260 = null;
         this.var_3261 = null;
         this.var_3265 = null;
         this.var_3268 = null;
         this.var_3267 = null;
         this.var_3251 = null;
         this.var_3224 = null;
         this.var_3249 = null;
         this.var_3235 = null;
         this.var_3244 = null;
         this.var_3238 = null;
         this.var_3230 = null;
         this.var_3241 = null;
         this.var_3231 = null;
         this.var_3232 = null;
         this.var_3239 = null;
         this.var_3250 = null;
         this.var_3253 = null;
         this.var_3256 = null;
         this.var_3252 = null;
         this.var_3257 = null;
         this.var_3234 = null;
         this.var_3254 = null;
         this.var_3243 = null;
         this.var_3233 = null;
         this.var_3242 = null;
         this.var_3245 = null;
         this.var_3240 = null;
         this.var_3236 = null;
         this.var_3255 = null;
         this.var_3219 = null;
         this.var_3219 = null;
         this.var_3219 = null;
         this.var_3219 = null;
         this.var_3219 = null;
         this.var_3223 = null;
         this.var_3220 = null;
      }
      
      private function method_2266() : void
      {
         this.var_2630.setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         this.var_2630.setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         this.var_2630.setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         this.var_2630.setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         this.var_2630.setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         this.var_2630.setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         this.var_2630.setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         this.var_2630.setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         this.var_2630.setStyle("trackUpSkin",ScrollTrackGreen);
         this.var_2630.setStyle("trackDownSkin",ScrollTrackGreen);
         this.var_2630.setStyle("trackOverSkin",ScrollTrackGreen);
         this.var_2630.setStyle("trackDisabledSkin",ScrollTrackGreen);
         this.var_2630.setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         this.var_2630.setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         this.var_2630.setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         this.var_2630.setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
      }
      
      private function hideAllIcons() : void
      {
         var _loc2_:DisplayObject = null;
         Main.method_8("GARAGE WINDOW","hideAllIcons");
         var _loc1_:int = 0;
         while(_loc1_ < this.var_3206.length)
         {
            _loc2_ = this.var_3206[_loc1_] as DisplayObject;
            if(this.var_3208.contains(_loc2_))
            {
               this.var_3208.removeChild(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function showIcons() : void
      {
         var _loc2_:DisplayObject = null;
         Main.method_8("GARAGE WINDOW","showIcons");
         var _loc1_:int = 0;
         while(_loc1_ < this.var_3206.length)
         {
            _loc2_ = this.var_3206[_loc1_] as DisplayObject;
            if(!this.var_3208.contains(_loc2_))
            {
               this.var_3208.addChild(_loc2_);
            }
            _loc2_.visible = true;
            _loc1_++;
         }
      }
      
      public function name_1551(param1:String, param2:name_324, param3:Boolean, param4:name_325 = null, param5:Array = null) : void
      {
         var _loc10_:ImageResource = null;
         var _loc11_:int = 0;
         var _loc12_:name_323 = null;
         var _loc13_:int = 0;
         var _loc14_:name_323 = null;
         var _loc15_:name_1591 = null;
         var _loc16_:Vector.<name_352> = null;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:int = 0;
         var _loc20_:name_328 = null;
         var _loc21_:ModInfoRow = null;
         var _loc22_:int = 0;
         var _loc23_:Array = null;
         var _loc24_:int = 0;
         var _loc25_:String = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:name_364 = null;
         Main.method_8("GARAGE WINDOW"," ");
         Main.method_8("GARAGE WINDOW","showItemInfooooo (itemId: %1)",param1);
         this.id = param1;
         this.var_3263 = GarageWindow.name_1549(param2.name_373);
         if(this.item != param2.id)
         {
            this.item = param2.id;
         }
         this.var_3258 = param2.id != null && Boolean(param2.id.method_316(name_1634));
         if(this.var_3258)
         {
            this.var_3216.init(param2.id);
         }
         removeChildrenFrom(this.var_3218);
         this.type = param2.name_373;
         this.params = param2;
         param3 = param2.name_1359;
         this.info = param4;
         this.var_3214.text = param2.name;
         this.var_3207.htmlText = param2.description;
         var _loc6_:ImageResource = ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param2.previewId));
         if(param2.name_373 == name_321.KIT)
         {
            _loc10_ = KitsInfoData.getImage(param2.baseItemId);
            if(_loc10_ != null)
            {
               _loc6_ = _loc10_;
            }
         }
         var _loc7_:BitmapData = null;
         if(_loc6_ != null && _loc6_.data != null)
         {
            _loc7_ = _loc6_.data;
         }
         else if(_loc6_ != null && !_loc6_.isLoaded)
         {
            _loc6_.loadLazyResource(this);
         }
         else
         {
            _loc7_ = new StubBitmapData(16711680);
         }
         this.preview.bitmapData = _loc7_;
         var _loc8_:Boolean = !(this.type == name_321.ARMOR || this.type == name_321.WEAPON || this.type == name_321.name_374);
         this.hideAllIcons();
         this.var_3206 = new Array();
         var _loc9_:Array = param2.itemProperties;
         if(param1.indexOf("shaft_") < 0)
         {
            if(_loc9_ != null)
            {
               _loc11_ = 0;
               while(_loc11_ < _loc9_.length)
               {
                  _loc12_ = _loc9_[_loc11_] as name_323;
                  switch(_loc12_.property)
                  {
                     case ItemProperty.ARMOR:
                        Main.method_8("GARAGE WINDOW","ItemProperty: ARMOR");
                        if(_loc8_)
                        {
                           this.var_3248.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3248.var_451 = "";
                        }
                        this.var_3206[4] = this.var_3248;
                        break;
                     case ItemProperty.DAMAGE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: DAMAGE");
                        if(_loc8_)
                        {
                           this.var_3222.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3222.var_451 = "";
                        }
                        this.var_3206[4] = this.var_3222;
                        break;
                     case ItemProperty.DAMAGE_PER_SECOND:
                        Main.method_8("GARAGE WINDOW","ItemProperty: DAMAGE_PER_SECOND");
                        if(_loc8_)
                        {
                           this.var_3237.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3237.var_451 = "";
                        }
                        this.var_3206[4] = this.var_3237;
                        break;
                     case ItemProperty.IMPACT_FORCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: IMPACT_FORCE");
                        if(_loc8_)
                        {
                           this.impactForce.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.impactForce.var_451 = "";
                        }
                        this.var_3206[5] = this.impactForce;
                        break;
                     case ItemProperty.AIMING_ERROR:
                        Main.method_8("GARAGE WINDOW","ItemProperty: AIMING_ERROR");
                        if(_loc8_)
                        {
                           this.var_3251.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3251.var_451 = "";
                        }
                        this.var_3206[8] = this.var_3251;
                        break;
                     case ItemProperty.CONE_ANGLE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: CONE_ANGLE");
                        if(_loc8_)
                        {
                           this.var_3249.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3249.var_451 = "";
                        }
                        this.var_3206[8] = this.var_3249;
                        break;
                     case ItemProperty.SHOT_AREA:
                        Main.method_8("GARAGE WINDOW","ItemProperty: SHOT_AREA");
                        if(_loc8_)
                        {
                           this.var_3246.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3246.var_451 = "";
                        }
                        this.var_3206[10] = this.var_3246;
                        break;
                     case ItemProperty.SHOT_FREQUENCY:
                        Main.method_8("GARAGE WINDOW","ItemProperty: SHOT_FREQUENCY");
                        if(_loc8_)
                        {
                           this.var_3226.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3226.var_451 = "";
                        }
                        this.var_3206[6] = this.var_3226;
                        break;
                     case ItemProperty.SHAFT_DAMAGE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: SHOT_FREQUENCY");
                        if(_loc8_)
                        {
                           this.var_3220.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3220.var_451 = "";
                        }
                        this.var_3206[7] = this.var_3220;
                        break;
                     case ItemProperty.SHAFT_SHOT_FREQUENCY:
                        Main.method_8("GARAGE WINDOW","ItemProperty: SHOT_FREQUENCY");
                        if(_loc8_)
                        {
                           this.var_3223.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3223.var_451 = "";
                        }
                        this.var_3206[8] = this.var_3223;
                        break;
                     case ItemProperty.SHOT_SPEED:
                        Main.method_8("GARAGE WINDOW","ItemProperty: SHOT_RANGE");
                        if(_loc8_)
                        {
                           this.var_3229.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3229.var_451 = "";
                        }
                        this.var_3206[9] = this.var_3229;
                        break;
                     case ItemProperty.TURRET_TURN_SPEED:
                        Main.method_8("GARAGE WINDOW","ItemProperty: TURRET_TURN_SPEED");
                        if(_loc8_)
                        {
                           this.var_3224.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3224.var_451 = "";
                        }
                        this.var_3206[7] = this.var_3224;
                        break;
                     case ItemProperty.SPEED:
                        Main.method_8("GARAGE WINDOW","ItemProperty: SPEED");
                        if(_loc8_)
                        {
                           this.var_3235.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3235.var_451 = "";
                        }
                        this.var_3206[11] = this.var_3235;
                        break;
                     case ItemProperty.TURN_SPEED:
                        Main.method_8("GARAGE WINDOW","ItemProperty: TURN_SPEED");
                        if(_loc8_)
                        {
                           this.var_3244.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3244.var_451 = "";
                        }
                        this.var_3206[12] = this.var_3244;
                        break;
                     case ItemProperty.WEIGHT:
                        Main.method_8("GARAGE WINDOW","ItemProperty: HULL_WEIGHT");
                        if(_loc8_)
                        {
                           this.var_3230.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3230.var_451 = "";
                        }
                        this.var_3206[13] = this.var_3230;
                        break;
                     case ItemProperty.POWER:
                        Main.method_8("GARAGE WINDOW","ItemProperty: HULL_POWER");
                        if(_loc8_)
                        {
                           this.var_3238.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3238.var_451 = "";
                        }
                        this.var_3206[14] = this.var_3238;
                        break;
                     case ItemProperty.CRITICAL_CHANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: CRITICAL_CHANCE");
                        if(_loc8_)
                        {
                           this.var_3241.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3241.var_451 = "";
                        }
                        this.var_3206[25] = this.var_3241;
                        break;
                     case ItemProperty.HEALING_TIME:
                        Main.method_8("GARAGE WINDOW","ItemProperty: HEATING_TIME");
                        if(_loc8_)
                        {
                           this.var_3232.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3232.var_451 = "";
                        }
                        this.var_3206[26] = this.var_3232;
                        break;
                     case ItemProperty.CRITICAL_DAMAGE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: CRITICAL_DAMAGE");
                        if(_loc8_)
                        {
                           this.var_3231.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3231.var_451 = "";
                        }
                        this.var_3206[27] = this.var_3231;
                        break;
                     case ItemProperty.MECH_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: MECH_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3239.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3239.var_451 = "";
                        }
                        this.var_3206[13] = this.var_3239;
                        break;
                     case ItemProperty.FIRE_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: FIRE_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3250.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3250.var_451 = "";
                        }
                        this.var_3206[14] = this.var_3250;
                        break;
                     case ItemProperty.PLASMA_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: PLASMA_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3253.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3253.var_451 = "";
                        }
                        this.var_3206[15] = this.var_3253;
                        break;
                     case ItemProperty.RAIL_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: RAIL_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3256.var_451 = _loc12_.value;
                        }
                        this.var_3206[16] = this.var_3256;
                        break;
                     case ItemProperty.MINE_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: TERMINATOR_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3257.var_451 = _loc12_.value;
                        }
                        this.var_3206[24] = this.var_3257;
                        break;
                     case ItemProperty.VAMPIRE_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: VAMPIRE_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3234.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3234.var_451 = "";
                        }
                        this.var_3206[18] = this.var_3234;
                        break;
                     case ItemProperty.THUNDER_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: THUNDER_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3254.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3254.var_451 = "";
                        }
                        this.var_3206[19] = this.var_3254;
                        break;
                     case ItemProperty.FREEZE_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: VAMPIRE_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3243.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3243.var_451 = "";
                        }
                        this.var_3206[20] = this.var_3243;
                        break;
                     case ItemProperty.RICOCHET_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: VAMPIRE_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3233.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3233.var_451 = "";
                        }
                        this.var_3206[21] = this.var_3233;
                        break;
                     case ItemProperty.SHAFT_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: VAMPIRE_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3242.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3242.var_451 = "";
                        }
                        this.var_3206[22] = this.var_3242;
                        break;
                     case ItemProperty.ALL_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: VAMPIRE_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3252.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3252.var_451 = "";
                        }
                        this.var_3206[23] = this.var_3252;
                        break;
                     case ItemProperty.SHOTGUN_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: VAMPIRE_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3245.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3245.var_451 = "";
                        }
                        this.var_3206[23] = this.var_3245;
                        break;
                     case ItemProperty.VULCAN_RESISTANCE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: VAMPIRE_RESISTANCE");
                        if(_loc8_)
                        {
                           this.var_3240.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3240.var_451 = "";
                        }
                        this.var_3206[23] = this.var_3240;
                        break;
                     case ItemProperty.HEALING_RADIUS:
                        Main.method_8("GARAGE WINDOW","ItemProperty: HEALING_RADUIS");
                        if(_loc8_)
                        {
                           this.var_3236.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3236.var_451 = "";
                        }
                        this.var_3206[23] = this.var_3236;
                        break;
                     case ItemProperty.HEAL_RATE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: HEAL_RATE");
                        if(_loc8_)
                        {
                           this.var_3255.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3255.var_451 = "";
                        }
                        this.var_3206[5] = this.var_3255;
                        break;
                     case ItemProperty.VAMPIRE_RATE:
                        Main.method_8("GARAGE WINDOW","ItemProperty: VAMPIRE_RATE");
                        if(_loc8_)
                        {
                           this.var_3219.var_451 = _loc12_.value;
                        }
                        else
                        {
                           this.var_3219.var_451 = "";
                        }
                        this.var_3206[6] = this.var_3219;
                        break;
                  }
                  _loc11_++;
               }
               Main.method_8("GARAGE WINDOW"," ");
            }
         }
         else
         {
            _loc13_ = 0;
            while(_loc13_ < _loc9_.length)
            {
               _loc14_ = _loc9_[_loc13_] as name_323;
               switch(_loc14_.property)
               {
                  case ItemProperty.TURRET_TURN_SPEED:
                     Main.method_8("GARAGE WINDOW","ItemProperty: TURRET_TURN_SPEED");
                     if(_loc8_)
                     {
                        this.var_3224.var_451 = _loc12_.value;
                     }
                     else
                     {
                        this.var_3224.var_451 = "";
                     }
                     this.var_3206[4] = this.var_3224;
                     break;
                  case ItemProperty.SHAFT_DAMAGE:
                     Main.method_8("GARAGE WINDOW","ItemProperty: SHOT_FREQUENCY");
                     if(_loc8_)
                     {
                        this.var_3220.var_451 = _loc12_.value;
                     }
                     else
                     {
                        this.var_3220.var_451 = "";
                     }
                     this.var_3206[2] = this.var_3220;
                     break;
                  case ItemProperty.SHAFT_SHOT_FREQUENCY:
                     Main.method_8("GARAGE WINDOW","ItemProperty: SHOT_FREQUENCY");
                     if(_loc8_)
                     {
                        this.var_3223.var_451 = _loc12_.value;
                     }
                     else
                     {
                        this.var_3223.var_451 = "";
                     }
                     this.var_3206[3] = this.var_3223;
                     break;
                  case ItemProperty.SHOT_FREQUENCY:
                     Main.method_8("GARAGE WINDOW","ItemProperty: SHOT_FREQUENCY");
                     if(_loc8_)
                     {
                        this.var_3226.var_451 = _loc12_.value;
                     }
                     else
                     {
                        this.var_3226.var_451 = "";
                     }
                     this.var_3206[1] = this.var_3226;
                     break;
                  case ItemProperty.DAMAGE:
                     Main.method_8("GARAGE WINDOW","ItemProperty: SHOT_FREQUENCY");
                     if(_loc8_)
                     {
                        this.var_3222.var_451 = _loc12_.value;
                     }
                     else
                     {
                        this.var_3222.var_451 = "";
                     }
                     this.var_3206[0] = this.var_3222;
                     break;
               }
               _loc13_++;
            }
         }
         Main.method_8("GARAGE WINDOW","   visibleIcons.length before: %1",this.var_3206.length);
         _loc11_ = 0;
         while(_loc11_ < this.var_3206.length)
         {
            if(this.var_3206[_loc11_] == null)
            {
               this.var_3206.splice(_loc11_,1);
            }
            else
            {
               _loc11_++;
            }
         }
         Main.method_8("GARAGE WINDOW","   visibleIcons.length after: %1",this.var_3206.length);
         if(this.var_3206.length > 0)
         {
            this.showIcons();
            if(!this.var_2632.contains(this.var_3208))
            {
               this.var_2632.addChild(this.var_3208);
            }
         }
         else if(this.var_2632.contains(this.var_3208))
         {
            this.var_2632.removeChild(this.var_3208);
         }
         if(param2.name_373 == name_321.KIT)
         {
            _loc15_ = KitsInfoData.getData(param2.baseItemId);
            if(_loc15_ != null)
            {
               _loc16_ = _loc15_.info;
               this.var_3247 = true;
               this.method_2956();
               this.var_3213 = new name_3211();
               this.method_2958();
               this.var_3213.show(new name_3215(_loc16_),_loc15_.discount,param2.price);
            }
            else
            {
               this.var_3247 = false;
               this.method_2956();
            }
         }
         else
         {
            this.var_3247 = false;
            this.method_2956();
         }
         if(this.type == name_321.ARMOR || this.type == name_321.WEAPON || this.type == name_321.name_374)
         {
            this.var_3228.bitmapData = ItemInfoPanelBitmaps.name_3242;
            this.var_3221.bitmapData = ItemInfoPanelBitmaps.name_3248;
            this.var_3225.bitmapData = ItemInfoPanelBitmaps.name_3250;
            _loc17_ = param2.modifications;
            this.method_2964();
            this.var_3209.name_3247(_loc17_.length);
            this.var_3209.name_1879(param2.name_1360);
            _loc19_ = 0;
            while(_loc19_ < _loc17_.length)
            {
               _loc20_ = name_328(_loc17_[_loc19_]);
               Main.method_8("GARAGE WINDOW","   modInfo: %1",_loc20_);
               _loc21_ = ModInfoRow(this.var_3209.name_3240[_loc19_]);
               if(_loc21_ != null)
               {
                  _loc21_.var_2359.text = Money.name_876(_loc20_.crystalPrice,false);
                  if(_loc22_ < _loc21_.var_2359.width)
                  {
                     _loc22_ = _loc21_.var_2359.width;
                  }
                  this.var_3209.maxCostWidth = _loc22_;
                  Main.method_8("GARAGE WINDOW","   maxCostWidth: %1",this.var_3209.maxCostWidth);
                  Main.method_8("GARAGE WINDOW","   constWidth: %1",this.var_3209.name_3214);
                  _loc21_.const_126.name_2152(_loc20_.rankId);
                  _loc18_ = new Array();
                  _loc23_ = _loc20_.itemProperties;
                  if(param1.indexOf("shaft_") < 0)
                  {
                     Main.method_8("GARAGE WINDOW","   modProperties: %1",_loc23_);
                     _loc11_ = 0;
                     while(_loc11_ < _loc23_.length)
                     {
                        _loc12_ = _loc23_[_loc11_] as name_323;
                        switch(_loc12_.property)
                        {
                           case ItemProperty.ARMOR:
                              _loc18_[4] = _loc12_.value;
                              break;
                           case ItemProperty.DAMAGE:
                              _loc18_[4] = _loc12_.value;
                              break;
                           case ItemProperty.DAMAGE_PER_SECOND:
                              _loc18_[4] = _loc12_.value;
                              break;
                           case ItemProperty.AIMING_ERROR:
                              _loc18_[8] = _loc12_.value;
                              break;
                           case ItemProperty.CONE_ANGLE:
                              _loc18_[8] = _loc12_.value;
                              break;
                           case ItemProperty.SHOT_AREA:
                              _loc18_[10] = _loc12_.value;
                              break;
                           case ItemProperty.SHOT_FREQUENCY:
                              _loc18_[6] = _loc12_.value;
                              break;
                           case ItemProperty.SHAFT_DAMAGE:
                              _loc18_[7] = _loc12_.value;
                              break;
                           case ItemProperty.SHAFT_SHOT_FREQUENCY:
                              _loc18_[8] = _loc12_.value;
                              break;
                           case ItemProperty.SHOT_SPEED:
                              _loc18_[9] = _loc12_.value;
                              break;
                           case ItemProperty.TURRET_TURN_SPEED:
                              _loc18_[7] = _loc12_.value;
                              break;
                           case ItemProperty.SPEED:
                              _loc18_[11] = _loc12_.value;
                              break;
                           case ItemProperty.TURN_SPEED:
                              _loc18_[12] = _loc12_.value;
                              break;
                           case ItemProperty.WEIGHT:
                              _loc18_[13] = _loc12_.value;
                              break;
                           case ItemProperty.POWER:
                              _loc18_[14] = _loc12_.value;
                              break;
                           case ItemProperty.MECH_RESISTANCE:
                              _loc18_[13] = _loc12_.value;
                              break;
                           case ItemProperty.FIRE_RESISTANCE:
                              _loc18_[14] = _loc12_.value;
                              break;
                           case ItemProperty.PLASMA_RESISTANCE:
                              _loc18_[15] = _loc12_.value;
                              break;
                           case ItemProperty.RAIL_RESISTANCE:
                              _loc18_[16] = _loc12_.value;
                              break;
                           case ItemProperty.VAMPIRE_RESISTANCE:
                              _loc18_[17] = _loc12_.value;
                              break;
                           case ItemProperty.SHAFT_RESISTANCE:
                              _loc18_[18] = _loc12_.value;
                              break;
                           case ItemProperty.FREEZE_RESISTANCE:
                              _loc18_[21] = _loc12_.value;
                              break;
                           case ItemProperty.SHOTGUN_RESISTANCE:
                              _loc18_[22] = _loc12_.value;
                              break;
                           case ItemProperty.RICOCHET_RESISTANCE:
                              _loc18_[23] = _loc12_.value;
                              break;
                           case ItemProperty.VULCAN_RESISTANCE:
                              _loc18_[24] = _loc12_.value;
                              break;
                           case ItemProperty.THUNDER_RESISTANCE:
                              _loc18_[25] = _loc12_.value;
                              break;
                           case ItemProperty.MINE_RESISTANCE:
                              _loc18_[26] = _loc12_.value;
                              break;
                           case ItemProperty.ALL_RESISTANCE:
                              _loc18_[27] = _loc12_.value;
                              break;
                           case ItemProperty.HEALING_RADIUS:
                              _loc18_[18] = _loc12_.value;
                              break;
                           case ItemProperty.CRITICAL_CHANCE:
                              _loc18_[19] = _loc12_.value;
                              break;
                           case ItemProperty.CRITICAL_DAMAGE:
                              _loc18_[27] = _loc12_.value;
                              break;
                           case ItemProperty.IMPACT_FORCE:
                              _loc18_[5] = _loc12_.value;
                              break;
                           case ItemProperty.HEALING_TIME:
                              _loc18_[20] = _loc12_.value;
                              break;
                           case ItemProperty.HEAL_RATE:
                              _loc18_[5] = _loc12_.value;
                              break;
                           case ItemProperty.VAMPIRE_RATE:
                              _loc18_[6] = _loc12_.value;
                              break;
                        }
                        _loc11_++;
                     }
                  }
                  else
                  {
                     _loc11_ = 0;
                     while(_loc11_ < _loc23_.length)
                     {
                        _loc12_ = _loc23_[_loc11_] as name_323;
                        switch(_loc12_.property)
                        {
                           case ItemProperty.SHAFT_DAMAGE:
                              _loc18_[2] = _loc12_.value;
                              break;
                           case ItemProperty.SHAFT_SHOT_FREQUENCY:
                              _loc18_[3] = _loc12_.value;
                              break;
                           case ItemProperty.DAMAGE:
                              _loc18_[0] = _loc12_.value;
                              break;
                           case ItemProperty.TURRET_TURN_SPEED:
                              _loc18_[4] = _loc12_.value;
                              break;
                           case ItemProperty.SHOT_FREQUENCY:
                              _loc18_[1] = _loc12_.value;
                              break;
                        }
                        _loc11_++;
                     }
                  }
                  _loc11_ = 0;
                  while(_loc11_ < _loc18_.length)
                  {
                     if(_loc18_[_loc11_] == null)
                     {
                        _loc18_.splice(_loc11_,1);
                     }
                     else
                     {
                        _loc11_++;
                     }
                  }
                  _loc21_.name_3244(_loc18_.length);
                  _loc21_.name_3249(_loc18_);
               }
               _loc19_++;
            }
            this.var_3209.name_3246();
         }
         else
         {
            this.var_3228.bitmapData = ItemInfoPanelBitmaps.name_3232;
            this.var_3221.bitmapData = ItemInfoPanelBitmaps.name_3221;
            this.var_3225.bitmapData = ItemInfoPanelBitmaps.name_3226;
            this.method_2963();
         }
         if(param3)
         {
            this.name_2619.visible = true;
            this.name_2621.visible = false;
            this.name_2620.visible = false;
         }
         else if(this.type == name_321.INVENTORY)
         {
            this.name_2619.visible = true;
            this.name_2621.visible = false;
            this.name_2620.visible = false;
         }
         else
         {
            this.name_2619.visible = false;
            if(this.type == name_321.PLUGIN)
            {
               this.name_2621.visible = false;
               this.name_2620.visible = false;
            }
            else
            {
               this.name_2621.visible = true;
               if(this.type == name_321.ARMOR || this.type == name_321.WEAPON || this.type == name_321.name_374)
               {
                  this.name_2620.visible = param2.name_1360 < 3 && param2.modifications.length > 1;
               }
               else
               {
                  this.name_2620.visible = false;
               }
            }
         }
         this.var_3216.visible = this.var_3258;
         if(this.name_2619.visible)
         {
            _loc24_ = this.panelModel.rank >= this.params.rankId ? this.params.rankId : int(-this.params.rankId);
            if(this.type == name_321.INVENTORY)
            {
               _loc26_ = this.name_1537.value * this.params.price;
               this.name_1537.visible = true;
               _loc27_ = Math.min(ItemInfoPanel.const_2532,Math.floor(this.panelModel.crystal / this.params.price));
               if(_loc24_ > 0)
               {
                  if(_loc27_ > 0)
                  {
                     this.name_1537.enabled = true;
                     this.name_1537.alpha = 1;
                  }
                  else
                  {
                     this.name_1537.enabled = false;
                     this.name_1537.alpha = 0.7;
                  }
               }
               else
               {
                  this.name_1537.enabled = false;
                  this.name_1537.alpha = 0.7;
               }
            }
            else
            {
               _loc26_ = this.params.price;
               this.name_1537.visible = false;
            }
            _loc25_ = String(this.localeService.getText(name_390.name_1366));
            this.name_2619.name_1342(_loc25_);
            this.name_2619.name_1375(_loc26_,1,_loc24_);
            this.name_2619.enabled = this.panelModel.crystal >= this.params.price && _loc24_ > 0;
            if(_loc24_ > 0 && _loc26_ < 0)
            {
               this.var_3264 = -_loc26_ - this.panelModel.crystal;
            }
         }
         else if(this.name_2620.visible)
         {
            this.name_1537.visible = false;
            _loc26_ = this.params.name_1372;
            _loc24_ = this.panelModel.rank >= this.params.name_1376 ? this.params.name_1376 : int(-this.params.name_1376);
            _loc25_ = String(this.localeService.getText(name_390.const_1093));
            this.name_2620.name_1342(_loc25_);
            this.name_2620.name_1375(_loc26_,1,_loc24_);
            this.name_2620.enabled = this.panelModel.crystal > this.params.name_1372 && _loc24_ > 0;
            if(this.params.name_1372 > this.panelModel.crystal && this.panelModel.rank >= this.params.name_1376)
            {
               this.var_3264 = -_loc26_ - this.panelModel.crystal;
            }
         }
         else
         {
            this.name_1537.visible = false;
         }
         this.method_2955();
         this.method_904();
         if(this.type == name_321.PLUGIN && !param3)
         {
            if(!this.var_2632.contains(this.var_3211))
            {
               this.var_2632.addChild(this.var_3211);
            }
            _loc28_ = (this.modelRegister.getModelsByInterface(name_364) as Vector.<IModel>)[0] as name_364;
            this.name_1559 = new Date(_loc28_.method_1113(param1));
         }
         else if(this.var_2632.contains(this.var_3211))
         {
            this.var_2632.removeChild(this.var_3211);
         }
         if(!(this.var_3227.visible = !(param2.id != null && Boolean(param2.id.method_316(class_55)))))
         {
            class_55(param2.id.event(class_55)).updateActionElements(this.var_3218,this);
         }
      }
      
      private function method_2958() : void
      {
         if(!this.var_2632.contains(this.var_3213))
         {
            this.var_2632.addChild(this.var_3213);
         }
      }
      
      private function method_2956() : void
      {
         if(this.var_2632.contains(this.var_3213))
         {
            this.var_2632.removeChild(this.var_3213);
         }
      }
      
      public function method_904() : void
      {
         if(Boolean(lobbyLayoutService.inBattle()) && !battleInfoService.reArmorEnabled && this.params.name_373 != name_321.COLOR)
         {
            this.name_2621.enabled = false;
            return;
         }
         if(this.method_2960())
         {
            this.method_908();
         }
         else
         {
            this.name_2621.enabled = false;
            this.name_2621.name_1363();
         }
      }
      
      private function method_2960() : Boolean
      {
         return this.params.name_373 != name_321.INVENTORY && this.params.name_373 != name_321.PLUGIN && !this.params.name_1359;
      }
      
      private function method_908() : void
      {
         var _loc1_:CountDownTimer = delayMountCategoryService.name_1377(this.params.baseItemId);
         if(this.params.name_373 != name_321.COLOR && Boolean(lobbyLayoutService.inBattle()) && _loc1_.name_1368() > 0)
         {
            this.name_2621.startTimer(_loc1_);
            this.name_2621.addEventListener(name_1356.name_1364,this.method_895);
         }
         else
         {
            this.name_2621.name_1363();
            if(OSGi.getInstance().getService(name_381) == null)
            {
               this.name_2621.enabled = true;
            }
            else
            {
               this.name_2621.enabled = GarageModel(OSGi.getInstance().getService(name_381)).mountedItems.indexOf(this.params.baseItemId) == -1;
            }
         }
      }
      
      private function method_895(param1:name_1356) : void
      {
         if(this.name_2621 != null && OSGi.getInstance().getService(name_381) != null)
         {
            this.name_2621.enabled = GarageModel(OSGi.getInstance().getService(name_381)).mountedItems.indexOf(this.params.baseItemId) == -1;
            this.name_2621.removeEventListener(name_1356.name_1364,this.method_895);
         }
      }
      
      private function method_2959(param1:TankWindowInner) : Number
      {
         var _loc2_:MountedResistancesPanel = this.method_2957();
         _loc2_.visible = this.var_3263 == ItemViewCategoryEnum.RESISTANCE;
         if(_loc2_.visible)
         {
            param1.height -= _loc2_.height + this.var_3210 / 2;
            _loc2_.resize(param1.width);
         }
         return param1.height;
      }
      
      public function onMountItem() : void
      {
         if(this.item == null)
         {
            return;
         }
         if(!this.var_3227.visible)
         {
            class_55(this.item.event(class_55)).updateActionElements(this.var_3218,this);
         }
         else
         {
            this.method_2955();
            this.method_904();
         }
      }
      
      private function method_2955() : void
      {
         var _loc1_:int = this.var_3218.y;
         if(this.name_2619.visible)
         {
            this.name_2619.y = _loc1_;
            if(this.type == name_321.INVENTORY)
            {
               this.name_1537.x = -7;
               this.name_1537.y = this.name_2619.y + Math.round((this.const_1677.y - this.name_1537.height) * 0.5);
               this.name_2619.x = this.name_1537.x + this.name_1537.width + 10;
            }
            else
            {
               this.name_2619.x = 11;
            }
         }
         if(this.name_2621.visible)
         {
            this.name_2621.y = _loc1_;
            this.name_2621.x = this.size.x - 11 - this.const_1677.x;
         }
         if(this.name_2620.visible)
         {
            this.name_2620.y = _loc1_;
            this.name_2620.x = 11;
         }
      }
      
      public function method_2965() : String
      {
         return this.var_3270;
      }
      
      public function resize(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Array = null;
         var _loc13_:int = 0;
         var _loc14_:name_3210 = null;
         var _loc15_:int = 0;
         var _loc16_:ModInfoRow = null;
         var _loc17_:Vector.<Number> = null;
         Main.method_8("GARAGE WINDOW","ItemInfoPanel resize width: %1, height: %2",param1,param2);
         this.var_2630.update();
         this.size.x = param1;
         this.size.y = param2;
         this.window.width = param1;
         this.window.height = param2;
         this.var_1182.width = param1 - 11 * 2;
         this.var_1182.height = param2 - 11 - 64;
         this.var_3212.width = param1 - 11 * 2 - 2;
         this.areaRect2.width = this.var_3212.width - this.var_3217 * 2;
         this.var_3207.x = this.var_3217 - 3;
         this.var_3207.width = this.areaRect2.width;
         if(this.var_3206 != null)
         {
            _loc4_ = int(this.var_3206.length);
            if(_loc4_ > 0)
            {
               _loc3_ = this.var_3208.y + this.var_3208.height + this.var_3210;
               this.var_3225.x = this.areaRect2.width - this.var_3225.width;
               this.var_3221.width = this.var_3225.x - this.var_3221.x;
               _loc8_ = 6;
               _loc9_ = const_2485.width * _loc4_ + 10 * (_loc4_ - 1);
               _loc10_ = _loc9_;
               if(this.var_2632.contains(this.var_3209))
               {
                  _loc10_ += this.var_3209.name_3214;
               }
               _loc11_ = this.var_3208.width - _loc10_ >> 1;
               _loc12_ = new Array();
               _loc13_ = 0;
               while(_loc13_ < _loc4_)
               {
                  _loc14_ = this.var_3206[_loc13_] as name_3210;
                  _loc14_.x = _loc11_ + _loc13_ * (const_2485.width + 10);
                  _loc14_.y = _loc8_;
                  _loc13_++;
               }
               if(this.type == name_321.ARMOR || this.type == name_321.WEAPON || this.type == name_321.name_374)
               {
                  this.var_3209.name_3243(this.areaRect2.width);
                  _loc15_ = 0;
                  _loc16_ = null;
                  _loc17_ = null;
                  for each(_loc16_ in this.var_3209.name_3240)
                  {
                     _loc16_.name_868();
                  }
                  _loc17_ = _loc16_.name_3245();
                  _loc15_ = 0;
                  while(_loc15_ < _loc17_.length)
                  {
                     _loc14_ = this.var_3206[_loc15_] as name_3210;
                     _loc14_.x = _loc17_[_loc15_] - _loc14_.width / 2;
                     _loc14_.y = _loc8_;
                     _loc15_++;
                  }
               }
               this.var_3209.y = this.var_3208.y + _loc14_.height + 2;
               this.var_3207.y = this.var_3208.y + this.var_3208.height + this.var_3210 - 4;
            }
            else
            {
               this.var_3207.y = this.areaRect2.y + 24 - 7;
            }
         }
         else
         {
            this.var_3207.y = this.areaRect2.y + 24 - 7;
         }
         if(this.var_3258)
         {
            this.var_3216.y = this.var_3207.y;
            this.var_3207.y += this.var_3216.height + 5;
         }
         _loc3_ += this.var_3210 + this.var_3207.textHeight - 4;
         var _loc5_:int = _loc3_;
         if(this.preview.bitmapData != null)
         {
            this.var_3259 = true;
            this.preview.x = !this.var_3247 ? 11 : this.var_2632.width - this.preview.width >> 1;
            if(_loc4_ > 0)
            {
               this.preview.y = this.var_3207.y;
            }
            else
            {
               this.preview.y = this.areaRect2.y + 24;
            }
            this.var_3207.x = this.preview.x + this.preview.width + 5;
            this.var_3207.width = this.areaRect2.width - this.var_3207.x + 11;
            _loc3_ = Math.max(this.var_3207.y + 3 + this.var_3207.textHeight + this.var_3210,this.preview.y + this.preview.height + this.var_3210);
         }
         else
         {
            _loc3_ = this.var_3207.y + 3 + this.var_3207.textHeight + this.var_3210;
         }
         var _loc6_:* = this.method_2959(this.var_1182) - 2 - this.const_1944 * 2;
         var _loc7_:int = Math.max(_loc3_,_loc6_);
         this.var_3212.height = _loc7_;
         this.areaRect2.height = this.area.height - this.var_3210 * 2;
         if(_loc7_ > param2 - 11 - 64 - 2 - this.const_1944 * 2)
         {
            this.var_3259 = false;
            this.var_3207.x = this.var_3217 - 3;
            this.var_3207.width = this.areaRect2.width;
            _loc3_ = _loc5_;
            _loc7_ = Math.max(_loc3_,param2 - 11 - 64 - 2 - this.const_1944 * 2);
            this.var_3212.height = _loc7_;
            this.areaRect2.height = this.area.height - this.var_3210 * 2;
         }
         if(this.var_3247)
         {
            if(this.var_3213 != null)
            {
               this.var_3213.x = this.areaRect2.width - this.var_3213.width + 5;
               this.var_3213.y = this.preview.y + this.preview.height + 10;
            }
         }
         this.area.graphics.clear();
         this.area.graphics.beginFill(16711680,0);
         this.area.graphics.drawRect(this.var_3212.x,this.var_3212.y,this.var_3212.width,this.var_3212.height);
         if(this.var_3259)
         {
            this.method_2961();
         }
         else
         {
            this.method_2962();
         }
         this.var_3218.y = this.size.y - 11 - this.const_1677.y + 1;
         this.method_2955();
         this.method_904();
         if(this.var_3215.visible)
         {
            this.var_3215.y = this.var_3218.y - this.var_3215.height - this.var_3210 / 2;
            this.var_3215.x = this.var_1182.x;
         }
         this.var_2630.setSize(param1 - 11 * 2 - 2 + 6,_loc6_);
         this.var_2630.update();
         if(this.var_2632.contains(this.var_3211))
         {
            this.var_3211.x = this.areaRect2.x + this.areaRect2.width - this.var_3211.width + 3;
            this.var_3211.y = this.areaRect2.y - 7;
         }
      }
      
      public function method_2963() : void
      {
         if(this.var_2632.contains(this.var_3209))
         {
            this.var_2632.removeChild(this.var_3209);
         }
      }
      
      public function method_2964() : void
      {
         if(!this.var_2632.contains(this.var_3209))
         {
            this.var_2632.addChild(this.var_3209);
         }
      }
      
      public function method_2962() : void
      {
         if(this.var_2632.contains(this.preview))
         {
            this.var_2632.removeChild(this.preview);
         }
      }
      
      public function method_2961() : void
      {
         var _loc1_:name_324 = null;
         var _loc2_:Long = null;
         var _loc3_:ImageResource = null;
         var _loc4_:BitmapData = null;
         var _loc5_:ImageResource = null;
         if(!this.var_2632.contains(this.preview))
         {
            this.var_2632.addChild(this.preview);
            if(this.id != null)
            {
               _loc1_ = GarageModel.name_377(this.id) as name_324;
               _loc2_ = _loc1_.previewId;
               if(_loc2_ != null)
               {
                  _loc3_ = ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(_loc2_));
                  if(_loc1_.name_373 == name_321.KIT)
                  {
                     _loc5_ = KitsInfoData.getImage(_loc1_.baseItemId);
                     if(_loc5_ != null)
                     {
                        _loc3_ = _loc5_;
                     }
                  }
                  _loc4_ = null;
                  if(_loc3_ != null && _loc3_.data != null)
                  {
                     _loc4_ = _loc3_.data;
                  }
                  else if(_loc3_ != null && !_loc3_.isLoaded)
                  {
                     _loc3_.loadLazyResource(this);
                  }
                  else
                  {
                     _loc4_ = new StubBitmapData(16711680);
                  }
                  this.preview.bitmapData = _loc4_;
               }
            }
         }
      }
      
      public function onResourceLoadingComplete(param1:Resource) : void
      {
         var _loc2_:name_324 = null;
         var _loc3_:Long = null;
         var _loc4_:ImageResource = null;
         if(this.id != null)
         {
            _loc2_ = GarageModel.name_377(this.id) as name_324;
            _loc3_ = _loc2_.previewId;
            if(_loc2_.name_373 == name_321.KIT)
            {
               _loc4_ = KitsInfoData.getImage(_loc2_.baseItemId);
               if(_loc4_ != null)
               {
                  if(_loc4_.id == param1.id)
                  {
                     this.preview.bitmapData = ImageResource(param1).data;
                     this.resize(this.size.x,this.size.y);
                  }
               }
            }
            else if(_loc3_ != null && param1.id == _loc3_)
            {
               this.preview.bitmapData = ImageResource(param1).data;
               this.resize(this.size.x,this.size.y);
            }
         }
      }
      
      public function onResourceLoadingError(param1:Resource, param2:String) : void
      {
      }
      
      public function onResourceLoadingFatalError(param1:Resource, param2:String) : void
      {
      }
      
      public function onResourceLoadingStart(param1:Resource) : void
      {
      }
      
      public function set name_1559(param1:Date) : void
      {
         var _loc5_:String = null;
         Main.method_8("TIME INDICATOR"," ");
         var _loc2_:String = (param1.hours < 10 ? "0" + String(param1.hours) : String(param1.hours)) + ":" + (param1.minutes < 10 ? "0" + String(param1.minutes) : String(param1.minutes));
         var _loc3_:String = param1.month + 1 < 10 ? "0" + String(param1.month + 1) : String(param1.month + 1);
         var _loc4_:String = param1.date < 10 ? "0" + String(param1.date) : String(param1.date);
         if(this.localeService.getText(TextConst.GUI_LANG) == "ru")
         {
            _loc5_ = _loc4_ + "-" + _loc3_ + "-" + String(param1.fullYear);
         }
         else
         {
            _loc5_ = _loc3_ + "-" + _loc4_ + "-" + String(param1.fullYear);
         }
         this.var_3211.text = _loc4_ != "NaN" ? _loc2_ + "  " + _loc5_ : " ";
         Main.method_8("TIME INDICATOR","set remainingDate: " + _loc2_ + " " + _loc5_);
         this.resize(this.size.x,this.size.y);
      }
      
      private function inventoryNumChanged(param1:Event = null) : void
      {
         Main.method_8("GARAGE WINDOW","inventoryNumChanged");
         Main.method_8("GARAGE WINDOW","totalPrice: " + this.params.price * this.name_1537.value);
         var _loc2_:int = this.params.rankId;
         var _loc3_:int = this.params.price * this.name_1537.value;
         var _loc4_:String = String(this.localeService.getText(name_390.name_1366));
         this.name_2619.name_1342(_loc4_);
         this.name_2619.name_1375(_loc3_,1,_loc2_);
         this.name_2619.enabled = this.panelModel.crystal >= this.params.price * this.name_1537.value && _loc2_ > 0;
         if(_loc2_ > 0 && _loc3_ < 0)
         {
         }
         this.method_2955();
      }
   }
}
