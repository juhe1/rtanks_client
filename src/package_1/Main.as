package package_1
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.command.name_43;
   import alternativa.osgi.service.console.Console;
   import alternativa.osgi.service.console.ConsoleLogTarget;
   import alternativa.osgi.service.console.name_25;
   import alternativa.osgi.service.console.name_27;
   import alternativa.osgi.service.logging.name_26;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import package_11.IBundleActivator;
   import package_12.name_24;
   import package_13.Long;
   import package_13.LongFactory;
   import package_14.name_36;
   import package_14.name_37;
   import package_14.name_41;
   import package_15.FullscreenServiceImpl;
   import package_15.name_35;
   import package_16.LoadingProgress;
   import package_16.name_30;
   import package_17.name_39;
   import package_17.name_44;
   import package_18.name_34;
   import package_18.name_38;
   import package_19.AlertService;
   import package_19.name_42;
   import package_20.GameObject;
   import package_20.Space;
   import package_21.CommandServiceImpl;
   import package_22.DispatcherModel;
   import package_23.SWFAddressEvent;
   import package_24.name_50;
   import package_6.ClassRegister;
   import package_6.ModelsRegister;
   import package_7.AddressService;
   import package_7.name_28;
   import package_7.name_32;
   import package_7.name_46;
   import platform.client.fp10.core.registry.impl.GameTypeRegistryImpl;
   import platform.client.fp10.core.registry.impl.ModelsRegistryImpl;
   import platform.client.fp10.core.registry.impl.SpaceRegistryImpl;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.registry.name_33;
   import platform.client.fp10.core.registry.name_45;
   
   public class Main implements IBundleActivator
   {
      
      public static var stage:Stage;
      
      public static var mainContainer:DisplayObjectContainer;
      
      public static var backgroundLayer:DisplayObjectContainer;
      
      public static var contentLayer:DisplayObjectContainer;
      
      public static var contentUILayer:DisplayObjectContainer;
      
      public static var systemLayer:DisplayObjectContainer;
      
      public static var systemUILayer:DisplayObjectContainer;
      
      public static var dialogsLayer:DisplayObjectContainer;
      
      public static var noticesLayer:DisplayObjectContainer;
      
      public static var cursorLayer:DisplayObjectContainer;
      
      public static var loadingProgress:LoadingProgress;
      
      public static var osgi:OSGi;
      
      public static var var_16:int;
      
      public static var var_17:name_50;
      
      private static const const_2:String = "show_log_msgs";
      
      private static const const_1:String = "show_all_log_msgs";
       
      
      private var console:name_27;
      
      private var commandService:CommandServiceImpl;
      
      private var logService:name_26;
      
      public function Main()
      {
         super();
      }
      
      public static function method_10(param1:Array) : void
      {
      }
      
      public static function method_6() : void
      {
      }
      
      public static function method_7(param1:String, param2:uint = 0) : void
      {
      }
      
      public static function method_9(param1:String, ... rest) : void
      {
      }
      
      public static function method_8(param1:String, param2:String, ... rest) : void
      {
      }
      
      public static function hideConsole() : void
      {
         name_25(Main.osgi.getService(name_25)).hideConsole();
      }
      
      public static function showConsole() : void
      {
         name_25(Main.osgi.getService(name_25)).showConsole();
      }
      
      private static function method_3(param1:Event) : void
      {
      }
      
      public function start(param1:OSGi) : void
      {
         osgi = param1;
         this.logService = osgi.getService(name_26) as name_26;
         OSGi.clientLog = new name_41(this.logService);
         osgi.name_40(name_26,Space,"logService");
         osgi.registerService(name_45,new GameTypeRegistryImpl());
         osgi.registerService(name_33,new SpaceRegistryImpl());
         osgi.registerService(name_29,new ModelsRegistryImpl(osgi));
         osgi.name_40(name_29,GameObject,"modelRegistry");
         var _loc2_:name_24 = name_24(osgi.getService(name_24));
         var _loc3_:FullscreenServiceImpl = new FullscreenServiceImpl(_loc2_,null);
         osgi.registerService(name_34,_loc3_);
         osgi.registerService(name_38,new name_35(_loc2_,_loc3_.name_49()));
         osgi.registerService(name_44,new name_39());
         osgi.registerService(name_46,new ClassRegister());
         var _loc4_:name_32 = new ModelsRegister();
         osgi.registerService(name_32,_loc4_);
         var _loc5_:name_28 = new AddressService();
         osgi.registerService(name_28,_loc5_);
         if(_loc5_.getBaseURL() != "" && _loc5_.getBaseURL() != "undefined")
         {
            _loc5_.addEventListener(SWFAddressEvent.CHANGE,method_3);
         }
         else
         {
            osgi.unregisterService(name_28);
         }
         var _loc6_:Long = LongFactory.name_31(0,0);
         var _loc7_:Long = LongFactory.name_31(0,1);
         var _loc8_:Long = LongFactory.name_31(0,2);
         _loc4_.register("0","0");
         _loc4_.register("0","1");
         _loc4_.register("0","2");
         _loc4_.add(new DispatcherModel());
         stage = name_24(osgi.getService(name_24)).stage;
         mainContainer = name_24(osgi.getService(name_24)).mainContainer;
         backgroundLayer = name_24(osgi.getService(name_24)).backgroundLayer;
         contentLayer = name_24(osgi.getService(name_24)).contentLayer;
         contentUILayer = name_24(osgi.getService(name_24)).contentUILayer;
         systemLayer = name_24(osgi.getService(name_24)).systemLayer;
         systemUILayer = name_24(osgi.getService(name_24)).systemUILayer;
         dialogsLayer = name_24(osgi.getService(name_24)).dialogsLayer;
         noticesLayer = name_24(osgi.getService(name_24)).noticesLayer;
         cursorLayer = name_24(osgi.getService(name_24)).cursorLayer;
         loadingProgress = name_30(osgi.getService(name_30)).loadingProgress;
         osgi.registerService(name_42,new AlertService());
         this.commandService = new CommandServiceImpl();
         param1.registerService(name_43,this.commandService);
         param1.registerService(name_36,new name_37(this.logService));
         if(Boolean(this.console))
         {
            return;
         }
         this.console = this.method_5(stage);
         param1.registerService(name_27,this.console);
         this.logService.name_47(new ConsoleLogTarget(this.commandService,this.console,null));
         this.method_4(stage,this.console,"show,ha,va,w,h,alpha");
      }
      
      private function method_5(param1:Stage) : name_27
      {
         return new Console(this.commandService,param1,50,100,1,1);
      }
      
      private function method_4(param1:Stage, param2:name_27, param3:String) : void
      {
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:Array = param3.split(",");
         var _loc7_:Object = {};
         for each(_loc4_ in _loc6_)
         {
            _loc5_ = _loc4_.split(":");
            _loc7_[_loc5_[0]] = _loc5_[1];
         }
         if(_loc7_["show"] != null)
         {
            param2.show();
         }
         if(_loc7_["ha"] != null)
         {
            param2.horizontalAlignment = int(_loc7_["ha"]);
         }
         if(_loc7_["va"] != null)
         {
            param2.vericalAlignment = int(_loc7_["va"]);
         }
         if(_loc7_["w"] != null)
         {
            param2.width = int(_loc7_["w"]);
         }
         if(_loc7_["h"] != null)
         {
            param2.height = int(_loc7_["h"]);
         }
         if(_loc7_["alpha"] != null)
         {
            param2.name_51("con_alpha " + _loc7_["alpha"]);
         }
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}
