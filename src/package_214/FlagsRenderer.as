package package_214
{
   import controls.dropdownlist.ComboBoxRenderer;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class FlagsRenderer extends ComboBoxRenderer
   {
       
      
      public function FlagsRenderer()
      {
         super();
      }
      
      override protected function method_2586(param1:Object) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         var _loc3_:Bitmap = name_634.method_1454(param1.country);
         _loc2_.addChild(_loc3_);
         return _loc2_;
      }
   }
}
