package package_382
{
   import alternativa.osgi.OSGi;
   import controls.Label;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import forms.name_1139;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class TierNumberView extends Sprite
   {
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      private static const const_2809:Class = name_3562;
      
      private static const const_2810:BitmapData = new const_2809().bitmapData;
       
      
      private var var_3633:Bitmap;
      
      private var var_3631:Label;
      
      private var var_3632:Label;
      
      public function TierNumberView()
      {
         this.var_3633 = new Bitmap(const_2810);
         this.var_3631 = new Label();
         this.var_3632 = new Label();
         super();
         addChild(this.var_3633);
         this.method_3250();
         this.method_3249();
      }
      
      public function set level(param1:int) : *
      {
         this.var_3631.text = param1.toString();
         this.method_1833();
      }
      
      private function method_3250() : void
      {
         this.var_3631.size = 42;
         this.var_3631.bold = true;
         this.var_3631.color = name_1139.name_1894;
         addChild(this.var_3631);
      }
      
      private function method_3249() : void
      {
         this.var_3632.size = 15;
         this.var_3632.text = localeService.getText(name_390.const_1149);
         this.var_3632.x = (this.var_3633.width - this.var_3632.width) / 2;
         this.var_3632.y = this.var_3633.height - 30;
         this.var_3632.color = name_1139.name_1894;
         addChild(this.var_3632);
      }
      
      private function method_1833() : *
      {
         this.var_3631.x = (this.var_3633.width - this.var_3631.width) / 2;
         this.var_3631.y = this.var_3632.y - 40;
      }
   }
}
