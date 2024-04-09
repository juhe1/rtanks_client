package alternativa.tanks.models.weapon
{
   import alternativa.physics.collision.name_1160;
   import alternativa.physics.Body;
   
   public class name_2505 implements name_1160
   {
       
      
      public var name_2506:Body;
      
      public function name_2505()
      {
         super();
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.name_2506 != param1;
      }
   }
}
