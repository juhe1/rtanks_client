package package_486
{
   import flash.utils.ByteArray;
   
   public class name_3711 extends ByteArray
   {
       
      
      public function name_3711(param1:String)
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         super();
         var _loc5_:ByteArray = new ByteArray();
         _loc2_ = 0;
         while(_loc2_ < 16)
         {
            this.writeByte(0);
            _loc2_++;
         }
         _loc5_.writeUTFBytes(param1);
         _loc5_.position = 0;
         while(Boolean(_loc5_.bytesAvailable))
         {
            _loc3_ = _loc5_.readByte();
            if(_loc3_ <= 127)
            {
               this.position = _loc3_ >> 3;
               _loc4_ = this.readByte();
               _loc4_ |= 1 << (_loc3_ & 7);
               this.position = _loc3_ >> 3;
               this.writeByte(_loc4_);
            }
         }
      }
      
      public function name_3713(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeUTFBytes(param1);
         _loc4_.position = 0;
         _loc2_ = _loc4_.readByte();
         if(Boolean(_loc2_ & 128))
         {
            return 0;
         }
         if(_loc2_ < 31 || _loc2_ == 127)
         {
            return _loc2_;
         }
         this.position = _loc2_ >> 3;
         _loc3_ = this.readByte();
         if(Boolean(_loc3_ & 1 << (_loc2_ & 7)))
         {
            return _loc2_;
         }
         return 0;
      }
   }
}
