package package_46
{
   import flash.utils.Dictionary;
   
   public class BattleEventDispatcherImpl implements name_96
   {
       
      
      private var var_627:int;
      
      private var var_628:Dictionary;
      
      private var var_629:Dictionary;
      
      private var var_630:Dictionary;
      
      private var var_631:Dictionary;
      
      public function BattleEventDispatcherImpl()
      {
         this.var_628 = new Dictionary();
         this.var_629 = new Dictionary();
         this.var_630 = new Dictionary();
         this.var_631 = new Dictionary();
         super();
      }
      
      private static function addListener(param1:Dictionary, param2:Class, param3:name_290) : void
      {
         var _loc4_:Vector.<name_290> = param1[param2];
         if(_loc4_ == null)
         {
            _loc4_ = new Vector.<name_290>();
            param1[param2] = _loc4_;
         }
         if(_loc4_.indexOf(param3) < 0)
         {
            _loc4_.push(param3);
         }
      }
      
      private static function removeListener(param1:Dictionary, param2:Class, param3:name_290) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Vector.<name_290> = param1[param2];
         if(_loc5_ != null)
         {
            _loc4_ = _loc5_.indexOf(param3);
            if(_loc4_ >= 0)
            {
               if(_loc5_.length == 1)
               {
                  delete param1[param2];
               }
               else
               {
                  _loc5_.splice(_loc4_,1);
               }
            }
         }
      }
      
      public function name_973(param1:Class, param2:name_290) : void
      {
         if(this.var_627 > 0)
         {
            removeListener(this.var_630,param1,param2);
            addListener(this.var_629,param1,param2);
         }
         else
         {
            addListener(this.var_628,param1,param2);
         }
      }
      
      public function name_972(param1:Class, param2:name_290) : void
      {
         if(this.var_627 > 0)
         {
            removeListener(this.var_629,param1,param2);
            addListener(this.var_630,param1,param2);
         }
         else
         {
            removeListener(this.var_628,param1,param2);
         }
      }
      
      public function dispatchEvent(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         ++this.var_627;
         var _loc4_:Vector.<name_290> = this.var_628[param1.constructor];
         if(_loc4_ != null)
         {
            _loc2_ = int(_loc4_.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               name_290(_loc4_[_loc3_]).handleBattleEvent(param1);
               _loc3_++;
            }
         }
         --this.var_627;
         var _loc5_:name_1335 = param1 as name_1335;
         if(_loc5_ != null)
         {
            _loc5_.name_1336();
         }
         this.method_882();
      }
      
      public function method_622(param1:Object) : void
      {
         if(!this.var_631[param1.constructor])
         {
            this.var_631[param1.constructor] = true;
            this.dispatchEvent(param1);
         }
      }
      
      public function method_621() : void
      {
         this.var_631 = new Dictionary();
      }
      
      private function method_882() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Vector.<name_290> = null;
         if(this.var_627 > 0)
         {
            return;
         }
         for(_loc4_ in this.var_630)
         {
            _loc5_ = this.var_630[_loc1_];
            delete this.var_630[_loc1_];
            _loc3_ = int(_loc5_.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               removeListener(this.var_628,_loc4_,_loc5_[_loc2_]);
               _loc2_++;
            }
         }
         for(_loc4_ in this.var_629)
         {
            _loc5_ = this.var_629[_loc1_];
            delete this.var_629[_loc1_];
            _loc3_ = int(_loc5_.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               addListener(this.var_628,_loc4_,_loc5_[_loc2_]);
               _loc2_++;
            }
         }
      }
   }
}
