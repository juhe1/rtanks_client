package alternativa.tanks.vehicles.tanks
{
   import alternativa.physics.Body;
   import package_289.TurretControlType;
   import package_37.Matrix3;
   
   public interface WeaponMount
   {
       
      
      function reset() : void;
      
      function method_1906() : void;
      
      function var_165(param1:Body) : void;
      
      function interpolate(param1:Number, param2:int) : void;
      
      function rotate(param1:Number, param2:Matrix3) : void;
      
      function name_948() : Boolean;
      
      function name_930() : Number;
      
      function name_937() : Number;
      
      function method_1903(param1:Number) : void;
      
      function method_1902() : TurretControlType;
      
      function method_1904() : Number;
      
      function method_1905() : int;
      
      function name_1087(param1:TurretControlType, param2:Number, param3:int) : void;
      
      function method_1908() : Number;
      
      function method_1907(param1:Number) : void;
      
      function name_201(param1:Number, param2:Boolean) : void;
      
      function name_1159() : Number;
      
      function name_1276() : Number;
      
      function name_246(param1:Number) : void;
      
      function method_486(param1:Number) : void;
      
      function lock(param1:int) : void;
      
      function unlock(param1:int) : void;
      
      function name_954() : int;
   }
}
