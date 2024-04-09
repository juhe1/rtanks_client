package package_399
{
   import alternativa.osgi.OSGi;
   import flash.geom.Point;
   import package_254.name_2100;
   import package_254.name_2221;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2116 extends name_2100
   {
      
      public static var localeService:name_102 = name_102(OSGi.getInstance().getService(name_102));
       
      
      private var var_1750:int = 12;
      
      public function name_2116()
      {
         super();
         text = localeService.getText(name_390.const_1205);
         arrowLehgth = 20;
         arrowAlign = name_2221.TOP_LEFT;
         var_601 = 3;
      }
      
      public function method_2625() : void
      {
         text = localeService.getText(name_390.const_1205);
      }
      
      public function method_2626() : void
      {
         text = localeService.getText(name_390.const_1095);
      }
      
      public function method_2627() : void
      {
         text = localeService.getText(name_390.const_811);
      }
      
      public function method_1791() : void
      {
         var _loc1_:Point = new Point();
         _loc1_.x = Math.round(var_1278.textWidth + this.var_1750 * 2);
         _loc1_.y = Math.round(var_1278.textHeight + this.var_1750 * 2) - 3;
         draw(_loc1_);
      }
   }
}
