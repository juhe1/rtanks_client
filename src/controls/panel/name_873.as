package controls.panel
{
   import controls.Label;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.Timer;
   
   [Embed(source="/_assets/assets.swf", symbol="controls.panel.name_873")]
   public class name_873 extends MovieClip
   {
       
      
      public var CR:MovieClip;
      
      public var C1:MovieClip;
      
      public var kdicon:MovieClip;
      
      public var L:MovieClip;
      
      public var N:MovieClip;
      
      public var _changeButton:MainPanelChangeButton;
      
      public var R:MovieClip;
      
      public var name_872:Label;
      
      public var name_879:Label;
      
      public var name_881:Label;
      
      public var name_874:Label;
      
      public var name_875:BaseButton;
      
      public var name_878:MovieClip;
      
      private var _width:int;
      
      private var var_1662:Sprite;
      
      private var var_1666:MovieClip;
      
      private var var_1660:MovieClip;
      
      private var b_conn1:MovieClip;
      
      private var var_1668:MovieClip;
      
      private var b_conn2:MovieClip;
      
      private var var_1667:MovieClip;
      
      private var b_conn3:MovieClip;
      
      private var var_1661:MovieClip;
      
      private var var_1664:MovieClip;
      
      private var timer:Timer;
      
      private var var_1659:Sprite = null;
      
      private var var_274:int;
      
      private var var_1665:int;
      
      private var var_1663:int;
      
      public function name_873()
      {
         this.name_872 = new Label();
         this.name_879 = new Label();
         this.name_881 = new Label();
         this.name_874 = new Label();
         this.var_1662 = new Sprite();
         this.timer = new Timer(50);
         super();
         this.var_1666 = getChildByName("L") as MovieClip;
         this.var_1660 = getChildByName("N") as MovieClip;
         this.b_conn1 = getChildByName("C1") as MovieClip;
         this.var_1661 = getChildByName("CR") as MovieClip;
         this.var_1664 = getChildByName("R") as MovieClip;
         this.name_878 = getChildByName("kdicon") as MovieClip;
         this.name_875 = getChildByName("_changeButton") as BaseButton;
         addChild(this.var_1662);
         addChild(this.name_872);
         addChild(this.name_879);
         addChild(this.name_881);
         addChild(this.name_874);
         this.var_1662.x = 5;
         this.var_1662.y = 5;
         this.name_872.x = 6;
         this.name_872.autoSize = TextFieldAutoSize.NONE;
         this.name_879.autoSize = TextFieldAutoSize.NONE;
         this.name_879.align = TextFormatAlign.RIGHT;
         this.name_879.width = 200;
         this.name_879.size = this.name_881.size = this.name_872.size = this.name_874.size = 12;
         this.name_879.color = this.name_881.color = this.name_872.color = this.name_874.color = 1244928;
         this.name_879.y = this.name_881.y = this.name_872.y = this.name_874.y = 4;
         this.name_879.height = this.name_874.height = this.name_872.height = 18;
         this.name_874.align = TextFormatAlign.RIGHT;
         this.name_874.autoSize = TextFieldAutoSize.NONE;
         this.name_874.width = 59;
         this.var_1659 = new Sprite();
         this.timer = new Timer(50);
         this.timer.addEventListener(TimerEvent.TIMER,this.method_1829);
         this.var_1662.addChild(this.var_1659);
         this.var_1659.alpha = 0;
      }
      
      public function get progress() : int
      {
         return this.var_274;
      }
      
      public function set progress(param1:int) : void
      {
         var _loc2_:Graphics = this.var_1662.graphics;
         var _loc3_:int = this.var_1660.width + 4;
         this.var_274 = param1;
         _loc2_.clear();
         _loc2_.beginFill(1244928,0.2);
         _loc2_.drawRect(0,0,_loc3_ / 10000 * this.var_274,16);
         _loc2_.endFill();
      }
      
      public function set name_880(param1:int) : void
      {
         this.var_1665 = param1;
         this.var_1663 = this.var_274;
         var _loc2_:Graphics = this.var_1659.graphics;
         var _loc3_:int = this.var_1660.width + 4;
         this.var_1659.alpha = 1;
         _loc2_.clear();
         if(this.var_1665 >= this.var_1663)
         {
            _loc2_.beginFill(16763904,1);
            _loc2_.drawRect(_loc3_ / 10000 * this.var_1663,0,_loc3_ / 10000 * (param1 - this.var_1663),16);
            _loc2_.endFill();
         }
         else
         {
            _loc2_.beginFill(16763904,1);
            _loc2_.drawRect(0,0,_loc3_,16);
            _loc2_.endFill();
         }
         this.timer.stop();
         this.timer.start();
      }
      
      private function method_1829(param1:TimerEvent) : void
      {
         var _loc2_:DisplayObject = this.var_1659;
         _loc2_.alpha -= 0.03;
         if(_loc2_.alpha <= 0)
         {
            this.timer.stop();
         }
      }
      
      override public function set width(param1:Number) : void
      {
         var _loc2_:int = 0;
         this._width = param1;
         _loc2_ = int(this._width - 180);
         this.var_1660.width = _loc2_;
         this.b_conn1.x = this.var_1660.width + this.var_1666.width;
         this.var_1661.width = 67;
         this.var_1661.x = this.b_conn1.x + this.b_conn1.width;
         this.var_1664.x = this.var_1661.x + this.var_1661.width;
         this.name_875.x = this.var_1664.x + 9;
         this.name_874.x = this.var_1661.x - 2;
         this.name_881.x = int(this.b_conn1.x - this.name_881.textWidth - 3);
         this.name_878.x = int(this.b_conn1.x - this.name_881.textWidth - 10);
         this.name_879.x = this.name_878.x - 205;
         this.name_872.width = this.var_1660.width - this.name_881.width - this.name_878.width - 5;
         this.progress = this.var_274;
      }
   }
}
