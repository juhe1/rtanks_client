package package_97
{
   public class name_2610
   {
       
      
      public var name_2611:Number = 0;
      
      public var angleX:Number = 0;
      
      public var angleZ:Number = 0;
      
      public function name_2610()
      {
         super();
      }
      
      public function interpolate(param1:name_2610, param2:name_2610, param3:Number) : void
      {
         this.name_2611 = param1.name_2611 + param3 * (param2.name_2611 - param1.name_2611);
         this.angleX = param1.angleX + param3 * (param2.angleX - param1.angleX);
         this.angleZ = param1.angleZ + param3 * (param2.angleZ - param1.angleZ);
      }
      
      public function copy(param1:name_2610) : void
      {
         this.name_2611 = param1.name_2611;
         this.angleX = param1.angleX;
         this.angleZ = param1.angleZ;
      }
   }
}
