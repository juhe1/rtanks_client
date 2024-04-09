package alternativa.tanks.gui
{
   import alternativa.tanks.gui.payment.controls.name_2833;
   import controls.base.DefaultButtonBase;
   import controls.TankWindowInner;
   import controls.name_1922;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_1.Main;
   import package_117.name_341;
   import package_379.class_123;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class ThanksForPurchaseWindow extends class_123
   {
      
      public static var localeService:name_102 = Main.osgi.getService(name_102) as name_102;
       
      
      private var bitmap:Class;
      
      public var name_983:DefaultButtonBase;
      
      private const const_1692:int = 12;
      
      private const var_1750:int = 9;
      
      private var var_1182:Sprite;
      
      public function ThanksForPurchaseWindow(param1:Vector.<name_341>)
      {
         var _loc4_:TankWindowInner = null;
         var _loc7_:name_341 = null;
         var _loc8_:name_2833 = null;
         this.bitmap = name_2834;
         super();
         var _loc2_:int = 12 * 2 + 9 * 2 + new this.bitmap().bitmapData.width;
         var _loc3_:name_1922 = new name_1922();
         addChild(_loc3_);
         _loc4_ = new TankWindowInner(_loc2_ - 12 * 2,0,TankWindowInner.GREEN);
         this.var_1182 = _loc4_;
         _loc3_.addChild(_loc4_);
         _loc4_.x = 12;
         _loc4_.y = 12;
         var _loc5_:Bitmap = new Bitmap(new this.bitmap().bitmapData);
         _loc5_.x = (_loc4_.width - _loc5_.width) / 2;
         this.method_223(_loc5_,12);
         var _loc6_:int = _loc4_.width * 0.8;
         for each(_loc7_ in param1)
         {
            _loc8_ = new name_2833(_loc7_.name,_loc7_.count);
            _loc8_.width = _loc6_;
            this.method_2611(_loc8_,_loc4_.width);
            this.method_223(_loc8_,0);
         }
         _loc4_.height += 12;
         this.name_983 = new DefaultButtonBase();
         if(localeService != null)
         {
            this.name_983.label = localeService.getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         }
         this.name_983.y = _loc4_.x + _loc4_.height + 12;
         this.method_2611(this.name_983,_loc2_);
         _loc3_.addChild(this.name_983);
         _loc3_.height = this.name_983.y + this.name_983.height + 12;
         _loc3_.width = _loc2_;
         addChild(_loc3_);
      }
      
      public function name_2099() : void
      {
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_1323);
         var_864.name_1001(this);
      }
      
      override protected function method_1320() : void
      {
         if(this.name_983.enable)
         {
            this.method_1323();
         }
      }
      
      private function method_1323(param1:MouseEvent = null) : void
      {
         this.name_983.removeEventListener(MouseEvent.CLICK,this.method_1323);
         var_864.name_1013(this);
         dispatchEvent(new Event(Event.CANCEL));
      }
      
      private function method_2611(param1:DisplayObject, param2:Number) : void
      {
         param1.x = (param2 - param1.width) / 2;
      }
      
      private function method_223(param1:DisplayObject, param2:int) : void
      {
         param1.y = this.var_1182.height + param2;
         this.var_1182.addChild(param1);
      }
   }
}
