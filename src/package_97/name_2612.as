package package_97
{
   import package_37.Vector3;
   import package_37.name_86;
   
   public class name_2612
   {
       
      
      public const position:Vector3 = new Vector3();
      
      public const orientation:name_86 = new name_86();
      
      public function name_2612()
      {
         super();
      }
      
      public function interpolate(param1:name_2612, param2:name_2612, param3:Number) : void
      {
         this.position.interpolate(param3,param1.position,param2.position);
         this.orientation.name_205(param1.orientation,param2.orientation,param3);
      }
      
      public function copy(param1:name_2612) : void
      {
         this.position.vCopy(param1.position);
         this.orientation.copy(param1.orientation);
      }
   }
}
