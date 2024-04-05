package alternativa.tanks.model.shop.items.kits
{
   import controls.base.name_1134;
   import flash.events.MouseEvent;
   import package_411.name_2247;
   import package_472.class_215;
   import package_472.name_3187;
   
   public class class_217 extends class_215
   {
      
      protected static const WIDTH:int = 844;
      
      protected static const const_1532:int = 143;
       
      
      protected var itemId:String;
      
      public function class_217(param1:String, param2:name_3187)
      {
         this.itemId = param1;
         addEventListener(MouseEvent.CLICK,this.method_2555);
         super(param2);
      }
      
      protected function method_3087(param1:name_1134) : void
      {
      }
      
      private function method_2555(param1:MouseEvent) : void
      {
         dispatchEvent(new name_2247(this.itemId,gridPosition));
      }
      
      override public function get width() : Number
      {
         return 844;
      }
      
      override public function get height() : Number
      {
         return 143;
      }
      
      override public function destroy() : void
      {
         super.destroy();
         removeEventListener(MouseEvent.CLICK,this.method_2555);
      }
      
      public function method_3086() : void
      {
         alpha = 0.9;
      }
   }
}
