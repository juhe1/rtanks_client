package package_72
{
   import alternativa.tanks.models.tank.class_7;
   import alternativa.tanks.models.weapon.WeaponObject;
   import alternativa.tanks.models.weapon.shotgun.PelletDirectionCalculator;
   import alternativa.tanks.models.weapon.shotgun.ShotgunRicochetTargetingSystem;
   import projects.tanks.client.battlefield.models.tankparts.weapons.shotgun.ShotgunHittingModelBase;
   import projects.tanks.client.battlefield.models.tankparts.weapons.shotgun.name_289;
   
   public class name_316 extends ShotgunHittingModelBase implements name_289, name_280
   {
       
      
      public function name_316()
      {
         super();
      }
      
      public function createTargetingSystem() : ShotgunRicochetTargetingSystem
      {
         var _loc1_:WeaponObject = new WeaponObject(class_7(object.name_176(class_7)).getTank().tankData.turret);
         return new ShotgunRicochetTargetingSystem(_loc1_,this.method_881(),method_771());
      }
      
      public function method_881() : PelletDirectionCalculator
      {
         var _loc1_:PelletDirectionCalculator = PelletDirectionCalculator(getData(PelletDirectionCalculator));
         if(_loc1_ == null)
         {
            _loc1_ = new PelletDirectionCalculator(method_771());
            putData(PelletDirectionCalculator,_loc1_);
         }
         return _loc1_;
      }
   }
}
