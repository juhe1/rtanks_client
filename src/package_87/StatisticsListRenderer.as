package package_87
{
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import controls.Label;
   import controls.Money;
   import controls.resultassets.name_3122;
   import controls.resultassets.name_3124;
   import controls.resultassets.name_3125;
   import controls.resultassets.name_3126;
   import controls.resultassets.name_3127;
   import controls.resultassets.name_3128;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.name_1139;
   import package_1.Main;
   import package_390.name_1889;
   
   public class StatisticsListRenderer extends CellRenderer
   {
      
      public static var var_2275:Boolean;
      
      private static const const_2367:int = 2;
      
      private static const const_2369:int = 3;
      
      private static const COLOR_NORMAL:uint = 16777215;
      
      private static const const_2370:uint = 15976448;
      
      private static const const_2368:uint = 10921638;
      
      private static const const_2366:String = "—";
      
      private static const const_2365:Class = name_3123;
       
      
      private var var_2684:DisplayObject;
      
      public function StatisticsListRenderer()
      {
         super();
         this.mouseChildren = true;
         this.useHandCursor = false;
         this.buttonMode = false;
      }
      
      private static function method_2910(param1:DisplayObjectContainer, param2:String, param3:uint, param4:String, param5:int, param6:int) : Label
      {
         var _loc7_:Label = null;
         _loc7_ = new Label();
         _loc7_.autoSize = TextFieldAutoSize.NONE;
         _loc7_.text = param2;
         _loc7_.color = param3;
         _loc7_.align = param4;
         _loc7_.x = param6;
         _loc7_.width = param5;
         _loc7_.height = name_2564.name_2570;
         param1.addChild(_loc7_);
         return _loc7_;
      }
      
      private static function method_2911(param1:DisplayObjectContainer, param2:int, param3:uint, param4:int) : void
      {
         var _loc5_:String = Money.name_876(param4,false);
         method_2910(param1,_loc5_,param3,TextFormatAlign.RIGHT,name_2564.name_2571,param2);
      }
      
      private static function method_2912(param1:DisplayObjectContainer, param2:int, param3:uint, param4:int, param5:int, param6:name_1889) : void
      {
         var _loc7_:Bitmap = null;
         var _loc8_:String = null;
         _loc7_ = null;
         var _loc9_:Shape = null;
         var _loc10_:int = 0;
         var _loc11_:uint = param3;
         if(param6.premium)
         {
            if(param4 > 0 || param5 > 0)
            {
               _loc11_ = 15976448;
               _loc8_ = Money.name_876(param4 + param5,false);
            }
            else
            {
               _loc11_ = param3;
               _loc8_ = "—";
            }
         }
         else if(param5 > 0)
         {
            _loc11_ = 16777215;
            _loc8_ = Money.name_876(param5,false);
         }
         else if(param6.self)
         {
            _loc11_ = 10921638;
            if(param4 > 0)
            {
               _loc8_ = Money.name_876(param4,false);
            }
            else
            {
               _loc8_ = "—";
            }
         }
         else
         {
            _loc11_ = param3;
            _loc8_ = "—";
         }
         var _loc12_:Label = method_2910(param1,_loc8_,_loc11_,TextFormatAlign.RIGHT,name_2564.name_2571,param2);
         if(param6.self && !param6.premium && param5 <= 0)
         {
            if(param4 > 0)
            {
               _loc9_ = new Shape();
               param1.addChild(_loc9_);
               _loc10_ = _loc12_.textWidth;
               _loc9_.x = _loc12_.x + name_2564.name_2571 - _loc10_ - 2;
               _loc9_.y = _loc12_.y + 9;
               _loc9_.graphics.clear();
               _loc9_.graphics.beginFill(10921638);
               _loc9_.graphics.drawRect(0,0,_loc10_,1);
               _loc9_.graphics.endFill();
            }
            _loc7_ = new Bitmap(new const_2365().bitmapData);
            param1.addChild(_loc7_);
            _loc7_.x = param2 + name_2564.name_2571 + 4;
            _loc7_.y = name_2564.name_2570 - 2 - _loc7_.height >> 1;
         }
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         this.var_2684 = this.method_2586(_data);
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = _listData.label;
         if(this.var_2684 != null)
         {
            setStyle("icon",this.var_2684);
         }
      }
      
      override protected function drawBackground() : void
      {
      }
      
      override protected function drawLayout() : void
      {
      }
      
      override protected function drawIcon() : void
      {
         var _loc1_:DisplayObject = icon;
         var _loc2_:Object = getStyleValue("icon");
         if(_loc2_ != null)
         {
            icon = getDisplayObjectInstance(_loc2_);
         }
         if(icon != null)
         {
            addChildAt(icon,1);
         }
         if(_loc1_ != null && _loc1_ != icon && _loc1_.parent == this)
         {
            removeChild(_loc1_);
         }
      }
      
      private function method_2586(param1:Object) : Sprite
      {
         var _loc3_:DisplayObject = null;
         var _loc8_:Label = null;
         var _loc2_:name_2569 = name_2569(param1);
         switch(_loc2_.type)
         {
            case ViewStatistics.BLUE:
               _loc3_ = _loc2_.self ? new name_3124() : new name_3126();
               break;
            case ViewStatistics.name_1428:
               _loc3_ = _loc2_.self ? new name_3128() : new name_3122();
               break;
            case ViewStatistics.RED:
               _loc3_ = _loc2_.self ? new name_3127() : new name_3125();
         }
         var _loc4_:Sprite = new Sprite();
         _loc4_.addChild(_loc3_);
         var _loc5_:uint = Boolean(_loc2_.suspicious) ? uint(name_1139.name_1151) : uint(16777215);
         var _loc6_:name_3121 = new name_3121(_loc2_);
         if(_loc2_.suspicious)
         {
            _loc6_.name_2046(name_1139.name_1151,true);
         }
         else
         {
            _loc6_.name_2046(16777215,BattlefieldModel(Main.osgi.name_6(name_83)).spectatorMode);
         }
         var _loc7_:int = name_2564.name_2578;
         _loc6_.x = _loc7_ - 14;
         _loc4_.addChild(_loc6_);
         _loc7_ += name_2564.name_2577;
         if(_loc2_.score > -1)
         {
            _loc8_ = method_2910(_loc4_,_loc2_.score.toString(),_loc5_,TextFormatAlign.RIGHT,name_2564.name_2582,_loc7_);
            _loc7_ += _loc8_.width;
         }
         _loc8_ = method_2910(_loc4_,_loc2_.kills.toString(),_loc5_,TextFormatAlign.RIGHT,name_2564.name_2583,_loc7_);
         _loc7_ += _loc8_.width;
         _loc8_ = method_2910(_loc4_,_loc2_.deaths.toString(),_loc5_,TextFormatAlign.RIGHT,name_2564.name_2574,_loc7_);
         _loc7_ += _loc8_.width;
         var _loc9_:Number = _loc2_.kills / _loc2_.deaths;
         var _loc10_:String = _loc2_.deaths == 0 || _loc2_.kills == 0 ? "—" : _loc9_.toFixed(2);
         _loc8_ = method_2910(_loc4_,_loc10_,_loc5_,TextFormatAlign.RIGHT,name_2564.name_2580,_loc7_);
         _loc7_ += _loc8_.width;
         if(_loc2_.reward > -1)
         {
            _loc8_ = method_2910(_loc4_,Money.name_876(_loc2_.reward,false),_loc5_,TextFormatAlign.RIGHT,name_2564.name_2579,_loc7_);
            _loc7_ += _loc8_.width;
            if(var_2275)
            {
               method_2912(_loc4_,_loc7_,_loc5_,_loc2_.premiumBonusReward,_loc2_.newbiesAbonementBonusReward,_loc6_);
               _loc7_ += _loc8_.width;
               method_2911(_loc4_,_loc7_,15976448,_loc2_.stars);
            }
         }
         _loc3_.width = width;
         _loc3_.height = name_2564.name_2570 - 2;
         return _loc4_;
      }
   }
}
