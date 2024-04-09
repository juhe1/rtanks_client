package alternativa.tanks.loader
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.utils.name_504;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_1.TanksServicesActivator;
   import package_12.name_24;
   import package_148.DishonestProgressBar;
   import package_54.name_102;
   
   public class LoaderWindow extends Sprite implements name_13
   {
      
      private static const const_22:Class = name_503;
      
      private static const const_21:Class = name_502;
      
      private static const const_23:int = 9000;
       
      
      private var _stage:Stage;
      
      private var var_83:DisplayObjectContainer;
      
      private var var_86:Bitmap;
      
      private var var_87:name_501;
      
      private var var_82:Timer;
      
      private var var_85:Array;
      
      private var var_84:DishonestProgressBar;
      
      private var var_81:Shape;
      
      public function LoaderWindow()
      {
         this.var_85 = [];
         super();
         var _loc1_:name_24 = name_24(TanksServicesActivator.osgi.getService(name_24));
         this.var_83 = _loc1_.systemUILayer;
         this._stage = _loc1_.stage;
         this.method_115();
         var _loc2_:BitmapData = method_114(TanksServicesActivator.osgi.getService(name_102) as name_102);
         this.var_86 = name_504.name_505(_loc2_,new const_21().bitmapData);
         addChild(this.var_86);
         this.var_87 = new name_501();
         addChild(this.var_87);
         this.var_84 = new DishonestProgressBar(this.method_116);
         addChild(this.var_84);
         this.var_84.x = 10;
         this.var_84.y = 239;
         this.var_82 = new Timer(9000,1);
         this.var_82.addEventListener(TimerEvent.TIMER_COMPLETE,this.method_113);
      }
      
      private static function method_114(param1:name_102) : BitmapData
      {
         return new const_22().bitmapData;
      }
      
      private function method_115() : void
      {
         this.var_81 = new Shape();
         this.var_81.graphics.beginFill(0,0);
         this.var_81.graphics.drawRect(0,0,1,1);
         this.var_81.graphics.endFill();
         addChild(this.var_81);
      }
      
      private function method_116() : void
      {
         if(this.var_83.contains(this))
         {
            this.var_83.removeChild(this);
         }
      }
      
      private function method_113(param1:TimerEvent = null) : void
      {
         if(this.var_85[0] is DisplayObject)
         {
            this.var_87.name_506(this.var_85.shift());
         }
         var _loc2_:name_499 = OSGi.getInstance().getService(name_499) as name_499;
         if(_loc2_ != null)
         {
            _loc2_.name_510(name_102(OSGi.getInstance().getService(name_102)).language);
         }
         this.var_82.stop();
         this.var_82.reset();
         this.var_82.start();
      }
      
      public function method_111(param1:DisplayObject) : void
      {
         this.var_85.push(param1);
      }
      
      public function show() : void
      {
         if(!this.var_83.contains(this))
         {
            this.var_84.start();
            this.var_83.addChild(this);
            this._stage.addEventListener(Event.RESIZE,this.align);
            this.align();
            this.var_82.start();
            this.method_113();
         }
      }
      
      private function align(param1:Event = null) : void
      {
         this.x = this._stage.stageWidth - this.var_86.width >>> 1;
         this.y = this._stage.stageHeight - this.var_86.height >>> 1;
         this.var_81.width = this._stage.stageWidth;
         this.var_81.height = this._stage.stageHeight;
         this.var_81.x = -x;
         this.var_81.y = -y;
      }
      
      public function hide() : void
      {
         if(this.var_83.contains(this))
         {
            this.var_82.stop();
            this.var_84.name_509();
            this._stage.removeEventListener(Event.RESIZE,this.align);
         }
         dispatchEvent(new name_500(name_500.name_507));
      }
      
      public function hideForcibly() : void
      {
         if(this.var_83.contains(this))
         {
            this.var_82.stop();
            this.var_84.name_508();
            this._stage.removeEventListener(Event.RESIZE,this.align);
            this.var_83.removeChild(this);
         }
      }
      
      public function method_112() : Boolean
      {
         return this.var_82.running;
      }
   }
}
