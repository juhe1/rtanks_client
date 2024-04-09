package package_175
{
   import controls.TankWindowInner;
   import controls.name_1922;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import package_1.Main;
   import package_12.name_24;
   import package_324.Signal;
   import package_396.name_2093;
   import utils.tweener.TweenLite;
   
   public class class_151 extends Sprite implements name_1832
   {
      
      public static var display:DisplayObjectContainer;
      
      protected static const const_1533:int = 11;
      
      private static const const_1475:int = 247;
      
      private static const const_1476:int = 200;
      
      private static const const_1573:int = 100;
      
      private static const const_1574:int = 34;
      
      private static const const_1575:int = 10;
      
      private static const const_1571:Number = 0.3;
      
      private static const const_1572:Number = 0.3;
       
      
      protected var var_1445:name_1922;
      
      protected var var_1264:TankWindowInner;
      
      protected var _width:int;
      
      protected var _height:int;
      
      protected var var_1450:int;
      
      private var var_1447:Signal;
      
      private var var_1395:Boolean;
      
      private var var_1446:uint;
      
      private var var_913:String;
      
      private var var_1449:String;
      
      private var var_1448:Boolean;
      
      public function class_151(param1:String = null, param2:String = "", param3:Boolean = true)
      {
         display = (Main.osgi.getService(name_24) as name_24).noticesLayer as DisplayObjectContainer;
         super();
         this.var_913 = param1;
         this.var_1449 = param2;
         this.var_1448 = param3;
         this.init();
      }
      
      protected function init() : void
      {
         this._width = 247;
         this._height = 200;
         this.var_1450 = this._height - 11 * 2;
         this.method_1660();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.method_1568();
      }
      
      protected function method_1568() : void
      {
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         this.var_1445.addEventListener(MouseEvent.CLICK,this.method_1375);
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event) : void
      {
         this.resize();
      }
      
      private function onRollOver(param1:MouseEvent) : void
      {
         clearTimeout(this.var_1446);
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.method_1656();
      }
      
      private function method_1375(param1:MouseEvent) : void
      {
         this.method_1655();
      }
      
      protected function method_1655() : void
      {
         this.hide();
      }
      
      protected function method_1476() : void
      {
         removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         this.var_1445.removeEventListener(MouseEvent.CLICK,this.method_1375);
      }
      
      private function method_1660() : void
      {
         this.var_1445 = new name_1922();
         addChild(this.var_1445);
         this.var_1264 = new TankWindowInner(247,200,TankWindowInner.GREEN);
         addChild(this.var_1264);
         this.var_1264.mouseChildren = false;
         this.var_1264.mouseEnabled = false;
         this.var_1264.y = 11;
         this.var_1264.x = 11;
         this.var_1264.showBlink = true;
      }
      
      public function show(param1:Signal) : void
      {
         this.var_1447 = param1;
         this.resize();
         this.var_1395 = true;
         display.addChild(this);
         var _loc2_:int = display.stage.stageWidth - this._width;
         TweenLite.name_2095(this,0.3,{
            "x":display.stage.stageWidth - this._width,
            "ease":name_2093.name_2094,
            "onComplete":this.method_1657
         });
      }
      
      private function method_1657() : void
      {
         this.enable = true;
         this.method_1568();
         this.method_1656();
      }
      
      private function method_1656() : void
      {
         if(this.var_1448)
         {
            clearTimeout(this.var_1446);
            this.var_1446 = setTimeout(this.method_1655,10 * 1000);
         }
      }
      
      public function hide() : void
      {
         this.var_1395 = false;
         this.enable = false;
         this.method_1476();
         clearTimeout(this.var_1446);
         TweenLite.name_2095(this,0.3,{
            "x":display.stage.stageWidth + 100,
            "ease":name_2093.name_2094,
            "onComplete":this.method_1658
         });
      }
      
      private function method_1658() : void
      {
         display.removeChild(this);
         this.var_1447.name_1473();
         this.var_1447 = null;
      }
      
      protected function resize() : void
      {
         this.method_1659();
         if(this.var_1395)
         {
            this.x = display.stage.stageWidth - this._width;
         }
         else
         {
            this.x = display.stage.stageWidth + 100;
         }
         this.y = 34;
      }
      
      private function method_1659() : void
      {
         this.var_1445.width = this._width;
         this.var_1445.height = this._height;
         this.var_1264.width = this.var_1445.width - 11 * 2;
         this.var_1264.height = this.var_1450;
      }
      
      public function set enable(param1:Boolean) : void
      {
         mouseChildren = param1;
         mouseEnabled = param1;
      }
      
      public function get userId() : String
      {
         return this.var_913;
      }
      
      public function get message() : String
      {
         return this.var_1449;
      }
      
      public function set method_1661(param1:Boolean) : void
      {
         this.var_1448 = param1;
      }
   }
}
