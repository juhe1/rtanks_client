package projects.tanks.client.commons.models.layout
{
   public class LayoutState
   {
      
      public static const MATCHMAKING:LayoutState = new LayoutState(0,"MATCHMAKING");
      
      public static const BATTLE_SELECT:LayoutState = new LayoutState(1,"BATTLE_SELECT");
      
      public static const GARAGE:LayoutState = new LayoutState(2,"GARAGE");
      
      public static const BATTLE:LayoutState = new LayoutState(3,"BATTLE");
      
      public static const RELOAD_SPACE:LayoutState = new LayoutState(4,"RELOAD_SPACE");
      
      public static const CLAN:LayoutState = new LayoutState(5,"CLAN");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function LayoutState(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function get method_393() : Vector.<LayoutState>
      {
         var _loc1_:Vector.<LayoutState> = new Vector.<LayoutState>();
         _loc1_.push(MATCHMAKING);
         _loc1_.push(BATTLE_SELECT);
         _loc1_.push(GARAGE);
         _loc1_.push(BATTLE);
         _loc1_.push(RELOAD_SPACE);
         _loc1_.push(CLAN);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "LayoutState [" + this.var_23 + "]";
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
