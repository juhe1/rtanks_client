package package_193
{
   import alternativa.tanks.models.user.name_580;
   import alternativa.tanks.models.user.name_65;
   import package_13.Long;
   import package_209.ClansListEvent;
   import package_230.ClanUserOutgoingModelBase;
   import package_230.name_627;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   
   public class name_596 extends ClanUserOutgoingModelBase implements name_627, name_170, name_287, name_583
   {
      
      public static var clanUserService:name_65;
       
      
      private var clans:Vector.<Long>;
      
      public function name_596()
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
         ClansListEvent.name_1886().dispatchEvent(new ClansListEvent(ClansListEvent.OUTGOING + ClansListEvent.ADD,param1));
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
            ClansListEvent.name_1886().dispatchEvent(new ClansListEvent(ClansListEvent.OUTGOING + ClansListEvent.REMOVE,param1));
         }
      }
      
      public function getOutgoingClans() : Vector.<Long>
      {
         return this.clans;
      }
      
      private function method_1427() : Boolean
      {
         return name_580(object.name_176(name_580)).loadingInServiceSpace();
      }
   }
}
