package package_97
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.name_1229;
   import alternativa.tanks.models.battlefield.name_83;
   import package_238.ObjectPool;
   import package_238.class_30;
   
   public class name_1465 extends class_30 implements name_1229
   {
      
      private static const const_1906:Number = 0.005;
      
      public static var battleService:name_83 = OSGi.getInstance().name_6(name_83) as name_83;
       
      
      private var bonus:ParaBonus;
      
      private var var_2311:Number;
      
      public function name_1465(param1:ObjectPool)
      {
         super(param1);
      }
      
      public function start(param1:ParaBonus) : void
      {
         this.bonus = param1;
         this.var_2311 = 0;
         param1.const_466.add(this.destroy);
         param1.const_467.add(this.destroy);
         param1.const_468.add(this.destroy);
         battleService.getBattlefieldData().viewport.name_755(this,0);
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.var_2311 += 0.005 * param2;
         if(this.var_2311 > 1)
         {
            this.var_2311 = 1;
         }
         var _loc3_:BonusMesh = this.bonus.skin;
         _loc3_.name_2606(this.var_2311);
         _loc3_.name_1068(this.var_2311);
         if(this.var_2311 == 1)
         {
            this.method_2341();
            this.destroy();
         }
      }
      
      private function method_2341() : void
      {
         var _loc1_:SpawnFlashRenderer = SpawnFlashRenderer(battleService.getObjectPool().getObject(SpawnFlashRenderer));
         _loc1_.start(this.bonus);
      }
      
      override protected function getClass() : Class
      {
         return name_1465;
      }
      
      private function destroy() : void
      {
         battleService.getBattlefieldData().viewport.method_776(this,0);
         this.bonus.const_466.remove(this.destroy);
         this.bonus.const_467.remove(this.destroy);
         this.bonus.const_468.remove(this.destroy);
         this.bonus = null;
         method_584();
      }
   }
}
