package package_218
{
   import alternativa.osgi.OSGi;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import package_12.name_24;
   import package_254.name_791;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   
   public class BlurService extends EventDispatcher implements name_637
   {
      
      public static var helperService:name_791;
      
      private static const const_1601:uint = 0;
      
      private static const const_1602:Number = 0.5;
       
      
      private var var_1589:Boolean;
      
      private var var_1586:Boolean;
      
      private var var_1587:Boolean;
      
      private var var_1588:Boolean;
      
      private var name_688:Sprite;
      
      private var var_1584:name_24;
      
      private var var_1585:Dictionary;
      
      private var var_1590:uint = 0;
      
      public function BlurService()
      {
         super();
         this.var_1584 = name_24(OSGi.getInstance().name_6(name_24));
         this.name_688 = new Sprite();
         this.name_688.mouseEnabled = true;
         this.var_1585 = new Dictionary();
      }
      
      private static function method_1778() : void
      {
      }
      
      private static function method_1779() : void
      {
      }
      
      public function method_1594(param1:DisplayObject) : void
      {
         if(param1 in this.var_1585)
         {
            return;
         }
         var _loc2_:Sprite = this.method_1781(param1);
         this.var_1585[param1] = _loc2_;
         ++this.var_1590;
         if(this.var_1590 == 1)
         {
            this.var_1584.stage.addEventListener(Event.RESIZE,this.method_161);
         }
         this.var_1584.dialogsLayer.addChildAt(_loc2_,0);
      }
      
      private function method_1781(param1:DisplayObject) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         param1.addEventListener(Event.REMOVED_FROM_STAGE,this.method_886);
         this.method_1776(_loc2_,param1);
         return _loc2_;
      }
      
      public function method_1586() : void
      {
         if(!this.var_1586)
         {
            this.var_1586 = true;
            this.method_1774();
         }
         this.var_1584.systemLayer.addChildAt(this.name_688,0);
      }
      
      public function method_1593() : void
      {
         if(!this.var_1589)
         {
            this.var_1589 = true;
            this.method_1774();
         }
         this.var_1584.dialogsLayer.addChildAt(this.name_688,0);
      }
      
      public function name_1869() : void
      {
         if(!this.var_1587)
         {
            this.var_1587 = true;
            this.method_1774();
         }
         this.var_1584.noticesLayer.addChildAt(this.name_688,0);
      }
      
      public function method_1588() : void
      {
         if(!this.var_1588)
         {
            this.var_1588 = true;
            this.method_1774();
         }
         this.var_1584.stage.addChild(this.name_688);
      }
      
      public function method_1590() : void
      {
         if(this.var_1586)
         {
            this.var_1586 = false;
            if(this.var_1588)
            {
               return;
            }
            if(this.var_1587)
            {
               this.name_1869();
               return;
            }
            if(this.var_1589)
            {
               this.method_1593();
               return;
            }
            this.method_1773();
         }
      }
      
      public function method_1592() : void
      {
         if(this.var_1589)
         {
            this.var_1589 = false;
            if(this.var_1588)
            {
               return;
            }
            if(this.var_1587)
            {
               this.name_1869();
               return;
            }
            if(this.var_1586)
            {
               this.method_1586();
               return;
            }
            this.method_1773();
         }
      }
      
      public function name_1868() : void
      {
         if(this.var_1587)
         {
            this.var_1587 = false;
            if(this.var_1588)
            {
               return;
            }
            if(this.var_1589)
            {
               this.method_1593();
               return;
            }
            if(this.var_1586)
            {
               this.method_1586();
               return;
            }
            this.method_1773();
         }
      }
      
      public function method_1591() : void
      {
         if(this.var_1588)
         {
            this.var_1588 = false;
            if(this.var_1587)
            {
               this.name_1869();
               return;
            }
            if(this.var_1589)
            {
               this.method_1593();
               return;
            }
            if(this.var_1586)
            {
               this.method_1586();
               return;
            }
            this.method_1773();
         }
      }
      
      public function method_1589() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this.var_1585)
         {
            this.method_1587(DisplayObject(_loc1_));
         }
      }
      
      public function method_1587(param1:DisplayObject) : void
      {
         if(param1 in this.var_1585)
         {
            param1.removeEventListener(Event.REMOVED_FROM_STAGE,this.method_886);
            removeDisplayObject(this.var_1585[param1]);
            delete this.var_1585[param1];
            --this.var_1590;
            if(this.var_1590 == 0)
            {
               this.var_1584.stage.removeEventListener(Event.RESIZE,this.method_161);
            }
         }
      }
      
      private function method_1774() : void
      {
         if(this.name_688.parent == null)
         {
            this.var_1584.stage.addEventListener(Event.RESIZE,this.method_1775);
            this.name_688.addEventListener(MouseEvent.CLICK,this.method_1777);
            this.method_1775();
            method_1778();
         }
      }
      
      private function method_1775(param1:Event = null) : void
      {
         var _loc2_:int = int(this.var_1584.stage.stageWidth);
         var _loc3_:int = int(this.var_1584.stage.stageHeight);
         this.name_688.graphics.clear();
         this.name_688.graphics.beginFill(0,0.5);
         this.name_688.graphics.drawRect(0,0,_loc2_,_loc3_);
      }
      
      private function method_1777(param1:MouseEvent) : void
      {
         if(this.method_1780())
         {
            dispatchEvent(new BlurServiceEvent(BlurServiceEvent.CLICK_OVERLAY_BATTLE_CONTENT));
         }
      }
      
      private function method_1780() : Boolean
      {
         return this.var_1586 && !this.var_1589 && !this.var_1587 && !this.var_1588;
      }
      
      private function method_1773() : void
      {
         if(this.name_688.parent != null)
         {
            this.name_688.removeEventListener(MouseEvent.CLICK,this.method_1777);
            removeDisplayObject(this.name_688);
            this.var_1584.stage.removeEventListener(Event.RESIZE,this.method_1775);
            method_1779();
         }
      }
      
      private function method_161(param1:Event) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in this.var_1585)
         {
            this.method_1776(this.var_1585[_loc2_],DisplayObject(_loc2_));
         }
      }
      
      private function method_1776(param1:Sprite, param2:DisplayObject) : void
      {
         var _loc3_:Point = param2.localToGlobal(new Point(0,0));
         param1.graphics.clear();
         param1.graphics.beginFill(0,0);
         param1.graphics.drawRect(_loc3_.x,_loc3_.y,param2.width,param2.height);
         param1.graphics.endFill();
      }
      
      private function method_886(param1:Event) : void
      {
         var _loc2_:DisplayObject = DisplayObject(param1.target);
         this.method_1587(_loc2_);
      }
   }
}
