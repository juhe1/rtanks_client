package package_148
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   
   public class DishonestProgressBar extends Sprite
   {
      
      private static const const_1470:Class = name_1693;
      
      private static const const_1471:Class = name_1694;
      
      private static const const_1468:Class = name_1696;
      
      private static const const_1467:BitmapData = new const_1468().bitmapData;
      
      private static const const_1469:Class = name_1695;
      
      private static const const_1465:BitmapData = new const_1469().bitmapData;
      
      private static const const_1466:Class = name_1697;
      
      private static const const_1475:int = 585;
      
      private static const const_1478:int = 581;
      
      private static const const_1476:int = 30;
      
      private static const const_1472:Number = 0.98;
      
      private static const const_1477:Number = 0.05;
      
      private static const const_1474:Number = 0.001;
      
      private static const const_1473:int = 100;
       
      
      private var var_988:Number;
      
      private var var_996:int;
      
      private var var_987:Bitmap;
      
      private var var_986:Shape;
      
      private var var_993:Bitmap;
      
      private var var_992:Bitmap;
      
      private var var_989:Shape;
      
      private var var_990:Matrix;
      
      private var var_998:Function;
      
      private var var_994:uint;
      
      private var var_995:Boolean;
      
      private var var_991:Number = 0.05;
      
      private var var_997:Number;
      
      private var var_999:int;
      
      public function DishonestProgressBar(param1:Function)
      {
         super();
         this.var_998 = param1;
         this.init();
      }
      
      private function init() : void
      {
         this.var_996 = 581 * 0.98;
         this.var_993 = new const_1470();
         addChild(this.var_993);
         this.var_992 = new const_1471();
         addChild(this.var_992);
         this.var_989 = new Shape();
         addChild(this.var_989);
         this.var_987 = new const_1466();
         this.var_987.x = 2;
         this.var_987.y = 2;
         this.var_987.width = 0;
         this.var_987.blendMode = BlendMode.OVERLAY;
         addChild(this.var_987);
         this.var_986 = new Shape();
         this.var_986.x = this.var_987.x;
         this.var_986.y = this.var_987.y;
         this.var_986.blendMode = BlendMode.ADD;
         this.var_986.alpha = 0.5;
         addChild(this.var_986);
         this.resize();
      }
      
      private function resize() : void
      {
         this.var_989.graphics.clear();
         this.var_989.graphics.beginBitmapFill(const_1467);
         this.var_989.graphics.drawRect(0,0,585 - this.var_993.width - this.var_992.width,30);
         this.var_989.graphics.endFill();
         this.var_989.x = this.var_993.width;
         this.var_992.x = this.var_989.x + this.var_989.width;
      }
      
      public function start() : void
      {
         clearTimeout(this.var_994);
         this.var_995 = false;
         this.var_987.width = 0;
         this.var_986.graphics.clear();
         this.var_988 = 0;
         this.var_990 = new Matrix();
         this.var_991 = 1;
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         if(getTimer() - this.var_999 < 5)
         {
            return;
         }
         this.var_999 = getTimer();
         if(this.var_995)
         {
            this.var_988 += this.var_997;
            if(this.var_988 >= 581)
            {
               removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
               this.var_988 = 581;
               this.var_994 = setTimeout(this.method_1214,100);
            }
         }
         else
         {
            this.var_991 -= 0.001;
            if(this.var_991 < 0.05)
            {
               this.var_991 = 0.05;
            }
            this.var_988 += this.var_991;
            if(this.var_988 >= this.var_996)
            {
               this.var_988 = this.var_996;
            }
         }
         this.method_1215(this.var_988);
         this.var_990.tx += 3;
         if(this.var_990.tx > const_1465.width)
         {
            this.var_990.tx = -this.var_990.tx % const_1465.width;
         }
      }
      
      public function name_509() : void
      {
         this.var_997 = (581 - this.var_988) / 10;
         this.var_995 = true;
      }
      
      private function method_1214() : void
      {
         this.var_998.apply();
      }
      
      private function method_1215(param1:int) : void
      {
         this.var_987.width = param1;
         this.var_986.graphics.clear();
         this.var_986.graphics.beginBitmapFill(const_1465,this.var_990,true,false);
         this.var_986.graphics.drawRect(0,0,param1,this.var_987.height);
         this.var_986.graphics.endFill();
      }
      
      public function name_508() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         clearTimeout(this.var_994);
      }
   }
}
