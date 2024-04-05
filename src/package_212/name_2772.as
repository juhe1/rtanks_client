package package_212
{
   import controls.base.name_1134;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class name_2772 extends Sprite
   {
      
      private static var var_3371:Class = name_3344;
      
      private static var var_3378:BitmapData = Bitmap(new var_3371()).bitmapData;
      
      private static var var_3372:Class = name_3343;
      
      private static var var_3374:BitmapData = Bitmap(new var_3372()).bitmapData;
      
      private static var var_3377:Class = name_3345;
      
      private static var var_3373:BitmapData = Bitmap(new var_3377()).bitmapData;
       
      
      private var var_3375:Bitmap;
      
      private var var_3369:Bitmap;
      
      private var var_3376:Bitmap;
      
      private var var_3370:name_1134;
      
      private var _count:int = 0;
      
      public function name_2772()
      {
         super();
         this.var_3375 = new Bitmap(var_3378);
         addChild(this.var_3375);
         this.var_3369 = new Bitmap(var_3374);
         addChild(this.var_3369);
         this.var_3376 = new Bitmap(var_3373);
         addChild(this.var_3376);
         this.var_3370 = new name_1134();
         addChild(this.var_3370);
         this.visible = false;
         this.resize();
      }
      
      private function resize() : void
      {
         this.var_3376.x = -5;
         this.var_3370.x = -int(this.var_3370.width) - 1;
         this.var_3369.width = this.method_3044();
         this.var_3369.x = this.var_3376.x - this.var_3369.width;
         this.var_3375.x = this.var_3369.x - this.var_3375.width;
      }
      
      private function method_3044() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.var_3370.text.length;
         if(_loc2_ == 1)
         {
            _loc1_ = 1;
         }
         else if(_loc2_ > 1)
         {
            _loc1_ = (_loc2_ - 1) * 6;
         }
         return _loc1_;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
         this.visible = this._count != 0;
         this.var_3370.text = param1.toString();
         this.resize();
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
      }
   }
}
