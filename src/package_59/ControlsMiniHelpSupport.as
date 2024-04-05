package package_59
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.name_83;
   import flash.events.Event;
   import flash.net.SharedObject;
   import package_12.name_24;
   import package_207.name_561;
   import package_46.name_1862;
   import package_46.name_290;
   import package_46.name_96;
   import package_76.FollowCameraController;
   import package_85.name_2067;
   import package_95.name_298;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class ControlsMiniHelpSupport implements AutoClosable, name_290
   {
      
      public static var storageService:name_298 = OSGi.getInstance().name_6(name_298) as name_298;
      
      public static var battleEventDispatcher:name_96 = OSGi.getInstance().name_6(name_96) as name_96;
      
      public static var userPropertiesService:name_561 = OSGi.getInstance().name_6(name_561) as name_561;
      
      public static var display:name_24 = OSGi.getInstance().name_6(name_24) as name_24;
      
      public static var var_1398:name_83 = OSGi.getInstance().name_6(name_83) as name_83;
      
      private static const const_1556:String = "disableControlsMiniHelp";
       
      
      private var controlsMiniHelp:name_2067;
      
      public function ControlsMiniHelpSupport()
      {
         super();
         var _loc1_:SharedObject = storageService.getStorage();
         if(!_loc1_.data["disableControlsMiniHelp"])
         {
            if(userPropertiesService.rank == 1)
            {
               _loc1_.data["disableControlsMiniHelp"] = 1;
               this.method_1621();
            }
         }
      }
      
      private function method_1621() : void
      {
         this.controlsMiniHelp = new name_2067();
         this.controlsMiniHelp.name_2068(FollowCameraController.name_964);
         var_1398.getBattlefieldData().viewport.addChild(this.controlsMiniHelp);
         this.name_731();
         battleEventDispatcher.name_973(name_1862,this);
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event) : void
      {
         this.name_731();
      }
      
      private function name_731() : void
      {
         this.controlsMiniHelp.x = display.stage.stageWidth - this.controlsMiniHelp.width >> 1;
         this.controlsMiniHelp.y = display.stage.stageHeight - this.controlsMiniHelp.height * 2;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is name_1862)
         {
            this.close();
         }
      }
      
      public function close() : void
      {
         if(this.controlsMiniHelp != null)
         {
            display.stage.removeEventListener(Event.RESIZE,this.onResize);
            battleEventDispatcher.name_972(name_1862,this);
            this.controlsMiniHelp.parent.removeChild(this.controlsMiniHelp);
            this.controlsMiniHelp = null;
         }
      }
   }
}
