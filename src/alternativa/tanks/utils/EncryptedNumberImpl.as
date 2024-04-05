package alternativa.tanks.utils
{
   import flash.utils.ByteArray;
   
   public class EncryptedNumberImpl implements EncryptedNumber
   {
      
      private static var byteArray:ByteArray = new ByteArray();
       
      
      private var mask:int;
      
      private var v1:int;
      
      private var v2:int;
      
      public function EncryptedNumberImpl(param1:Number = 0)
      {
         super();
         this.name_894(param1);
      }
      
      public function name_894(param1:Number) : void
      {
         this.mask = Math.random() * 4294967295;
         byteArray.position = 0;
         byteArray.writeDouble(param1);
         byteArray.position = 0;
         this.v1 = name_2177.name_2178(byteArray.readInt() ^ this.mask,5);
         this.v2 = name_2177.name_2178(byteArray.readInt() ^ this.mask,5);
      }
      
      public function name_900() : Number
      {
         byteArray.position = 0;
         byteArray.writeInt(name_2177.name_2179(this.v1,5) ^ this.mask);
         byteArray.writeInt(name_2177.name_2179(this.v2,5) ^ this.mask);
         byteArray.position = 0;
         return byteArray.readDouble();
      }
   }
}
