package package_191
{
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class IClanAcceptedModelEvents implements name_579
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_579>;
      
      public function IClanAcceptedModelEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_579>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function name_1930() : Vector.<Long>
      {
         var result:Vector.<Long> = null;
         var i:int = 0;
         var m:name_579 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.name_1930();
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
