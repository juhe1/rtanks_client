package package_114
{
   public class ChatModeratorLevel
   {
      
      public static const NONE:ChatModeratorLevel = new ChatModeratorLevel(0,"NONE");
      
      public static const COMMUNITY_MANAGER:ChatModeratorLevel = new ChatModeratorLevel(1,"COMMUNITY_MANAGER");
      
      public static const ADMINISTRATOR:ChatModeratorLevel = new ChatModeratorLevel(2,"ADMINISTRATOR");
      
      public static const MODERATOR:ChatModeratorLevel = new ChatModeratorLevel(3,"MODERATOR");
      
      public static const CANDIDATE:ChatModeratorLevel = new ChatModeratorLevel(4,"CANDIDATE");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function ChatModeratorLevel(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function get method_393() : Vector.<ChatModeratorLevel>
      {
         var _loc1_:Vector.<ChatModeratorLevel> = new Vector.<ChatModeratorLevel>();
         _loc1_.push(NONE);
         _loc1_.push(COMMUNITY_MANAGER);
         _loc1_.push(ADMINISTRATOR);
         _loc1_.push(MODERATOR);
         _loc1_.push(CANDIDATE);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "ChatModeratorLevel [" + this.var_23 + "]";
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
