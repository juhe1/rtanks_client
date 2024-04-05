package package_340
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class AvailableSkinsEvents implements name_1634
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<Object>;
      
      public function AvailableSkinsEvents(param1:name_70, param2:Vector.<Object>)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getSkins() : Vector.<name_70>
      {
         var result:Vector.<name_70> = null;
         var i:int = 0;
         var m:name_1634 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_1634(this.impl[i]);
               result = m.getSkins();
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
