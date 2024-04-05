package alternativa.tanks.vehicles.tanks
{
   import flash.utils.Dictionary;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   internal class HullsRegistry
   {
       
      
      private var var_3079:Dictionary;
      
      public function HullsRegistry()
      {
         this.var_3079 = new Dictionary();
         super();
      }
      
      public function name_2415(param1:Tanks3DSResource) : TankSkinHull
      {
         var _loc2_:TankSkinHull = this.var_3079[param1.id];
         if(_loc2_ == null)
         {
            _loc2_ = new TankSkinHull(param1);
            this.var_3079[param1.id] = _loc2_;
         }
         return _loc2_;
      }
   }
}
