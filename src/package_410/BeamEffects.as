package package_410
{
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.sfx.name_657;
   import flash.utils.Dictionary;
   import package_4.ClientObject;
   
   public class BeamEffects
   {
       
      
      private var effects:Dictionary;
      
      private var battleService:BattlefieldModel;
      
      public function BeamEffects(param1:BattlefieldModel)
      {
         super();
         this.effects = new Dictionary();
         this.battleService = param1;
      }
      
      public function name_672(param1:ClientObject, param2:name_657) : void
      {
         this.effects[param1] = param2;
         this.battleService.name_217(param2);
      }
      
      public function name_696(param1:ClientObject) : void
      {
         var _loc2_:name_657 = this.effects[param1];
         if(_loc2_ != null)
         {
            _loc2_.kill();
            delete this.effects[param1];
         }
      }
   }
}
