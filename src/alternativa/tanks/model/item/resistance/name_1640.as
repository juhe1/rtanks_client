package alternativa.tanks.model.item.resistance
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1640 implements name_1525
   {
       
      
      private var object:name_70;
      
      private var impl:name_1525;
      
      public function name_1640(param1:name_70, param2:name_1525)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function mount(param1:int, param2:name_70) : void
      {
         var index:int = param1;
         var item:name_70 = param2;
         try
         {
            Model.object = this.object;
            this.impl.mount(index,item);
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function name_1370(param1:name_70) : void
      {
         var item:name_70 = param1;
         try
         {
            Model.object = this.object;
            this.impl.name_1370(item);
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function name_1526() : Vector.<name_70>
      {
         var result:Vector.<name_70> = null;
         try
         {
            Model.object = this.object;
            result = this.impl.name_1526();
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
