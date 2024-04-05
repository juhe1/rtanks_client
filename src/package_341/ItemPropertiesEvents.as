package package_341
{
   import package_103.name_323;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class ItemPropertiesEvents implements name_1633
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_1633>;
      
      public function ItemPropertiesEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_1633>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getProperties() : Vector.<name_323>
      {
         var result:Vector.<name_323> = null;
         var i:int = 0;
         var m:name_1633 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_1633(this.impl[i]);
               result = m.getProperties();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_2414() : Vector.<name_323>
      {
         var result:Vector.<name_323> = null;
         var i:int = 0;
         var m:name_1633 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_1633(this.impl[i]);
               result = m.method_2414();
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
