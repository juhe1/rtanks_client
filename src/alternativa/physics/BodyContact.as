package alternativa.physics
{
   public class BodyContact
   {
      
      private static var var_1689:BodyContact;
       
      
      public var body1:name_660;
      
      public var body2:name_660;
      
      public var const_368:Vector.<ShapeContact>;
      
      private var var_411:BodyContact;
      
      public function BodyContact()
      {
         this.const_368 = new Vector.<ShapeContact>();
         super();
      }
      
      public static function create() : BodyContact
      {
         if(var_1689 == null)
         {
            return new BodyContact();
         }
         var _loc1_:BodyContact = var_1689;
         var_1689 = var_1689.var_411;
         _loc1_.var_411 = null;
         return _loc1_;
      }
      
      public function dispose() : void
      {
         var _loc1_:ShapeContact = null;
         this.body1 = null;
         this.body2 = null;
         var _loc2_:uint = this.const_368.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.const_368[_loc3_];
            _loc1_.dispose();
            _loc3_++;
         }
         this.const_368.length = 0;
         this.var_411 = var_1689;
         var_1689 = this;
      }
      
      public function copy(param1:BodyContact) : void
      {
         this.body1 = param1.body1;
         this.body2 = param1.body2;
         var _loc2_:Vector.<ShapeContact> = param1.const_368;
         var _loc3_:uint = _loc2_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.const_368[this.const_368.length] = _loc2_[_loc4_];
            _loc4_++;
         }
      }
      
      public function name_1173(param1:Vector.<ShapeContact>) : void
      {
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.const_368[_loc3_] = param1[_loc3_];
            _loc3_++;
         }
      }
   }
}
