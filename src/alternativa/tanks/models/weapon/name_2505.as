package alternativa.tanks.models.weapon
{
   import alternativa.physics.collision.name_1160;
   import alternativa.physics.name_660;
   
   public class name_2505 implements name_1160
   {
       
      
      public var name_2506:name_660;
      
      public function name_2505()
      {
         super();
      }
      
      public function considerBody(param1:name_660) : Boolean
      {
         return this.name_2506 != param1;
      }
   }
}
