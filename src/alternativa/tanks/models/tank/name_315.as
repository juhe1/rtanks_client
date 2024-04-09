package alternativa.tanks.models.tank
{
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.geom.Vector3D;
   import package_37.Vector3;
   import package_39.Model;
   import package_4.ClientObject;
   import platform.client.fp10.core.type.name_70;
   
   public class name_315 implements ITank
   {
       
      
      private var object:name_70;
      
      private var impl:ITank;
      
      public function name_315(param1:name_70, param2:ITank)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getTankData(param1:ClientObject) : TankData
      {
         return null;
      }
      
      public function update(param1:TankData, param2:int, param3:int, param4:Number, param5:Number, param6:Vector3) : void
      {
      }
      
      public function method_33(param1:Boolean) : void
      {
      }
      
      public function method_35() : void
      {
      }
      
      public function stop(param1:TankData) : void
      {
      }
      
      public function method_31(param1:Boolean) : void
      {
      }
      
      public function get userControlsEnabled() : Boolean
      {
         return false;
      }
      
      public function method_32(param1:Vector3D) : void
      {
      }
      
      public function method_34(param1:ClientObject, param2:int, param3:int) : void
      {
      }
      
      public function method_36(param1:ClientObject, param2:int) : void
      {
      }
      
      public function getTank() : Tank
      {
         var result:Tank = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getTank();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function isLocal() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = Boolean(this.impl.isLocal());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
