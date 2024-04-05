package alternativa.tanks.models.battlefield
{
   import flash.utils.getTimer;
   
   public class name_1228
   {
       
      
      private var var_2071:int;
      
      private var var_1034:int;
      
      private var frameCounter:int;
      
      private var fps:Number = 0;
      
      public function name_1228(param1:int)
      {
         super();
         this.var_2071 = param1;
         this.var_1034 = getTimer();
      }
      
      public function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(++this.frameCounter >= this.var_2071)
         {
            _loc1_ = getTimer();
            _loc2_ = _loc1_ - this.var_1034;
            this.var_1034 = _loc1_;
            this.fps = 1000 * this.frameCounter / _loc2_;
            this.frameCounter = 0;
         }
      }
      
      public function name_1236() : Number
      {
         return this.fps;
      }
   }
}
