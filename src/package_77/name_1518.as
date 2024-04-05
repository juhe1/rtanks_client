package package_77
{
   import package_242.name_662;
   import package_37.Vector3;
   import package_76.name_735;
   
   internal class name_1518 implements name_1517
   {
      
      private static const direction:Vector3 = new Vector3();
      
      private static const localDirection:Vector3 = new Vector3();
       
      
      private var var_2341:Boolean = false;
      
      private var const_507:name_662;
      
      private var const_504:name_662;
      
      private var const_503:name_662;
      
      public function name_1518(param1:name_662, param2:name_662, param3:name_662)
      {
         super();
         this.const_507 = param1;
         this.const_504 = param2;
         this.const_503 = param3;
      }
      
      public function name_1522(param1:class_185, param2:name_735, param3:Number) : Vector3
      {
         localDirection.x = param1.method_2360();
         localDirection.y = -param1.method_2359();
         localDirection.z = param1.method_2358();
         param2.method_1650(localDirection,direction);
         if(direction.lengthSqr() > 0)
         {
            direction.normalize();
         }
         if(param1.method_2361())
         {
            if(this.var_2341)
            {
               direction.scale(this.const_507.value * this.const_503.value * param3);
            }
            else
            {
               direction.scale(this.const_507.value * this.const_504.value * param3);
            }
         }
         else
         {
            direction.scale(this.const_507.value * param3);
         }
         return direction;
      }
      
      public function name_1519() : void
      {
         this.var_2341 = !this.var_2341;
      }
      
      public function name_1514() : Boolean
      {
         return this.var_2341;
      }
      
      public function name_1523(param1:Boolean) : void
      {
         this.var_2341 = param1;
      }
   }
}
