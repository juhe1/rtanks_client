package package_57
{
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public class name_167 implements name_913
   {
      
      private static const position:Vector3 = new Vector3();
      
      private static const const_64:Vector3 = new Vector3();
      
      private static const const_65:Matrix3 = new Matrix3();
       
      
      public var tank:Tank;
      
      public function name_167(param1:Tank)
      {
         super();
         this.tank = param1;
      }
      
      public function reset() : void
      {
      }
      
      public function update(param1:Number) : void
      {
         position.copy(this.tank.var_328);
         position.transform4(this.tank.var_331);
         this.tank.var_334.name_182(const_64);
         this.tank.method_461().name_969(position,const_64);
      }
   }
}
