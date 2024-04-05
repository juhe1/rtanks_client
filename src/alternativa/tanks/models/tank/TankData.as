package alternativa.tanks.models.tank
{
   import alternativa.tanks.models.weapon.name_213;
   import alternativa.tanks.sfx.name_127;
   import alternativa.tanks.utils.CircularObjectBuffer;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_4.ClientObject;
   import package_40.TankSpawnState;
   import package_47.BattleTeamType;
   import platform.client.fp10.core.type.name_70;
   
   public class TankData
   {
      
      public static var var_293:int = 10;
      
      public static var name_106:TankData;
       
      
      public var battlefield:ClientObject;
      
      public var user:ClientObject;
      
      public var turret:ClientObject;
      
      public var hull:ClientObject;
      
      public var weapon:name_213;
      
      public var local:Boolean;
      
      public var health:int;
      
      public var tank:Tank;
      
      public var ctrlBits:int;
      
      public var enabled:Boolean;
      
      public var teamType:BattleTeamType;
      
      public var userName:String;
      
      public var userRank:int;
      
      public var sounds:name_127;
      
      public var name_197:int;
      
      public var name_87:TankSpawnState;
      
      public var mass:Number = 1;
      
      public var power:Number = 0;
      
      public var name_149:int;
      
      public var object:name_70;
      
      public var name_78:int;
      
      private var events:CircularObjectBuffer;
      
      public function TankData()
      {
         this.events = new CircularObjectBuffer(var_293);
         super();
      }
      
      public function name_84(param1:Object) : void
      {
         this.events.name_884(param1);
      }
      
      public function toString() : String
      {
         var _loc2_:Object = null;
         var _loc1_:String = "user id=" + this.user.id + "\n" + "user name=" + this.userName + "\n" + "user rank=" + this.userRank + "\n" + "local=" + this.local + "\n" + "team type=" + (this.teamType == null ? "none" : this.teamType.toString()) + "\n" + "incarnation=" + this.name_149 + "\n" + "health=" + this.health + "\n" + "enabled=" + this.enabled + "\n" + "ctrlBits=" + this.ctrlBits + "\n" + "mass=" + this.mass + "\n" + "power=" + this.power + "\n" + "turret id=" + (this.turret == null ? null : this.turret.id) + "\n" + "hull id=" + (this.hull == null ? null : this.hull.id) + "\n" + "title.hidden=" + (this.tank == null ? "none" : this.tank.title.name_885()) + "\n" + "collisionGroup=" + (this.tank == null ? "none" : this.tank.collisionGroup) + "\n" + "pos=" + (this.tank == null ? "none" : this.tank.state.position) + "\n" + "orientation=" + (this.tank == null ? "none" : this.tank.state.orientation) + "\n";
         _loc1_ += "Last events: \n";
         for each(_loc2_ in this.events.method_141())
         {
            _loc1_ += _loc2_.toString() + "\n";
         }
         return _loc1_;
      }
   }
}
