package alternativa.tanks.gui
{
   import controls.DefaultButton;
   import controls.Label;
   import controls.TankInput;
   import controls.name_1922;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class name_1853 extends Sprite
   {
      
      private static const Watches3Hours:Class;
      
      private static const Watches5Hours:Class;
       
      
      private var window:name_1922;
      
      private var var_1276:DefaultButton;
      
      private var name_983:DefaultButton;
      
      private var var_2564:Label;
      
      private var var_2562:Label;
      
      public var name_1855:TankInput;
      
      public var name_1854:TankInput;
      
      private var var_2563:Bitmap;
      
      public var name_1029:Point;
      
      public function name_1853(param1:int)
      {
         super();
         this.name_1029 = new Point(392,270);
         this.window = new name_1922();
         this.window.width = this.name_1029.x;
         this.window.height = this.name_1029.y;
         var _loc2_:name_102 = name_102(Main.osgi.name_6(name_102));
         this.window.name_2241 = _loc2_.getText(TextConst.GUI_LANG);
         this.var_2563 = param1 >= 5 * 60 ? new Watches5Hours() : new Watches3Hours();
         this.var_2563.x = 12;
         this.var_2563.y = 34;
         this.window.addChild(this.var_2563);
         this.var_1276 = new DefaultButton();
         this.var_1276.width = 115;
         this.var_1276.height = 30;
         this.var_1276.x = 160;
         this.var_1276.y = 220;
         this.var_1276.label = "确认";
         this.window.addChild(this.var_1276);
         this.name_983 = new DefaultButton();
         this.name_983.width = 96;
         this.name_983.height = 30;
         this.name_983.x = 290;
         this.name_983.y = 220;
         this.name_983.label = "取消";
         this.window.addChild(this.name_983);
         this.name_1855 = new TankInput();
         this.name_1855.label = "您的真实姓名:";
         this.name_1855.x = 165;
         this.name_1855.y = 30;
         this.window.addChild(this.name_1855);
         this.name_1854 = new TankInput();
         this.name_1854.label = "身份证号码:";
         this.name_1854.x = 165;
         this.name_1854.y = 70;
         this.window.addChild(this.name_1854);
         this.name_1854.addEventListener(FocusEvent.FOCUS_OUT,this.method_1710);
         this.name_1854.addEventListener(FocusEvent.FOCUS_IN,this.method_1694);
         this.var_2562 = new Label();
         this.var_2562.text = param1 >= 5 * 60 ? "您已进入不健康游戏时间，为了您的健康，请您立即下线休息。\n如不下线，您的身体将受到损害，您的收益已降为零，直到您的累计下线时间满5小时后，才能恢复正常。" : "您已经进入疲劳游戏时间，您的游戏收益将降为正常值的50%，为了您的健康，请尽快下线休息，做适当身体活动，合理安排学习生活。";
         this.var_2562.x = 14;
         this.var_2562.y = 120;
         this.var_2562.wordWrap = true;
         this.var_2562.height = 80;
         this.var_2562.width = 370;
         this.window.addChild(this.var_2562);
         addChild(this.window);
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_2538);
         this.var_1276.addEventListener(MouseEvent.CLICK,this.method_2537);
      }
      
      private function method_1694(param1:FocusEvent) : void
      {
         var _loc2_:TankInput = param1.currentTarget as TankInput;
         _loc2_.validValue = true;
      }
      
      private function method_1710(param1:FocusEvent) : void
      {
         var _loc2_:int = 0;
         if(this.name_1854 != null)
         {
            _loc2_ = this.name_1854.value.length;
            this.name_1854.validValue = _loc2_ == 18;
         }
      }
      
      public function name_1857() : void
      {
         this.var_1276.enabled = false;
         this.name_983.enabled = false;
      }
      
      public function name_1856() : void
      {
         this.var_1276.enabled = true;
         this.name_983.enabled = true;
      }
      
      private function method_2538(param1:Event) : void
      {
         dispatchEvent(new Event(Event.CANCEL));
      }
      
      private function method_2537(param1:Event) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
