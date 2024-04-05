package package_85
{
   import alternativa.osgi.OSGi;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import package_254.name_791;
   import package_54.name_102;
   import package_76.FollowCameraController;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2067 extends Sprite
   {
      
      public static var var_815:name_791 = OSGi.getInstance().name_6(name_791) as name_791;
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
       
      
      private var var_2712:Bitmap;
      
      private var var_2711:Bitmap;
      
      public function name_2067()
      {
         super();
         this.var_2712 = new Bitmap(localeService.getImage(name_390.const_718));
         this.var_2711 = new Bitmap(localeService.getImage(name_390.const_978));
         addEventListener(MouseEvent.CLICK,method_2588);
      }
      
      private static function method_2588(param1:MouseEvent) : void
      {
         var_815.showHelp();
         param1.stopPropagation();
      }
      
      public function name_2068(param1:int) : void
      {
         if(this.var_2712.parent != null)
         {
            removeChild(this.var_2712);
         }
         if(this.var_2711.parent != null)
         {
            removeChild(this.var_2711);
         }
         if(param1 == FollowCameraController.name_964)
         {
            addChild(this.var_2712);
         }
         else
         {
            addChild(this.var_2711);
         }
      }
   }
}
