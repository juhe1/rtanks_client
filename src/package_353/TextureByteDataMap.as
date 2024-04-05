package package_353
{
   import package_303.TextureByteData;
   
   public class TextureByteDataMap
   {
       
      
      private var _data:Object;
      
      public function TextureByteDataMap(param1:Object = null)
      {
         super();
         this._data = param1 == null ? {} : param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function getValue(param1:String) : TextureByteData
      {
         return this._data[param1];
      }
      
      public function putValue(param1:String, param2:TextureByteData) : void
      {
         this._data[param1] = param2;
      }
   }
}
