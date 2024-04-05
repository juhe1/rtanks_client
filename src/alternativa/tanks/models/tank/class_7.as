package alternativa.tanks.models.tank
{
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.geom.Vector3D;
   import package_37.Vector3;
   import package_4.ClientObject;
   
   public interface class_7
   {
       
      
      function getTankData(param1:ClientObject) : TankData;
      
      function update(param1:TankData, param2:int, param3:int, param4:Number, param5:Number, param6:Vector3) : void;
      
      function method_33(param1:Boolean) : void;
      
      function method_35() : void;
      
      function stop(param1:TankData) : void;
      
      function method_31(param1:Boolean) : void;
      
      function get userControlsEnabled() : Boolean;
      
      function method_32(param1:Vector3D) : void;
      
      function method_34(param1:ClientObject, param2:int, param3:int) : void;
      
      function method_36(param1:ClientObject, param2:int) : void;
      
      function getTank() : Tank;
      
      function isLocal() : Boolean;
   }
}
