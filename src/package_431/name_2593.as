package package_431
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.utils.getTimer;
   
   public class name_2593 extends Shape
   {
      
      public static var var_3153:Class = name_3131;
      
      public static var var_3152:BitmapData = (new var_3153() as Bitmap).bitmapData;
      
      public static var const_2061:Class = name_3132;
      
      public static var var_3151:BitmapData = (new const_2061() as Bitmap).bitmapData;
      
      private static const const_2373:int = 500;
      
      private static const const_1532:int = 500;
      
      private static const matrix:Matrix = new Matrix();
      
      private static const colorTransform:ColorTransform = new ColorTransform();
       
      
      private var startTime:int;
      
      private var running:Boolean;
      
      public function name_2593()
      {
         super();
         visible = false;
      }
      
      public function init(param1:uint) : void
      {
         colorTransform.color = param1;
         transform.colorTransform = colorTransform;
      }
      
      public function update(param1:int) : void
      {
         if(!this.running)
         {
            return;
         }
         if(param1 > this.startTime + 500)
         {
            this.stop();
            return;
         }
         var _loc2_:Number = (param1 - this.startTime) / 500;
         this.alpha = -(2 * _loc2_ - 1) * (2 * _loc2_ - 1) + 0.8;
         var _loc3_:int = _loc2_ * 500;
         graphics.clear();
         matrix.ty = 500 - _loc3_;
         graphics.beginBitmapFill(var_3151,matrix,true);
         graphics.drawRect(0,500 - _loc3_,var_3151.width,Math.min(_loc3_,var_3151.height));
         graphics.endFill();
         if(_loc3_ > var_3151.height)
         {
            graphics.beginBitmapFill(var_3152,null,false);
            graphics.drawRect(0,500 - _loc3_ + var_3151.height,var_3152.width,_loc3_ - var_3151.height);
            graphics.endFill();
         }
      }
      
      public function start() : void
      {
         this.running = true;
         this.startTime = getTimer();
         visible = true;
         alpha = 0;
      }
      
      public function stop() : void
      {
         visible = false;
         this.running = false;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      override public function get height() : Number
      {
         return 500;
      }
   }
}
