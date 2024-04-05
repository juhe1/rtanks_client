package package_196
{
   import alternativa.tanks.gui.clanmanagement.ClanIncomingRequestsDialog;
   import package_13.Long;
   import package_233.ClanIncomingModelBase;
   import package_233.name_625;
   import platform.client.fp10.core.model.name_170;
   
   public class name_609 extends ClanIncomingModelBase implements name_625, name_581, name_170
   {
       
      
      private var var_1219:Vector.<Long>;
      
      private var var_1310:ClanIncomingRequestsDialog;
      
      public function name_609()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         this.var_1219 = method_771().objects.concat();
      }
      
      public function method_1409(param1:Long) : void
      {
         this.var_1219.push(param1);
         if(this.var_1310 != null)
         {
            this.var_1310.addUser(param1);
         }
      }
      
      public function method_1408(param1:Long) : void
      {
         var _loc2_:Number = this.var_1219.indexOf(param1);
         this.var_1219.splice(_loc2_,1);
         if(this.var_1310 != null)
         {
            this.var_1310.removeUser(param1);
         }
      }
      
      public function method_573() : Vector.<Long>
      {
         return this.var_1219;
      }
      
      public function method_1442(param1:ClanIncomingRequestsDialog) : void
      {
         this.var_1310 = param1;
      }
   }
}
