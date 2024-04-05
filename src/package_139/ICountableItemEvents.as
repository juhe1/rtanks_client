package package_139
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class ICountableItemEvents implements name_1538
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<Object>;
      
      public function ICountableItemEvents(param1:name_70, param2:Vector.<Object>)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getCount() : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:name_1538 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_1538(this.impl[i]);
               result = int(m.getCount());
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function setCount(param1:int) : void
      {
         var i:int = 0;
         var m:name_1538 = null;
         var value:int = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_1538(this.impl[i]);
               m.setCount(value);
               i++;
            }
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
         var i:int = 0;
         var m:name_1538 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_1538(this.impl[i]);
               result = Boolean(m.method_1105());
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
