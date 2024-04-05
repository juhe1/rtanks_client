package alternativa.tanks.models.battlefield.logic
{
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.tank.spawn.name_279;
   import alternativa.tanks.utils.name_75;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_1.Main;
   import platform.client.fp10.core.type.name_70;
   
   public class name_130 implements class_23
   {
       
      
      private var readyTime:int;
      
      private var tank:Tank;
      
      private var battle:BattlefieldModel;
      
      private var var_392:Boolean;
      
      public function name_130(param1:int, param2:Tank)
      {
         super();
         this.readyTime = param1;
         this.tank = param2;
         this.battle = Main.osgi.name_6(name_83) as BattlefieldModel;
      }
      
      public function method_504(param1:int, param2:int) : void
      {
         var _loc3_:name_70 = null;
         var _loc4_:name_279 = null;
         if(this.tank != null && this.tank.skin != null)
         {
            this.tank.skin.name_1068(name_75.method_218((this.readyTime - param1) / 500,0,1));
         }
         if(param1 > this.readyTime)
         {
            this.stop();
            _loc3_ = this.tank.method_484();
            if(_loc3_ != null && _loc3_.gameClass != null)
            {
               _loc4_ = name_279(_loc3_.name_176(name_279));
               _loc4_.name_1069();
            }
         }
      }
      
      private function stop() : void
      {
         this.battle.name_165().name_977(this);
      }
   }
}
