package scpacker.resource
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.loader.name_13;
   import alternativa.tanks.service.name_554;
   import flash.events.EventDispatcher;
   import package_102.Command;
   import package_102.Type;
   import package_124.name_42;
   import package_13.Long;
   import package_137.AlertService;
   import package_147.DispatcherModel;
   import package_187.name_555;
   import package_20.GameObject;
   import package_39.Model;
   import platform.client.core.general.resource.types.imageframe.ResourceImageFrameParams;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceInfo;
   import platform.client.fp10.core.resource.types.ResourceImageParams;
   import scpacker.networking.class_6;
   
   public class ResourceLoaderModel extends EventDispatcher implements class_6
   {
      
      public static var modelRegistry:name_29 = OSGi.getInstance().getService(name_29) as name_29;
       
      
      private var var_105:LocalizationLoader;
      
      private var var_106:GameObject;
      
      public function ResourceLoaderModel()
      {
         super();
         this.var_105 = new LocalizationLoader();
         this.var_106 = new GameObject(Long.getLong(1,1),null,"ResourceLoader",null);
      }
      
      public function onData(param1:Command) : void
      {
         var _loc2_:Object = null;
         var _loc3_:* = undefined;
         if(param1.type == Type.SYSTEM)
         {
            switch(param1.name_319[0])
            {
               case "init_localization":
                  this.var_105.name_556(param1.name_319[1]);
                  AlertService(OSGi.getInstance().getService(name_42)).init();
                  break;
               case "init_social_network":
                  _loc2_ = JSON.parse(param1.name_319[1]);
                  for each(_loc3_ in _loc2_)
                  {
                     name_554(OSGi.getInstance().getService(name_554)).setEnabled(_loc3_.snId,_loc3_.enabled);
                  }
                  break;
               case "load_resources":
                  this.method_132(JSON.parse(param1.name_319[1]),parseInt(param1.name_319[2]));
                  break;
               case "init_auth":
                  name_13(OSGi.getInstance().getService(name_13)).hideForcibly();
                  Authorization(OSGi.getInstance().getService(IAuthorization)).init();
            }
         }
      }
      
      private function method_132(param1:Object, param2:int) : void
      {
         var obj:* = undefined;
         var json:Object = param1;
         var id:int = param2;
         var resources:Array = new Array();
         for each(obj in json)
         {
            resources.push(obj);
         }
         try
         {
            Model.object = this.var_106;
            OSGi.getInstance().getService(DispatcherModel).loadDependencies(new name_555(id,this.method_131(resources,id)));
            OSGi.clientLog.log("ResourceLoaderModel","Start loading resource list, size: %1",resources.length);
            Model.method_38();
         }
         catch(err:Error)
         {
            OSGi.clientLog.log("ResourceLoaderModel","ParseLoadResource error %1",err.getStackTrace());
         }
      }
      
      private function method_131(param1:Array, param2:int) : Vector.<Resource>
      {
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:ResourceInfo = null;
         var _loc8_:Class = null;
         var _loc9_:Resource = null;
         var _loc3_:Vector.<Resource> = new Vector.<Resource>();
         if(param1.length == 0)
         {
            return _loc3_;
         }
         var _loc4_:ResourceRegistry = ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry));
         for each(_loc5_ in param1)
         {
            _loc6_ = null;
            if(_loc5_.type != 11 && (_loc5_.alpha != null || _loc5_.type == 10))
            {
               _loc6_ = new ResourceImageParams(_loc5_.alpha);
            }
            else if(_loc5_.type == 11)
            {
               _loc6_ = new ResourceImageFrameParams(_loc5_.multiframe.fps,_loc5_.multiframe.height,_loc5_.multiframe.width,_loc5_.multiframe.numFrames);
            }
            _loc7_ = new ResourceInfo(_loc5_.type,Long.getLong(0,_loc5_.id),Long.getLong(0,_loc5_.version),_loc5_.lazy,_loc6_);
            if(!_loc4_.isRegistered(_loc7_.id))
            {
               if(!_loc4_.isTypeClassRegistered(_loc7_.type))
               {
                  throw new Error("Unknown resource type " + _loc7_.type);
               }
               _loc8_ = _loc4_.getResourceClass(_loc7_.type);
               _loc9_ = null;
               if(_loc7_.resourceParams == null)
               {
                  _loc9_ = Resource(new _loc8_(_loc7_));
               }
               else
               {
                  _loc9_ = Resource(new _loc8_(_loc7_,_loc7_.resourceParams));
               }
               _loc4_.registerResource(_loc9_);
               if(!_loc9_.isLazy)
               {
                  _loc3_.push(_loc9_);
               }
            }
         }
         return _loc3_;
      }
   }
}
