package package_197
{
   import alternativa.tanks.gui.clanmanagement.name_594;
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_616 implements name_585
   {
       
      
      private var object:name_70;
      
      private var impl:name_585;
      
      public function name_616(param1:name_70, param2:name_585)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function method_1453(param1:name_594) : void
      {
         var clanOutgoingWindow:name_594 = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_1453(clanOutgoingWindow);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_573() : Vector.<Long>
      {
         var result:Vector.<Long> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.method_573();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
