package package_240
{
   import alternativa.engine3d.objects.Decal;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_1229;
   import flash.utils.getTimer;
   
   public class FadingDecalsRenderer implements name_1229
   {
       
      
      public var battleService:BattlefieldModel;
      
      private var var_1411:int;
      
      private var entries:Vector.<name_2073>;
      
      private var var_1410:int;
      
      public function FadingDecalsRenderer(param1:int, param2:BattlefieldModel)
      {
         this.entries = new Vector.<name_2073>();
         super();
         this.var_1411 = param1;
         this.battleService = param2;
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:name_2073 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = this.var_1410;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = this.entries[_loc7_];
            _loc4_ = param1 - _loc3_.startTime;
            if(_loc4_ > this.var_1411)
            {
               _loc5_++;
               this.battleService.method_187(_loc3_.name_2074);
               --this.var_1410;
            }
            else
            {
               _loc3_.name_2074.alpha = 1 - _loc4_ / this.var_1411;
               if(_loc5_ > 0)
               {
                  this.entries[_loc7_ - _loc5_] = _loc3_;
               }
            }
            _loc7_++;
         }
         var _loc8_:int = this.var_1410;
         while(_loc8_ < _loc6_)
         {
            this.entries[_loc8_] = null;
            _loc8_++;
         }
      }
      
      public function add(param1:Decal) : void
      {
         this.entries[this.var_1410] = new name_2073(param1,getTimer());
         ++this.var_1410;
      }
   }
}
