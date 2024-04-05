package package_40
{
   import alternativa.tanks.vehicles.tanks.chassis.SpeedCharacteristics;
   import package_41.TankSpecification;
   import package_41.TankState;
   import package_47.BattleTeamType;
   
   public class ClientTank
   {
       
      
      public var self:Boolean;
      
      public var teamType:BattleTeamType;
      
      public var incarnationId:int;
      
      public var tankSpecification:TankSpecification;
      
      public var speedCharacteristics:SpeedCharacteristics;
      
      public var tankState:TankState;
      
      public var tankSpawnState:TankSpawnState;
      
      public var health:int;
      
      public function ClientTank()
      {
         super();
      }
   }
}
