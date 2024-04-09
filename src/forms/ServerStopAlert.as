package forms
{
   import controls.Label;
   import controls.statassets.name_1154;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class ServerStopAlert extends Sprite
   {
       
      
      protected const const_151:int = 15;
      
      protected var bg:name_1154;
      
      protected var var_1740:Label;
      
      protected var var_463:int = 0;
      
      protected var var_462:Timer;
      
      public var str:String;
      
      public function ServerStopAlert(param1:int)
      {
         this.bg = new name_1154();
         this.var_1740 = new Label();
         super();
         this.var_463 = param1;
         this.init();
      }
      
      protected function init() : void
      {
         var _loc1_:name_102 = Main.osgi.getService(name_102) as name_102;
         this.var_1740.align = TextFormatAlign.CENTER;
         this.str = _loc1_.getText(TextConst.SERVER_STOP_ALERT_TEXT);
         this.var_1740.text = this.getText(this.str,"88");
         addChild(this.bg);
         addChild(this.var_1740);
         this.var_1740.x = 15;
         this.var_1740.y = 15;
         this.bg.width = this.var_1740.width + 15 * 2;
         this.bg.height = this.var_1740.height + 15 * 2;
         this.method_686();
      }
      
      protected function method_686() : void
      {
         this.var_462 = new Timer(1000);
         this.var_462.addEventListener(TimerEvent.TIMER,this.method_685);
         this.var_462.start();
         this.method_685();
      }
      
      protected function method_685(param1:TimerEvent = null) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = int(this.var_463 / 60);
         var _loc4_:int = this.var_463 - _loc3_ * 60;
         _loc2_ = _loc4_ > 9 ? String(_loc4_) : "0" + String(_loc4_);
         this.var_1740.text = this.var_1740.text = this.getText(this.str,_loc2_);
         --this.var_463;
         if(this.var_463 < 0)
         {
            this.var_462.removeEventListener(TimerEvent.TIMER,this.method_685);
            this.var_462.stop();
         }
      }
      
      protected function getText(param1:String, ... rest) : String
      {
         var _loc3_:String = param1;
         var _loc4_:int = 0;
         while(_loc4_ < rest.length)
         {
            _loc3_ = _loc3_.replace("%" + (_loc4_ + 1),rest[_loc4_]);
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
