package package_271
{
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import platform.client.fp10.core.network.connection.name_837;
   
   public class name_838 implements name_837
   {
      
      public static const name_846:name_838 = new name_838();
       
      
      public function name_838()
      {
         super();
      }
      
      public function method_1807(param1:IDataOutput, param2:ByteArray) : void
      {
         param1.writeBytes(param2,param2.position);
      }
      
      public function method_1806(param1:ByteArray, param2:IDataInput) : void
      {
         param2.readBytes(param1,param1.position);
      }
      
      public function reset() : void
      {
      }
   }
}
