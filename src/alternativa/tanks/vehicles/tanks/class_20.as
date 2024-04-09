package alternativa.tanks.vehicles.tanks
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.physics.Body;
   import alternativa.tanks.models.weapon.name_903;
   import package_37.Vector3;
   import package_47.BattleTeamType;
   
   public interface class_20
   {
       
      
      function method_458(param1:name_903, param2:int = 0) : Boolean;
      
      function method_456() : Body;
      
      function method_463(param1:int = 0) : Vector3;
      
      function method_457() : Vector3;
      
      function method_462(param1:int = 0) : Number;
      
      function name_144() : Object3D;
      
      function method_460() : int;
      
      function method_461() : TankSkin;
      
      function method_459(param1:int = 7) : void;
      
      function get teamType() : BattleTeamType;
   }
}
