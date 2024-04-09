package package_96
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.device.DeviceButtonSkin;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import package_103.name_323;
   import package_341.name_1633;
   import package_343.ResistancesIconsUtils;
   import package_467.ShopButton;
   import package_89.name_1358;
   import platform.client.fp10.core.type.name_70;
   
   public class ResistanceButton extends ShopButton
   {
      
      public static var var_2347:name_1358 = OSGi.getInstance().getService(name_1358) as name_1358;
      
      private static const const_2466:Class = name_3190;
      
      private static const const_2469:BitmapData = new const_2466().bitmapData;
      
      private static const const_2464:Class = name_3191;
      
      private static const const_2467:BitmapData = new const_2464().bitmapData;
      
      private static const const_2470:Class = name_3189;
      
      private static const const_2471:BitmapData = new const_2470().bitmapData;
      
      private static const const_2465:Class = name_3192;
      
      private static const const_2463:BitmapData = new const_2465().bitmapData;
      
      private static const const_2472:Class = name_3193;
      
      private static const const_2468:BitmapData = new const_2472().bitmapData;
       
      
      private var var_3170:Bitmap;
      
      private var var_3169:Bitmap;
      
      private var var_3166:Bitmap;
      
      private var var_3167:Bitmap;
      
      public var item:name_70;
      
      private var index:int;
      
      protected var var_3168:Bitmap;
      
      public function ResistanceButton(param1:int)
      {
         this.var_3170 = new Bitmap(const_2471);
         this.var_3169 = new Bitmap(const_2463);
         this.var_3166 = new Bitmap(const_2469);
         this.var_3167 = new Bitmap(const_2467);
         super(new DeviceButtonSkin());
         this.index = param1;
         this.var_3170.visible = false;
         addChildAt(this.var_3170,1);
         addChildAt(this.var_3169,2);
         this.var_3166.visible = false;
         this.var_3166.x = (width - this.var_3166.width) / 2;
         this.var_3166.y = (height - this.var_3166.height) / 2;
         this.var_3167.visible = false;
         this.var_3167.x = (width - this.var_3167.width) / 2;
         this.var_3167.y = (height - this.var_3167.height) / 2;
         addChildAt(this.var_3166,4);
         addChildAt(this.var_3167,5);
         this.enable();
      }
      
      public function method_2364() : int
      {
         return this.index;
      }
      
      public function disable() : void
      {
         buttonMode = false;
         super.method_1476();
         this.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.var_3169.bitmapData = const_2468;
      }
      
      public function enable() : void
      {
         super.init();
         this.addEventListener(MouseEvent.CLICK,this.onClick);
         this.var_3169.bitmapData = const_2463;
      }
      
      private function method_2931() : void
      {
         this.var_3167.visible = false;
         this.var_3166.visible = false;
      }
      
      private function method_2930() : void
      {
         this.var_3166.visible = !this.name_2615();
         this.var_3167.visible = this.name_2615();
      }
      
      private function method_2928() : void
      {
         this.var_3170.visible = !this.name_2615();
         this.var_3169.visible = this.name_2615();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.item != null)
         {
            var_2347.name_1370(this.item);
         }
      }
      
      override protected function method_1470(param1:MouseEvent) : void
      {
         if(this.name_2615())
         {
            this.disable();
            return;
         }
         var_1786.visible = param1.type == MouseEvent.MOUSE_OVER || param1.type == MouseEvent.MOUSE_DOWN;
         var_3164.visible = !var_1786.visible;
         if(var_1786.visible)
         {
            this.method_2930();
         }
         else
         {
            this.method_2931();
            this.method_2928();
         }
      }
      
      public function reset() : void
      {
         if(this.item != null)
         {
            if(var_2347.name_1369(this.item))
            {
               this.item = null;
               this.method_2929(null);
               buttonMode = false;
            }
         }
      }
      
      public function name_2615() : Boolean
      {
         return this.item == null;
      }
      
      private function method_2929(param1:BitmapData) : void
      {
         if(this.var_3168 != null)
         {
            removeChild(this.var_3168);
         }
         this.var_3168 = new Bitmap(param1);
         this.var_3168.x = (width - this.var_3168.width) / 2;
         this.var_3168.y = (height - this.var_3168.height) / 2;
         this.method_2928();
         addChildAt(this.var_3168,3);
         buttonMode = true;
      }
      
      public function name_2616(param1:name_70) : void
      {
         var _loc2_:name_323 = null;
         var _loc3_:Vector.<name_323> = this.getProperties(param1);
         for each(_loc2_ in _loc3_)
         {
            this.method_2929(ResistancesIconsUtils.name_3194(_loc2_.property).bitmapData);
         }
      }
      
      private function getProperties(param1:name_70) : Vector.<name_323>
      {
         if(param1.method_316(name_1633))
         {
            return name_1633(param1.name_176(name_1633)).getProperties();
         }
         return null;
      }
      
      override public function destroy() : void
      {
         this.removeEventListener(MouseEvent.CLICK,this.onClick);
         super.destroy();
      }
   }
}
