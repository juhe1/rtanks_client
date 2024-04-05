package package_197
{
   import alternativa.tanks.gui.clanmanagement.name_594;
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class IClanOutgoingModelEvents implements name_585
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_585>;
      
      public function IClanOutgoingModelEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_585>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function method_1453(param1:name_594) : void
      {
         var i:int = 0;
         var m:name_585 = null;
         var clanOutgoingWindow:name_594 = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_1453(clanOutgoingWindow);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_573() : Vector.<Long>
      {
         var result:Vector.<Long> = null;
         var i:int = 0;
         var m:name_585 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.method_573();
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
