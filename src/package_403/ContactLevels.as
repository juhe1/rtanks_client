package package_403
{
   import alternativa.physics.BodyContact;
   import alternativa.physics.Body;
   
   public class ContactLevels
   {
       
      
      private const var_793:Vector.<BodyContact> = new Vector.<BodyContact>();
      
      public function ContactLevels()
      {
         super();
      }
      
      public function init(param1:Vector.<BodyContact>) : void
      {
         var _loc2_:int = int(param1.length);
         this.var_793.length = _loc2_;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_793[_loc3_] = param1[_loc3_];
            _loc3_++;
         }
      }
      
      public function clear() : void
      {
         this.var_793.length = 0;
      }
      
      public function name_2863(param1:Vector.<BodyContact>, param2:Vector.<Body>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:BodyContact = null;
         _loc3_ = 0;
         while(_loc3_ < this.var_793.length)
         {
            _loc4_ = this.var_793[_loc3_];
            if(this.method_3055(_loc4_))
            {
               param1[param1.length] = _loc4_;
               param2[param2.length] = this.method_3054(_loc4_);
               this.method_3053(_loc3_);
               _loc3_--;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.var_793.length)
         {
            _loc4_ = this.var_793[_loc3_];
            if(param2.indexOf(_loc4_.body1) >= 0 && param2.indexOf(_loc4_.body2) >= 0)
            {
               param1[param1.length] = _loc4_;
               this.method_3053(_loc3_);
               _loc3_--;
            }
            _loc3_++;
         }
      }
      
      private function method_3055(param1:BodyContact) : Boolean
      {
         return !(param1.body1.var_317 && param1.body2.var_317);
      }
      
      private function method_3054(param1:BodyContact) : Body
      {
         if(param1.body1.var_317)
         {
            return param1.body1;
         }
         return param1.body2;
      }
      
      private function method_3053(param1:int) : void
      {
         var _loc2_:int = this.var_793.length - 1;
         this.var_793[param1] = this.var_793[_loc2_];
         this.var_793.length = _loc2_;
      }
      
      public function name_2865(param1:Vector.<Body>, param2:Vector.<BodyContact>, param3:Vector.<Body>) : void
      {
         var _loc4_:int = 0;
         var _loc5_:BodyContact = null;
         _loc4_ = 0;
         while(_loc4_ < this.var_793.length)
         {
            _loc5_ = this.var_793[_loc4_];
            if(this.method_3057(param1,_loc5_))
            {
               param2[param2.length] = _loc5_;
               param3[param3.length] = this.method_3056(_loc5_,param1);
               this.method_3053(_loc4_);
               _loc4_--;
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < this.var_793.length)
         {
            _loc5_ = this.var_793[_loc4_];
            if(param3.indexOf(_loc5_.body1) >= 0 && param3.indexOf(_loc5_.body2) >= 0)
            {
               param2[param2.length] = _loc5_;
               this.method_3053(_loc4_);
               _loc4_--;
            }
            _loc4_++;
         }
      }
      
      private function method_3057(param1:Vector.<Body>, param2:BodyContact) : Boolean
      {
         return param1.indexOf(param2.body1) >= 0 || param1.indexOf(param2.body2) >= 0;
      }
      
      private function method_3056(param1:BodyContact, param2:Vector.<Body>) : Body
      {
         if(param2.indexOf(param1.body1) < 0)
         {
            return param1.body1;
         }
         return param1.body2;
      }
      
      public function name_2864() : Boolean
      {
         return this.var_793.length > 0;
      }
   }
}
