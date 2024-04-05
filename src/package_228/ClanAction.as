package package_228
{
   public class ClanAction
   {
      
      public static const DELETE_CLAN:ClanAction = new ClanAction(0,"DELETE_CLAN");
      
      public static const PERMISSION_DISTRIBUTION:ClanAction = new ClanAction(1,"PERMISSION_DISTRIBUTION");
      
      public static const REMOVE_FROM_CLAN:ClanAction = new ClanAction(2,"REMOVE_FROM_CLAN");
      
      public static const ADDING_TO_CLAN:ClanAction = new ClanAction(3,"ADDING_TO_CLAN");
      
      public static const ACCESS_BLOCK:ClanAction = new ClanAction(4,"ACCESS_BLOCK");
      
      public static const BATTLE_GROUPS:ClanAction = new ClanAction(5,"BATTLE_GROUPS");
      
      public static const INVITE_TO_CLAN:ClanAction = new ClanAction(6,"INVITE_TO_CLAN");
      
      public static const EDIT_PROFILE:ClanAction = new ClanAction(7,"EDIT_PROFILE");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function ClanAction(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function get method_393() : Vector.<ClanAction>
      {
         var _loc1_:Vector.<ClanAction> = new Vector.<ClanAction>();
         _loc1_.push(DELETE_CLAN);
         _loc1_.push(PERMISSION_DISTRIBUTION);
         _loc1_.push(REMOVE_FROM_CLAN);
         _loc1_.push(ADDING_TO_CLAN);
         _loc1_.push(ACCESS_BLOCK);
         _loc1_.push(BATTLE_GROUPS);
         _loc1_.push(INVITE_TO_CLAN);
         _loc1_.push(EDIT_PROFILE);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "ClanAction [" + this.var_23 + "]";
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get name() : String
      {
         return this.var_23;
      }
   }
}
