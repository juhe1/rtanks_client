package package_163
{
   import alternativa.physics.name_660;
   import alternativa.tanks.models.weapon.shared.name_1742;
   import alternativa.tanks.vehicles.tanks.Tank;
   
   public class name_1704 implements name_1742
   {
       
      
      public function name_1704()
      {
         super();
      }
      
      public function name_2686(param1:name_660) : Boolean
      {
         var _loc2_:Tank = param1 as Tank;
         return _loc2_ != null && _loc2_.tankData.health > 0;
      }
   }
}
