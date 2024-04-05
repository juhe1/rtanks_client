package package_177
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import package_1.Main;
   import package_12.name_24;
   import package_176.name_549;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_379.class_123;
   
   public class DialogsService implements name_550
   {
      
      public static var display:name_24 = Main.osgi.name_6(name_24) as name_24;
       
      
      private var var_1130:Vector.<DisplayObject>;
      
      private var var_1131:Vector.<DisplayObject>;
      
      private var dialogsLayer:DisplayObjectContainer;
      
      public function DialogsService()
      {
         this.var_1130 = new Vector.<DisplayObject>();
         this.var_1131 = new Vector.<DisplayObject>();
         super();
         this.dialogsLayer = display.dialogsLayer;
      }
      
      public function name_1001(param1:DisplayObject) : void
      {
         if(this.var_1130.indexOf(param1) > -1)
         {
            return;
         }
         this.var_1130.unshift(param1);
         if(this.var_1130.length > 1)
         {
            this.method_1372(this.var_1130[1],false);
         }
         this.method_1371(param1,this.var_1130.length == 1);
         if(this.var_1130.length == 1)
         {
            display.stage.addEventListener(Event.RESIZE,this.onResize);
         }
      }
      
      public function name_1585(param1:DisplayObject) : void
      {
         if(this.var_1130.length == 0)
         {
            this.name_1001(param1);
         }
         else
         {
            this.var_1131.unshift(param1);
         }
      }
      
      public function name_1013(param1:DisplayObject) : void
      {
         var _loc2_:int = this.var_1130.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         this.var_1130.splice(this.var_1130.indexOf(param1),1);
         if(this.var_1130.length == 0 && this.var_1131.length > 0)
         {
            this.var_1130.push(this.var_1131.pop());
         }
         this.method_1372(param1,this.var_1130.length == 0);
         if(this.var_1130.length > 0)
         {
            this.method_1371(this.var_1130[0],false);
         }
         else
         {
            display.stage.removeEventListener(Event.RESIZE,this.onResize);
         }
      }
      
      private function method_1371(param1:DisplayObject, param2:Boolean) : void
      {
         if(param2)
         {
            (Main.osgi.name_6(name_115) as PanelModel).blur();
            (Main.osgi.name_6(name_115) as PanelModel).lock();
            (Main.osgi.name_6(name_115) as PanelModel).lockControls();
         }
         this.center(param1);
         name_549(Main.osgi.name_6(name_549)).open();
         this.dialogsLayer.addChild(param1);
         if(param1 is class_123)
         {
            class_123(param1).setEventListeners();
         }
      }
      
      private function method_1372(param1:DisplayObject, param2:Boolean) : void
      {
         if(this.dialogsLayer.contains(param1))
         {
            if(param1 is class_123)
            {
               class_123(param1).removeEventListeners();
            }
            name_549(Main.osgi.name_6(name_549)).close();
            this.dialogsLayer.removeChild(param1);
         }
         if(param2)
         {
            (Main.osgi.name_6(name_115) as PanelModel).unblur();
            (Main.osgi.name_6(name_115) as PanelModel).unlock();
            (Main.osgi.name_6(name_115) as PanelModel).method_523();
         }
      }
      
      private function onResize(param1:Event) : void
      {
         if(this.var_1130.length > 0)
         {
            this.center(this.var_1130[0]);
         }
      }
      
      public function method_1370(param1:DisplayObject) : void
      {
         this.center(param1);
      }
      
      private function center(param1:DisplayObject) : void
      {
         param1.x = int((display.stage.stageWidth - param1.width) * 0.5);
         param1.y = int((display.stage.stageHeight - param1.height) * 0.5);
      }
   }
}
