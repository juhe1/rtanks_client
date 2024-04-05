package alternativa.tanks.models.tank.spawn
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class ITankSpawnerEvents implements name_279
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<Object>;
      
      public function ITankSpawnerEvents(param1:name_70, param2:Vector.<Object>)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function method_767() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:name_279 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_279(this.impl[i]);
               result = int(m.method_767());
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function name_1069() : void
      {
         var i:int = 0;
         var m:name_279 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_279(this.impl[i]);
               m.name_1069();
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_769() : void
      {
         var i:int = 0;
         var m:name_279 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_279(this.impl[i]);
               m.method_769();
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_768() : void
      {
         var i:int = 0;
         var m:name_279 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_279(this.impl[i]);
               m.method_768();
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function setReadyToPlace() : void
      {
         var i:int = 0;
         var m:name_279 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_279(this.impl[i]);
               m.setReadyToPlace();
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
