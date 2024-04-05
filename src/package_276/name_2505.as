package package_276
{
   import alternativa.physics.collision.name_1160;
   import alternativa.physics.name_660;
   
   internal class name_2505 implements name_1160
   {
       
      
      private var name_787:name_660;
      
      public function name_2505(param1:name_660)
      {
         super();
         this.name_787 = param1;
      }
      
      public function considerBody(param1:name_660) : Boolean
      {
         return this.name_787 != param1;
      }
   }
}
