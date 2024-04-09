package package_167
{
   import alternativa.model.IModel;
   import package_322.IShotModelBase;
   import package_322.ShotModelBase;
   import package_4.ClientObject;
   
   public class ShotModel extends ShotModelBase implements IShotModelBase, IShot
   {
       
      
      public function ShotModel()
      {
         super();
         _interfaces.push(IModel,IShotModelBase,IShot);
      }
      
      public function initObject(param1:ClientObject, param2:Number, param3:Number, param4:int) : void
      {
         var _loc5_:name_1454 = new name_1454(param4);
         _loc5_.name_1618.value = param2;
         _loc5_.name_1622.value = 2 * 180 * param2 / Math.PI;
         _loc5_.name_1614.value = param3;
         _loc5_.name_1628.value = 2 * 180 * param3 / Math.PI;
         param1.method_12(ShotModel,_loc5_);
      }
      
      public function method_1006(param1:ClientObject) : name_1454
      {
         return param1.method_16(ShotModel) as name_1454;
      }
   }
}
