package package_71
{
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_37.Vector3;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class LaserPointerEvents implements name_277
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<Object>;
      
      public function LaserPointerEvents(param1:name_70, param2:Vector.<Object>)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function method_877(param1:Vector3) : void
      {
         var i:int = 0;
         var m:name_277 = null;
         var direction:Vector3 = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_277(this.impl[i]);
               m.method_877(direction);
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_875(param1:Tank, param2:Vector3) : void
      {
         var i:int = 0;
         var m:name_277 = null;
         var target:Tank = param1;
         var localPoint:Vector3 = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_277(this.impl[i]);
               m.method_875(target,localPoint);
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_878() : void
      {
         var i:int = 0;
         var m:name_277 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_277(this.impl[i]);
               m.method_878();
               i++;
            }
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
         var i:int = 0;
         var m:name_277 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_277(this.impl[i]);
               result = uint(m.method_874());
               i++;
            }
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
         var i:int = 0;
         var m:name_277 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_277(this.impl[i]);
               result = uint(m.method_876());
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
