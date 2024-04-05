package package_19
{
   import alternativa.osgi.OSGi;
   import controls.base.name_1134;
   import controls.base.name_998;
   import controls.name_1891;
   import controls.name_1922;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   
   public class ServerMessageWindow extends Sprite
   {
      
      private static const const_1605:Class = name_2167;
      
      private static const const_1604:BitmapData = new const_1605().bitmapData;
       
      
      private var var_1615:name_998;
      
      private var window:name_1922;
      
      private var description:name_1134;
      
      private var var_1616:name_1891;
      
      private var icon:Bitmap;
      
      private var var_1617:String;
      
      public function ServerMessageWindow()
      {
         var _loc5_:Number = NaN;
         super();
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         _loc1_ = NaN;
         _loc2_ = 10;
         _loc1_ = -2;
         _loc5_ = 47;
         _loc3_ = 33;
         _loc4_ = 100;
         this.icon = new Bitmap(const_1604);
         this.icon.x = 23;
         this.icon.y = 23;
         this.description = new name_1134();
         this.description.color = 5898035;
         this.description.multiline = true;
         this.description.autoSize = TextFieldAutoSize.LEFT;
         this.description.x = this.icon.x + this.icon.width + 12 - 4;
         this.description.y = 12 + 12 - 3;
         this.description.text = "Unknown";
         this.description.selectable = true;
         if(this.description.y + this.description.height > this.icon.y + this.icon.height)
         {
            _loc5_ += this.description.y + this.description.height - this.icon.y - this.icon.height;
         }
         this.window = new name_1922(300,12 + _loc5_ + _loc2_ + _loc3_ + _loc2_ + _loc1_ + _loc3_ + 12);
         this.var_1616 = new name_1891(300 - 12 * 2,_loc5_,name_1891.name_1428);
         this.var_1616.x = 12;
         this.var_1616.y = 12;
         addChild(this.window);
         this.window.addChild(this.var_1616);
         this.window.addChild(this.icon);
         this.window.addChild(this.description);
         this.var_1615 = new name_998();
         this.var_1615.label = "Close";
         this.var_1615.x = 12 + 1;
         this.var_1615.y = 12 + _loc5_ + _loc2_;
         this.var_1615.width += 24 * 2;
         this.var_1615.addEventListener(MouseEvent.CLICK,this.method_1792);
         this.window.addChild(this.var_1615);
         this.method_1790();
      }
      
      private function method_1790() : void
      {
         if(stage != null)
         {
            this.window.x = stage.width - this.window.width >> 1;
            this.window.y = stage.height - this.window.height >> 1;
         }
      }
      
      private function method_1792(param1:MouseEvent = null) : void
      {
         AlertService(OSGi.getInstance().name_6(name_42)).hideServerMessageWindow();
      }
      
      private function method_1791() : void
      {
         this.var_1616.width = 12 + this.icon.width + 8 + this.description.width + 20;
         this.var_1616.height = Math.max(this.icon.height,this.description.height) + 2 * 10;
         this.window.width = this.var_1616.width + 2 * 12;
         this.window.height = 12 + this.var_1616.height + 12 + this.var_1615.height + 24 - 10;
         if(this.description.height < this.icon.height)
         {
            this.description.y = this.icon.y + (this.icon.height - this.description.textHeight >> 1) - 3;
         }
         this.var_1615.x = this.window.width - this.var_1615.width >> 1;
         this.var_1615.y = this.var_1616.y + this.var_1616.height + 12 - 4;
         this.method_1790();
      }
      
      public function set text(param1:String) : void
      {
         this.description.text = param1;
         this.method_1791();
      }
      
      public function get currentSize() : Point
      {
         return new Point(this.width,this.height);
      }
      
      private function onOkButtonClick(param1:MouseEvent) : void
      {
         AlertService(OSGi.getInstance().name_6(name_42)).hideServerMessageWindow();
      }
   }
}
