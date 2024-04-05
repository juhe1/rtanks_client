package package_254
{
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class class_37 extends Sprite
   {
       
      
      public var var_602:int = 5000;
      
      protected var var_599:int = 0;
      
      protected var var_601:int = -1;
      
      protected var _size:Point;
      
      protected var var_597:Point;
      
      private var var_21:int;
      
      private var var_600:String;
      
      private var var_598:name_1305;
      
      public function class_37()
      {
         super();
         this.var_597 = new Point();
      }
      
      public function draw(param1:Point) : void
      {
      }
      
      public function align(param1:int, param2:int) : void
      {
      }
      
      public function get id() : int
      {
         return this.var_21;
      }
      
      public function set id(param1:int) : void
      {
         this.var_21 = param1;
      }
      
      public function get groupKey() : String
      {
         return this.var_600;
      }
      
      public function set groupKey(param1:String) : void
      {
         this.var_600 = param1;
      }
      
      public function get timer() : name_1305
      {
         return this.var_598;
      }
      
      public function set timer(param1:name_1305) : void
      {
         this.var_598 = param1;
      }
      
      public function get size() : Point
      {
         return this._size;
      }
      
      public function get showNum() : int
      {
         return this.var_599;
      }
      
      public function set showNum(param1:int) : void
      {
         this.var_599 = param1;
      }
      
      public function get method_824() : int
      {
         return this.var_601;
      }
      
      public function get targetPoint() : Point
      {
         return this.var_597;
      }
      
      public function set targetPoint(param1:Point) : void
      {
         this.var_597 = param1.clone();
      }
   }
}
