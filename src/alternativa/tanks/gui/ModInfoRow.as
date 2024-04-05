package alternativa.tanks.gui
{
   import assets.name_2295;
   import controls.base.name_1134;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import package_1.Main;
   
   public class ModInfoRow extends Sprite
   {
      
      private static const const_2770:int = 13;
       
      
      public var labels:Array;
      
      public var var_2359:name_1134;
      
      public var var_1841:name_2295;
      
      public var const_126:SmallRankIcon;
      
      public var var_2360:UpgradeIndicator;
      
      public const h:int = 17;
      
      public const const_2771:int = 10;
      
      private var var_3604:int = 0;
      
      private var _width:int;
      
      public var var_3605:int;
      
      public function ModInfoRow(param1:int)
      {
         var _loc2_:name_1134 = null;
         this._width = param1;
         super();
         this.labels = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < 8)
         {
            _loc2_ = new name_1134();
            _loc2_.color = 16777215;
            _loc2_.align = TextFormatAlign.CENTER;
            _loc2_.text = "ABC123";
            addChild(_loc2_);
            this.labels.push(_loc2_);
            _loc2_.y = 17 - _loc2_.height >> 1;
            _loc3_++;
         }
         this.var_2359 = new name_1134();
         this.var_2359.color = 16777215;
         this.var_2359.align = TextFormatAlign.RIGHT;
         this.var_2359.text = "ABC123";
         addChild(this.var_2359);
         this.var_2359.y = 17 - this.var_2359.height >> 1;
         this.var_1841 = new name_2295();
         addChild(this.var_1841);
         this.var_1841.y = 17 - this.var_1841.height >> 1;
         this.const_126 = new SmallRankIcon();
         addChild(this.const_126);
         this.const_126.y = (17 - this.const_126.height >> 1) + 1;
         this.var_2360 = new UpgradeIndicator();
         addChild(this.var_2360);
         this.var_2360.y = (17 - this.var_2360.height >> 1) + 1;
      }
      
      public function method_3225() : void
      {
         removeChild(this.var_2360);
      }
      
      public function name_1879() : void
      {
         var _loc1_:name_1134 = null;
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            _loc1_ = this.labels[_loc2_] as name_1134;
            _loc1_.color = 16777215;
            _loc1_.sharpness = -100;
            _loc1_.thickness = 100;
            _loc2_++;
         }
         this.var_2359.sharpness = -100;
         this.var_2359.thickness = 100;
      }
      
      public function name_2631() : void
      {
         var _loc1_:name_1134 = null;
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            _loc1_ = this.labels[_loc2_] as name_1134;
            _loc1_.color = 16777215;
            _loc1_.sharpness = 50;
            _loc1_.thickness = -50;
            _loc2_++;
         }
         this.var_2359.color = 16777215;
         this.var_2359.sharpness = 50;
         this.var_2359.thickness = -50;
      }
      
      public function name_3244(param1:int) : void
      {
         this.var_3604 = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.labels.length)
         {
            this.labels[_loc2_].visible = _loc2_ < param1;
            _loc2_++;
         }
      }
      
      public function name_3249(param1:Array) : void
      {
         Main.method_8("GARAGE WINDOW","setLabelsText: %1",param1);
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(param1[_loc2_] != null && param1[_loc2_] != "" && param1[_loc2_] != "null")
            {
               (this.labels[_loc2_] as name_1134).text = param1[_loc2_];
            }
            else
            {
               (this.labels[_loc2_] as name_1134).text = "—";
            }
            _loc2_++;
         }
      }
      
      public function name_868() : void
      {
         var _loc1_:name_1134 = null;
         this.var_1841.x = this._width - this.var_1841.width - 10;
         this.var_2359.x = this.var_1841.x - 3 - this.var_2359.width;
         var _loc2_:Number = this.var_1841.x - 3 - this.var_3605;
         this.const_126.x = _loc2_ - 10 - 13;
         this.var_2360.x = this.const_126.x - this.var_2360.width - 10;
         this.var_2360.y = (17 - this.var_2360.height >> 1) + 1;
         var _loc3_:Number = (this.var_2360.x - 2 * 10) / this.var_3604;
         var _loc4_:int = 0;
         while(_loc4_ < this.var_3604)
         {
            _loc1_ = this.labels[_loc4_];
            _loc1_.x = Math.round(10 + _loc3_ * _loc4_ + (_loc3_ - _loc1_.width) / 2);
            _loc4_++;
         }
      }
      
      public function name_3245() : Vector.<Number>
      {
         var _loc1_:name_1134 = null;
         var _loc2_:Vector.<Number> = new Vector.<Number>(this.var_3604,true);
         var _loc3_:int = 0;
         while(_loc3_ < this.var_3604)
         {
            _loc1_ = this.labels[_loc3_];
            _loc2_[_loc3_] = _loc1_.x + _loc1_.width * 0.5;
            _loc3_++;
         }
         return _loc2_;
      }
   }
}
