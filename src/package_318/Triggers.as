package package_318
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.name_1384;
   import alternativa.tanks.battle.name_712;
   
   public class Triggers
   {
       
      
      private const const_443:Vector.<name_712> = new Vector.<name_712>();
      
      private const var_679:Vector.<name_1384> = new Vector.<name_1384>();
      
      private var running:Boolean;
      
      public function Triggers()
      {
         super();
      }
      
      public function add(param1:name_712) : void
      {
         if(this.running)
         {
            this.var_679.push(new name_2561(this,param1));
         }
         else if(this.const_443.indexOf(param1) < 0)
         {
            this.const_443.push(param1);
         }
      }
      
      public function remove(param1:name_712) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.running)
         {
            this.var_679.push(new name_2562(this,param1));
         }
         else
         {
            _loc2_ = int(this.const_443.length);
            if(_loc2_ > 0)
            {
               _loc3_ = this.const_443.indexOf(param1);
               if(_loc3_ >= 0)
               {
                  this.const_443[_loc3_] = this.const_443[--_loc2_];
                  this.const_443.length = _loc2_;
               }
            }
         }
      }
      
      public function name_1394(param1:Body) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:name_712 = null;
         if(param1 != null)
         {
            this.running = true;
            _loc2_ = int(this.const_443.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.const_443[_loc3_];
               _loc4_.method_1636(param1);
               _loc3_++;
            }
            this.running = false;
            this.method_2182();
         }
      }
      
      private function method_2182() : void
      {
         var _loc1_:name_1384 = null;
         while((_loc1_ = this.var_679.pop()) != null)
         {
            _loc1_.execute();
         }
      }
   }
}
