package package_303
{
   import flash.utils.ByteArray;
   
   public class TextureByteData
   {
       
      
      public var diffuseData:ByteArray;
      
      public var opacityData:ByteArray;
      
      public function TextureByteData(param1:ByteArray = null, param2:ByteArray = null)
      {
         super();
         this.diffuseData = param1;
         this.opacityData = param2;
      }
   }
}
