package package_274
{
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   
   public class name_854 implements name_860
   {
       
      
      public function name_854()
      {
         super();
      }
      
      public function encode(param1:name_69, param2:Object) : void
      {
         param1.writer.writeInt(Long(param2).high);
         param1.writer.writeInt(Long(param2).low);
      }
      
      public function decode(param1:name_69) : Object
      {
         return Long.getLong(param1.reader.readInt(),param1.reader.readInt());
      }
      
      public function init(param1:name_840) : void
      {
      }
   }
}
