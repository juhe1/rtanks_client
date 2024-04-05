package package_3
{
   import flash.display.Stage;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.setTimeout;
   
   public class GPUCapabilities extends EventDispatcher
   {
      
      private static var var_68:Boolean;
      
      private static var var_69:Boolean;
       
      
      private var stage:Stage;
      
      public function GPUCapabilities(param1:Stage)
      {
         super();
         this.stage = param1;
      }
      
      public static function get method_95() : Boolean
      {
         return var_68;
      }
      
      public static function get constrained() : Boolean
      {
         return var_69;
      }
      
      public function name_20() : void
      {
         if(this.stage3DExists())
         {
            this.getContext3D();
         }
         else
         {
            this.method_94();
         }
      }
      
      private function stage3DExists() : Boolean
      {
         return this.stage.hasOwnProperty("stage3Ds");
      }
      
      private function getContext3D() : void
      {
         var _loc1_:Object = this.method_89();
         _loc1_.addEventListener("context3DCreate",this.onContext3DCreate);
         _loc1_.addEventListener(ErrorEvent.ERROR,this.onContext3DCreateError);
         _loc1_.requestContext3D("auto");
      }
      
      private function onContext3DCreate(param1:Event) : void
      {
         this.method_91();
         this.method_92();
         if(!var_68 && this.method_93())
         {
            this.getContext3DConstrained();
         }
         else
         {
            this.method_90();
         }
      }
      
      private function method_93() : Boolean
      {
         var _loc1_:Object = this.method_89();
         return _loc1_.requestContext3D.length > 1;
      }
      
      private function getContext3DConstrained() : void
      {
         var_69 = true;
         var _loc1_:Object = this.method_89();
         _loc1_.addEventListener("context3DCreate",this.onContext3DCreateConstrained);
         _loc1_.addEventListener(ErrorEvent.ERROR,this.onContext3DCreateError);
         _loc1_.requestContext3D("auto","baselineConstrained");
      }
      
      private function onContext3DCreateConstrained(param1:Event) : void
      {
         this.method_91();
         this.method_92();
         this.method_90();
      }
      
      private function method_92() : void
      {
         var _loc1_:Object = this.method_89();
         var _loc2_:Object = _loc1_.context3D;
         var _loc3_:String = String(_loc2_.driverInfo);
         var_68 = _loc3_.toLowerCase().indexOf("software") == -1;
         _loc2_.dispose();
      }
      
      private function onContext3DCreateError(param1:ErrorEvent) : void
      {
         this.method_91();
         this.method_90();
      }
      
      private function method_89() : Object
      {
         return this.stage["stage3Ds"][0];
      }
      
      private function method_91() : void
      {
         var _loc1_:Object = this.method_89();
         _loc1_.removeEventListener("context3DCreate",this.onContext3DCreate);
         _loc1_.removeEventListener("context3DCreate",this.onContext3DCreateConstrained);
         _loc1_.removeEventListener(ErrorEvent.ERROR,this.onContext3DCreateError);
      }
      
      private function method_94() : void
      {
         setTimeout(this.method_90,0);
      }
      
      private function method_90() : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
