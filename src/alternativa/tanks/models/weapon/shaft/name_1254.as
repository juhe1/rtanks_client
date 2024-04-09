package alternativa.tanks.models.weapon.shaft
{
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.logic.class_23;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.vehicles.tanks.TankSkin;
   import package_1.Main;
   import package_76.name_735;
   
   public class name_1254 implements class_23
   {
      
      private static const const_1812:Number = 0.005;
      
      private static const const_147:Number = 0.005;
      
      private static const const_1813:Number = 1.5707963267948966;
       
      
      private var camera:name_735;
      
      private var skin:TankSkin;
      
      private var var_2095:Number;
      
      private var battle:BattlefieldModel;
      
      public function name_1254(param1:name_735)
      {
         super();
         this.camera = param1;
         this.var_2095 = 1.5707963267948966;
         this.battle = Main.osgi.getService(IBattleField) as BattlefieldModel;
      }
      
      public function name_1146(param1:TankSkin) : void
      {
         this.skin = param1;
      }
      
      public function name_1278(param1:Number) : void
      {
         this.var_2095 = param1;
      }
      
      public function start() : void
      {
         this.battle.name_165().name_212(this);
      }
      
      public function stop() : void
      {
         this.battle.name_165().name_977(this);
      }
      
      public function method_504(param1:int, param2:int) : void
      {
         this.camera.fov += 0.005 * param2;
         if(this.camera.fov > this.var_2095)
         {
            this.camera.fov = this.var_2095;
         }
         var _loc3_:Number = this.skin.name_123.alpha;
         _loc3_ += 0.005 * param2;
         if(_loc3_ > 1)
         {
            _loc3_ = 1;
         }
         this.skin.name_1068(_loc3_);
         if(this.camera.fov == this.var_2095 && _loc3_ == 1)
         {
            this.stop();
         }
      }
   }
}
