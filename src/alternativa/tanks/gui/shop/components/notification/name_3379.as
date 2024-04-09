package alternativa.tanks.gui.shop.components.notification
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import package_1.Main;
   import package_174.name_1845;
   import package_174.name_534;
   import package_489.name_3582;
   
   public class name_3379 extends Sprite
   {
      
      public static var var_3676:name_534 = Main.osgi.getService(name_534) as name_534;
       
      
      private var var_3677:Bitmap;
      
      private var var_3678:Bitmap;
      
      public function name_3379()
      {
         super();
         this.var_3677 = new Bitmap(name_3582.name_3583);
         this.var_3677.visible = false;
         addChild(this.var_3677);
         this.var_3678 = new Bitmap(name_3582.name_3584);
         this.var_3678.visible = false;
         addChild(this.var_3678);
         var_3676.addEventListener(name_1845.name_1848,this.method_3284);
         var_3676.addEventListener(name_1845.name_1846,this.method_3285);
         var_3676.addEventListener(name_1845.name_1847,this.method_3283);
      }
      
      private function method_3283(param1:name_1845) : void
      {
         this.var_3677.visible = false;
         this.var_3678.visible = false;
      }
      
      private function method_3284(param1:name_1845) : void
      {
         this.var_3677.visible = true;
         this.var_3678.visible = false;
      }
      
      private function method_3285(param1:name_1845) : void
      {
         this.var_3677.visible = false;
         this.var_3678.visible = true;
      }
   }
}
