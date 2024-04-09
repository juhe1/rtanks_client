package package_188
{
   import alternativa.osgi.OSGi;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import package_1.TanksServicesActivator;
   import package_12.name_24;
   
   public class BackgroundService implements name_560
   {
      
      private static const const_1592:Class = name_2132;
      
      private static const const_1593:BitmapData = new const_1592().bitmapData;
       
      
      private var osgi:OSGi;
      
      private var stage:Stage;
      
      private var var_1524:DisplayObjectContainer;
      
      private var bg:Shape;
      
      private var var_1523:Rectangle;
      
      public function BackgroundService()
      {
         super();
         this.osgi = TanksServicesActivator.osgi;
         var _loc1_:name_24 = this.osgi.getService(name_24) as name_24;
         this.stage = _loc1_.stage;
         this.var_1524 = _loc1_.backgroundLayer;
         this.bg = new Shape();
      }
      
      public function showBg() : void
      {
         if(!this.var_1524.contains(this.bg))
         {
            this.method_1733();
            this.var_1524.addChild(this.bg);
            this.stage.addEventListener(Event.RESIZE,this.method_1733);
         }
      }
      
      public function method_1405() : void
      {
         if(this.var_1524.contains(this.bg))
         {
            this.stage.removeEventListener(Event.RESIZE,this.method_1733);
            this.var_1524.removeChild(this.bg);
         }
      }
      
      public function drawBg(param1:Rectangle = null) : void
      {
         this.var_1523 = param1;
         this.method_1733();
      }
      
      private function method_1733(param1:Event = null) : void
      {
         this.bg.graphics.clear();
         this.bg.graphics.beginBitmapFill(const_1593);
         this.bg.graphics.drawRect(0,0,this.stage.stageWidth,this.stage.stageHeight);
         if(this.var_1523 != null)
         {
            this.bg.graphics.drawRect(this.var_1523.x,this.var_1523.y,this.var_1523.width,this.var_1523.height);
         }
      }
   }
}
