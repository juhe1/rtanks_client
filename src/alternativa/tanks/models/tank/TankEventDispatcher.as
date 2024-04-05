package alternativa.tanks.models.tank
{
   import flash.utils.Dictionary;
   
   public class TankEventDispatcher implements name_103
   {
       
      
      private var var_1614:Boolean;
      
      private var var_628:Dictionary;
      
      private var var_1613:Dictionary;
      
      private var var_630:Dictionary;
      
      public function TankEventDispatcher()
      {
         this.var_628 = new Dictionary();
         this.var_1613 = new Dictionary();
         this.var_630 = new Dictionary();
         super();
      }
      
      public function name_718(param1:int, param2:class_15) : void
      {
         if(this.var_1614)
         {
            this.removeListener(this.var_630,param1,param2);
            this.addListener(this.var_1613,param1,param2);
         }
         else
         {
            this.addListener(this.var_628,param1,param2);
         }
      }
      
      public function name_717(param1:int, param2:class_15) : void
      {
         if(this.var_1614)
         {
            this.removeListener(this.var_1613,param1,param2);
            this.addListener(this.var_630,param1,param2);
         }
         else
         {
            this.removeListener(this.var_628,param1,param2);
         }
      }
      
      public function dispatchEvent(param1:int, param2:TankData) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_1614 = true;
         var _loc3_:Vector.<class_15> = this.var_628[param1];
         if(_loc3_ != null)
         {
            _loc4_ = int(_loc3_.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               class_15(_loc3_[_loc5_]).handleTankEvent(param1,param2);
               _loc5_++;
            }
         }
         this.var_1614 = false;
         this.method_882();
      }
      
      private function addListener(param1:Dictionary, param2:int, param3:class_15) : void
      {
         var _loc5_:int = 0;
         var _loc4_:Vector.<class_15> = param1[param2];
         if(_loc4_ == null)
         {
            _loc4_ = new Vector.<class_15>();
            param1[param2] = _loc4_;
         }
         else
         {
            _loc5_ = _loc4_.indexOf(param3);
            if(_loc5_ > -1)
            {
               return;
            }
         }
         _loc4_.push(param3);
      }
      
      private function removeListener(param1:Dictionary, param2:int, param3:class_15) : void
      {
         var _loc4_:Vector.<class_15> = param1[param2];
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:int = _loc4_.indexOf(param3);
         if(_loc5_ < 0)
         {
            return;
         }
         if(_loc4_.length == 1)
         {
            delete param1[param2];
         }
         else
         {
            _loc4_.splice(_loc5_,1);
         }
      }
      
      private function method_882() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Vector.<class_15> = null;
         for(_loc1_ in this.var_630)
         {
            _loc4_ = _loc1_;
            _loc5_ = this.var_630[_loc1_];
            delete this.var_630[_loc1_];
            _loc3_ = int(_loc5_.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.removeListener(this.var_628,_loc4_,_loc5_[_loc2_]);
               _loc2_++;
            }
         }
         for(_loc1_ in this.var_1613)
         {
            _loc4_ = _loc1_;
            _loc5_ = this.var_1613[_loc1_];
            delete this.var_1613[_loc1_];
            _loc3_ = int(_loc5_.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.addListener(this.var_628,_loc4_,_loc5_[_loc2_]);
               _loc2_++;
            }
         }
      }
   }
}
