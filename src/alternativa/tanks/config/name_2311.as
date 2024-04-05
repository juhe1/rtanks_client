package alternativa.tanks.config
{
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.primitives.Plane;
   
   public class name_2311 extends BSP
   {
       
      
      public function name_2311()
      {
         super();
         var _loc1_:Plane = new Plane();
         createTree(_loc1_);
         z = -20000;
         name = "static";
      }
   }
}
