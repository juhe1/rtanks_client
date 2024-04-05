package package_134
{
   import flash.events.EventDispatcher;
   
   public class name_545 extends EventDispatcher implements name_357
   {
       
      
      private var var_1128:Boolean = false;
      
      public function name_545()
      {
         super();
      }
      
      public function method_1152() : Boolean
      {
         return this.var_1128;
      }
      
      public function setState(param1:Boolean) : void
      {
         this.var_1128 = param1;
         if(this.var_1128)
         {
            dispatchEvent(new BattlePassPurchaseEvent());
         }
      }
   }
}
