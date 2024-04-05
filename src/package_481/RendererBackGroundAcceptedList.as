package package_481
{
   import controls.cellrenderer.name_1932;
   import flash.display.Sprite;
   import forms.friends.list.AcceptedList;
   import forms.friends.list.renderer.HeaderAcceptedList;
   
   public class RendererBackGroundAcceptedList extends Sprite
   {
       
      
      protected var var_1207:Vector.<Number>;
      
      protected var _width:int = 100;
      
      public function RendererBackGroundAcceptedList(param1:Boolean, param2:Boolean = false)
      {
         var _loc3_:name_1932 = null;
         this.var_1207 = new Vector.<Number>();
         super();
         var _loc4_:int = int(HeaderAcceptedList.var_1155.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(param1)
            {
               if(param2)
               {
                  _loc3_ = new name_3657();
               }
               else
               {
                  _loc3_ = new name_3656();
               }
            }
            else if(param2)
            {
               _loc3_ = new name_3654();
            }
            else
            {
               _loc3_ = new name_3655();
            }
            addChild(_loc3_);
            _loc5_++;
         }
         this.resize();
      }
      
      protected function resize() : void
      {
         var _loc1_:name_1932 = null;
         var _loc3_:int = 0;
         _loc1_ = null;
         if(this.method_3297())
         {
            this.var_1207 = Vector.<Number>([0,this._width - 224,this._width - 1]);
         }
         else
         {
            this.var_1207 = Vector.<Number>([0,this._width - 233,this._width - 1]);
         }
         var _loc2_:int = int(HeaderAcceptedList.var_1155.length);
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = getChildAt(_loc3_) as name_1932;
            _loc1_.width = this.var_1207[_loc3_ + 1] - this.var_1207[_loc3_] - 2;
            _loc1_.height = 18;
            _loc1_.x = this.var_1207[_loc3_];
            _loc3_++;
         }
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,this._width - 1,18);
         graphics.endFill();
      }
      
      protected function method_3297() : Boolean
      {
         return AcceptedList.var_3002;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.resize();
      }
   }
}
