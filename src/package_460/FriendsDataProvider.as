package package_460
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.friends.FriendsService;
   import fl.data.DataProvider;
   import flash.utils.Dictionary;
   import package_120.name_408;
   import package_13.Long;
   import package_480.name_3474;
   
   public class FriendsDataProvider extends DataProvider
   {
      
      public static var userInfoService:name_408 = OSGi.getInstance().name_6(name_408) as name_408;
      
      public static const name_3015:String = "isNew";
      
      public static const const_2725:String = "id";
      
      public static const name_3018:String = "online";
      
      public static const name_3017:String = "isBattle";
      
      public static const name_3016:String = "uid";
      
      public static const const_2727:String = "availableInvite";
      
      public static const const_2726:String = "availableBattle";
      
      private static var var_1163:RegExp = /\-|\./;
      
      private static var var_1164:RegExp = /\*/g;
       
      
      private var var_1168:Function;
      
      private var var_1160:Dictionary;
      
      private var var_1166:String;
      
      private var var_1161:String;
      
      private var var_1167:RegExp;
      
      private var var_1162:Object;
      
      private var var_1165:Object;
      
      public var de:Long;
      
      public function FriendsDataProvider()
      {
         this.de = new Long(0,10000);
         this.var_1160 = new Dictionary();
         this.var_1161 = "";
         super();
      }
      
      private static function method_1417(param1:String) : RegExp
      {
         param1 = param1.replace(var_1163,"\\$&").replace(var_1164,".*");
         param1 = "^" + param1;
         return new RegExp(param1,"i");
      }
      
      public function get getItemAtHandler() : Function
      {
         return this.var_1168;
      }
      
      public function set getItemAtHandler(param1:Function) : void
      {
         this.var_1168 = param1;
      }
      
      override public function getItemAt(param1:uint) : Object
      {
         var _loc2_:Object = super.getItemAt(param1);
         if(this.getItemAtHandler != null)
         {
            this.getItemAtHandler(_loc2_);
         }
         return _loc2_;
      }
      
      public function method_3162(param1:Long, param2:Boolean = true) : int
      {
         var _loc3_:int = this.method_3159(param1,"isNew",true);
         if(param2 && _loc3_ != -1)
         {
            this.method_1418();
         }
         return _loc3_;
      }
      
      public function name_3014(param1:Long, param2:Boolean = true) : int
      {
         var _loc3_:int = this.method_3159(param1,"online",param2);
         if(param2 && _loc3_ != -1)
         {
            this.method_1418();
         }
         return _loc3_;
      }
      
      public function method_3164() : void
      {
         var _loc1_:Object = null;
         var _loc2_:int = int(this.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = super.getItemAt(_loc3_);
            _loc3_++;
         }
      }
      
      public function method_3163(param1:Long) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = this.method_3159(param1,"availableInvite",false);
         if(_loc3_ != -1)
         {
            _loc2_ = super.getItemAt(_loc3_);
         }
      }
      
      public function method_3161(param1:Long, param2:Boolean = true) : int
      {
         var _loc3_:int = this.method_3159(param1,"isBattle",false);
         if(_loc3_ != -1)
         {
            this.method_3159(param1,"availableBattle",false);
         }
         if(param2 && _loc3_ != -1)
         {
            this.method_1418();
         }
         return _loc3_;
      }
      
      public function addUser(param1:String, param2:String, param3:String, param4:int, param5:int, param6:Boolean) : void
      {
         var _loc7_:Object = {};
         var _loc8_:Long = new Long(0,param4);
         _loc7_.id = _loc8_;
         _loc7_.idb = new name_3474(param2,param3);
         _loc7_.uid = param1;
         _loc7_.rank = param5;
         _loc7_.online = param6;
         _loc7_.isNew = FriendsService.method_1177(param1);
         _loc7_.availableInvite = false;
         _loc7_.isBattle = false;
         _loc7_.availableBattle = false;
         _loc7_.snUid = param1;
         _loc7_.isSNFriend = false;
         _loc7_.isReferral = false;
         super.addItem(_loc7_);
         this.var_1160[_loc8_] = _loc7_;
         this.refresh();
      }
      
      public function removeUser(param1:Long) : void
      {
         if(!(param1 in this.var_1160))
         {
            return;
         }
         var _loc2_:int = this.method_3160("id",param1);
         if(_loc2_ >= 0)
         {
            super.removeItemAt(_loc2_);
         }
         delete this.var_1160[param1];
      }
      
      override public function removeAll() : void
      {
         this.var_1160 = new Dictionary();
         super.removeAll();
      }
      
      public function refresh() : void
      {
         this.filter();
         this.method_1418();
      }
      
      override public function sortOn(param1:Object, param2:Object = null) : *
      {
         this.var_1162 = param1;
         this.var_1165 = param2;
         super.sortOn(this.var_1162,this.var_1165);
      }
      
      public function method_1418() : void
      {
         super.sortOn(this.var_1162,this.var_1165);
      }
      
      public function method_1422(param1:String, param2:String) : void
      {
         if(param2 == "" && this.var_1161 != "")
         {
            this.method_1420();
            return;
         }
         this.var_1166 = param1;
         this.var_1161 = param2;
         this.var_1167 = method_1417(this.var_1161);
         this.filter();
      }
      
      public function filter() : void
      {
         var _loc1_:Object = null;
         if(this.var_1161 != "")
         {
            super.removeAll();
            for each(_loc1_ in this.var_1160)
            {
               if(this.method_1419(_loc1_))
               {
                  super.addItem(_loc1_);
               }
            }
         }
         this.method_1418();
      }
      
      public function method_1420(param1:Boolean = true) : void
      {
         var _loc2_:Object = null;
         this.var_1161 = "";
         if(!param1)
         {
            return;
         }
         super.removeAll();
         for each(_loc2_ in this.var_1160)
         {
            super.addItem(_loc2_);
         }
         this.method_1418();
      }
      
      private function method_1419(param1:Object) : Boolean
      {
         return param1.hasOwnProperty(this.var_1166) && param1[this.var_1166].search(this.var_1167) != -1;
      }
      
      public function method_3159(param1:Long, param2:String, param3:Object) : int
      {
         var _loc4_:Object = null;
         var _loc5_:int = this.method_3160("id",param1);
         if(_loc5_ != -1)
         {
            _loc4_ = super.getItemAt(_loc5_);
            _loc4_[param2] = param3;
            super.replaceItemAt(_loc4_,_loc5_);
            super.invalidateItemAt(_loc5_);
         }
         if(param1 in this.var_1160)
         {
            this.var_1160[param1][param2] = param3;
         }
         return _loc5_;
      }
      
      public function method_3160(param1:String, param2:*, param3:Boolean = false) : int
      {
         var _loc4_:Object = null;
         var _loc5_:* = undefined;
         var _loc6_:int = int(this.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = super.getItemAt(_loc7_);
            if(_loc4_ && _loc4_.hasOwnProperty(param1) && _loc4_[param1] == param2)
            {
               return _loc7_;
            }
            _loc7_++;
         }
         if(param3)
         {
            for(_loc5_ in this.var_1160)
            {
               _loc4_ = this.var_1160[_loc5_];
               if(_loc4_.hasOwnProperty(param1) && _loc4_[param1] == param2)
               {
                  return _loc7_;
               }
            }
         }
         return -1;
      }
   }
}
