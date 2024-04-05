package package_139
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1642 implements name_1538
   {
       
      
      private var object:name_70;
      
      private var impl:name_1538;
      
      public function name_1642(param1:name_70, param2:name_1538)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getCount() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = int(this.impl.getCount());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function setCount(param1:int) : void
      {
         var value:int = param1;
         try
         {
            Model.object = this.object;
            this.impl.setCount(value);
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1105() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = Boolean(this.impl.method_1105());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
