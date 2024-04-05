package alternativa.tanks.gui.notinclan
{
   import alternativa.tanks.gui.notinclan.dialogs.name_573;
   import controls.base.name_1940;
   import flash.events.MouseEvent;
   import package_208.name_586;
   import package_208.name_588;
   import package_26.ClanUserNotificationsManager;
   import package_391.name_1939;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_643 extends name_573
   {
      
      public static var localeService:name_102;
      
      public static const WIDTH:Number = 900;
      
      public static const const_1532:Number = 500;
       
      
      private var var_1244:name_1939;
      
      private var var_1245:name_1940;
      
      private var var_1246:name_586;
      
      private var var_1247:name_588;
      
      public function name_643()
      {
         this.var_1244 = new name_1939();
         this.var_1245 = new name_1940();
         super();
         this.var_1244.width = 120;
         this.var_1244.x = 900 - this.var_1244.width - 11;
         this.var_1244.y = 11;
         this.var_1244.label = localeService.getText(name_390.const_1375);
         this.var_1244.addEventListener(MouseEvent.CLICK,this.method_1481);
         addChild(this.var_1244);
         this.var_1245.width = 120;
         this.var_1245.x = this.var_1244.x - this.var_1245.width - 11;
         this.var_1245.y = 11;
         this.var_1245.label = localeService.getText(name_390.const_630);
         this.var_1245.addEventListener(MouseEvent.CLICK,this.method_1480);
         addChild(this.var_1245);
         if(ClanUserNotificationsManager.name_1941() > 0)
         {
            this.method_1481();
         }
         else
         {
            this.method_1480();
         }
      }
      
      private function method_1480(param1:MouseEvent = null) : void
      {
         this.method_1483();
         this.var_1247 = new name_588(name_983.width);
         this.var_1247.x = 0;
         this.var_1247.y = this.var_1244.y + this.var_1244.height + 3 * 11;
         this.var_1247.width = 900;
         this.var_1247.height = 500 - this.var_1245.y - this.var_1245.height - 3 * 11;
         addChild(this.var_1247);
         this.var_1245.enable = false;
         this.var_1244.enable = true;
      }
      
      private function method_1481(param1:MouseEvent = null) : void
      {
         this.method_1482();
         this.var_1246 = new name_586(name_983.width);
         this.var_1246.x = 0;
         this.var_1246.y = this.var_1244.y + this.var_1244.height + 3 * 11;
         this.var_1246.width = 900;
         this.var_1246.height = 500 - this.var_1245.y - this.var_1245.height - 3 * 11;
         addChild(this.var_1246);
         this.var_1245.enable = true;
         this.var_1244.enable = false;
      }
      
      override public function destroy() : void
      {
         this.var_1244.removeEventListener(MouseEvent.CLICK,this.method_1481);
         this.var_1245.removeEventListener(MouseEvent.CLICK,this.method_1480);
         this.method_1483();
         this.method_1482();
         this.var_1244.destroy();
         super.destroy();
      }
      
      private function method_1482() : void
      {
         if(this.var_1247 != null)
         {
            if(contains(this.var_1247))
            {
               removeChild(this.var_1247);
            }
            this.var_1247.destroy();
            this.var_1247 = null;
         }
      }
      
      private function method_1483() : void
      {
         if(this.var_1246 != null)
         {
            if(contains(this.var_1246))
            {
               removeChild(this.var_1246);
            }
            this.var_1246.destroy();
            this.var_1246 = null;
         }
      }
      
      override public function get height() : Number
      {
         return 500;
      }
      
      override public function get width() : Number
      {
         return 900;
      }
      
      override protected function method_1477() : String
      {
         return name_390.const_1106;
      }
   }
}
