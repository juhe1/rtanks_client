package package_17
{
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.name_70;
   
   public class name_39 implements name_44
   {
       
      
      private var var_211:Number = 0;
      
      private var item:name_70 = null;
      
      public function name_39()
      {
         super();
      }
      
      public function method_277() : Boolean
      {
         return this.var_211 > getTimer();
      }
      
      public function startEvent(param1:int) : void
      {
         this.var_211 = param1 == 0 ? Number(0) : Number(param1 * 1000 + getTimer());
      }
      
      public function method_278() : Number
      {
         return this.var_211;
      }
   }
}
