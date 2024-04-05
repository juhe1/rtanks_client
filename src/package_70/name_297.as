package package_70
{
   import package_37.Vector3;
   import package_39.Model;
   import package_93.name_1243;
   import platform.client.fp10.core.type.name_70;
   
   public class name_297 implements name_273
   {
       
      
      private var object:name_70;
      
      private var impl:name_273;
      
      public function name_297(param1:name_70, param2:name_273)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function method_796(param1:name_70, param2:Vector3, param3:Vector.<name_1243>) : void
      {
         var shooter:name_70 = param1;
         var direction:Vector3 = param2;
         var targets:Vector.<name_1243> = param3;
         try
         {
            Model.object = this.object;
            this.impl.method_796(shooter,direction,targets);
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
