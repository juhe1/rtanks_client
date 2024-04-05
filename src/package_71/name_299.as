package package_71
{
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_37.Vector3;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_299 implements name_277
   {
       
      
      private var object:name_70;
      
      private var impl:name_277;
      
      public function name_299(param1:name_70, param2:name_277)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function method_877(param1:Vector3) : void
      {
         var direction:Vector3 = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_877(direction);
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_875(param1:Tank, param2:Vector3) : void
      {
         var target:Tank = param1;
         var localPoint:Vector3 = param2;
         try
         {
            Model.object = this.object;
            this.impl.method_875(target,localPoint);
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_878() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.method_878();
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_874() : uint
      {
         var result:uint = 0;
         try
         {
            Model.object = this.object;
            result = uint(this.impl.method_874());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_876() : uint
      {
         var result:uint = 0;
         try
         {
            Model.object = this.object;
            result = uint(this.impl.method_876());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
