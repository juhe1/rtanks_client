package controls
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import controls.base.LabelBase;
   import controls.statassets.name_1154;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class SuicideIndicator extends name_1154
   {
      
      public static var battleService:BattlefieldModel;
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
      
      private static const const_1554:Class = name_2065;
      
      private static const const_1555:String = "{time}";
       
      
      private var var_1393:LabelBase;
      
      private var var_1396:String;
      
      private var var_1394:int;
      
      private var var_1395:Boolean;
      
      private var var_364:int;
      
      public function SuicideIndicator(param1:BattlefieldModel)
      {
         super();
         battleService = param1;
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Bitmap = null;
         _loc1_ = 0;
         this.var_1396 = localeService.getText(name_390.const_1423);
         _loc4_ = 5;
         _loc5_ = 16;
         _loc6_ = new Bitmap(new const_1554().bitmapData);
         addChild(_loc6_);
         _loc6_.y = 33 - 5;
         _loc1_ = _loc6_.y + _loc6_.height + 2 * _loc4_;
         this.var_1393 = new LabelBase();
         this.var_1393.size = _loc5_;
         this.var_1393.autoSize = TextFieldAutoSize.LEFT;
         this.var_1393.text = this.var_1396.replace("{time}"," 99:99");
         this.var_1393.y = _loc1_;
         addChild(this.var_1393);
         if(width < this.var_1393.textWidth)
         {
            width = this.var_1393.textWidth;
         }
         width += 2 * 33;
         _loc6_.x = width - _loc6_.width >> 1;
         height = _loc1_ + this.var_1393.height + 33 - 5;
      }
      
      public function set name_978(param1:int) : void
      {
         if(this.var_1394 == param1)
         {
            return;
         }
         this.var_1394 = param1;
         var _loc2_:int = this.var_1394 / 60;
         this.var_1394 -= _loc2_ * 60;
         var _loc3_:String = this.var_1394 < 10 ? "0" + this.var_1394 : this.var_1394.toString();
         this.var_1393.text = this.var_1396.replace("{time}",_loc2_ + ":" + _loc3_);
         this.var_1393.x = width - this.var_1393.width >> 1;
      }
      
      public function show(param1:int) : void
      {
         if(this.var_1395)
         {
            return;
         }
         this.var_364 = getTimer() + param1;
         this.var_1395 = true;
         this.name_978 = param1;
         battleService.var_117.viewport.addChild(this);
         this.onResize();
         Main.stage.addEventListener(Event.RESIZE,this.onResize);
         Main.stage.addEventListener(Event.ENTER_FRAME,this.method_1619);
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.x = Main.stage.stageWidth - this.width >> 1;
         this.y = Main.stage.stageHeight - this.height >> 1;
      }
      
      private function method_1619(param1:Event = null) : void
      {
         var _loc2_:int = getTimer();
         this.name_978 = Math.max((this.var_364 - _loc2_) / 1000,0);
      }
      
      public function hide() : void
      {
         if(!this.var_1395)
         {
            return;
         }
         this.var_1395 = false;
         this.removeDisplayObject(this);
         Main.stage.removeEventListener(Event.RESIZE,this.onResize);
         Main.stage.removeEventListener(Event.ENTER_FRAME,this.method_1619);
      }
      
      public function destroy() : void
      {
         this.hide();
         this.var_1393 = null;
      }
      
      private function removeDisplayObject(param1:DisplayObject) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
   }
}
