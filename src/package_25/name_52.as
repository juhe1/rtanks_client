package package_25
{
   import flash.events.IEventDispatcher;
   import package_228.ClanAction;
   
   public interface name_52 extends IEventDispatcher
   {
       
      
      function updateUserClanInfo(param1:name_353) : void;
      
      function method_373(param1:String) : name_353;
      
      function get updateFriendsClanButtonFunction() : Function;
      
      function set updateFriendsClanButtonFunction(param1:Function) : void;
      
      function method_375(param1:ClanAction) : Boolean;
      
      function get actions() : Vector.<ClanAction>;
      
      function set actions(param1:Vector.<ClanAction>) : void;
      
      function get restrictionTime() : int;
      
      function set restrictionTime(param1:int) : void;
      
      function method_376(param1:String) : Boolean;
      
      function get selfClan() : Boolean;
      
      function set selfClan(param1:Boolean) : void;
      
      function get clanMember() : Boolean;
      
      function set clanMember(param1:Boolean) : void;
      
      function get giveBonusesClan() : Boolean;
      
      function set giveBonusesClan(param1:Boolean) : void;
      
      function method_374() : void;
      
      function method_345() : void;
   }
}
