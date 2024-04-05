package package_400
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.name_2856;
   import assets.icons.GarageItemBackground;
   import controls.base.name_1134;
   import controls.base.name_998;
   import controls.name_1891;
   import controls.name_1922;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import forms.name_1838;
   import package_121.name_343;
   import package_379.class_123;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class WeeklyQuestRewardWindowBase extends class_123
   {
      
      private static const const_2199:Class = name_2857;
      
      private static const package_4:BitmapData = new const_2199().bitmapData;
      
      private static const const_1598:int = 12;
      
      private static const const_422:int = 9;
      
      private static const const_1530:int = 33;
      
      private static const SPACE:int = 8;
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
       
      
      private var var_1182:name_1891;
      
      private var name_983:name_998;
      
      private var messageLabel:name_1134;
      
      private var name_1029:Point;
      
      private var var_1739:int = 450;
      
      private var var_2557:Sprite;
      
      public function WeeklyQuestRewardWindowBase(param1:Vector.<name_343>, param2:String, param3:Boolean)
      {
         var _loc8_:GarageItemBackground = null;
         var _loc9_:int = 0;
         var _loc12_:int = 0;
         var _loc4_:Bitmap = null;
         var _loc5_:name_2856 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         super();
         _loc8_ = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         _loc9_ = Math.ceil(param1.length / 2);
         this.var_2557 = new Sprite();
         this.var_1739 = _loc8_.width + 12 * 2 + 9 * 2 + (_loc8_.width + 8) * (_loc9_ - 1);
         this.messageLabel = new name_1134();
         this.messageLabel.wordWrap = true;
         this.messageLabel.multiline = true;
         this.messageLabel.text = param2;
         this.messageLabel.size = 12;
         this.messageLabel.color = 5898034;
         this.messageLabel.x = 12 * 2;
         this.messageLabel.y = 110 + 12 * 2;
         this.messageLabel.width = this.var_1739 - 12 * 4;
         this.name_1029 = new Point(this.var_1739,90 + this.messageLabel.height + 33 + 12 * 2 + 9 * 3);
         var _loc10_:* = param3 ? name_1838.name_1844(localeService.getText(name_390.const_1415),this.name_1029.x,this.name_1029.y) : new name_1922(this.name_1029.x,this.name_1029.y);
         addChild(_loc10_);
         this.var_1182 = new name_1891(0,0,name_1891.name_1428);
         addChild(this.var_1182);
         this.var_1182.x = 12;
         this.var_1182.y = 12;
         this.var_1182.width = this.name_1029.x - 12 * 2;
         this.var_1182.height = this.name_1029.y - 12 - 9 * 2 - 33 + 2;
         _loc4_ = new Bitmap(package_4);
         _loc4_.y = 12 * 2;
         _loc4_.x = this.var_1182.width - _loc4_.width >> 1;
         this.var_1182.addChild(_loc4_);
         addChild(this.messageLabel);
         addChild(this.var_2557);
         var _loc11_:int = int(param1.length / _loc9_) + 1;
         _loc12_ = 0;
         while(_loc12_ < param1.length)
         {
            _loc8_ = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
            this.var_2557.addChild(_loc8_);
            _loc5_ = new name_2856(param1[_loc12_].itemImage,_loc8_.width,_loc8_.height);
            this.var_2557.addChild(_loc5_);
            if(int(_loc12_ / _loc9_) + 1 == _loc11_)
            {
               _loc6_ = param1.length - (_loc11_ - 1) * _loc9_;
               _loc7_ = (_loc9_ - _loc6_) * (_loc8_.width + 8 >> 1);
               _loc8_.x = _loc12_ % _loc9_ * (_loc8_.width + 8) + _loc7_;
            }
            else
            {
               _loc8_.x = _loc12_ % _loc9_ * (_loc8_.width + 8);
            }
            _loc8_.y = (_loc8_.height + 8) * int(_loc12_ / _loc9_);
            _loc5_.x = _loc8_.x;
            _loc5_.y = _loc8_.y;
            this.method_2630(param1[_loc12_].count,_loc8_);
            _loc12_++;
         }
         this.name_1029.y += this.var_2557.height;
         this.name_983 = new name_998();
         this.name_1029.y += this.name_983.height;
         addChild(this.name_983);
         this.name_983.label = localeService.getText(name_390.const_675);
         this.name_983.y = this.name_1029.y - 9 - 33 - 2;
         this.name_983.x = this.name_1029.x - this.name_983.width - 9 - 2;
         this.method_2533();
         _loc10_.height = this.name_1029.y;
         _loc10_.width = this.name_1029.x;
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_2629);
      }
      
      private function method_2630(param1:int, param2:GarageItemBackground) : name_1134
      {
         var _loc3_:name_1134 = null;
         if(param1 > 0)
         {
            _loc3_ = new name_1134();
            this.var_2557.addChild(_loc3_);
            _loc3_.size = 16;
            _loc3_.color = 5898034;
            _loc3_.text = "×" + param1;
            _loc3_.x = param2.x + param2.width - _loc3_.width - 1.5 * 9;
            _loc3_.y = param2.y + param2.height - _loc3_.height - 9;
         }
         return _loc3_;
      }
      
      private function method_2533() : void
      {
         this.messageLabel.width = this.var_1739 - 12 * 4;
         this.var_2557.y = this.messageLabel.y + this.messageLabel.height + 12;
         this.var_2557.x = this.name_1029.x - this.var_2557.width >> 1;
         this.var_1182.width = this.name_1029.x - 12 * 2;
         this.var_1182.height = this.name_1029.y - 12 - 9 * 2 - 33 + 2;
      }
      
      private function method_2629(param1:MouseEvent = null) : void
      {
         this.destroy();
      }
      
      public function destroy() : void
      {
         this.name_983.removeEventListener(MouseEvent.CLICK,this.method_2629);
         var_864.name_1013(this);
      }
      
      override protected function method_1319() : void
      {
         this.method_2629();
      }
      
      override protected function method_1320() : void
      {
         this.method_2629();
      }
      
      public function show() : void
      {
         var_864.name_1001(this);
      }
   }
}
