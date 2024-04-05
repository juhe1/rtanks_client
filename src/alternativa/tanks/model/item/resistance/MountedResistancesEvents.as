package alternativa.tanks.model.item.resistance
{
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class MountedResistancesEvents implements name_1525
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_1525>;
      
      public function MountedResistancesEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_1525>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function mount(param1:int, param2:name_70) : void
      {
         var i:int = 0;
         var m:name_1525 = null;
         var index:int = param1;
         var item:name_70 = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_1525(this.impl[i]);
               m.mount(index,item);
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function name_1370(param1:name_70) : void
      {
         var i:int = 0;
         var m:name_1525 = null;
         var item:name_70 = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_1525(this.impl[i]);
               m.name_1370(item);
               i++;
            }
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
         var i:int = 0;
         var m:name_1525 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_1525(this.impl[i]);
               result = m.name_1526();
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
