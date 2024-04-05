package package_194
{
   import package_13.Long;
   import package_228.ClanPermission;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class IClanPermissionsModelEvents implements name_575
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_575>;
      
      public function IClanPermissionsModelEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_575>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function name_731(param1:Long, param2:ClanPermission) : void
      {
         var i:int = 0;
         var m:name_575 = null;
         var id:Long = param1;
         var position:ClanPermission = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.name_731(id,position);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
