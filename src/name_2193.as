package
{
   import alternativa.utils.removeDisplayObject;
   import base.class_122;
   import flash.display.Bitmap;
   import flash.errors.IllegalOperationError;
   
   public class name_2193 extends class_122
   {
       
      
      private var var_445:Boolean = false;
      
      private var const_126:Bitmap;
      
      public function name_2193()
      {
         super();
      }
      
      public function name_971(param1:int) : void
      {
         this.var_445 = true;
         this.method_2044(this.method_2046(param1));
      }
      
      private function method_2044(param1:Bitmap) : void
      {
         removeDisplayObject(this.const_126);
         addChild(this.const_126 = param1);
      }
      
      public function name_2152(param1:int) : void
      {
         this.var_445 = false;
         this.method_2044(this.method_2045(param1));
      }
      
      public function name_122(param1:int) : void
      {
         if(this.var_445)
         {
            this.name_971(param1);
         }
         else
         {
            this.name_2152(param1);
         }
      }
      
      public function init(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            this.name_971(param2);
         }
         else
         {
            this.name_2152(param2);
         }
      }
      
      protected function method_2045(param1:int) : Bitmap
      {
         throw new IllegalOperationError();
      }
      
      protected function method_2046(param1:int) : Bitmap
      {
         throw new IllegalOperationError();
      }
   }
}
