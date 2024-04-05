package package_193
{
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class IClanUserOutgoingModelEvents implements name_583
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_583>;
      
      public function IClanUserOutgoingModelEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_583>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getOutgoingClans() : Vector.<Long>
      {
         var result:Vector.<Long> = null;
         var i:int = 0;
         var m:name_583 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getOutgoingClans();
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
