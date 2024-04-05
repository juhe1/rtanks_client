package package_446
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import package_1.Main;
   import package_123.name_1858;
   import package_123.name_339;
   
   public class name_3370 extends Sprite
   {
      
      public static var var_3673:name_339 = name_339(Main.osgi.name_6(name_339));
      
      private static var var_3675:Class = name_3581;
      
      private static var var_3674:BitmapData = Bitmap(new var_3675()).bitmapData;
       
      
      public function name_3370()
      {
         super();
         var _loc1_:Bitmap = new Bitmap(var_3674);
         addChild(_loc1_);
         visible = false;
         var_3673.addEventListener(name_1858.name_1859,this.method_3281);
         var_3673.addEventListener(name_1858.name_1847,this.method_3282);
      }
      
      private function method_3282(param1:name_1858) : void
      {
         visible = false;
      }
      
      private function method_3281(param1:name_1858) : void
      {
         visible = true;
      }
   }
}
