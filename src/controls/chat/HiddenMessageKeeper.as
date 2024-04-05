package controls.chat
{
   import flash.utils.Dictionary;
   
   public class HiddenMessageKeeper
   {
       
      
      private var var_3571:Dictionary;
      
      public function HiddenMessageKeeper()
      {
         this.var_3571 = new Dictionary();
         super();
      }
      
      public function method_2285(param1:String, param2:name_3079) : void
      {
         if(!(param1 in this.var_3571))
         {
            this.var_3571[param1] = new Vector.<name_3079>();
         }
         this.var_3571[param1].push(param2);
      }
      
      public function name_3095(param1:String) : Vector.<name_3079>
      {
         var _loc2_:Vector.<name_3079> = this.var_3571[param1];
         delete this.var_3571[param1];
         return _loc2_ != null ? _loc2_ : new Vector.<name_3079>();
      }
      
      public function method_2260(param1:String) : void
      {
         var _loc2_:Vector.<name_3079> = null;
         var _loc3_:Vector.<int> = null;
         var _loc4_:int = 0;
         var _loc5_:name_3079 = null;
         for each(_loc2_ in this.var_3571)
         {
            _loc3_ = new Vector.<int>();
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               _loc5_ = _loc2_[_loc4_] as name_3079;
               if(_loc5_.name_3082().uid == param1)
               {
                  _loc3_.push(_loc4_);
               }
               _loc4_++;
            }
            _loc4_ = _loc3_.length - 1;
            while(_loc4_ >= 0)
            {
               _loc2_.splice(_loc3_[_loc4_],1);
               _loc4_--;
            }
         }
      }
   }
}
