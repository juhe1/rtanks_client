package package_97
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_1229;
   import alternativa.tanks.models.battlefield.IBattleField;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_465.AnimationTrack;
   import package_465.name_3180;
   
   public class SpawnFlashRenderer extends class_30 implements name_1229
   {
      
      public static var battleService:IBattleField = OSGi.getInstance().getService(IBattleField) as IBattleField;
      
      private static const const_2460:Vector.<Number> = Vector.<Number>([0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5]);
      
      private static const method_393:Vector.<Number> = Vector.<Number>([0,130.05,255,201.45,140.25,104.55,66.3,40.8,25.5,10.2,0]);
      
      private static const const_2459:AnimationTrack = new AnimationTrack(const_2460,method_393);
       
      
      private var colorTransform:name_3181;
      
      private var animation:name_3180;
      
      private var bonus:ParaBonus;
      
      public function SpawnFlashRenderer(param1:ObjectPool)
      {
         this.colorTransform = new name_3181();
         this.animation = new name_3180(const_2459,this.colorTransform);
         super(param1);
      }
      
      public function start(param1:ParaBonus) : void
      {
         this.bonus = param1;
         param1.const_466.add(this.destroy);
         param1.const_467.add(this.destroy);
         param1.const_468.add(this.destroy);
         param1.skin.name_1196(this.colorTransform.colorTransform);
         battleService.getBattlefieldData().viewport.name_755(this,0);
         this.animation.start();
      }
      
      public function render(param1:int, param2:int) : void
      {
         if(this.animation.name_3182())
         {
            this.bonus.var_743.activate(battleService as BattlefieldModel);
            this.destroy();
         }
         else
         {
            this.animation.update(param2 / 1000);
         }
      }
      
      override protected function getClass() : Class
      {
         return SpawnFlashRenderer;
      }
      
      private function destroy() : void
      {
         battleService.getBattlefieldData().viewport.method_776(this,0);
         this.bonus.const_466.remove(this.destroy);
         this.bonus.const_467.remove(this.destroy);
         this.bonus.const_468.remove(this.destroy);
         this.bonus.skin.name_1196(null);
         this.bonus = null;
         method_584();
      }
   }
}
