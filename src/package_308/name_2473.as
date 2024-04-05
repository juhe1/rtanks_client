package package_308
{
   import alternativa.physics.name_660;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_37.Vector3;
   
   public class name_2473
   {
       
      
      private var tank:Tank;
      
      private var var_3103:Vector3;
      
      private var localPoint:Vector3;
      
      public function name_2473()
      {
         this.var_3103 = new Vector3();
         this.localPoint = new Vector3();
         super();
      }
      
      public function name_2481(param1:Vector3, param2:Tank = null) : void
      {
         this.var_3103.copy(param1);
         this.tank = param2;
         if(this.name_2490())
         {
            this.localPoint.copy(param1);
            BattleUtils.globalToLocal(param2 as name_660,this.localPoint);
         }
      }
      
      public function name_2490() : Boolean
      {
         return this.tank != null;
      }
      
      public function getTank() : Tank
      {
         return this.tank;
      }
      
      public function name_2485() : Vector3
      {
         return this.var_3103;
      }
      
      public function name_2484() : Vector3
      {
         return this.localPoint;
      }
      
      public function reset() : void
      {
         this.tank = null;
         this.var_3103.reset();
         this.localPoint.reset();
      }
   }
}
