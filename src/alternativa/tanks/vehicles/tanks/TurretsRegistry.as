package alternativa.tanks.vehicles.tanks
{
   import flash.utils.Dictionary;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   internal class TurretsRegistry
   {
       
      
      private var var_3080:Dictionary;
      
      public function TurretsRegistry()
      {
         this.var_3080 = new Dictionary();
         super();
      }
      
      public function name_2414(param1:Tanks3DSResource) : TankSkinTurret
      {
         var _loc2_:TankSkinTurret = this.var_3080[param1.id];
         if(_loc2_ == null)
         {
            _loc2_ = new TankSkinTurret(param1);
            this.var_3080[param1.id] = _loc2_;
         }
         return _loc2_;
      }
   }
}
