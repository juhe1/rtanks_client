package alternativa.osgi
{
   import alternativa.osgi.service.console.ConsoleService;
   import alternativa.osgi.service.console.name_25;
   import alternativa.osgi.service.console.name_530;
   import alternativa.osgi.service.dump.DumpService;
   import alternativa.osgi.service.dump.name_524;
   import alternativa.osgi.service.logging.name_11;
   import alternativa.osgi.service.logging.name_26;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.net.SharedObject;
   import flash.system.ApplicationDomain;
   import flash.utils.Dictionary;
   import package_11.IBundleActivator;
   import package_11.name_522;
   import package_12.name_24;
   import package_12.name_529;
   import package_14.name_533;
   import package_16.name_30;
   import package_16.name_532;
   import package_171.name_527;
   import package_171.name_528;
   import package_172.name_525;
   import package_172.name_531;
   import package_173.LogServiceImpl;
   import package_34.BundleDumper;
   import package_34.ServiceDumper;
   import package_35.FocusService;
   import package_35.name_98;
   import package_36.NetworkService;
   import package_36.name_105;
   import package_54.LocaleService;
   import package_54.name_102;
   import package_95.IStorageService;
   import package_95.name_526;
   
   public class OSGi
   {
      
      private static var instance:OSGi;
      
      public static var clientLog:name_533;
       
      
      private const const_24:RegExp = /^\s*(.*?)\s*$/;
      
      private var var_90:Dictionary;
      
      private var var_88:Vector.<name_522>;
      
      private var services:Dictionary;
      
      private var var_89:Vector.<Object>;
      
      private var var_91:Dictionary;
      
      private var var_17:name_11;
      
      public function OSGi()
      {
         super();
         this.services = new Dictionary(false);
         this.var_90 = new Dictionary(false);
         this.var_88 = new Vector.<name_522>();
         this.var_89 = new Vector.<Object>();
         this.var_91 = new Dictionary();
         this.method_119();
      }
      
      public static function init(param1:Boolean, param2:Stage, param3:DisplayObjectContainer, param4:String, param5:Array, param6:String, param7:int, param8:String, param9:Object, param10:String, param11:Object) : OSGi
      {
         param3.focusRect = false;
         instance = new OSGi();
         instance.registerService(name_528,new name_527(param11));
         if(param1)
         {
            instance.registerService(name_25,new ConsoleService(param9));
            instance.registerService(name_531,new name_525());
         }
         else
         {
            instance.registerService(name_25,new name_530());
         }
         instance.registerService(name_98,new FocusService(param2));
         instance.registerService(name_24,new name_529(param2,param3));
         instance.registerService(name_105,new NetworkService(param4,param5,param8,param6,param7));
         instance.registerService(IStorageService,new name_526(instance.method_118("name"),instance.method_118("accounts")));
         var _loc12_:name_524 = new DumpService(instance);
         instance.registerService(name_524,_loc12_);
         instance.registerService(name_30,new name_532());
         instance.registerService(name_102,new LocaleService(param10));
         _loc12_.registerDumper(new BundleDumper(instance));
         _loc12_.registerDumper(new ServiceDumper(instance));
         return instance;
      }
      
      public static function get osgi() : OSGi
      {
         return instance;
      }
      
      public static function getInstance() : OSGi
      {
         return instance;
      }
      
      private function method_119() : void
      {
         var _loc1_:LogServiceImpl = new LogServiceImpl();
         this.var_17 = _loc1_.getLogger("OSGI");
         this.registerService(name_26,_loc1_);
      }
      
      public function method_123(param1:String) : name_522
      {
         var _loc2_:name_25 = this.getService(name_25) as name_25;
         var _loc3_:name_522 = this.method_120(param1);
         if(_loc3_ != null)
         {
            if(this.var_90[_loc3_.name] != null)
            {
               throw new Error("Bundle [" + _loc3_.name + "] already installed");
            }
            this.var_90[_loc3_.name] = _loc3_;
            this.var_88.push(_loc3_);
            if(_loc3_.name_523 != null)
            {
               _loc3_.name_523.start(this);
            }
            else
            {
               this.var_17.debug("Bundle activator = null");
            }
         }
         else
         {
            this.var_17.debug("Bundle = null");
         }
         this.var_17.debug("Bundle " + _loc3_.name + " installed");
         return _loc3_;
      }
      
      private function method_120(param1:String) : name_522
      {
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc9_:String = null;
         var _loc10_:Class = null;
         var _loc11_:IBundleActivator = null;
         var _loc2_:Array = param1.split(/\r*\n/);
         var _loc3_:Dictionary = new Dictionary(false);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc7_ = String(_loc2_[_loc4_].replace(this.const_24,"$1"));
            if(_loc7_.length != 0)
            {
               _loc8_ = _loc7_.split(/\s*:\s*/,2);
               _loc9_ = String(_loc8_[1].replace(this.const_24,"$1"));
               _loc3_[_loc8_[0]] = _loc9_;
            }
            _loc4_++;
         }
         var _loc5_:String = String(_loc3_["Bundle-Name"]);
         var _loc6_:String = String(_loc3_["Bundle-Activator"]);
         if(ApplicationDomain.currentDomain.hasDefinition(_loc6_))
         {
            _loc10_ = Class(ApplicationDomain.currentDomain.getDefinition(_loc6_));
            _loc11_ = IBundleActivator(new _loc10_());
         }
         if(_loc5_ != "" && _loc5_ != null)
         {
            return new name_522(_loc5_,_loc11_,_loc3_);
         }
         throw new Error("Manifest not valid");
      }
      
      public function method_121(param1:name_522) : void
      {
         var _loc2_:name_25 = this.getService(name_25) as name_25;
         if(param1 == null)
         {
            throw new Error("OSGi ERROR: uninstall NULL bundle");
         }
         if(param1.name_523 != null)
         {
            param1.name_523.stop(this);
         }
         this.var_88.splice(this.var_88.indexOf(param1),1);
         delete this.var_90[param1.name];
         this.var_17.debug("Bundle " + param1.name + " uninstalled");
      }
      
      public function registerService(param1:Class, param2:Object) : void
      {
         var _loc3_:name_25 = this.getService(name_25) as name_25;
         if(this.services[param1] == null)
         {
            this.services[param1] = param2;
            this.var_89.push(param2);
            this.var_17.debug("Service " + param1 + " registered");
         }
         else
         {
            this.services[param1] = param2;
         }
      }
      
      public function name_498(param1:Array, param2:Object, param3:Dictionary = null) : void
      {
         var _loc4_:Class = null;
         for each(_loc4_ in param1)
         {
            this.registerService(_loc4_,param2);
         }
      }
      
      public function unregisterService(param1:Class) : void
      {
         var _loc2_:name_25 = this.getService(name_25) as name_25;
         this.var_89.splice(this.var_89.indexOf(this.services[param1]),1);
         delete this.services[param1];
         this.var_17.debug("Service " + param1 + " unregistered");
      }
      
      public function name_40(param1:Class, param2:Class, param3:String) : void
      {
         param2[param3] = this.services[param1];
         var _loc4_:Object = this.services[param1];
         this.var_17.debug("Inject %1 have been processed. Current value is %2",[param1,_loc4_]);
      }
      
      public function getService(param1:Class) : Object
      {
         return this.services[param1];
      }
      
      public function get method_124() : Vector.<name_522>
      {
         return this.var_88;
      }
      
      public function get method_122() : Vector.<Object>
      {
         return this.var_89;
      }
      
      public function method_118(param1:String, param2:String = null, param3:Boolean = false) : SharedObject
      {
         return SharedObject.getLocal(param1,param2,param3);
      }
   }
}
