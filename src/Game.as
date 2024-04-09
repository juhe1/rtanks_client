package
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.loader.LoaderWindow;
   import alternativa.tanks.loader.name_13;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.tank.TankModel;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import juho.hacking.HackRegistry;
   import package_1.BattlefieldModelActivator;
   import package_1.Main;
   import package_1.TanksServicesActivator;
   import package_1.name_10;
   import package_1.BattlefieldSharedActivator;
   import package_1.TanksWarfareActivator;
   import package_1.BattlefieldGUIActivator;
   import package_1.name_3;
   import package_1.name_4;
   import package_1.name_5;
   import package_1.name_7;
   import package_1.name_8;
   import package_10.StartupSettings;
   import package_11.IBundleActivator;
   import package_2.AESEncrypterModel;
   import package_2.name_9;
   import package_3.GPUCapabilities;
   import package_4.ClientObject;
   import package_5.ServerConnectionServiceImpl;
   import package_5.name_21;
   import package_6.ObjectRegister;
   import package_7.name_11;
   import package_8.Activator;
   import package_9.name_14;
   import platform.client.fp10.core.network.connection.name_12;
   import platform.client.fp10.core.osgi.ResourceActivator;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   import scpacker.resource.ResourceLoaderModel;
   
   public class Game extends Sprite
   {
      
      public static var getInstance:Game;
      
      public static var var_1:String;
      
      public static var local:Boolean = false;
      
      public static var var_3:Boolean = true;
      
      public static var _stage:Stage;
      
      private static var var_2:Boolean;
       
      
      public var osgi:OSGi;
      
      public var var_4:Main;
      
      public var var_11:BattlefieldModelActivator;
      
      public var var_15:BattlefieldSharedActivator;
      
      public var panel:name_4;
      
      public var locale:name_5;
      
      public var services:TanksServicesActivator;
      
      public var warfare:TanksWarfareActivator;
      
      public var var_12:BattlefieldGUIActivator;
      
      public var var_9:name_8;
      
      public var var_8:name_3;
      
      public var var_5:name_7;
      
      public var var_6:ClientObject;
      
      public var var_14:BattlefieldModel;
      
      public var var_13:TankModel;
      
      public var var_10:Object;
      
      public var var_7:IBundleActivator;
      
      public function Game()
      {
         this.var_9 = new name_8();
         this.var_8 = new name_3();
         this.var_5 = new name_7();
         super();
         if(numChildren > 1)
         {
            removeChildAt(0);
            removeChildAt(0);
         }
         this.var_7 = new ResourceActivator();
      }
      
      public function activateAllModels(param1:Object) : void
      {
         this.var_4.start(this.osgi);
         this.var_5.start(this.osgi);
         var _loc2_:String = String(param1["lang"]);
         if(_loc2_ == null || _loc2_ == "ru")
         {
            this.var_9.start(this.osgi);
            var_1 = "RU";
         }
         else
         {
            this.var_8.start(this.osgi);
            var_1 = "EN";
         }
         new name_14().start(this.osgi);
         this.panel.start(this.osgi);
         this.locale.start(this.osgi);
         this.services.start(this.osgi);
         this.var_7.start(this.osgi);
         new name_10().start(this.osgi);
         new Activator().start(this.osgi);
      }
      
      public function SUPER(param1:Stage, param2:DisplayObjectContainer, param3:Object = null) : void
      {
         new HackRegistry();
         if(var_2)
         {
            return;
         }
         var_2 = true;
         _stage = param1;
         this.focusRect = false;
         param1.focus = this;
         param1.scaleMode = StageScaleMode.NO_SCALE;
         param1.align = StageAlign.TOP_LEFT;
         this.osgi = OSGi.init(false,param1,param2,"127.0.0.1",[12345],"127.0.0.1",12345,param3["resources"],new name_11(),param3["lang"].toUpperCase(),Object);
         this.var_4 = new Main();
         this.var_11 = new BattlefieldModelActivator();
         this.panel = new name_4();
         this.locale = new name_5();
         this.services = new TanksServicesActivator();
         getInstance = this;
         this.activateAllModels(param3);
         var _loc4_:GPUCapabilities = new GPUCapabilities(param1);
         _loc4_.name_20();
         if(parent != null)
         {
            if(parent.parent != null)
            {
               if(parent.parent.parent != null)
               {
                  StartupSettings.name_22 = Sprite(parent.parent.parent);
               }
            }
         }
         var _loc5_:LoaderWindow = Main.osgi.getService(name_13) as LoaderWindow;
         _loc5_.show();
         this.var_10 = new Object();
         var _loc6_:ObjectRegister = new ObjectRegister(null);
         this.var_6 = new ClientObject("rtanks",null,"RTanks",null);
         this.var_6.register = _loc6_;
         _loc6_.name_15("rtanks",null,"RTanks");
         var _loc7_:name_21 = new ServerConnectionServiceImpl();
         _loc7_.connect(new name_12(param3["ip"],Vector.<int>([param3["port"]])),this.method_1);
      }
      
      private function method_1() : void
      {
         this.method_2(null);
      }
      
      private function method_2(param1:Event) : void
      {
         var _loc2_:Network = Main.osgi.getService(name_2) as Network;
         var _loc3_:Lobby = new Lobby();
         Main.osgi.registerService(ILobby,_loc3_);
         Main.osgi.registerService(ClansController,new ClansController());
         var _loc4_:Authorization = new Authorization();
         Main.osgi.registerService(IAuthorization,_loc4_);
         var _loc5_:AESEncrypterModel = new AESEncrypterModel();
         Main.osgi.registerService(name_9,_loc5_);
         _loc2_.addListener(_loc5_);
         _loc5_.name_16(_loc2_);
         var _loc6_:ResourceLoaderModel = new ResourceLoaderModel();
         Main.osgi.registerService(ResourceLoaderModel,_loc6_);
         Network(Main.osgi.getService(name_2)).addListener(_loc6_);
      }
   }
}
