package alternativa.tanks.models.battlefield.gui
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.utils.removeDisplayObject;
   import controls.base.LabelBase;
   import controls.statassets.name_1154;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.text.TextFieldAutoSize;
   import package_12.name_24;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ReloaderIndicator extends name_1154
   {
      
      public static var display:name_24 = OSGi.getInstance().getService(name_24) as name_24;
      
      public static var var_1732:IBattleField = OSGi.getInstance().getService(IBattleField) as IBattleField;
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
      
      private static const const_1554:Class = name_2191;
      
      private static const const_1555:String = "{time}";
       
      
      private var var_1393:LabelBase;
      
      private var var_1396:String;
      
      private var var_1394:int;
      
      private var var_1395:Boolean;
      
      public function ReloaderIndicator()
      {
         super();
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
         var _loc7_:LabelBase = new LabelBase();
         _loc7_.size = _loc5_;
         _loc7_.text = localeService.getText(name_390.const_1007);
         _loc7_.y = _loc1_;
         addChild(_loc7_);
         width = _loc7_.textWidth;
         _loc1_ += _loc7_.height;
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
         _loc7_.x = width - _loc7_.width >> 1;
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
         this.var_1395 = true;
         this.name_978 = param1;
         var_1732.getBattlefieldData().viewport.addChild(this);
         this.onResize();
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event = null) : void
      {
         this.x = display.stage.stageWidth - this.width >> 1;
         this.y = display.stage.stageHeight - this.height >> 1;
      }
      
      public function hide() : void
      {
         if(!this.var_1395)
         {
            return;
         }
         this.var_1395 = false;
         removeDisplayObject(this);
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function destroy() : void
      {
         this.hide();
         this.var_1393 = null;
      }
   }
}
