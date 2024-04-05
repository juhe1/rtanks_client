package package_15
{
   import flash.display.StageDisplayState;
   import flash.events.FullScreenEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import package_12.name_24;
   import package_18.name_38;
   
   public class name_35 implements name_38
   {
      
      private static const const_52:int = 250;
       
      
      private var var_221:Boolean;
      
      private var var_222:uint;
      
      public function name_35(param1:name_24, param2:Boolean)
      {
         super();
         if(param2)
         {
            param1.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.method_320);
            this.var_221 = param1.stage.displayState != StageDisplayState.NORMAL;
         }
      }
      
      private function method_320(param1:FullScreenEvent) : void
      {
         clearTimeout(this.var_222);
         if(param1.fullScreen)
         {
            this.var_221 = true;
         }
         else
         {
            this.var_222 = setTimeout(this.method_321,250);
         }
      }
      
      private function method_321() : void
      {
         this.var_221 = false;
      }
      
      public function method_206() : Boolean
      {
         return this.var_221;
      }
   }
}
