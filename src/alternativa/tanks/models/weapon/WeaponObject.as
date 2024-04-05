package alternativa.tanks.models.weapon
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.class_7;
   import flash.events.EventDispatcher;
   import package_161.name_1448;
   import package_161.name_515;
   import package_4.ClientObject;
   import package_7.name_32;
   import package_92.name_1188;
   import package_92.name_1451;
   
   public class WeaponObject extends EventDispatcher
   {
       
      
      protected var remote:Boolean = false;
      
      protected var object:ClientObject;
      
      public function WeaponObject(param1:ClientObject)
      {
         super();
         this.object = param1;
      }
      
      public function commonData() : name_1451
      {
         return this.method_2193().name_1457(this.method_2192().turret);
      }
      
      public function method_2193() : name_1188
      {
         return OSGi.getInstance().name_6(name_1188) as name_1188;
      }
      
      public function name_1456() : name_515
      {
         var _loc1_:name_32 = OSGi.getInstance().name_6(name_32) as name_32;
         return name_515(_loc1_.getModelsByInterface(name_1448)[0]);
      }
      
      public function method_2192() : TankData
      {
         return TankModel(OSGi.getInstance().name_6(class_7)).getTankData(this.object);
      }
      
      public function name_1248(param1:ClientObject) : void
      {
         this.object = param1;
      }
      
      public function getObject() : ClientObject
      {
         return this.object;
      }
      
      public function method_2195() : Boolean
      {
         return this.object != null;
      }
      
      public function isLocal() : Boolean
      {
         return !this.remote;
      }
      
      public function method_2194() : void
      {
         this.remote = true;
      }
   }
}
