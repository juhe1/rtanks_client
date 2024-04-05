package package_38
{
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class name_69
   {
       
      
      private var var_357:IDataOutput;
      
      private var var_358:IDataInput;
      
      private var var_359:OptionalMap;
      
      public function name_69(param1:IDataOutput, param2:IDataInput, param3:OptionalMap)
      {
         super();
         this.var_357 = param1;
         this.var_358 = param2;
         this.var_359 = param3;
      }
      
      public function get writer() : IDataOutput
      {
         return this.var_357;
      }
      
      public function set writer(param1:IDataOutput) : void
      {
         this.var_357 = param1;
      }
      
      public function get reader() : IDataInput
      {
         return this.var_358;
      }
      
      public function set reader(param1:IDataInput) : void
      {
         this.var_358 = param1;
      }
      
      public function get optionalMap() : OptionalMap
      {
         return this.var_359;
      }
      
      public function set optionalMap(param1:OptionalMap) : void
      {
         this.var_359 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:int = 0;
         var _loc2_:String = null;
         var _loc3_:String = "";
         var _loc4_:int = int(ByteArray(this.reader).position);
         _loc3_ += "\n=== Optional Map ===\n";
         _loc3_ += this.optionalMap.toString();
         _loc3_ += "\n=== Dump data (trunc 100 bytes) ===\n";
         var _loc5_:int = 0;
         var _loc6_:String = "";
         var _loc7_:int = 0;
         while(Boolean(ByteArray(this.reader).bytesAvailable) && _loc7_ < 100)
         {
            _loc1_ = int(this.reader.readByte());
            _loc2_ = String.fromCharCode(_loc1_);
            if(_loc1_ >= 0 && _loc1_ < 16)
            {
               _loc3_ += "0";
            }
            if(_loc1_ < 0)
            {
               _loc1_ = 256 + _loc1_;
            }
            _loc3_ += _loc1_.toString(16);
            _loc3_ += " ";
            if(_loc1_ < 12 && _loc1_ > 128)
            {
               _loc6_ += ".";
            }
            else
            {
               _loc6_ += _loc2_;
            }
            _loc5_++;
            if(_loc5_ > 16)
            {
               _loc3_ += "\t";
               _loc3_ += _loc6_;
               _loc3_ += "\n";
               _loc5_ = 0;
               _loc6_ = "";
            }
            _loc7_++;
         }
         if(_loc5_ != 0)
         {
            while(_loc5_ < 18)
            {
               _loc5_++;
               _loc3_ += "   ";
            }
            _loc3_ += "\t";
            _loc3_ += _loc6_;
            _loc3_ += "\n";
         }
         ByteArray(this.reader).position = _loc4_;
         return _loc3_;
      }
   }
}
