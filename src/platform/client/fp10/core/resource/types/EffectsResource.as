package platform.client.fp10.core.resource.types
{
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.IResourceSerializationListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.ResourceInfo;
   
   public class EffectsResource extends Resource
   {
       
      
      public function EffectsResource(param1:ResourceInfo)
      {
         super(param1);
      }
      
      override public function loadBytes(param1:ByteArray, param2:IResourceLoadingListener) : Boolean
      {
         return true;
      }
      
      override public function serialize(param1:IResourceSerializationListener) : void
      {
      }
      
      override public function load(param1:String, param2:IResourceLoadingListener) : void
      {
         super.load(param1,param2);
         param2.onResourceLoadingStart(this);
         this.completeLoading();
      }
      
      override protected function doReload() : void
      {
      }
      
      override protected function createDummyData() : Boolean
      {
         return true;
      }
      
      override protected function completeLoading() : void
      {
         super.completeLoading();
      }
   }
}
