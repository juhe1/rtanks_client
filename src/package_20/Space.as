package package_20
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.name_11;
   import alternativa.osgi.service.logging.name_26;
   import flash.utils.Dictionary;
   import package_13.Long;
   import package_271.XorBasedProtectionContext;
   import package_271.name_838;
   import package_272.name_844;
   import package_36.name_105;
   import package_38.name_840;
   import platform.client.fp10.core.model.class_11;
   import platform.client.fp10.core.model.name_287;
   import platform.client.fp10.core.model.name_805;
   import platform.client.fp10.core.network.connection.name_12;
   import platform.client.fp10.core.network.connection.name_837;
   import platform.client.fp10.core.network.connection.name_839;
   import platform.client.fp10.core.network.connection.name_841;
   import platform.client.fp10.core.network.name_836;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.type.name_178;
   import platform.client.fp10.core.type.name_202;
   import platform.client.fp10.core.type.name_70;
   import platform.client.fp10.core.type.name_835;
   
   public class Space implements name_202
   {
      
      public static var logService:name_26;
      
      public static var messageBoxService:IErrorMessageService;
      
      public static var networkService:name_105;
      
      private static var var_17:name_11;
       
      
      private var var_21:Long;
      
      private var var_198:Dictionary;
      
      private var var_200:Dictionary;
      
      private var var_199:Vector.<name_70>;
      
      private var var_201:name_841;
      
      private var listeners:Vector.<name_835>;
      
      public function Space(param1:Long, param2:name_844, param3:name_840, param4:Boolean)
      {
         this.var_198 = new Dictionary();
         this.var_200 = new Dictionary();
         super();
         this.var_21 = param1;
         this.var_199 = new Vector.<name_70>();
         var_17 = var_17 || logService.getLogger("space");
         this.listeners = new Vector.<name_835>();
         var _loc5_:name_837 = param4 ? new XorBasedProtectionContext(null,param1) : name_838.name_846;
         var _loc6_:GameClass = new GameClass(Long.getLong(0,0),new Vector.<Long>());
         this.name_15(param1,_loc6_,"Space object");
      }
      
      public function getObjectByName(param1:String) : name_70
      {
         return this.var_200[param1];
      }
      
      public function connect(param1:String, param2:Vector.<int>) : void
      {
         this.var_201.connect(new name_12(param1,param2));
      }
      
      public function close() : void
      {
         this.var_201.close(name_839.SPACE_CLOSED);
         this.method_279();
      }
      
      private function method_279() : void
      {
         var _loc1_:name_835 = null;
         var _loc2_:Vector.<name_835> = this.listeners.concat();
         for each(_loc1_ in _loc2_)
         {
            _loc1_.name_843();
         }
      }
      
      public function name_15(param1:Long, param2:name_178, param3:String) : name_70
      {
         var _loc4_:GameObject = null;
         OSGi.clientLog.log("objects","Try create object id low %1 name %2 returnObject %3",param1.low,param3,this.var_198[param1.low]);
         if(this.var_198[param1.low] == null)
         {
            _loc4_ = new GameObject(param1,GameClass(param2),param3,this);
            this.var_198[_loc4_.id.low] = _loc4_;
            this.var_200[_loc4_.name] = _loc4_;
            this.var_199.push(_loc4_);
         }
         return this.var_198[param1.low];
      }
      
      public function name_188(param1:Long) : void
      {
         param1 = param1;
         var _loc2_:GameObject = this.var_198[param1.low];
         if(_loc2_ != null)
         {
            this.method_280(_loc2_);
         }
      }
      
      private function method_281(param1:name_70) : void
      {
         var _loc2_:class_11 = class_11(param1.event(class_11));
         _loc2_.objectUnloaded();
         name_287(param1.event(name_287)).objectUnloaded();
         _loc2_.objectUnloadedPost();
         name_805(param1.event(name_805)).objectUnloadedPost();
      }
      
      private function method_282(param1:GameObject) : void
      {
         var _loc2_:name_835 = null;
         var _loc3_:Vector.<name_835> = this.listeners.concat();
         for each(_loc2_ in _loc3_)
         {
            _loc2_.name_842(param1);
         }
      }
      
      private function method_283(param1:Error, param2:Long) : void
      {
         throw param1;
      }
      
      private function method_280(param1:GameObject) : void
      {
         this.var_199.splice(this.var_199.indexOf(param1),1);
         delete this.var_198[param1.id.low];
         delete this.var_200[param1.name];
         param1.clear();
         param1 = null;
      }
      
      public function getObject(param1:Long) : name_70
      {
         return this.var_198[param1.low];
      }
      
      public function get objects() : Vector.<name_70>
      {
         return this.var_199;
      }
      
      public function get id() : Long
      {
         return this.var_21;
      }
      
      public function get commandSender() : name_836
      {
         return this.var_201;
      }
      
      public function get rootObject() : name_70
      {
         return this.getObject(this.var_21);
      }
      
      public function addEventListener(param1:name_835) : void
      {
         if(this.listeners.indexOf(param1) == -1)
         {
            this.listeners.push(param1);
         }
      }
      
      public function removeEventListener(param1:name_835) : void
      {
         var _loc2_:int = this.listeners.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.listeners.splice(_loc2_,1);
         }
      }
      
      public function modelsDataReady(param1:name_70) : void
      {
         var _loc2_:name_835 = null;
         var _loc3_:Vector.<name_835> = this.listeners.concat();
         for each(_loc2_ in _loc3_)
         {
            _loc2_.name_845(param1);
         }
      }
      
      public function toString() : String
      {
         return "[Space id=" + this.id + "]";
      }
   }
}
