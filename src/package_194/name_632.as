package package_194
{
   import package_13.Long;
   import package_228.ClanPermission;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_632 implements name_575
   {
       
      
      private var object:name_70;
      
      private var impl:name_575;
      
      public function name_632(param1:name_70, param2:name_575)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function name_731(param1:Long, param2:ClanPermission) : void
      {
         var id:Long = param1;
         var position:ClanPermission = param2;
         try
         {
            Model.object = this.object;
            this.impl.name_731(id,position);
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
