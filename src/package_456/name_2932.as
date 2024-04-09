package package_456
{
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class name_2932 extends Sprite
   {
      
      private static var var_3484:Class = name_3446;
      
      private static var var_3481:BitmapData = Bitmap(new var_3484()).bitmapData;
      
      private static var var_3485:Class = name_3447;
      
      private static var var_3480:BitmapData = Bitmap(new var_3485()).bitmapData;
      
      private static var var_3482:Class = name_3445;
      
      private static var var_3483:BitmapData = Bitmap(new var_3482()).bitmapData;
       
      
      private var label:LabelBase;
      
      private var var_3479:Bitmap;
      
      public function name_2932(param1:Boolean, param2:Boolean, param3:int, param4:uint)
      {
         this.label = new LabelBase();
         super();
         this.init(param1,param2,param3,param4);
      }
      
      public function method_3126(param1:int) : void
      {
         this.label.text = String(param1);
      }
      
      public function method_3125(param1:Boolean) : void
      {
         removeChild(this.var_3479);
         this.var_3479 = new Bitmap(param1 ? var_3481 : var_3480);
         addChild(this.var_3479);
      }
      
      private function init(param1:Boolean, param2:Boolean, param3:int, param4:uint) : void
      {
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,18,16);
         graphics.endFill();
         this.var_3479 = new Bitmap(param2 ? var_3483 : (param1 ? var_3481 : var_3480));
         this.var_3479.y = 3;
         addChild(this.var_3479);
         this.label.text = String(param3);
         this.label.x = this.var_3479.width;
         this.label.y = -1;
         this.label.color = param4;
         addChild(this.label);
      }
   }
}
