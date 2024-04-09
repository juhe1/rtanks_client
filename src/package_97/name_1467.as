package package_97
{
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_1229;
   import alternativa.tanks.models.battlefield.IBattleField;
   import package_1.Main;
   import package_238.ObjectPool;
   import package_238.class_30;
   
   public class name_1467 extends class_30 implements name_1229
   {
      
      public static var battleService:BattlefieldModel = BattlefieldModel(Main.osgi.getService(IBattleField));
      
      private static const const_147:Number = 0.001;
       
      
      private var object:BonusMesh;
      
      private var cords:Cords;
      
      private var parachute:name_1461;
      
      private var alpha:Number = 0;
      
      public function name_1467(param1:ObjectPool)
      {
         super(param1);
      }
      
      public function start(param1:BonusMesh, param2:Cords, param3:name_1461) : void
      {
         this.object = param1;
         this.cords = param2;
         this.parachute = param3;
         this.alpha = 0;
         battleService.getBattlefieldData().viewport.name_755(this,0);
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.alpha += 0.001 * param2;
         if(this.alpha > 1)
         {
            this.alpha = 1;
         }
         this.object.name_1068(this.alpha);
         this.cords.name_1068(this.alpha);
         this.parachute.name_1068(this.alpha);
         if(this.alpha >= 1)
         {
            this.destroy();
         }
      }
      
      override protected function getClass() : Class
      {
         return name_1467;
      }
      
      private function destroy() : void
      {
         if(this.object != null)
         {
            battleService.getBattlefieldData().viewport.method_776(this,0);
            this.object = null;
            this.cords = null;
            this.parachute = null;
            method_584();
         }
      }
   }
}
