package package_196
{
   import alternativa.tanks.gui.clanmanagement.ClanIncomingRequestsDialog;
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_646 implements name_581
   {
       
      
      private var object:name_70;
      
      private var impl:name_581;
      
      public function name_646(param1:name_70, param2:name_581)
      {
         super();
         this.object = param1;
         this.impl = param2;
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
      
      public function method_1442(param1:ClanIncomingRequestsDialog) : void
      {
         var window:ClanIncomingRequestsDialog = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_1442(window);
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
