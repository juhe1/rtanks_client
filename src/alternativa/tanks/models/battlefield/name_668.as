package alternativa.tanks.models.battlefield
{
   import flash.utils.getTimer;
   
   internal class name_668
   {
      
      private static const const_1579:int = 10;
       
      
      private var var_1456:Number;
      
      private var _fps:Number;
      
      private var var_1455:Number;
      
      private var var_1458:Number;
      
      private var var_1454:int;
      
      private var var_1452:int;
      
      private var var_1457:int;
      
      private var var_1453:int;
      
      public function name_668()
      {
         super();
         this.reset();
      }
      
      public function get method_1671() : Number
      {
         return this.var_1456;
      }
      
      public function get fps() : Number
      {
         return this._fps;
      }
      
      public function get method_1668() : Number
      {
         return this.var_1455;
      }
      
      public function get method_1672() : Number
      {
         return this.var_1458;
      }
      
      public function method_1670() : Number
      {
         return 1000 / (this.var_1453 - this.var_1457) * this.var_1454;
      }
      
      public function get method_1669() : int
      {
         return this.var_1454;
      }
      
      public function get totalTime() : int
      {
         return this.var_1453 - this.var_1457;
      }
      
      public function reset() : void
      {
         this.var_1452 = 0;
         this.var_1456 = 0;
         this._fps = 100;
         this.var_1455 = 100;
         this.var_1458 = 0;
         this.var_1454 = 0;
         this.var_1457 = getTimer();
         this.var_1453 = this.var_1457;
      }
      
      public function update() : void
      {
         var _loc1_:int = getTimer();
         this.method_1665();
         if(this.method_1666(_loc1_))
         {
            this.method_1664(_loc1_);
            this.method_1667();
            this.var_1453 = _loc1_;
         }
      }
      
      private function method_1665() : void
      {
         ++this.var_1454;
         ++this.var_1452;
      }
      
      private function method_1666(param1:int) : Boolean
      {
         return this.var_1452 >= 10 && param1 > this.var_1453;
      }
      
      private function method_1664(param1:int) : void
      {
         this.var_1456 = (param1 - this.var_1453) / this.var_1452;
         this._fps = 1000 / this.var_1456;
         this.var_1452 = 0;
      }
      
      private function method_1667() : void
      {
         this.var_1455 = Math.min(this.var_1455,this._fps);
         this.var_1458 = Math.max(this.var_1458,this._fps);
      }
   }
}
