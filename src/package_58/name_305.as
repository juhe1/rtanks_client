package package_58
{
   import package_39.Model;
   import package_51.name_90;
   import platform.client.fp10.core.type.name_70;
   
   public class name_305 implements name_112
   {
       
      
      private var object:name_70;
      
      private var impl:name_112;
      
      public function name_305(param1:name_70, param2:name_112)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getResistance(param1:Boolean) : int
      {
         var result:int = 0;
         var update:Boolean = param1;
         try
         {
            Model.object = this.object;
            result = int(this.impl.getResistance(update));
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_501() : Vector.<name_90>
      {
         var result:Vector.<name_90> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.method_501();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function updateOthersResistances() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.updateOthersResistances();
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
