package alternativa.tanks.model.friends
{
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_347.name_1666;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class FriendsService
   {
      
      public static var name_398:String = new String();
      
      private static var friends:Dictionary = new Dictionary();
      
      private static var var_961:Dictionary = new Dictionary();
      
      private static var var_962:Dictionary = new Dictionary();
      
      private static var var_960:name_1667 = new name_1667();
       
      
      public function FriendsService()
      {
         super();
      }
      
      public static function name_427(param1:String) : void
      {
         method_1172(param1);
         method_1173(param1);
         method_1175(param1);
         method_1170(param1);
         method_1171(param1);
         trace(param1);
      }
      
      public static function method_1174(param1:String) : name_1666
      {
         if(param1 in friends)
         {
            return friends[param1];
         }
         return name_1666.UNKNOWN;
      }
      
      private static function method_1169(param1:Dictionary, param2:Object = null) : int
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         for each(_loc3_ in param1)
         {
            if(param2 != null)
            {
               if(_loc3_ == param2)
               {
                  _loc4_++;
               }
            }
            else
            {
               _loc4_++;
            }
         }
         return _loc4_;
      }
      
      public static function method_1180(param1:String) : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;make_friend;" + param1);
      }
      
      public static function method_851(param1:String) : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;cancel_request;" + param1);
      }
      
      public static function method_371(param1:String) : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;deny_friend;" + param1);
      }
      
      public static function method_346(param1:String) : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;accept_friend;" + param1);
      }
      
      public static function method_1178(param1:String) : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;remove_new_accepted;" + param1);
      }
      
      public static function name_476(param1:String) : void
      {
         var _loc2_:name_1666 = name_1666.name_1669;
         friends[param1] = _loc2_;
         var_960.name_1668(_loc2_);
      }
      
      public static function name_446(param1:String) : void
      {
         var _loc2_:name_1666 = name_1666.INCOMING;
         friends[param1] = _loc2_;
         var_960.name_1668(_loc2_);
      }
      
      public static function name_441(param1:String) : void
      {
         var _loc2_:name_1666 = name_1666.UNKNOWN;
         friends[param1] = _loc2_;
         var_960.name_1668(_loc2_);
      }
      
      public static function name_418(param1:String) : void
      {
         var _loc2_:name_1666 = name_1666.OUTGOING;
         friends[param1] = _loc2_;
         var_960.name_1668(_loc2_);
      }
      
      private static function method_1172(param1:String) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in JSON.parse(param1).friends)
         {
            if(_loc2_ == null || friends[_loc2_.id] != null)
            {
               return;
            }
            friends[_loc2_.id] = name_1666.name_1669;
         }
      }
      
      private static function method_1173(param1:String) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in JSON.parse(param1).incoming)
         {
            if(_loc2_ == null || friends[_loc2_.id] != null)
            {
               return;
            }
            friends[_loc2_.id] = name_1666.INCOMING;
         }
      }
      
      private static function method_1175(param1:String) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in JSON.parse(param1).outcoming)
         {
            if(_loc2_ == null || friends[_loc2_.id] != null)
            {
               return;
            }
            friends[_loc2_.id] = name_1666.OUTGOING;
         }
      }
      
      private static function method_1170(param1:String) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in JSON.parse(param1).new_accepted)
         {
            if(_loc2_ == null || var_961[_loc2_.id] != null)
            {
               return;
            }
            var_961[_loc2_.id] = true;
            var_960.name_1670(_loc2_.id);
         }
      }
      
      public static function name_409(param1:String) : void
      {
         if(param1 == null || var_961[param1] != null)
         {
            return;
         }
         var_961[param1] = true;
         var_960.name_1670(param1);
      }
      
      public static function name_431(param1:String) : void
      {
         if(param1 == null || var_961[param1] == null)
         {
            return;
         }
         delete var_961[param1];
         var_960.name_1670(param1);
      }
      
      public static function get method_1181() : int
      {
         return method_1169(var_961);
      }
      
      public static function method_1177(param1:String) : Boolean
      {
         return var_961[param1] != null || var_962[param1] != null;
      }
      
      private static function method_1171(param1:String) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in JSON.parse(param1).new_incoming)
         {
            if(_loc2_ == null || var_962[_loc2_.id] != null)
            {
               return;
            }
            var_962[_loc2_.id] = true;
            var_960.name_1671(_loc2_.id);
         }
      }
      
      public static function name_485(param1:String) : void
      {
         if(param1 == null || var_962[param1] != null)
         {
            return;
         }
         var_962[param1] = true;
         var_960.name_1671(param1);
      }
      
      public static function name_454(param1:String) : void
      {
         if(param1 == null || var_962[param1] == null)
         {
            return;
         }
         delete var_962[param1];
         var_960.name_1671(param1);
      }
      
      public static function get method_1176() : int
      {
         return method_1169(var_962);
      }
      
      public static function method_1179() : name_1667
      {
         return var_960;
      }
      
      public static function method_1182(param1:String) : Boolean
      {
         var _loc2_:Boolean = false;
         if(PanelModel(Main.osgi.name_6(name_115)).isBattleSelect || PanelModel(Main.osgi.name_6(name_115)).isInBattle)
         {
            if(method_1174(param1) == name_1666.name_1669)
            {
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
   }
}
