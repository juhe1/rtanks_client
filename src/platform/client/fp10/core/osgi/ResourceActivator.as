package platform.client.fp10.core.osgi
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.name_26;
   import package_11.name_23;
   import package_147.DispatcherModel;
   import package_36.name_105;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.registry.impl.ResourceRegistryImpl;
   import platform.client.fp10.core.resource.BatchResourceLoader;
   import platform.client.fp10.core.resource.IResourceLoader;
   import platform.client.fp10.core.resource.IResourceLocalStorageInternal;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceLoader;
   import platform.client.fp10.core.resource.ResourceLocalStorage;
   import platform.client.fp10.core.resource.ResourceTimer;
   import platform.client.fp10.core.resource.ResourceType;
   import platform.client.fp10.core.resource.types.EffectsResource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SWFLibraryResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.resource.types.TextureResource;
   import platform.client.fp10.core.service.IResourceTimer;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.errormessage.impl.MessageBoxService;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import projects.tanks.clients.flash.resources.resource.name_496;
   
   public class ResourceActivator implements name_23
   {
       
      
      public function ResourceActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         param1.name_498([IResourceLocalStorage,IResourceLocalStorageInternal],new ResourceLocalStorage(param1));
         param1.name_40(IResourceLocalStorage,ResourceLoader,"localStorage");
         param1.name_40(IResourceLocalStorage,ImageResource,"resourceLocalStorage");
         param1.name_40(IResourceLocalStorage,MultiframeImageResource,"resourceLocalStorage");
         param1.name_40(IResourceLocalStorage,TextureResource,"resourceLocalStorage");
         param1.name_40(IResourceLocalStorage,Tanks3DSResource,"resourceLocalStorage");
         param1.name_40(IResourceLocalStorage,ImageResource,"resourceLocalStorage");
         param1.name_40(IResourceLocalStorage,name_496,"resourceLocalStorage");
         param1.name_1(IErrorMessageService,new MessageBoxService(param1));
         param1.name_40(IErrorMessageService,BatchResourceLoader,"messageBoxService");
         param1.name_40(name_105,ResourceLoader,"networkSerice");
         param1.name_1(IResourceLoader,new ResourceLoader(param1));
         param1.name_40(IResourceLoader,BatchResourceLoader,"resourceLoader");
         param1.name_1(ResourceRegistry,new ResourceRegistryImpl(param1));
         param1.name_40(ResourceRegistry,BatchResourceLoader,"resourceRegistry");
         param1.name_40(ResourceRegistry,Resource,"resourceRegistry");
         param1.name_40(IResourceLoader,ResourceRegistryImpl,"resourceLoader");
         param1.name_40(ResourceRegistry,MapResource,"resourceRegistry");
         param1.name_1(IResourceTimer,new ResourceTimer(param1));
         param1.name_40(IResourceTimer,Resource,"resourceTimer");
         param1.name_40(name_26,DispatcherModel,"logService");
         param1.name_1(DispatcherModel,new DispatcherModel());
         var _loc2_:ResourceRegistry = ResourceRegistry(param1.name_6(ResourceRegistry));
         _loc2_.registerTypeClasses(ResourceType.SWF_LIBRARY,SWFLibraryResource);
         _loc2_.registerTypeClasses(ResourceType.IMAGE,ImageResource);
         _loc2_.registerTypeClasses(ResourceType.MULTIFRAME_IMAGE,MultiframeImageResource);
         _loc2_.registerTypeClasses(ResourceType.SOUND,SoundResource);
         _loc2_.registerTypeClasses(ResourceType.TEXTURE,TextureResource);
         _loc2_.registerTypeClasses(ResourceType.EFFECTS,EffectsResource);
         _loc2_.registerTypeClasses(Tanks3DSResource.name_497,Tanks3DSResource);
         _loc2_.registerTypeClasses(MapResource.name_497,MapResource);
         _loc2_.registerTypeClasses(name_496.name_497,name_496);
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}
