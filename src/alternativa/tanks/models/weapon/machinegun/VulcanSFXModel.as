package alternativa.tanks.models.weapon.machinegun
{
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import alternativa.tanks.services.objectpool.name_118;
   import package_1.Main;
   import package_300.name_1189;
   import package_358.class_168;
   import package_358.class_169;
   import package_4.ClientObject;
   
   public class VulcanSFXModel extends class_168 implements class_169, class_11, class_170
   {
      
      private static var var_138:name_118;
       
      
      public function VulcanSFXModel()
      {
         super();
         var_365.push(name_66,class_11,class_170);
         var_138 = name_118(Main.osgi.name_6(name_118));
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
