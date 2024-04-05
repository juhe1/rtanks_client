package package_97
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_1229;
   import alternativa.tanks.models.battlefield.name_83;
   import package_1.Main;
   import package_238.ObjectPool;
   import package_238.class_30;
   
   public class name_1462 extends class_30 implements name_1229
   {
      
      public static var battleService:BattlefieldModel = BattlefieldModel(Main.osgi.name_6(name_83));
      
      private static const const_1907:Number = 0.001;
       
      
      private var var_2316:BonusMesh;
      
      public function name_1462(param1:ObjectPool)
      {
         super(param1);
      }
      
      public function init(param1:BonusMesh) : void
      {
         this.var_2316 = param1;
         battleService.var_117.viewport.name_755(this,0);
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.method_2346(param2);
      }
      
      private function method_2346(param1:int) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = this.var_2316.name_2499();
         _loc4_ -= 0.001 * param1;
         if(_loc4_ > 0)
         {
            this.var_2316.name_1068(_loc4_);
            _loc2_ = this.var_2316.name_2609();
            if(_loc2_ > 0)
            {
               _loc3_ = _loc2_ - 0.002 * param1;
               if(_loc3_ < 0)
               {
                  _loc3_ = 0;
               }
               this.var_2316.name_2606(_loc3_);
            }
         }
         else
         {
            this.destroy();
         }
      }
      
      override protected function getClass() : Class
      {
         return name_1462;
      }
      
      private function destroy() : void
      {
         battleService.var_117.viewport.method_776(this,0);
         if(this.var_2316 != null)
         {
            this.var_2316.alternativa3d::removeFromParent();
            this.var_2316.name_2606(1);
            this.var_2316.name_1336();
            this.var_2316 = null;
         }
         method_584();
      }
   }
}
