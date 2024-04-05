package package_26
{
   import alternativa.tanks.gui.clanmanagement.name_563;
   import alternativa.tanks.gui.notinclan.name_568;
   import flash.events.EventDispatcher;
   import package_13.Long;
   import package_195.name_582;
   import package_275.name_865;
   import platform.client.fp10.core.network.connection.name_839;
   import platform.client.fp10.core.type.name_70;
   
   public class ClanServiceImpl extends EventDispatcher implements name_62
   {
       
      
      private var var_246:Vector.<Long>;
      
      private var var_23:String;
      
      private var var_251:String;
      
      private var var_249:String;
      
      private var var_250:Long;
      
      private var var_244:name_582;
      
      private var var_241:name_70;
      
      private var var_247:Boolean;
      
      private var var_243:Boolean;
      
      private var var_253:name_568;
      
      private var var_242:name_563;
      
      private var var_245:int;
      
      private var var_254:int;
      
      private var var_252:Boolean;
      
      private var var_248:int;
      
      public function ClanServiceImpl()
      {
         super();
      }
      
      public function method_354(param1:name_839) : void
      {
         this.clanMembers = new Vector.<Long>();
      }
      
      public function method_352() : void
      {
         this.clanMembers = new Vector.<Long>();
      }
      
      public function get clanMembers() : Vector.<Long>
      {
         return this.var_246;
      }
      
      public function set clanMembers(param1:Vector.<Long>) : void
      {
         this.var_246 = param1;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
      
      public function set name(param1:String) : void
      {
         this.var_23 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_251;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_251 = param1;
      }
      
      public function method_353(param1:String, param2:int, param3:name_865, param4:Boolean) : void
      {
         dispatchEvent(new name_866(name_866.UPDATE,param1,param2,param3,param4));
      }
      
      public function get clanObject() : name_70
      {
         return this.var_241;
      }
      
      public function set clanObject(param1:name_70) : void
      {
         this.var_241 = param1;
         this.var_242 = new name_563(this.var_241);
      }
      
      public function objectUnloaded() : void
      {
         this.var_241 = null;
         this.var_242.destroy();
      }
      
      public function maxMembers() : void
      {
         this.var_242.maxMembers();
      }
      
      public function get clanManagementPanel() : name_563
      {
         return this.var_242;
      }
      
      public function get creatorId() : Long
      {
         return this.var_250;
      }
      
      public function set creatorId(param1:Long) : void
      {
         this.var_250 = param1;
      }
      
      public function get creationDate() : String
      {
         return this.var_249;
      }
      
      public function set creationDate(param1:String) : void
      {
         this.var_249 = param1;
      }
      
      public function get isSelf() : Boolean
      {
         return this.var_247;
      }
      
      public function set isSelf(param1:Boolean) : void
      {
         this.var_247 = param1;
      }
      
      public function get membersCount() : int
      {
         return this.clanMembers.length;
      }
      
      public function get isBlocked() : Boolean
      {
         return this.var_243;
      }
      
      public function set isBlocked(param1:Boolean) : void
      {
         this.var_243 = param1;
      }
      
      public function method_351(param1:String) : void
      {
         this.var_243 = true;
         dispatchEvent(new name_867(name_867.CLAN_BLOCK,param1));
      }
      
      public function set minRankForCreateClan(param1:int) : void
      {
         this.var_245 = param1;
      }
      
      public function get minRankForCreateClan() : int
      {
         return this.var_245;
      }
      
      public function get notInClanPanel() : name_568
      {
         return this.var_253;
      }
      
      public function set notInClanPanel(param1:name_568) : void
      {
         this.var_253 = param1;
      }
      
      public function get clanPanelModel() : name_582
      {
         return this.var_244;
      }
      
      public function set clanPanelModel(param1:name_582) : void
      {
         this.var_244 = param1;
      }
      
      public function get minRankForRequest() : int
      {
         return this.var_254;
      }
      
      public function set minRankForRequest(param1:int) : void
      {
         this.var_254 = param1;
      }
      
      public function get requestsEnabled() : Boolean
      {
         return this.var_252;
      }
      
      public function set requestsEnabled(param1:Boolean) : void
      {
         this.var_252 = param1;
      }
      
      public function get maxCharactersDescription() : int
      {
         return this.var_248;
      }
      
      public function set maxCharactersDescription(param1:int) : void
      {
         this.var_248 = param1;
      }
   }
}
