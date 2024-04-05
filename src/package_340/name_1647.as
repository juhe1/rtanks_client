package package_340
{
   import package_136.MountSkinItemModelBase;
   import package_136.name_1643;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1647 extends MountSkinItemModelBase implements name_1643, name_1635
   {
       
      
      public function name_1647()
      {
         super();
      }
      
      public function getMountedSkin() : name_70
      {
         return method_771().item;
      }
      
      public function mount(param1:name_70) : void
      {
         method_771().item = param1;
         server.name_2669(param1);
      }
   }
}
