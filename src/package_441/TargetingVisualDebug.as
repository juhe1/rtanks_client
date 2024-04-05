package package_441
{
   import alternativa.engine3d.primitives.Box;
   import alternativa.tanks.models.weapon.name_903;
   import package_242.name_679;
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public class TargetingVisualDebug
   {
      
      private static var var_3321:name_679 = new name_679("targeting_debug",0,0,1);
       
      
      private var var_3322:Vector.<Box>;
      
      private var name_1085:Vector3;
      
      private var var_1441:Vector3;
      
      private var const_430:Matrix3;
      
      public function TargetingVisualDebug()
      {
         this.var_3322 = new Vector.<Box>();
         this.name_1085 = new Vector3();
         this.var_1441 = new Vector3();
         this.const_430 = new Matrix3();
         super();
      }
      
      public function reset() : void
      {
      }
      
      public function method_2994(param1:name_903, param2:Vector3, param3:Number, param4:Vector3 = null) : void
      {
      }
      
      private function method_2993(param1:Number, param2:Number, param3:Number, param4:uint = 65535) : Box
      {
         return null;
      }
   }
}
