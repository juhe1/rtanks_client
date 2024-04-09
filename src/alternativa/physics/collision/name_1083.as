package alternativa.physics.collision
{
   import alternativa.physics.BodyContact;
   import alternativa.physics.ShapeContact;
   import alternativa.tanks.vehicles.tanks.TankBody;
   import package_37.Vector3;
   import package_61.RayHit;
   
   public interface name_1083
   {
       
      
      function method_696(param1:Vector.<BodyContact>) : void;
      
      function raycast(param1:Vector3, param2:Vector3, param3:int, param4:Number, param5:name_1160, param6:RayHit) : Boolean;
      
      function name_251(param1:Vector3, param2:Vector3, param3:int, param4:Number, param5:name_1160, param6:RayHit) : Boolean;
      
      function method_695(param1:Vector3, param2:Vector3, param3:int, param4:Number, param5:name_1160 = null) : Boolean;
      
      function method_694(param1:CollisionPrimitive, param2:CollisionPrimitive, param3:Vector.<ShapeContact>) : void;
      
      function method_698(param1:CollisionPrimitive, param2:CollisionPrimitive) : Boolean;
      
      function method_697() : Vector.<TankBody>;
   }
}
