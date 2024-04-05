package package_85
{
   import flash.display.Bitmap;
   import package_254.class_37;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ControlsHelper extends class_37
   {
      
      public static var localeService:name_102;
      
      public static const name_1106:String = "Tank.ControlsHelper";
      
      public static const name_1107:int = 1;
       
      
      private var var_603:Bitmap;
      
      public function ControlsHelper()
      {
         super();
         this.init();
      }
      
      override public function align(param1:int, param2:int) : void
      {
         this.var_603.x = (param1 - this.var_603.width) / 2;
         this.var_603.y = (param2 - this.var_603.height) / 2;
      }
      
      private function init() : void
      {
         this.var_603 = new Bitmap(localeService.getImage(name_390.name_1306));
         addChild(this.var_603);
         var_601 = 10;
         var_602 = 8000;
      }
   }
}
