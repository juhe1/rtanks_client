package package_276
{
   import alternativa.physics.collision.name_1160;
   import alternativa.physics.Body;
   
   internal class name_2505 implements name_1160
   {
       
      
      private var name_787:Body;
      
      public function name_2505(param1:Body)
      {
         super();
         this.name_787 = param1;
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.name_787 != param1;
      }
   }
}
