package package_481
{
   import controls.cellrenderer.name_1932;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class name_3482 extends Sprite
   {
       
      
      private var _width:int = 100;
      
      public function name_3482(param1:Boolean)
      {
         super();
         var _loc2_:name_1932 = null;
         if(param1)
         {
            _loc2_ = new name_3657();
         }
         else
         {
            _loc2_ = new name_3656();
         }
         addChild(_loc2_);
         this.resize();
      }
      
      protected function resize() : void
      {
         var _loc1_:DisplayObject = getChildAt(0);
         _loc1_.width = this._width - 3;
         _loc1_.height = 18;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.resize();
      }
   }
}
