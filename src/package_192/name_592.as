package package_192
{
   import alternativa.tanks.models.user.name_580;
   import alternativa.tanks.models.user.name_65;
   import package_13.Long;
   import package_209.ClansListEvent;
   import package_216.ClanUserIncomingModelBase;
   import package_216.name_644;
   import package_26.ClanUserNotificationsManager;
   import platform.client.fp10.core.model.name_170;
   
   public class name_592 extends ClanUserIncomingModelBase implements name_644, name_170, name_574
   {
      
      public static var clanUserService:name_65;
       
      
      private var clans:Vector.<Long>;
      
      public function name_592()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         if(!this.method_1427())
         {
            return;
         }
         this.clans = method_771().objects.concat();
      }
      
      public function objectUnloaded() : void
      {
         if(!this.method_1427())
         {
            return;
         }
         this.clans.length = 0;
      }
      
      public function method_1409(param1:Long) : void
      {
         if(!this.method_1427())
         {
            return;
         }
         this.clans.push(param1);
         ClanUserNotificationsManager.name_1944(param1);
         ClansListEvent.name_1886().dispatchEvent(new ClansListEvent(ClansListEvent.INCOMING + ClansListEvent.ADD,param1));
      }
      
      public function method_1408(param1:Long) : void
      {
         if(!this.method_1427())
         {
            return;
         }
         var _loc2_:int = this.clans.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.clans.splice(_loc2_,1);
            ClansListEvent.name_1886().dispatchEvent(new ClansListEvent(ClansListEvent.INCOMING + ClansListEvent.REMOVE,param1));
         }
      }
      
      public function getIncomingClans() : Vector.<Long>
      {
         return this.clans;
      }
      
      private function method_1427() : Boolean
      {
         return name_580(object.name_176(name_580)).loadingInServiceSpace();
      }
   }
}
