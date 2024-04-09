package scpacker.test
{
   import alternativa.osgi.OSGi;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import package_120.UserInfoService;
   import package_120.name_408;
   
   public class name_1014 extends Sprite
   {
      
      private static const const_1648:int = -73;
      
      private static const const_1645:int = 60;
      
      private static const const_1644:int = 90;
      
      private static const const_1646:int = 135;
      
      private static const const_1643:Class = name_2192;
       
      
      private const const_1647:int = 4000;
      
      private const name_1363:int = 2000;
      
      private var var_1735:int;
      
      private var label:LabelBase;
      
      private var var_1734:LabelBase;
      
      private var timer:Timer;
      
      private var const_126:name_2193;
      
      private var var_1736:int;
      
      public function name_1014(param1:String, param2:int)
      {
         var _loc3_:Bitmap = null;
         this.const_126 = new BigRankIcon();
         super();
         filters = [new GlowFilter(0,1,6,6)];
         this.const_126.init(UserInfoService(OSGi.getInstance().getService(name_408)).localUserInfo.premium,param2);
         this.const_126.x = -(this.const_126.width >> 1);
         this.const_126.y = -73;
         addChild(this.const_126);
         this.label = new LabelBase();
         this.label.color = 16776960;
         this.label.size = 18;
         this.label.bold = true;
         this.label.autoSize = TextFieldAutoSize.CENTER;
         this.label.align = TextFormatAlign.CENTER;
         this.label.multiline = true;
         this.label.text = "Поздравляем\nВы получили звание «" + param1 + "»";
         addChild(this.label);
         this.var_1735 = 90;
         if(UpdateRankPrize.getCount(param2) > 0)
         {
            this.var_1734 = new LabelBase();
            this.var_1734.color = 16776960;
            this.var_1734.size = 18;
            this.var_1734.bold = true;
            this.var_1734.autoSize = TextFieldAutoSize.CENTER;
            this.var_1734.text = "Ваш подарок " + UpdateRankPrize.getCount(param2);
            this.var_1734.x = -(this.var_1734.width >> 1);
            this.var_1734.y = 60;
            addChild(this.var_1734);
            _loc3_ = new const_1643();
            _loc3_.x = this.var_1734.x + this.var_1734.width + 2;
            _loc3_.y = 60 - 1;
            addChild(_loc3_);
            this.var_1735 = 135;
         }
         addEventListener(Event.ADDED_TO_STAGE,this.method_1925);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_1926);
      }
      
      private function method_1925(param1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.method_1922);
         this.timer = new Timer(4000,1);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.method_1924);
         this.timer.start();
         this.method_1922(null);
      }
      
      private function method_1923(param1:Event) : void
      {
         var _loc2_:Number = 1 - (getTimer() - this.var_1736) / 2000;
         this.alpha = _loc2_;
         if(_loc2_ <= 0)
         {
            removeEventListener(Event.ENTER_FRAME,this.method_1923);
            parent.removeChild(this);
         }
      }
      
      private function method_1926(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.method_1922);
         removeEventListener(Event.ADDED_TO_STAGE,this.method_1925);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.method_1926);
      }
      
      private function method_1922(param1:Event) : void
      {
         x = stage.stageWidth / 2;
         y = stage.stageHeight - this.var_1735 >> 1;
      }
      
      private function method_1924(param1:TimerEvent) : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.method_1924);
         addEventListener(Event.ENTER_FRAME,this.method_1923);
         this.var_1736 = getTimer();
      }
   }
}
