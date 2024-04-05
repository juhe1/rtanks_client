package package_46
{
   import flash.utils.Dictionary;
   
   public class BattleEventSupport implements name_290
   {
       
      
      private var dispatcher:name_96;
      
      private var var_2049:Dictionary;
      
      public function BattleEventSupport(param1:name_96)
      {
         this.var_2049 = new Dictionary();
         super();
         this.dispatcher = param1;
      }
      
      public function name_1221(param1:Class, param2:Function) : void
      {
         this.var_2049[param1] = param2;
      }
      
      public function method_2132() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.var_2049)
         {
            this.dispatcher.name_973(_loc1_,this);
         }
      }
      
      public function method_2133() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.var_2049)
         {
            this.dispatcher.name_972(_loc1_,this);
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Function = this.var_2049[param1.constructor];
         if(_loc2_ != null)
         {
            _loc2_(param1);
         }
      }
      
      public function dispatchEvent(param1:Object) : void
      {
         this.dispatcher.dispatchEvent(param1);
      }
   }
}
