package package_73
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class ShotgunSFXEvents implements name_282
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<Object>;
      
      public function ShotgunSFXEvents(param1:name_70, param2:Vector.<Object>)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getEffects() : name_1244
      {
         var result:name_1244 = null;
         var i:int = 0;
         var m:name_282 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_282(this.impl[i]);
               result = m.getEffects();
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
