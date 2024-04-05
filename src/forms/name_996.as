package forms
{
   import controls.PlayerInfo;
   import controls.rangicons.name_2242;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_280.MainButtonBarEvents;
   
   public class name_996 extends Sprite
   {
       
      
      public var var_1765:name_2242;
      
      public var name_872:PlayerInfo;
      
      public var buttonBar:ButtonBar;
      
      private var var_277:int;
      
      private var var_1764:Boolean = false;
      
      public var const_126:name_2193;
      
      public function name_996(param1:Boolean = false)
      {
         this.var_1765 = new name_2242();
         this.name_872 = new PlayerInfo();
         this.buttonBar = new ButtonBar();
         this.const_126 = new BigRankIcon();
         super();
         this.var_1764 = param1;
         addEventListener(Event.ADDED_TO_STAGE,this.configUI);
      }
      
      public function set rang(param1:int) : void
      {
         this.var_277 = param1;
         this.name_872.rank = param1;
         this.const_126.init(false,param1);
         this.method_1943();
         this.buttonBar.draw();
      }
      
      public function get rang() : int
      {
         return this.var_277;
      }
      
      private function configUI(param1:Event) : void
      {
         this.y = 3;
         addChild(this.const_126);
         addChild(this.name_872);
         addChild(this.buttonBar);
         removeEventListener(Event.ADDED_TO_STAGE,this.configUI);
         this.name_872.var_270.name_875.addEventListener(MouseEvent.CLICK,this.method_1944);
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function method_1944(param1:MouseEvent) : void
      {
         this.buttonBar.dispatchEvent(new MainButtonBarEvents(1));
      }
      
      public function onResize(param1:Event) : void
      {
         var _loc2_:int = 0;
         _loc2_ = int(Math.max(1000,stage.stageWidth));
         this.name_872.x = 15;
         this.name_872.width = _loc2_ - this.buttonBar.width + 13 - this.name_872.x - 10;
         this.buttonBar.x = _loc2_ - this.buttonBar.width - 4;
         this.buttonBar.draw();
      }
      
      public function name_1041(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         _loc2_ = int(Math.max(1000,stage.stageWidth));
         this.name_872.x = 15;
         this.name_872.width = _loc2_ - this.buttonBar.width + 13 - this.name_872.x - 10;
         this.buttonBar.x = _loc2_ - this.buttonBar.width - 4;
         this.const_126.init(param1,this.name_872.rank);
         this.method_1943();
      }
      
      private function method_1943() : void
      {
         this.const_126.y = 29 - (this.const_126.height >> 1);
         this.const_126.x = 38 - (this.const_126.width >> 1);
      }
      
      public function hide() : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function get isTester() : Boolean
      {
         return this.var_1764;
      }
      
      public function set isTester(param1:Boolean) : void
      {
         this.var_1764 = param1;
         this.buttonBar.isTester = this.var_1764;
         this.buttonBar.draw();
         this.onResize(null);
      }
   }
}
