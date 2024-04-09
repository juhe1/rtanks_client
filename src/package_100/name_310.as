package package_100
{
   import alternativa.physics.collision.name_1160;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.weapon.name_1419;
   import alternativa.tanks.models.weapon.name_903;
   import package_37.Vector3;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_61.RayHit;
   
   public class name_310 implements class_39
   {
      
      public static var battleService:IBattleField;
       
      
      private const const_459:Number = 0.9999;
      
      private var name_247:TanksCollisionDetector;
      
      private var maxDistance:Number;
      
      private var filter:name_1160;
      
      private var var_701:Boolean = false;
      
      public function name_310(param1:Number, param2:name_1160)
      {
         super();
         this.maxDistance = param1;
         this.filter = param2;
         this.name_247 = battleService.getBattlefieldData().name_247;
      }
      
      public function method_973() : void
      {
         this.var_701 = true;
      }
      
      protected function raycast(param1:Vector3, param2:Vector3, param3:RayHit) : Boolean
      {
         if(this.name_247.raycast(param1,param2,name_73.WEAPON,this.maxDistance,this.filter,param3))
         {
            param3.var_460 = !BattleUtils.name_1420(param3.var_81.name_787) || name_1419.name_1423(param1,param3.position);
            return true;
         }
         return false;
      }
      
      protected function method_976(param1:name_903, param2:Vector3) : Vector3
      {
         if(!this.var_701 || param2.vDot(param1.direction) > 0.9999)
         {
            return param1.name_1422;
         }
         return param1.name_1421;
      }
      
      public function method_975(param1:Number) : void
      {
         this.maxDistance = param1;
      }
      
      public function method_974(param1:name_903, param2:Vector3) : Vector.<RayHit>
      {
         return undefined;
      }
   }
}
