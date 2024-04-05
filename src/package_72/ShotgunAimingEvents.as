package package_72
{
   import alternativa.tanks.models.weapon.shotgun.PelletDirectionCalculator;
   import alternativa.tanks.models.weapon.shotgun.ShotgunRicochetTargetingSystem;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class ShotgunAimingEvents implements name_280
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<Object>;
      
      public function ShotgunAimingEvents(param1:name_70, param2:Vector.<Object>)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function createTargetingSystem() : ShotgunRicochetTargetingSystem
      {
         var result:ShotgunRicochetTargetingSystem = null;
         var i:int = 0;
         var m:name_280 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_280(this.impl[i]);
               result = m.createTargetingSystem();
               i++;
            }
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
         var i:int = 0;
         var m:name_280 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_280(this.impl[i]);
               result = m.method_881();
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
