package alternativa.tanks.models.weapon.machinegun
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.tanks.services.objectpool.IObjectPoolService;
   import package_1.Main;
   import package_300.name_1189;
   import package_358.class_168;
   import package_358.class_169;
   import package_4.ClientObject;
   
   public class VulcanSFXModel extends class_168 implements class_169, class_11, class_170
   {
      
      private static var var_138:IObjectPoolService;
       
      
      public function VulcanSFXModel()
      {
         super();
         _interfaces.push(IModel,class_11,class_170);
         var_138 = IObjectPoolService(Main.osgi.getService(IObjectPoolService));
      }
      
      public function initObject(param1:ClientObject, param2:name_1189) : void
      {
         var _loc3_:name_2410 = new name_2410(param2);
         param1.method_12(MachineGunEffects,_loc3_);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:name_2410 = this.method_1239(param1);
         if(_loc2_ != null)
         {
            _loc2_.close();
         }
      }
      
      public function method_1239(param1:ClientObject) : name_2410
      {
         return name_2410(param1.method_16(MachineGunEffects));
      }
   }
}
