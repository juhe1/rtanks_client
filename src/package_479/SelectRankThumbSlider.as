package package_479
{
   import controls.slider.name_3351;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class SelectRankThumbSlider extends name_3351
   {
      
      private static const const_2928:Class = name_3722;
      
      private static const const_2927:BitmapData = new const_2928().bitmapData;
       
      
      private var var_3747:SmallRankIcon;
      
      private var var_3746:SmallRankIcon;
      
      private var var_2930:int = 1;
      
      private var var_2935:int = 1;
      
      public var name_3638:Sprite;
      
      public var name_3637:Sprite;
      
      public var name_3639:Sprite;
      
      public function SelectRankThumbSlider()
      {
         var _loc1_:Graphics = null;
         this.var_3747 = new SmallRankIcon();
         this.var_3746 = new SmallRankIcon();
         super();
         addChild(this.var_3746);
         addChild(this.var_3747);
         this.var_3746.y = 9;
         this.var_3747.y = 9;
         this.name_3638 = new Sprite();
         _loc1_ = this.name_3638.graphics;
         _loc1_.beginFill(0,0);
         _loc1_.drawRect(0,0,15,30);
         _loc1_.endFill();
         this.name_3637 = new Sprite();
         this.name_3637.x = 15;
         this.name_3639 = new Sprite();
         _loc1_ = this.name_3639.graphics;
         _loc1_.beginFill(0,0);
         _loc1_.drawRect(0,0,15,30);
         _loc1_.endFill();
         addChild(this.name_3638);
         addChild(this.name_3637);
         addChild(this.name_3639);
         this.name_3638.buttonMode = true;
         this.name_3637.buttonMode = true;
         this.name_3639.buttonMode = true;
      }
      
      override protected function draw() : void
      {
         var _loc1_:Graphics = null;
         var _loc2_:Matrix = null;
         super.draw();
         var _loc3_:int = this.var_2935 - this.var_2930;
         this.var_3747.name_2152(this.var_2930);
         this.var_3746.name_2152(this.var_2935);
         this.var_3746.visible = _loc3_ > 0;
         if(_loc3_ == 0)
         {
            this.var_3746.x = this.var_3747.x = int((_width - this.var_3747.width) / 2);
         }
         else
         {
            this.var_3747.x = 11;
            this.var_3746.x = _width - this.var_3746.width - 11;
            _loc1_ = this.graphics;
            _loc2_ = new Matrix();
            _loc2_.translate(5,12);
            _loc1_.beginBitmapFill(const_2927,_loc2_);
            _loc1_.drawRect(5,12,4,7);
            _loc1_.endFill();
            _loc2_ = new Matrix();
            _loc2_.rotate(Math.PI);
            _loc2_.translate(_width - 9,12);
            _loc1_.beginBitmapFill(const_2927,_loc2_);
            _loc1_.drawRect(_width - 9,12,4,7);
            _loc1_.endFill();
         }
         _loc1_ = this.name_3637.graphics;
         _loc1_.clear();
         _loc1_.beginFill(0,0);
         _loc1_.drawRect(0,0,_width - 30,30);
         _loc1_.endFill();
         this.name_3639.x = _width - 15;
      }
      
      public function set minRang(param1:int) : void
      {
         this.var_2930 = param1;
         this.draw();
      }
      
      public function set maxRang(param1:int) : void
      {
         this.var_2935 = param1;
         this.draw();
      }
   }
}
