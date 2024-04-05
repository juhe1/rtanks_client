package package_340
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class MountSkinEvents implements name_1635
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<Object>;
      
      public function MountSkinEvents(param1:name_70, param2:Vector.<Object>)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getMountedSkin() : name_70
      {
         var result:name_70 = null;
         var i:int = 0;
         var m:name_1635 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_1635(this.impl[i]);
               result = m.getMountedSkin();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function mount(param1:name_70) : void
      {
         var i:int = 0;
         var m:name_1635 = null;
         var skin:name_70 = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_1635(this.impl[i]);
               m.mount(skin);
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
