package package_26
{
   import alternativa.tanks.gui.clanmanagement.name_563;
   import alternativa.tanks.gui.notinclan.name_568;
   import flash.events.IEventDispatcher;
   import package_13.Long;
   import package_195.name_582;
   import package_275.name_865;
   import platform.client.fp10.core.type.name_70;
   
   public interface name_62 extends IEventDispatcher
   {
       
      
      function get clanMembers() : Vector.<Long>;
      
      function set clanMembers(param1:Vector.<Long>) : void;
      
      function get name() : String;
      
      function set name(param1:String) : void;
      
      function get tag() : String;
      
      function set tag(param1:String) : void;
      
      function get creatorId() : Long;
      
      function set creatorId(param1:Long) : void;
      
      function get creationDate() : String;
      
      function set creationDate(param1:String) : void;
      
      function get clanPanelModel() : name_582;
      
      function set clanPanelModel(param1:name_582) : void;
      
      function method_353(param1:String, param2:int, param3:name_865, param4:Boolean) : void;
      
      function get clanObject() : name_70;
      
      function set clanObject(param1:name_70) : void;
      
      function maxMembers() : void;
      
      function objectUnloaded() : void;
      
      function get clanManagementPanel() : name_563;
      
      function get membersCount() : int;
      
      function get notInClanPanel() : name_568;
      
      function set notInClanPanel(param1:name_568) : void;
      
      function get isSelf() : Boolean;
      
      function set isSelf(param1:Boolean) : void;
      
      function method_352() : void;
      
      function get isBlocked() : Boolean;
      
      function set isBlocked(param1:Boolean) : void;
      
      function set minRankForCreateClan(param1:int) : void;
      
      function get minRankForCreateClan() : int;
      
      function get minRankForRequest() : int;
      
      function set minRankForRequest(param1:int) : void;
      
      function get requestsEnabled() : Boolean;
      
      function set requestsEnabled(param1:Boolean) : void;
      
      function get maxCharactersDescription() : int;
      
      function set maxCharactersDescription(param1:int) : void;
      
      function method_351(param1:String) : void;
   }
}
