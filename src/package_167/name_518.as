package package_167
{
   import alternativa.model.name_66;
   import package_322.class_43;
   import package_322.class_66;
   import package_4.ClientObject;
   
   public class name_518 extends class_66 implements class_43, class_67
   {
       
      
      public function name_518()
      {
         super();
         var_365.push(name_66,class_43,class_67);
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:int) : void
      {
         var _loc5_:name_1454 = new name_1454(param4);
         _loc5_.name_1618.value = param2;
         _loc5_.name_1622.value = 2 * 180 * param2 / Math.PI;
         _loc5_.name_1614.value = param3;
         _loc5_.name_1628.value = 2 * 180 * param3 / Math.PI;
         param1.method_12(name_518,_loc5_);
      }
      
      public function method_1006(param1:ClientObject) : name_1454
      {
         return param1.method_16(name_518) as name_1454;
      }
   }
}
