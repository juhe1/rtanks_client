package package_254
{
   import controls.Label;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.display.StageQuality;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextFormat;
   
   public class name_2100 extends class_37
   {
      
      private static var defaultTextFormat:TextFormat = new TextFormat("Tahoma",10,16777215,true);
       
      
      private var back:Shape;
      
      private var var_1744:Shape;
      
      public const const_1653:int = 16;
      
      private const lineThickness:int = 1;
      
      private const lineColor:uint = 16777215;
      
      private const const_1655:uint = 0;
      
      private const const_1657:Number = 1;
      
      private const const_1656:Number = 0.85;
      
      private const const_1654:int = 24;
      
      private const const_1652:int = 24;
      
      private var var_1749:int = 48;
      
      private var var_1746:int;
      
      private var var_1752:int;
      
      private var arrowP1:Point;
      
      private var arrowP2:Point;
      
      private var var_1745:Point;
      
      private var outlineArrowP1:Point;
      
      private var outlineArrowP2:Point;
      
      private var var_1743:Point;
      
      private var var_1751:Boolean;
      
      public var var_1278:Label;
      
      private var var_1750:int = 12;
      
      private var var_1747:Bitmap;
      
      private var var_1129:BitmapData;
      
      private var var_1748:Sprite;
      
      public function name_2100()
      {
         this.arrowP1 = new Point();
         this.arrowP2 = new Point();
         this.var_1745 = new Point();
         this.outlineArrowP1 = new Point();
         this.outlineArrowP2 = new Point();
         this.var_1743 = new Point();
         super();
         _size = new Point();
         var_597 = new Point();
         this.var_1747 = new Bitmap();
         addChild(this.var_1747);
         this.var_1748 = new Sprite();
         this.var_1748.mouseEnabled = false;
         this.var_1748.mouseChildren = false;
         this.var_1748.tabEnabled = false;
         this.var_1748.tabChildren = false;
         this.var_1744 = new Shape();
         this.var_1748.addChild(this.var_1744);
         this.back = new Shape();
         this.var_1748.addChild(this.back);
         this.arrowAlign = name_2221.MIDDLE_RIGHT;
         this.var_1278 = new Label();
         this.var_1278.multiline = true;
         addChild(this.var_1278);
         this.var_1278.x = this.var_1750 - 3;
         this.var_1278.y = this.var_1750 - 4;
         this.var_1278.mouseEnabled = false;
         this.var_1278.tabEnabled = false;
      }
      
      public static function set textFormat(param1:TextFormat) : void
      {
         name_2100.defaultTextFormat = param1;
      }
      
      override public function draw(param1:Point) : void
      {
         _size.x = int(param1.x);
         _size.y = int(param1.y);
         this.var_1744.graphics.clear();
         this.var_1744.graphics.beginFill(16777215,1);
         this.var_1744.graphics.drawRoundRect(-1,-1,param1.x + 1 * 2,param1.y + 1 * 2,16 + 2,16 + 2);
         this.var_1744.graphics.drawRoundRect(0,0,param1.x,param1.y,16,16);
         this.back.graphics.clear();
         this.back.graphics.beginFill(0,0.85);
         this.back.graphics.drawRoundRect(0,0,param1.x,param1.y,16,16);
         var _loc2_:Number = this.var_1749 / 24;
         if(Boolean(this.var_1746 & name_2221.name_2223))
         {
            this.arrowP1.y = 0;
            this.arrowP2.y = 0;
            this.var_1745.y = -this.var_1749;
            this.outlineArrowP1.y = 0;
            this.outlineArrowP2.y = 0;
            this.var_1743.y = -_loc2_ * (24 + 1 * 2);
         }
         else if(Boolean(this.var_1746 & name_2221.name_2224))
         {
            this.arrowP1.y = param1.y - 24 >> 1;
            this.arrowP2.y = this.arrowP1.y + 24;
            this.var_1745.y = this.arrowP1.y;
            this.outlineArrowP1.y = this.arrowP1.y - 1;
            this.outlineArrowP2.y = this.arrowP1.y + 24 + 1;
            this.var_1743.y = this.outlineArrowP1.y;
         }
         else
         {
            this.arrowP1.y = param1.y;
            this.arrowP2.y = param1.y;
            this.var_1745.y = param1.y + this.var_1749;
            this.outlineArrowP1.y = param1.y;
            this.outlineArrowP2.y = param1.y;
            this.var_1743.y = param1.y + _loc2_ * (24 + 1 * 2);
         }
         if(Boolean(this.var_1746 & name_2221.name_2225))
         {
            if(this.var_1751 == name_2222.VERTICAL)
            {
               this.var_1745.x = 24;
               this.arrowP1.x = 24;
               this.arrowP2.x = 24 + 24;
               this.var_1743.x = 24 - 1;
               this.outlineArrowP1.x = 24 - 1;
               this.outlineArrowP2.x = 24 + 24 + 1;
            }
            else
            {
               this.var_1745.x = -this.var_1749;
               this.arrowP1.x = 0;
               this.arrowP2.x = 0;
               this.var_1743.x = -_loc2_ * (24 + 1 * 2);
               this.outlineArrowP1.x = 0;
               this.outlineArrowP2.x = 0;
            }
            if(Boolean(this.var_1746 & name_2221.name_2223))
            {
               this.var_1744.graphics.drawRect(this.arrowP1.x,this.arrowP1.y - 1,this.arrowP2.x - this.arrowP1.x,1);
            }
            else if(Boolean(this.var_1746 & name_2221.name_2224))
            {
               this.var_1744.graphics.drawRect(this.arrowP1.x - 1,this.arrowP1.y,1,this.arrowP2.y - this.arrowP1.y);
            }
            else
            {
               this.var_1744.graphics.drawRect(this.arrowP1.x,this.arrowP1.y,this.arrowP2.x - this.arrowP1.x,1);
            }
         }
         else if(Boolean(this.var_1746 & name_2221.name_2227))
         {
            this.var_1745.x = param1.x - 24 >> 1;
            this.arrowP1.x = this.var_1745.x;
            this.arrowP2.x = this.var_1745.x + 24;
            this.var_1743.x = this.var_1745.x - 1;
            this.outlineArrowP1.x = this.var_1743.x;
            this.outlineArrowP2.x = this.arrowP2.x + 1;
            if(Boolean(this.var_1746 & name_2221.name_2223))
            {
               this.var_1744.graphics.drawRect(this.arrowP1.x,this.arrowP1.y - 1,this.arrowP2.x - this.arrowP1.x,1);
            }
            else
            {
               this.var_1744.graphics.drawRect(this.arrowP1.x,this.arrowP1.y,this.arrowP2.x - this.arrowP1.x,1);
            }
         }
         else
         {
            if(this.var_1751 == name_2222.VERTICAL)
            {
               this.var_1745.x = param1.x - 24;
               this.arrowP1.x = this.var_1745.x;
               this.arrowP2.x = this.arrowP1.x - 24;
               this.var_1743.x = this.var_1745.x + 1;
               this.outlineArrowP1.x = this.var_1743.x;
               this.outlineArrowP2.x = this.var_1745.x - 24 - 1;
            }
            else
            {
               this.var_1745.x = param1.x + this.var_1749;
               this.arrowP1.x = param1.x;
               this.arrowP2.x = param1.x;
               this.var_1743.x = param1.x + _loc2_ * (24 + 1 * 2);
               this.outlineArrowP1.x = param1.x;
               this.outlineArrowP2.x = param1.x;
            }
            if(Boolean(this.var_1746 & name_2221.name_2223))
            {
               this.var_1744.graphics.drawRect(this.arrowP1.x,this.arrowP1.y - 1,this.arrowP2.x - this.arrowP1.x,1);
            }
            else if(Boolean(this.var_1746 & name_2221.name_2224))
            {
               this.var_1744.graphics.drawRect(this.arrowP1.x,this.arrowP1.y,1,this.arrowP2.y - this.arrowP1.y);
            }
            else
            {
               this.var_1744.graphics.drawRect(this.arrowP1.x,this.arrowP1.y,this.arrowP2.x - this.arrowP1.x,1);
            }
         }
         this.back.graphics.moveTo(this.var_1745.x,this.var_1745.y);
         this.back.graphics.lineTo(this.arrowP1.x,this.arrowP1.y);
         this.back.graphics.lineTo(this.arrowP2.x,this.arrowP2.y);
         this.back.graphics.lineTo(this.var_1745.x,this.var_1745.y);
         this.var_1744.graphics.beginFill(16777215,1);
         this.var_1744.graphics.moveTo(this.var_1743.x,this.var_1743.y);
         this.var_1744.graphics.lineTo(this.outlineArrowP1.x,this.outlineArrowP1.y);
         this.var_1744.graphics.lineTo(this.outlineArrowP2.x,this.outlineArrowP2.y);
         this.var_1744.graphics.lineTo(this.var_1743.x,this.var_1743.y);
         this.var_1744.graphics.moveTo(this.var_1745.x,this.var_1745.y);
         this.var_1744.graphics.lineTo(this.arrowP1.x,this.arrowP1.y);
         this.var_1744.graphics.lineTo(this.arrowP2.x,this.arrowP2.y);
         this.var_1744.graphics.lineTo(this.var_1745.x,this.var_1745.y);
         var _loc3_:String = stage.quality;
         stage.quality = StageQuality.HIGH;
         var _loc4_:Matrix = new Matrix();
         if(this.var_1743.x < 0)
         {
            _loc4_.tx = -Math.round(this.var_1743.x);
            this.var_1747.x = Math.round(this.var_1743.x);
         }
         else
         {
            _loc4_.tx = 1;
            this.var_1747.x = -1;
         }
         if(this.var_1743.y < 0)
         {
            _loc4_.ty = -Math.round(this.var_1743.y);
            this.var_1747.y = Math.round(this.var_1743.y);
         }
         else
         {
            _loc4_.ty = 1;
            this.var_1747.y = -1;
         }
         this.var_1747.bitmapData = new BitmapData(Math.round(this.var_1744.width),Math.round(this.var_1744.height),true,0);
         this.var_1747.bitmapData.draw(this.var_1748,_loc4_,new ColorTransform(),BlendMode.NORMAL,null,true);
         stage.quality = _loc3_;
         this.var_1278.width = param1.x - this.var_1750 * 2;
      }
      
      override public function align(param1:int, param2:int) : void
      {
         this.method_1933();
      }
      
      protected function method_1933() : void
      {
         var _loc1_:Point = null;
         if(parent != null)
         {
            _loc1_ = parent.globalToLocal(var_597);
            this.x = Math.round(_loc1_.x - this.var_1743.x);
            this.y = Math.round(_loc1_.y - this.var_1743.y);
         }
      }
      
      public function get arrowLehgth() : int
      {
         return this.var_1749;
      }
      
      public function set arrowLehgth(param1:int) : void
      {
         this.var_1749 = param1;
      }
      
      public function get arrowAlign() : int
      {
         return this.var_1746;
      }
      
      public function set arrowAlign(param1:int) : void
      {
         if(param1 == name_2221.MIDDLE_CENTER)
         {
            this.var_1746 = name_2221.BOTTOM_LEFT;
         }
         else
         {
            this.var_1746 = param1;
         }
         if(Boolean(this.var_1746 & name_2221.name_2223) || Boolean(this.var_1746 & name_2221.name_2226))
         {
            this.var_1751 = name_2222.VERTICAL;
         }
         else
         {
            this.var_1751 = name_2222.HORIZONTAL;
         }
      }
      
      public function set text(param1:String) : void
      {
         this.var_1278.htmlText = param1;
         _size.x = Math.round(this.var_1278.textWidth + this.var_1750 * 2);
         _size.y = Math.round(this.var_1278.textHeight + this.var_1750 * 2) - 3;
      }
      
      override public function set targetPoint(param1:Point) : void
      {
         var _loc2_:Point = null;
         super.targetPoint = param1;
         if(parent != null)
         {
            _loc2_ = parent.globalToLocal(param1);
            this.x = Math.round(_loc2_.x - this.var_1743.x);
            this.y = Math.round(_loc2_.y - this.var_1743.y);
         }
      }
   }
}
