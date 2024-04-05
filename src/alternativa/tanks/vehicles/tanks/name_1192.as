package alternativa.tanks.vehicles.tanks
{
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class name_1192
   {
       
      
      private var var_2024:HullsRegistry;
      
      private var var_2025:TurretsRegistry;
      
      public function name_1192()
      {
         this.var_2024 = new HullsRegistry();
         this.var_2025 = new TurretsRegistry();
         super();
      }
      
      public function name_1199(param1:Tanks3DSResource) : TankSkinHull
      {
         return this.var_2024.name_2415(param1);
      }
      
      public function name_1198(param1:Tanks3DSResource) : TankSkinTurret
      {
         return this.var_2025.name_2414(param1);
      }
   }
}
