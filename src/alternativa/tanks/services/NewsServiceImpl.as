package alternativa.tanks.services
{
   import flash.events.EventDispatcher;
   import package_13.Long;
   import package_130.name_348;
   import package_95.IStorageService;
   
   public class NewsServiceImpl extends EventDispatcher implements name_363
   {
      
      public static var storageService:IStorageService;
      
      private static const const_1992:String = "NEWS_SERVICE_READ_NEWS";
       
      
      private var var_2407:Vector.<name_348>;
      
      private var var_2408:Function;
      
      private var var_2409:Function;
      
      public function NewsServiceImpl()
      {
         super();
      }
      
      public function setInitialNewsItems(param1:Vector.<name_348>) : void
      {
         this.var_2407 = param1.concat();
         if(this.var_2408 != null)
         {
            this.var_2408(param1);
         }
         if(this.var_2409 != null && this.method_2406())
         {
            this.var_2409();
         }
      }
      
      public function method_1159(param1:name_348) : void
      {
         var _loc2_:NewsServiceEvent = null;
         if(this.var_2407 == null)
         {
            this.var_2407 = new Vector.<name_348>();
         }
         this.var_2407.unshift(param1);
         if(this.var_2408 != null)
         {
            _loc2_ = new NewsServiceEvent(NewsServiceEvent.NEWS_ITEM_IS_SENT);
            _loc2_.name_2660(param1);
            dispatchEvent(_loc2_);
         }
      }
      
      public function method_1158(param1:Long) : void
      {
         var _loc2_:Object = storageService.getStorage().data["NEWS_SERVICE_READ_NEWS"];
         if(_loc2_ == null)
         {
            _loc2_ = {};
         }
         _loc2_[param1.toString()] = "";
         storageService.getStorage().data["NEWS_SERVICE_READ_NEWS"] = _loc2_;
      }
      
      public function method_1164(param1:Long) : void
      {
         var _loc2_:NewsServiceEvent = new NewsServiceEvent(NewsServiceEvent.NEWS_ITEM_IS_REMOVED);
         _loc2_.name_2659(param1);
         dispatchEvent(_loc2_);
      }
      
      public function method_1156(param1:Function) : void
      {
         if(this.var_2407 != null)
         {
            param1(this.var_2407);
         }
         else
         {
            this.var_2408 = param1;
         }
      }
      
      public function method_1155(param1:Function) : void
      {
         if(this.var_2407 == null)
         {
            this.var_2409 = param1;
         }
         else if(this.method_2406())
         {
            param1();
         }
      }
      
      private function method_2406() : Boolean
      {
         var _loc1_:name_348 = null;
         for each(_loc1_ in this.var_2407)
         {
            if(!this.method_1161(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function method_1161(param1:name_348) : Boolean
      {
         var _loc2_:Object = storageService.getStorage().data["NEWS_SERVICE_READ_NEWS"];
         if(!_loc2_)
         {
            return false;
         }
         return _loc2_.hasOwnProperty(param1.id.toString());
      }
      
      public function method_1162() : void
      {
         var _loc1_:* = null;
         var _loc2_:name_348 = null;
         var _loc3_:Object = storageService.getStorage().data["NEWS_SERVICE_READ_NEWS"];
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Object = {};
         for(_loc1_ in _loc3_)
         {
            for each(_loc2_ in this.var_2407)
            {
               if(_loc1_ == _loc2_.id.toString())
               {
                  _loc4_[_loc1_] = "";
                  break;
               }
            }
         }
         storageService.getStorage().data["NEWS_SERVICE_READ_NEWS"] = _loc4_;
      }
      
      public function method_1163() : void
      {
         this.var_2408 = null;
      }
      
      public function method_1157() : void
      {
         this.var_2409 = null;
      }
      
      public function method_1160() : void
      {
         this.var_2407 = null;
      }
      
      public function method_1154() : Vector.<name_348>
      {
         var _loc1_:name_348 = null;
         var _loc2_:Object = storageService.getStorage().data["NEWS_SERVICE_READ_NEWS"];
         if(_loc2_ == null)
         {
            return this.var_2407;
         }
         var _loc3_:Vector.<name_348> = new Vector.<name_348>();
         for each(_loc1_ in this.var_2407)
         {
            if(!this.method_2407(_loc2_,_loc1_))
            {
               _loc3_.push(_loc1_);
            }
         }
         return _loc3_;
      }
      
      private function method_2407(param1:Object, param2:name_348) : Boolean
      {
         return param1.hasOwnProperty(param2.id.toString());
      }
   }
}
