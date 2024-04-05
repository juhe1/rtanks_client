package package_191
{
   import alternativa.tanks.gui.clanmanagement.name_563;
   import package_13.Long;
   import package_220.ClanAcceptedModelBase;
   import package_220.name_626;
   import package_26.name_62;
   
   public class name_591 extends ClanAcceptedModelBase implements name_579, name_626
   {
      
      public static var clanService:name_62;
       
      
      public function name_591()
      {
         super();
      }
      
      public function method_1409(param1:Long) : void
      {
         if(this.method_1605() != null)
         {
            this.method_1605().method_1426(param1);
         }
      }
      
      public function method_1408(param1:Long) : void
      {
         if(this.method_1605() != null)
         {
            this.method_1605().method_1425(param1);
         }
      }
      
      public function name_1930() : Vector.<Long>
      {
         return method_771().objects;
      }
      
      private function method_1605() : name_563
      {
         return clanService.clanManagementPanel;
      }
   }
}
