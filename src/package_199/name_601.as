package package_199
{
   import alternativa.tanks.models.user.name_580;
   import package_13.Long;
   import package_235.ClanFriendsModelBase;
   import package_235.name_635;
   import package_27.ClanMembersListEvent;
   import package_27.name_59;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   
   public class name_601 extends ClanFriendsModelBase implements name_635, name_170, name_287
   {
      
      public static var clanFriendsService:name_59;
       
      
      public function name_601()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         if(!this.method_1427())
         {
            return;
         }
         clanFriendsService.clanMembers = method_771().users.concat();
      }
      
      public function method_1574(param1:Long) : void
      {
         if(!this.method_1427())
         {
            return;
         }
         clanFriendsService.clanMembers.push(param1);
         clanFriendsService.dispatchEvent(new ClanMembersListEvent(ClanMembersListEvent.ACCEPTED_USER,param1));
      }
      
      public function method_1573(param1:Long) : void
      {
         if(!this.method_1427())
         {
            return;
         }
         var _loc2_:int = int(clanFriendsService.clanMembers.indexOf(param1));
         if(_loc2_ >= 0)
         {
            clanFriendsService.clanMembers.splice(_loc2_,1);
            clanFriendsService.dispatchEvent(new ClanMembersListEvent(ClanMembersListEvent.REMOVE_USER,param1));
         }
      }
      
      public function method_1572(param1:Vector.<Long>) : void
      {
         if(!this.method_1427())
         {
            return;
         }
         clanFriendsService.clanMembers = param1.concat();
      }
      
      public function objectUnloaded() : void
      {
         if(!this.method_1427())
         {
            return;
         }
         clanFriendsService.clanMembers = null;
      }
      
      private function method_1427() : Boolean
      {
         return name_580(object.name_176(name_580)).loadingInServiceSpace();
      }
   }
}
