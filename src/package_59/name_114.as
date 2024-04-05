package package_59
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.gui.ReloaderIndicator;
   import alternativa.tanks.models.battlefield.logic.class_23;
   import alternativa.tanks.models.battlefield.name_83;
   import flash.events.Event;
   import flash.utils.getTimer;
   import package_12.name_24;
   import package_46.name_140;
   import package_46.name_290;
   import package_46.name_704;
   import package_46.name_96;
   import package_64.name_154;
   import package_66.name_168;
   import package_66.name_974;
   import package_66.name_975;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.name_70;
   
   public class name_114 implements AutoClosable, name_290, class_23
   {
      
      public static var battleEventDispatcher:name_96 = OSGi.getInstance().name_6(name_96) as name_96;
      
      public static var display:name_24 = OSGi.getInstance().name_6(name_24) as name_24;
      
      public static var battleService:name_83 = OSGi.getInstance().name_6(name_83) as name_83;
      
      private static const const_73:int = 900;
       
      
      private var var_363:name_70;
      
      private var var_364:int;
      
      private var var_362:ReloaderIndicator;
      
      public function name_114(param1:name_70)
      {
         super();
         this.var_363 = param1;
         this.init();
      }
      
      private function init() : void
      {
         this.var_362 = new ReloaderIndicator();
         display.stage.addEventListener(Event.ACTIVATE,this.method_506);
         display.stage.addEventListener(Event.DEACTIVATE,this.method_505);
         battleEventDispatcher.name_973(name_168,this);
         battleEventDispatcher.name_973(name_704,this);
         battleEventDispatcher.name_973(name_140,this);
         battleEventDispatcher.name_973(name_154,this);
      }
      
      private function method_506(param1:Event) : void
      {
         this.var_362.visible = true;
      }
      
      private function method_505(param1:Event) : void
      {
         this.var_362.visible = false;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is name_168)
         {
            this.name_157(name_168(param1).suicideDelayMS + 900);
         }
         else if(param1 is name_704)
         {
            this.name_254();
         }
         else if(param1 is name_140)
         {
            this.method_508(name_140(param1));
         }
         else if(param1 is name_154)
         {
            this.method_507(name_154(param1));
         }
      }
      
      private function name_157(param1:int) : void
      {
         this.var_364 = getTimer() + param1;
         this.var_362.show(param1 / 1000);
         battleService.name_165().name_212(this);
         battleEventDispatcher.dispatchEvent(new name_974());
      }
      
      private function name_254() : void
      {
         battleService.name_165().name_977(this);
         this.var_362.hide();
         battleEventDispatcher.dispatchEvent(new name_975());
      }
      
      public function method_504(param1:int, param2:int) : void
      {
         this.var_362.name_978 = Math.max((this.var_364 - param1) / 1000,0);
      }
      
      private function method_508(param1:name_140) : void
      {
         if(this.var_363 == param1.tank.method_484())
         {
            this.name_254();
         }
      }
      
      private function method_507(param1:name_154) : void
      {
         if(this.var_363 == param1.name_976)
         {
            this.name_254();
         }
      }
      
      public function close() : void
      {
         display.stage.removeEventListener(Event.ACTIVATE,this.method_506);
         display.stage.removeEventListener(Event.DEACTIVATE,this.method_505);
         battleEventDispatcher.name_972(name_168,this);
         battleEventDispatcher.name_972(name_704,this);
         battleEventDispatcher.name_972(name_140,this);
         battleEventDispatcher.name_972(name_154,this);
         this.var_362.destroy();
         this.var_362 = null;
         this.var_363 = null;
      }
   }
}
