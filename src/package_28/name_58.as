package package_28
{
   import flash.events.EventDispatcher;
   import package_210.ForeignClanWindow;
   import package_225.name_861;
   
   public class name_58 extends EventDispatcher implements name_57
   {
       
      
      private var var_239:ForeignClanWindow;
      
      private var var_240:Boolean;
      
      public function name_58()
      {
         super();
      }
      
      public function method_341(param1:name_861) : void
      {
         this.var_240 = true;
         this.var_239 = new ForeignClanWindow(param1);
      }
      
      public function method_347() : void
      {
         dispatchEvent(new ForeignClanEvent(ForeignClanEvent.SEND_REQUEST));
      }
      
      public function method_346() : void
      {
         dispatchEvent(new ForeignClanEvent(ForeignClanEvent.ACCEPT_REQUEST));
      }
      
      public function method_340() : void
      {
         dispatchEvent(new ForeignClanEvent(ForeignClanEvent.name_862));
      }
      
      public function method_339() : void
      {
         this.var_239.name_864();
      }
      
      public function method_345(param1:String) : void
      {
         if(this.var_239 != null)
         {
            this.var_239.name_863(param1);
         }
      }
      
      public function method_350() : void
      {
         if(this.var_239 != null)
         {
            this.var_239.method_350();
         }
      }
      
      public function method_342() : void
      {
         if(this.var_239 != null)
         {
            this.var_239.method_342();
         }
      }
      
      public function method_349(param1:String) : void
      {
         if(this.var_239 != null)
         {
            this.var_239.method_349(param1);
         }
      }
      
      public function method_348() : void
      {
         this.var_239.destroy();
      }
      
      public function method_344() : void
      {
         this.var_239 = null;
         this.var_240 = false;
      }
      
      public function method_343() : Boolean
      {
         return this.var_240;
      }
   }
}
