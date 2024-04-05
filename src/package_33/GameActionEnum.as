package package_33
{
   import alternativa.tanks.class_18;
   
   public class GameActionEnum extends class_18
   {
      
      private static var var_292:Vector.<GameActionEnum>;
      
      public static const ROTATE_TURRET_LEFT:GameActionEnum = new GameActionEnum(0,"ROTATE_TURRET_LEFT");
      
      public static const ROTATE_TURRET_RIGHT:GameActionEnum = new GameActionEnum(1,"ROTATE_TURRET_RIGHT");
      
      public static const CENTER_TURRET:GameActionEnum = new GameActionEnum(2,"CENTER_TURRET");
      
      public static const CHASSIS_LEFT_MOVEMENT:GameActionEnum = new GameActionEnum(3,"CHASSIS_LEFT_MOVEMENT");
      
      public static const CHASSIS_RIGHT_MOVEMENT:GameActionEnum = new GameActionEnum(4,"CHASSIS_RIGHT_MOVEMENT");
      
      public static const CHASSIS_FORWARD_MOVEMENT:GameActionEnum = new GameActionEnum(5,"CHASSIS_FORWARD_MOVEMENT");
      
      public static const CHASSIS_BACKWARD_MOVEMENT:GameActionEnum = new GameActionEnum(6,"CHASSIS_BACKWARD_MOVEMENT");
      
      public static const FOLLOW_CAMERA_UP:GameActionEnum = new GameActionEnum(7,"FOLLOW_CAMERA_UP");
      
      public static const FOLLOW_CAMERA_DOWN:GameActionEnum = new GameActionEnum(8,"FOLLOW_CAMERA_DOWN");
      
      public static const DROP_FLAG:GameActionEnum = new GameActionEnum(9,"DROP_FLAG");
      
      public static const BATTLE_PAUSE:GameActionEnum = new GameActionEnum(10,"BATTLE_PAUSE");
      
      public static const BATTLE_VIEW_INCREASE:GameActionEnum = new GameActionEnum(11,"BATTLE_VIEW_INCREASE");
      
      public static const BATTLE_VIEW_DECREASE:GameActionEnum = new GameActionEnum(12,"BATTLE_VIEW_DECREASE");
      
      public static const FULL_SCREEN:GameActionEnum = new GameActionEnum(13,"FULL_SCREEN");
      
      public static const SUICIDE:GameActionEnum = new GameActionEnum(14,"SUICIDE");
      
      public static const SHOW_TANK_PARAMETERS:GameActionEnum = new GameActionEnum(15,"SHOW_TANK_PARAMETERS");
      
      public static const USE_FIRS_AID:GameActionEnum = new GameActionEnum(16,"USE_FIRS_AID");
      
      public static const USE_DOUBLE_ARMOR:GameActionEnum = new GameActionEnum(17,"USE_DOUBLE_ARMOR");
      
      public static const USE_DOUBLE_DAMAGE:GameActionEnum = new GameActionEnum(18,"USE_DOUBLE_DAMAGE");
      
      public static const USE_NITRO:GameActionEnum = new GameActionEnum(19,"USE_NITRO");
      
      public static const USE_MINE:GameActionEnum = new GameActionEnum(20,"USE_MINE");
      
      public static const DROP_GOLD_BOX:GameActionEnum = new GameActionEnum(21,"DROP_GOLD_BOX");
      
      public static const SHOT:GameActionEnum = new GameActionEnum(22,"SHOT");
      
      public static const ULTIMATE:GameActionEnum = new GameActionEnum(23,"ULTIMATE");
      
      public static const OPEN_GARAGE:GameActionEnum = new GameActionEnum(24,"OPEN_GARAGE");
      
      public static const LOOK_AROUND:GameActionEnum = new GameActionEnum(25,"LOOK_AROUND");
       
      
      public function GameActionEnum(param1:int, param2:String)
      {
         super(param1,param2);
      }
      
      public static function get method_393() : Vector.<GameActionEnum>
      {
         if(!var_292)
         {
            var_292 = new Vector.<GameActionEnum>();
            var_292.push(ROTATE_TURRET_LEFT);
            var_292.push(ROTATE_TURRET_RIGHT);
            var_292.push(CENTER_TURRET);
            var_292.push(CHASSIS_LEFT_MOVEMENT);
            var_292.push(CHASSIS_RIGHT_MOVEMENT);
            var_292.push(CHASSIS_FORWARD_MOVEMENT);
            var_292.push(CHASSIS_BACKWARD_MOVEMENT);
            var_292.push(FOLLOW_CAMERA_UP);
            var_292.push(FOLLOW_CAMERA_DOWN);
            var_292.push(DROP_FLAG);
            var_292.push(BATTLE_PAUSE);
            var_292.push(BATTLE_VIEW_INCREASE);
            var_292.push(BATTLE_VIEW_DECREASE);
            var_292.push(FULL_SCREEN);
            var_292.push(SUICIDE);
            var_292.push(SHOW_TANK_PARAMETERS);
            var_292.push(USE_FIRS_AID);
            var_292.push(USE_DOUBLE_ARMOR);
            var_292.push(USE_DOUBLE_DAMAGE);
            var_292.push(USE_NITRO);
            var_292.push(USE_MINE);
            var_292.push(DROP_GOLD_BOX);
            var_292.push(SHOT);
            var_292.push(ULTIMATE);
            var_292.push(OPEN_GARAGE);
            var_292.push(LOOK_AROUND);
         }
         return var_292;
      }
   }
}
