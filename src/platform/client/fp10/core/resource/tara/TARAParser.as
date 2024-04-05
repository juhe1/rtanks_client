package platform.client.fp10.core.resource.tara
{
   import flash.utils.ByteArray;
   
   public class TARAParser
   {
       
      
      private var _data:Object;
      
      public function TARAParser(param1:ByteArray)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1);
         }
      }
      
      public function parse(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ByteArray = null;
         var _loc4_:FileInfo = null;
         var _loc5_:int = param1.readInt();
         var _loc6_:Vector.<FileInfo> = new Vector.<FileInfo>(_loc5_);
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            _loc6_[_loc2_] = new FileInfo(param1.readUTF(),param1.readInt());
            _loc2_++;
         }
         this._data = {};
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            _loc3_ = new ByteArray();
            _loc4_ = _loc6_[_loc2_];
            param1.readBytes(_loc3_,0,_loc4_.size);
            this._data[_loc4_.name] = _loc3_;
            _loc2_++;
         }
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function getFileData(param1:String) : ByteArray
      {
         if(this._data == null)
         {
            return null;
         }
         return ByteArray(this._data[param1]);
      }
   }
}

class FileInfo
{
    
   
   public var name:String;
   
   public var size:int;
   
   public function FileInfo(param1:String, param2:int)
   {
      super();
      this.name = param1;
      this.size = param2;
   }
}
