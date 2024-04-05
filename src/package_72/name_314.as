package package_72
{
   import alternativa.tanks.models.weapon.shotgun.PelletDirectionCalculator;
   import alternativa.tanks.models.weapon.shotgun.ShotgunRicochetTargetingSystem;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_314 implements name_280
   {
       
      
      private var object:name_70;
      
      private var impl:name_280;
      
      public function name_314(param1:name_70, param2:name_280)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function createTargetingSystem() : ShotgunRicochetTargetingSystem
      {
         var result:ShotgunRicochetTargetingSystem = null;
         try
         {
            Model.object = this.object;
            result = this.impl.createTargetingSystem();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_881() : PelletDirectionCalculator
      {
         var result:PelletDirectionCalculator = null;
         try
         {
            Model.object = this.object;
            result = this.impl.method_881();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
