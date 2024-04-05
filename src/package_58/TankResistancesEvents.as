package package_58
{
   import package_39.Model;
   import package_51.name_90;
   import platform.client.fp10.core.type.name_70;
   
   public class TankResistancesEvents implements name_112
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<Object>;
      
      public function TankResistancesEvents(param1:name_70, param2:Vector.<Object>)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getResistance(param1:Boolean) : int
      {
         var result:int = 0;
         var i:int = 0;
         var m:name_112 = null;
         var update:Boolean = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_112(this.impl[i]);
               result = int(m.getResistance(update));
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function method_501() : Vector.<name_90>
      {
         var result:Vector.<name_90> = null;
         var i:int = 0;
         var m:name_112 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_112(this.impl[i]);
               result = m.method_501();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function updateOthersResistances() : void
      {
         var i:int = 0;
         var m:name_112 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = name_112(this.impl[i]);
               m.updateOthersResistances();
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
