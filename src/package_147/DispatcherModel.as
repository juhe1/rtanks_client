package package_147
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.name_11;
   import alternativa.osgi.service.logging.name_26;
   import package_13.Long;
   import package_187.name_1686;
   import package_187.name_555;
   import package_20.Space;
   import package_354.name_1689;
   import package_354.name_1690;
   import package_355.name_1688;
   import package_39.Model;
   import platform.client.core.general.spaces.loading.dispatcher.class_64;
   import platform.client.core.general.spaces.loading.dispatcher.class_65;
   import platform.client.fp10.core.model.class_11;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.registry.name_33;
   import platform.client.fp10.core.resource.BatchResourceLoader;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.errormessage.errors.name_1691;
   import platform.client.fp10.core.type.name_202;
   import platform.client.fp10.core.type.name_70;
   
   public class DispatcherModel extends class_65 implements class_64
   {
      
      public static var logService:name_26;
      
      private static var var_17:name_11;
       
      
      private var modelRegister:name_29;
      
      private var resourceRegistry:ResourceRegistry;
      
      private var var_984:name_33;
      
      public function DispatcherModel()
      {
         super();
         var _loc1_:OSGi = OSGi.getInstance();
         this.modelRegister = _loc1_.name_6(name_29) as name_29;
         this.resourceRegistry = _loc1_.name_6(ResourceRegistry) as ResourceRegistry;
         this.var_984 = _loc1_.name_6(name_33) as name_33;
         var_17 = var_17 || logService.getLogger("dispatcher");
      }
      
      private static function method_309(param1:Error) : void
      {
         var _loc2_:String = param1.getStackTrace();
         var_17.error(_loc2_);
         method_1208(_loc2_);
      }
      
      private static function method_1208(param1:String) : void
      {
         IErrorMessageService(OSGi.getInstance().name_6(IErrorMessageService)).showMessage(new name_1691(param1));
      }
      
      public function loadDependencies(param1:name_555) : void
      {
         var _loc2_:BatchResourceLoader = null;
         if(param1.callbackId > 0)
         {
            putData(name_555,param1);
         }
         if(param1.resources.length > 0)
         {
            _loc2_ = this.method_1213();
            _loc2_.load(param1.resources);
         }
         else if(param1.callbackId > 0)
         {
            if(getData(BatchResourceLoader) == null)
            {
               this.method_1209();
            }
         }
      }
      
      private function method_1213() : BatchResourceLoader
      {
         var _loc1_:BatchResourceLoader = BatchResourceLoader(getData(BatchResourceLoader));
         if(_loc1_ == null)
         {
            _loc1_ = new BatchResourceLoader(method_39(this.method_1209));
            putData(BatchResourceLoader,_loc1_);
         }
         return _loc1_;
      }
      
      public function method_1207(param1:name_1686) : void
      {
         this.method_1212(param1);
         this.method_1211(param1.objects);
      }
      
      private function method_1212(param1:name_1686) : void
      {
         var _loc2_:name_70 = null;
         var _loc3_:int = 0;
         var _loc4_:name_1688 = null;
         var _loc5_:name_66 = null;
         var _loc6_:Object = null;
         var _loc7_:Vector.<name_1688> = param1.modelsData;
         var _loc8_:name_202 = this.var_984.currentSpace;
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc2_ = _loc8_.getObject(Long(_loc7_[_loc9_].data));
            _loc9_++;
            _loc3_ = _loc9_;
            while(_loc3_ < _loc7_.length && !(_loc7_[_loc3_].data is Long))
            {
               _loc3_++;
            }
            while(_loc9_ < _loc3_)
            {
               _loc4_ = _loc7_[_loc9_];
               _loc5_ = this.modelRegister.getModel(_loc4_.id);
               if(_loc5_ == null)
               {
                  method_309(new name_1689(_loc8_.id,_loc2_.id,_loc4_.id));
               }
               else
               {
                  _loc6_ = _loc4_.data;
                  if(_loc6_ != null)
                  {
                     Model.object = _loc2_;
                     _loc5_.method_18(_loc6_);
                     Model.method_38();
                  }
               }
               _loc9_++;
            }
         }
      }
      
      private function method_1211(param1:Vector.<name_70>) : void
      {
         var object:name_70 = null;
         object = null;
         var objects:Vector.<name_70> = param1;
         for each(object in objects)
         {
            try
            {
               this.method_1210(object);
            }
            catch(e:Error)
            {
               method_309(new name_1690(var_984.currentSpace.id,object.id,e));
            }
         }
      }
      
      private function method_1210(param1:name_70) : void
      {
         var _loc2_:class_11 = class_11(param1.event(class_11));
         _loc2_.objectLoaded();
         name_170(param1.event(name_170)).objectLoaded();
         _loc2_.objectLoadedPost();
         name_141(param1.event(name_141)).objectLoadedPost();
         Space(this.var_984.currentSpace).modelsDataReady(param1);
      }
      
      public function method_1206(param1:Vector.<name_70>) : void
      {
         var _loc2_:name_70 = null;
         var _loc3_:name_202 = Model.object.space;
         for each(_loc2_ in param1)
         {
            _loc3_.name_188(_loc2_.id);
         }
      }
      
      public function method_1209() : void
      {
         var _loc1_:name_555 = name_555(clearData(name_555));
         server.name_1692(_loc1_.callbackId);
         OSGi.clientLog.log("DispatcherModel","onBatchLoadingComplete %1",_loc1_.callbackId);
         clearData(BatchResourceLoader);
      }
   }
}
