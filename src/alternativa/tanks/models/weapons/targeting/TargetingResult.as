package alternativa.tanks.models.weapons.targeting
{
   import alternativa.tanks.battle.BattleUtils;
   import package_37.Vector3;
   import package_61.RayHit;
   
   public class TargetingResult
   {
       
      
      private var direction:Vector3;
      
      private var var_460:RayHit;
      
      private var var_2486:Vector.<RayHit>;
      
      public function TargetingResult()
      {
         this.direction = new Vector3();
         super();
      }
      
      public function method_695() : Boolean
      {
         return this.var_460 != null;
      }
      
      public function method_2492() : RayHit
      {
         return this.var_460;
      }
      
      public function name_1755() : Vector3
      {
         return this.direction;
      }
      
      public function method_2491() : Vector.<RayHit>
      {
         return this.var_2486;
      }
      
      public function name_1757() : Boolean
      {
         return this.var_2486.length > 0;
      }
      
      public function method_2493() : Boolean
      {
         return this.var_460 != null || this.var_2486.length > 0;
      }
      
      public function name_452(param1:Vector3, param2:Vector.<RayHit>) : void
      {
         var _loc3_:RayHit = null;
         this.direction.copy(param1);
         this.var_2486 = param2.concat();
         this.var_460 = null;
         if(this.var_2486.length > 0)
         {
            _loc3_ = this.var_2486[this.var_2486.length - 1];
            if(!BattleUtils.name_1420(_loc3_.var_81.name_787))
            {
               this.var_460 = this.var_2486.pop();
            }
         }
      }
      
      public function name_1751() : RayHit
      {
         if(this.var_460 != null)
         {
            return this.var_460;
         }
         return this.var_2486[0];
      }
   }
}
