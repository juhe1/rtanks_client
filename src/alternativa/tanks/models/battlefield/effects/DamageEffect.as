package alternativa.tanks.models.battlefield.effects
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_1.Main;
   import package_37.Vector3;
   import package_61.RayHit;
   
   public class DamageEffect
   {
      
      private static const const_114:Vector3 = new Vector3();
      
      private static const const_117:Vector3 = new Vector3(0,0,1);
      
      private static const var_397:RayHit = new RayHit();
       
      
      private var battlefield:BattlefieldModel;
      
      public function DamageEffect()
      {
         super();
         this.battlefield = Main.osgi.getService(IBattleField) as BattlefieldModel;
      }
      
      public function name_220(param1:Tank, param2:int, param3:DamageIndicatorType) : void
      {
         var _loc4_:Object3D = param1.skin.name_144();
         var _loc5_:name_2652 = name_2652(this.battlefield.getObjectPool().getObject(name_2652));
         var _loc6_:uint = this.method_2392(param3);
         _loc5_.init(new Vector3(_loc4_.x,_loc4_.y,_loc4_.z),_loc6_,param2);
         this.battlefield.name_217(_loc5_);
      }
      
      private function method_2392(param1:DamageIndicatorType) : uint
      {
         switch(param1)
         {
            case DamageIndicatorType.FATAL:
               return 15741974;
            case DamageIndicatorType.CRITICAL:
               return 14207247;
            case DamageIndicatorType.HEAL:
               return 381208;
            default:
               return 16777215;
         }
      }
   }
}
