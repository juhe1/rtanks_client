package package_192
{
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class IClanUserIncomingModelEvents implements name_574
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_574>;
      
      public function IClanUserIncomingModelEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_574>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getIncomingClans() : Vector.<Long>
      {
         var result:Vector.<Long> = null;
         var i:int = 0;
         var m:name_574 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getIncomingClans();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
