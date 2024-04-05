package package_271
{
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import package_13.Long;
   import platform.client.fp10.core.network.connection.*;
   
   public class XorBasedProtectionContext implements name_837
   {
       
      
      private var var_1627:Vector.<int>;
      
      private var var_1626:int = 0;
      
      private var var_1629:Vector.<int>;
      
      private var var_1628:int = 0;
      
      private var var_1625:int;
      
      public function XorBasedProtectionContext(param1:ByteArray, param2:Long)
      {
         this.var_1627 = new Vector.<int>(8,true);
         this.var_1629 = new Vector.<int>(8,true);
         super();
         this.var_1625 = 0;
         var _loc3_:int = 0;
         while(_loc3_ < 32)
         {
            this.var_1625 ^= param1[_loc3_];
            _loc3_++;
         }
         this.var_1625 ^= param2.high >> 24 & 255;
         this.var_1625 ^= param2.high >> 16 & 255;
         this.var_1625 ^= param2.high >> 8 & 255;
         this.var_1625 ^= param2.high >> 0 & 255;
         this.var_1625 ^= param2.low >> 24 & 255;
         this.var_1625 ^= param2.low >> 16 & 255;
         this.var_1625 ^= param2.low >> 8 & 255;
         this.var_1625 ^= param2.low >> 0 & 255;
         this.var_1625 = this.var_1625 >= 128 ? int(this.var_1625 - 256) : int(this.var_1625);
         this.reset();
      }
      
      public function reset() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            this.var_1627[_loc1_] = this.var_1625 ^ _loc1_ << 3;
            this.var_1629[_loc1_] = this.var_1625 ^ _loc1_ << 3 ^ 87;
            _loc1_++;
         }
         this.var_1626 = 0;
         this.var_1628 = 0;
      }
      
      public function method_1807(param1:IDataOutput, param2:ByteArray) : void
      {
         var _loc3_:int = 0;
         while(param2.bytesAvailable > 0)
         {
            _loc3_ = param2.readByte();
            param1.writeByte(_loc3_ ^ this.var_1629[this.var_1628]);
            this.var_1629[this.var_1628] = _loc3_;
            this.var_1628 ^= _loc3_ & 7;
         }
      }
      
      public function method_1806(param1:ByteArray, param2:IDataInput) : void
      {
         while(param2.bytesAvailable > 0)
         {
            this.var_1627[this.var_1626] = param2.readByte() ^ this.var_1627[this.var_1626];
            param1.writeByte(this.var_1627[this.var_1626]);
            this.var_1626 ^= this.var_1627[this.var_1626] & 7;
         }
      }
   }
}
