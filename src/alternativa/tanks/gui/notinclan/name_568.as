package alternativa.tanks.gui.notinclan
{
   import alternativa.tanks.gui.notinclan.dialogs.name_573;
   import alternativa.tanks.gui.notinclan.dialogs.name_578;
   import alternativa.tanks.gui.notinclan.dialogs.name_597;
   import alternativa.tanks.models.user.name_65;
   import controls.base.name_1134;
   import controls.base.name_1890;
   import controls.windowinner.WindowInner;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import package_124.name_42;
   import package_25.name_52;
   import package_26.ClanUserNotificationsManager;
   import package_391.name_1951;
   import package_54.name_102;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   import utils.name_1952;
   
   public class name_568 extends name_573
   {
      
      public static var clanUserService:name_65;
      
      public static var alertService:name_42;
      
      public static var localeService:name_102;
      
      public static var clanUserInfoService:name_52;
      
      private static var var_1269:Class = name_1953;
      
      private static const image:Bitmap = new var_1269();
      
      public static const const_1529:Number = 7;
      
      public static const const_422:Number = 11;
      
      public static const WIDTH:Number = 790;
      
      public static const const_1532:Number = 450;
       
      
      private var var_1270:name_70;
      
      private var var_1266:name_1134;
      
      private var var_1264:WindowInner;
      
      private var var_1265:name_1890;
      
      private var var_1263:name_1951;
      
      private var var_1267:name_573;
      
      private var var_262:int = 0;
      
      private var var_1268:uint = 0;
      
      public function name_568(param1:name_70)
      {
         this.var_1265 = new name_1890();
         this.var_1263 = new name_1951();
         super();
         this.var_1270 = param1;
         ClanUserNotificationsManager.name_1878(this.var_1263);
         this.init();
      }
      
      public function init() : void
      {
         this.var_1264 = new WindowInner(0,0,WindowInner.name_1428);
         addChild(this.var_1264);
         addChild(image);
         this.var_1266 = new name_1134();
         this.var_1266.align = TextFormatAlign.CENTER;
         this.var_1266.text = localeService.getText(name_390.const_657);
         this.var_1264.addChild(this.var_1266);
         image.x = 790 / 2 - image.width / 2 + 1;
         image.y = 2 * 11;
         this.var_1264.width = 790 - 2 * 11;
         this.var_1264.height = 450 - this.var_1265.height - 3 * 11;
         this.var_1264.x = 11;
         this.var_1264.y = 11;
         this.var_1266.width = this.var_1264.width - 2 * 11;
         this.var_1266.height = this.var_1264.height - 2 * 11;
         this.var_1266.x = this.var_1264.width / 2 - this.var_1266.width / 2;
         this.var_1266.y = image.y + image.height + 11;
         this.var_1265.label = localeService.getText(name_390.const_1269);
         this.var_1265.addEventListener(MouseEvent.CLICK,this.method_1505);
         this.var_1265.x = 790 / 2 - this.var_1265.width - 13;
         this.var_1265.y = 450 - this.var_1265.height - 11;
         addChild(this.var_1265);
         this.var_1263.label = localeService.getText(name_390.const_609);
         this.var_1263.addEventListener(MouseEvent.CLICK,this.method_1506);
         this.var_1263.x = 790 / 2 + 13;
         this.var_1263.y = this.var_1265.y;
         addChild(this.var_1263);
         this.method_1507();
      }
      
      private function method_1506(param1:MouseEvent) : void
      {
         this.var_1267 = new name_643();
      }
      
      private function method_1505(param1:MouseEvent) : void
      {
         if(clanUserService.hasClanLicense)
         {
            this.var_1267 = new name_578();
         }
         else
         {
            this.var_1267 = new name_597();
         }
      }
      
      override public function destroy() : void
      {
         clanUserService.method_357();
         ClanUserNotificationsManager.name_1954(this.var_1263);
         this.var_1263.destroy();
         if(this.var_1267 != null)
         {
            this.var_1267.destroy();
         }
         clearInterval(this.var_1268);
         super.destroy();
      }
      
      override public function get height() : Number
      {
         return 450;
      }
      
      override public function get width() : Number
      {
         return 790;
      }
      
      override protected function method_1477() : String
      {
         return localeService.getText(name_390.const_1169);
      }
      
      public function method_1508() : void
      {
         alertService.method_1143(localeService.getText(name_390.const_1124));
      }
      
      public function method_1507() : void
      {
         this.restrictionTime = clanUserInfoService.restrictionTime;
         if(this.restrictionTime > 0 && this.var_1268 == 0)
         {
            this.method_1504();
            this.var_1268 = setInterval(this.method_1504,1000);
         }
      }
      
      private function method_1504() : void
      {
         --this.restrictionTime;
         if(this.restrictionTime <= 0)
         {
            clearInterval(this.var_1268);
            this.var_1268 = 0;
            this.restrictionTime = 0;
            this.var_1263.enabled = true;
         }
         else
         {
            this.var_1263.enabled = false;
            this.var_1263.label = name_1952.format(this.restrictionTime);
         }
      }
      
      public function set restrictionTime(param1:int) : void
      {
         this.var_262 = param1;
      }
      
      public function get restrictionTime() : int
      {
         return this.var_262;
      }
   }
}
