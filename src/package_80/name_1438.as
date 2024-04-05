package package_80
{
   import alternativa.tanks.models.battlefield.gui.inventory.HudInventoryIcon;
   import alternativa.tanks.models.battlefield.gui.inventory.name_2589;
   import controls.InventoryIcon;
   import controls.Label;
   import flash.display.Bitmap;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.text.TextFieldAutoSize;
   import flash.utils.clearInterval;
   import flash.utils.setTimeout;
   import package_429.name_2590;
   import package_429.name_2596;
   import package_430.name_2591;
   import package_430.name_2594;
   import package_431.name_2593;
   import package_49.name_146;
   import package_49.name_163;
   
   public class name_1438
   {
      
      private static const const_1895:int = 10;
      
      public static const const_1897:uint = 16777215;
      
      public static const const_1896:uint = 11711154;
      
      public static const const_1894:GlowFilter = new GlowFilter(0,0.8,4,4,3);
      
      private static const const_1898:int = 1;
      
      private static const const_1899:int = 2;
      
      private static const const_1900:int = 3;
       
      
      private var var_2304:int;
      
      private var var_2292:Label;
      
      private var item:name_1437;
      
      private var canvas:DisplayObjectContainer;
      
      private var var_2305:name_2590;
      
      private var var_2288:Label;
      
      private var var_2295:int;
      
      private var var_2298:InventoryIcon;
      
      private var var_2301:int = 3;
      
      private var colorTransform:ColorTransform;
      
      private var var_2303:int;
      
      private var var_2300:Number = 1;
      
      private var var_2289:name_2596;
      
      private var var_2290:name_2589;
      
      private var var_2297:Bitmap;
      
      private var var_2291:int;
      
      private var var_2302:int;
      
      private var var_2293:name_2594;
      
      private var var_2294:name_2593;
      
      public var var_2299:Boolean;
      
      private var var_2296:uint;
      
      public function name_1438(param1:int)
      {
         this.var_2298 = new InventoryIcon(InventoryIcon.EMPTY);
         this.colorTransform = new ColorTransform();
         this.var_2294 = new name_2593();
         super();
         this.var_2291 = param1;
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:Sprite = null;
         var _loc2_:Bitmap = null;
         this.canvas = new Sprite();
         this.canvas.addChild(this.var_2294);
         _loc1_ = new Sprite();
         this.canvas.addChild(_loc1_);
         _loc1_.blendMode = BlendMode.ADD;
         this.var_2290 = new name_2589(this.var_2291);
         _loc2_ = new Bitmap(HudInventoryIcon.method_2322(HudInventoryIcon.name_2602));
         var _loc3_:Bitmap = new Bitmap(HudInventoryIcon.method_2322(HudInventoryIcon.name_2600));
         this.var_2297 = new Bitmap(HudInventoryIcon.method_2322(HudInventoryIcon.name_2601));
         this.var_2292 = new Label();
         this.var_2292.size = 10;
         this.var_2292.text = this.var_2291.toString();
         this.var_2292.x = this.var_2290.width - this.var_2292.width - 2;
         this.var_2292.y = this.var_2290.height - this.var_2292.height;
         var _loc4_:name_2590 = new name_2590(HudInventoryIcon.method_2322(HudInventoryIcon.name_2605));
         var _loc5_:name_2590 = new name_2590(HudInventoryIcon.name_2604(this.var_2291));
         this.var_2288 = new Label();
         this.var_2288.width = this.var_2290.width;
         this.var_2288.autoSize = TextFieldAutoSize.CENTER;
         this.var_2288.filters = [const_1894];
         _loc1_.addChild(_loc3_);
         _loc1_.addChild(_loc2_);
         _loc1_.addChild(_loc4_);
         _loc1_.addChild(_loc5_);
         _loc1_.addChild(this.var_2290);
         _loc1_.addChild(this.var_2292);
         _loc1_.addChild(this.var_2297);
         this.canvas.addChild(this.var_2288);
         this.var_2293 = new name_2594(_loc1_);
         this.var_2289 = new name_2596(this.var_2291,_loc5_,_loc4_,this.var_2293,this.var_2290,this.method_2333,this.method_2336);
         this.name_1441(name_146.const_96,true);
      }
      
      public function name_1441(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            this.var_2295 |= param1;
         }
         else
         {
            this.var_2295 &= ~param1;
         }
         if(param1 == name_146.const_96)
         {
            if(param2)
            {
               if(this.var_2291 != name_163.const_109)
               {
                  this.var_2290.state = name_2589.name_2592;
                  this.var_2293.name_2595();
                  this.var_2289.destroy();
               }
            }
            else
            {
               this.method_2328(this.method_2330);
            }
         }
         if(param2)
         {
            this.var_2293.name_2595();
         }
         this.method_2325();
         this.method_2326();
      }
      
      private function method_2339(param1:int) : void
      {
         if(this.var_2291 == name_163.name_196 || this.var_2291 == name_163.MINE || this.var_2291 == name_163.const_110)
         {
            if(this.isLocked() && !this.var_2289.name_1399() && this.method_2327() > 0 && param1 == name_146.name_203)
            {
               this.var_2293.method_2328(name_2591.name_1308(this.var_2291));
            }
         }
      }
      
      private function method_2325() : void
      {
         this.method_2335();
         this.method_2332();
      }
      
      private function method_2335() : void
      {
         if(this.item == null)
         {
            this.var_2292.visible = false;
         }
         if(this.isLocked())
         {
            this.var_2292.visible = false;
         }
         else if(this.var_2289.name_1399())
         {
            this.var_2292.visible = false;
         }
         else
         {
            this.var_2292.visible = this.method_2327() > 0;
         }
      }
      
      private function method_2332() : void
      {
         if(this.var_2289.name_1399())
         {
            if(!this.var_2289.name_2599() && this.var_2289.name_2597())
            {
               this.var_2288.color = 11711154;
            }
         }
         else if(this.isLocked() || this.method_2329())
         {
            this.var_2288.color = 11711154;
         }
         else
         {
            this.var_2288.color = 16777215;
         }
         this.var_2288.visible = !this.method_2329();
      }
      
      private function method_2326() : void
      {
         if(this.isLocked())
         {
            this.var_2293.name_2595();
            this.var_2297.visible = true;
         }
         else
         {
            this.var_2297.visible = this.method_2329();
            if(!this.var_2289.name_1399())
            {
               this.var_2290.state = name_2589.name_2592;
            }
         }
      }
      
      public function ready() : *
      {
         this.var_2289.destroy();
         this.var_2290.state = name_2589.name_2592;
         if(!this.isLocked())
         {
            this.method_2328(this.method_2330);
            this.var_2296 = setTimeout(this.method_2328,350);
            this.method_2325();
            this.method_2331();
         }
         this.method_2326();
      }
      
      public function method_2331() : void
      {
         this.var_2294.init(HudInventoryIcon.name_2603(this.var_2291));
         this.var_2294.y = -this.var_2294.height + this.var_2290.width - 2;
         this.var_2294.start();
      }
      
      private function method_2329() : Boolean
      {
         return this.method_2327() <= 0;
      }
      
      public function method_2327() : int
      {
         if(this.item != null)
         {
            return this.item.count;
         }
         return 0;
      }
      
      private function method_2333() : void
      {
         if(this.var_2289.name_2597())
         {
            this.var_2290.state = name_2589.name_2598;
         }
         else
         {
            this.var_2290.state = name_2589.name_2592;
            this.name_1441(name_146.const_96,false);
         }
      }
      
      private function method_2328(param1:Function = null) : void
      {
         this.method_2334();
         this.var_2293.method_2328(name_2591.name_1308(this.var_2291),param1);
      }
      
      private function method_2336() : void
      {
         this.var_2288.visible = true;
         this.var_2288.color = 11711154;
         this.var_2290.state = name_2589.name_2598;
      }
      
      private function method_2330() : void
      {
         this.method_2325();
      }
      
      public function isLocked() : Boolean
      {
         return this.var_2295 != 0;
      }
      
      public function getCanvas() : DisplayObject
      {
         return this.canvas;
      }
      
      public function name_1442(param1:name_1437) : void
      {
         if(this.item == param1)
         {
            return;
         }
         this.item = param1;
         if(param1 != null)
         {
            this.name_1443();
         }
      }
      
      public function name_1439() : name_1437
      {
         return this.item;
      }
      
      public function update(param1:int) : void
      {
         if(this.item == null)
         {
            return;
         }
         this.item.method_2324(param1);
         this.var_2289.update(param1);
         this.var_2293.update(param1);
         this.var_2294.update(param1);
      }
      
      public function method_994(param1:int) : void
      {
         this.item.method_2321(param1);
         this.var_2289.method_994(param1);
         this.method_2325();
         this.method_2326();
      }
      
      public function method_997(param1:int, param2:Boolean) : void
      {
         this.item.method_2321(param1);
         this.var_2289.method_997(param1,param2);
         this.method_2325();
         this.method_2326();
      }
      
      public function name_1443() : void
      {
         this.method_2325();
         this.method_2326();
         this.var_2288.text = this.method_2327().toString();
         this.var_2288.y = -this.var_2288.height - 2;
      }
      
      private function method_2334() : void
      {
         if(this.var_2296 != 0)
         {
            clearInterval(this.var_2296);
            this.var_2296 = 0;
         }
      }
      
      private function method_2337(param1:int) : void
      {
      }
      
      private function method_2338(param1:uint) : void
      {
         this.colorTransform.redOffset = param1;
         this.colorTransform.greenOffset = param1;
         this.colorTransform.blueOffset = param1;
         this.colorTransform.alphaOffset = param1;
         this.canvas.transform.colorTransform = this.colorTransform;
      }
   }
}
