package package_464
{
   import flash.display.Shape;
   import utils.name_3361;
   
   public class name_2893 extends Shape
   {
      
      private static const const_2630:Number = 0;
      
      private static const const_414:Number = 1;
       
      
      private var var_3402:name_3361;
      
      private var var_2253:int;
      
      private var _size:int;
      
      private var var_3404:Number;
      
      private var var_3403:Number;
      
      private var var_3405:Boolean;
      
      public function name_2893(param1:Number, param2:Boolean = false)
      {
         super();
         this._size = param1;
         this.var_3405 = param2;
         this.init();
      }
      
      private static function method_218(param1:Number) : Number
      {
         return Math.max(0,Math.min(1,param1));
      }
      
      private function init() : void
      {
         this.var_2253 = Math.ceil(Math.sqrt(this._size * this._size + this._size * this._size) / 2);
         this.var_3402 = new name_3361(this.graphics);
      }
      
      public function method_284(param1:Number, param2:Number) : void
      {
         if(this.var_3404 == param1 && this.var_3403 == param2)
         {
            return;
         }
         this.var_3404 = param1;
         this.var_3403 = param2;
         var _loc3_:Number = 360 * method_218(param1);
         var _loc4_:Number = 360 * method_218(param2);
         var _loc5_:Number = _loc4_ - _loc3_;
         var _loc6_:Number = this.var_3405 ? Number(Number(-90)) : Number(Number(_loc3_ - 90));
         this.var_3402.clear();
         this.var_3402.beginFill(16711680);
         this.var_3402.name_3362(this._size / 2,this._size / 2,this.var_2253,_loc5_,_loc6_,true);
         this.var_3402.endFill();
      }
   }
}
