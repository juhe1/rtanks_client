package package_296
{
   import package_294.name_2538;
   import package_427.class_179;
   import package_427.name_2537;
   
   public class name_2351 extends class_179
   {
       
      
      public var var_3049:int = 10;
      
      public function name_2351()
      {
         super();
         var_2217 = 6;
      }
      
      public function method_223(param1:name_2537) : void
      {
         var _loc3_:name_2537 = null;
         method_2285(param1);
         if(var_170.numChildren > this.var_3049)
         {
            _loc3_ = name_1352();
            if(_loc3_ != null)
            {
               _loc3_.removeEventListener(name_2538.name_2539,this.method_2286);
               _loc3_.removeEventListener(name_2538.name_3053,this.updateUid);
            }
         }
         param1.addEventListener(name_2538.name_2539,this.method_2286);
         param1.addEventListener(name_2538.name_3053,this.updateUid);
         var _loc2_:int = param1 is KillMessageOutputLine ? int(6) : int(10);
         param1.x = -param1.width - _loc2_;
      }
      
      private function method_2286(param1:name_2538) : void
      {
         if(var_170.contains(param1.line))
         {
            name_1352();
         }
         param1.line.removeEventListener(name_2538.name_2539,this.method_2286);
      }
      
      private function updateUid(param1:name_2538) : void
      {
         var _loc2_:name_2537 = param1.line;
         var _loc3_:int = _loc2_ is KillMessageOutputLine ? int(6) : int(10);
         _loc2_.x = -_loc2_.width - _loc3_;
         _loc2_.removeEventListener(name_2538.name_3053,this.method_2286);
      }
   }
}
