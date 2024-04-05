package package_353
{
   import flash.utils.ByteArray;
   
   public class ByteArrayMap
   {
       
      
      private var _data:Object;
      
      public function ByteArrayMap(param1:Object = null)
      {
         super();
         this._data = param1 == null ? {} : param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function getValue(param1:String) : ByteArray
      {
         return this._data[param1];
      }
      
      public function putValue(param1:String, param2:ByteArray) : void
      {
         this._data[param1] = param2;
      }
   }
}
