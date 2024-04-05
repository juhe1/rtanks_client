package package_197
{
   import alternativa.tanks.gui.clanmanagement.name_594;
   import package_13.Long;
   import package_226.ClanOutgoingModelBase;
   import package_226.name_622;
   import platform.client.fp10.core.model.name_170;
   
   public class ClanOutgoingModel extends ClanOutgoingModelBase implements name_622, name_585, name_170
   {
       
      
      private var var_1220:name_594;
      
      private var var_1219:Vector.<Long>;
      
      public function ClanOutgoingModel()
      {
         this.var_1219 = new Vector.<Long>();
         super();
      }
      
      public function objectLoaded() : void
      {
         this.var_1219 = method_771().objects.concat();
      }
      
      public function method_1453(param1:name_594) : void
      {
         this.var_1220 = param1;
      }
      
      public function method_1409(param1:Long) : void
      {
         this.var_1219.push(param1);
         if(this.var_1220 != null)
         {
            this.var_1220.addUser(param1);
         }
      }
      
      public function method_1408(param1:Long) : void
      {
         var _loc2_:Number = this.var_1219.indexOf(param1);
         this.var_1219.splice(_loc2_,1);
         if(this.var_1220 != null)
         {
            this.var_1220.removeUser(param1);
         }
      }
      
      public function method_573() : Vector.<Long>
      {
         return this.var_1219;
      }
   }
}
