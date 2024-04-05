package forms
{
   import alternativa.osgi.OSGi;
   import base.class_122;
   import controls.Label;
   import controls.name_1922;
   import flash.display.Bitmap;
   import package_443.BackgroundHeader;
   import package_54.name_102;
   
   public class name_1838 extends class_122
   {
      
      private static const const_2039:int = 25;
      
      private static const const_2041:int = 22;
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
       
      
      private const const_2040:int = 11;
      
      private var label:Label;
      
      private var window:name_1922;
      
      private var var_2543:Bitmap;
      
      public function name_1838(param1:String = null)
      {
         this.label = new Label();
         super();
         this.window = new name_1922();
         addChild(this.window);
         this.method_2515();
         if(param1 != null)
         {
            this.method_2514(param1);
         }
      }
      
      public static function name_1844(param1:String, param2:int = -1, param3:int = -1) : name_1838
      {
         var _loc4_:name_1838 = new name_1838(param1);
         _loc4_.width = param2;
         _loc4_.height = param3;
         return _loc4_;
      }
      
      private function method_2515() : void
      {
         this.label.size = 16;
         this.label.color = 12632256;
         this.label.sharpness = 40;
         this.label.thickness = 70;
         this.label.bold = true;
      }
      
      private function method_2514(param1:String) : void
      {
         this.label.text = param1;
         if(this.label.width > this.label.height)
         {
            if(this.label.width + 2 * 11 < BackgroundHeader.name_2719.width)
            {
               this.var_2543 = new Bitmap(BackgroundHeader.name_2719);
            }
            else
            {
               this.var_2543 = new Bitmap(BackgroundHeader.name_2721);
            }
         }
         else
         {
            this.var_2543 = new Bitmap(BackgroundHeader.name_2720);
         }
         addChild(this.var_2543);
         addChild(this.label);
         this.resize();
      }
      
      public function method_2516(param1:String) : void
      {
         this.method_2514(localeService.getText(param1));
      }
      
      override public function set width(param1:Number) : void
      {
         this.window.width = param1;
         this.resize();
      }
      
      override public function get width() : Number
      {
         return this.window.width;
      }
      
      override public function set height(param1:Number) : void
      {
         this.window.height = param1;
         this.resize();
      }
      
      override public function get height() : Number
      {
         return this.window.height;
      }
      
      private function resize() : void
      {
         if(this.var_2543 != null)
         {
            if(this.label.width > this.label.height)
            {
               this.var_2543.x = this.window.width - this.var_2543.width >> 1;
               this.var_2543.y = -25;
               this.label.x = this.window.width - this.label.width >> 1;
               this.label.y = 5 - (22 + this.label.height >> 1);
            }
            else
            {
               this.var_2543.x = -25;
               this.var_2543.y = this.window.height - this.var_2543.height >> 1;
               this.label.x = 5 - (22 + this.label.width >> 1);
               this.label.y = this.window.height - this.label.height >> 1;
            }
         }
      }
   }
}
