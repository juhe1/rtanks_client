package package_42
{
   import alternativa.tanks.utils.BitVector;
   
   public class TankBodyIdProvider
   {
      
      private static const const_1566:int = 64;
      
      private static const instance:TankBodyIdProvider = new TankBodyIdProvider();
       
      
      private const ids:Vector.<int> = new Vector.<int>(64,true);
      
      private const const_1565:BitVector = new BitVector(64);
      
      private var var_1415:int;
      
      public function TankBodyIdProvider()
      {
         super();
         this.reset();
      }
      
      public static function name_779() : int
      {
         return instance.method_1633();
      }
      
      public static function name_756(param1:int) : void
      {
         instance.release(param1);
      }
      
      public static function name_1393() : void
      {
         instance.reset();
      }
      
      public function method_1633() : int
      {
         var _loc1_:int = 0;
         if(this.var_1415 < 64)
         {
            _loc1_ = this.ids[this.var_1415++];
            this.const_1565.name_2080(_loc1_);
            return _loc1_;
         }
         throw new Error();
      }
      
      public function release(param1:int) : void
      {
         if(this.const_1565.name_2079(param1) == 1)
         {
            this.const_1565.name_2078(param1);
            var _loc2_:* = --this.var_1415;
            this.ids[_loc2_] = param1;
         }
      }
      
      public function reset() : void
      {
         this.var_1415 = 0;
         var _loc1_:int = 0;
         while(_loc1_ < 64)
         {
            this.ids[_loc1_] = _loc1_;
            _loc1_++;
         }
         this.const_1565.clear();
      }
   }
}
