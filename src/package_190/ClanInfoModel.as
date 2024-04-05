package package_190
{
   import flash.events.Event;
   import package_12.name_24;
   import package_13.Long;
   import package_236.ClanInfoModelBase;
   import package_236.name_2001;
   import package_236.name_611;
   import package_26.name_62;
   import package_26.name_866;
   import package_26.name_867;
   import package_275.name_865;
   import package_30.name_63;
   import package_393.name_2002;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   
   public class ClanInfoModel extends ClanInfoModelBase implements name_611, name_571, name_170, name_287
   {
      
      public static var clanService:name_62;
      
      public static var display:name_24;
      
      public static var createClanService:name_63;
       
      
      private var description:String;
      
      public function ClanInfoModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clanService.addEventListener(name_866.UPDATE,method_39(this.method_1526));
         var _loc1_:name_2001 = method_771();
         var _loc2_:Date = new Date(_loc1_.createTime);
         clanService.clanMembers = _loc1_.users.concat();
         clanService.name = _loc1_.name;
         clanService.tag = _loc1_.tag;
         clanService.minRankForRequest = _loc1_.minRankForAddClan;
         clanService.creatorId = _loc1_.creatorId;
         clanService.creationDate = name_2002.name_2009(_loc2_);
         clanService.isSelf = _loc1_.self;
         putData(Boolean,_loc1_.blocked);
         putData(String,_loc1_.reasonForBlocking);
         clanService.isBlocked = _loc1_.blocked;
         clanService.requestsEnabled = _loc1_.incomingRequestEnabled;
         clanService.maxCharactersDescription = _loc1_.maxCharactersDescription;
         this.description = _loc1_.description;
         clanService.addEventListener(name_867.CLAN_BLOCK,method_39(this.method_1525));
         ClanInfoDelayed.getInstance().dispatchEvent(new Event(ClanInfoDelayed.name_2003 + object.id.toString()));
      }
      
      private function method_1525(param1:name_867) : void
      {
         putData(Boolean,true);
         putData(String,param1.name_2004);
      }
      
      public function method_1449() : String
      {
         var _loc1_:Object = getData(Boolean);
         if(Boolean(_loc1_))
         {
            return String(getData(String));
         }
         if(this.description != null)
         {
            return this.description;
         }
         return "";
      }
      
      public function method_1450() : Long
      {
         return method_771().creatorId;
      }
      
      public function method_1451() : Long
      {
         return method_771().createTime;
      }
      
      public function name_1896() : int
      {
         return method_771().users.length;
      }
      
      private function method_1526(param1:name_866) : void
      {
         this.description = param1.description;
         server.name_2005(param1.description);
         server.name_2008(param1.flag.id);
         server.name_2007(param1.rankIndex);
         server.name_2006(param1.name_2010);
      }
      
      public function objectUnloaded() : void
      {
         clanService.method_352();
         clanService.isSelf = false;
         clanService.removeEventListener(name_866.UPDATE,method_39(this.method_1526));
         clanService.removeEventListener(name_867.CLAN_BLOCK,method_39(this.method_1525));
      }
      
      public function getClanName() : String
      {
         return method_771().name;
      }
      
      public function name_1897() : String
      {
         return method_771().tag;
      }
      
      public function name_1893() : name_865
      {
         var _loc1_:name_865 = null;
         var _loc2_:int = 0;
         while(_loc2_ < createClanService.flags.length)
         {
            _loc1_ = createClanService.flags[_loc2_];
            if(method_771().flagId == _loc1_.id)
            {
               return _loc1_;
            }
            _loc2_++;
         }
         return createClanService.defaultFlag;
      }
      
      public function incomingRequestEnabled() : Boolean
      {
         return method_771().incomingRequestEnabled;
      }
      
      public function method_1452() : int
      {
         return method_771().minRankForAddClan;
      }
   }
}
