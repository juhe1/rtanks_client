package package_90
{
   import alternativa.tanks.model.friends.FriendsService;
   import flash.events.EventDispatcher;
   import package_263.ContextMenu;
   import package_54.name_102;
   
   public class name_536 extends EventDispatcher implements name_308
   {
      
      public static var localeService:name_102;
       
      
      private var var_1111:ContextMenu;
      
      private var var_1113:String;
      
      private var var_1112:String;
      
      public function name_536()
      {
         super();
         this.var_1111 = new ContextMenu();
         this.var_1111.name_1831(this);
      }
      
      public function show(param1:int, param2:int, param3:String, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:Boolean, param12:Boolean, param13:Boolean = false, param14:Boolean = true) : void
      {
         this.var_1111.show(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
      }
      
      public function method_850(param1:String, param2:String) : void
      {
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.WRITE_IN_CHAT,param1,param2));
      }
      
      public function method_853(param1:String, param2:String) : void
      {
         this.var_1113 = param1;
         this.var_1112 = param2;
      }
      
      private function method_1304() : void
      {
      }
      
      public function method_371(param1:String, param2:String) : void
      {
         FriendsService.method_371(param1);
      }
      
      public function method_346(param1:String, param2:String) : void
      {
         FriendsService.method_346(param1);
      }
      
      public function method_851(param1:String, param2:String) : void
      {
         FriendsService.method_851(param1);
      }
      
      public function method_849(param1:String) : void
      {
         FriendsService.method_1180(param1);
      }
      
      public function method_852(param1:String, param2:String) : void
      {
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.FOCUS_ON_USER,param1,param2));
      }
      
      public function method_854(param1:String, param2:String) : void
      {
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.VOTE_USER,param1,param2));
      }
   }
}
