package forms.battlelist
{
   public class MapTheme
   {
      
      public static const SUMMER:MapTheme = new MapTheme(0,"SUMMER");
      
      public static const WINTER:MapTheme = new MapTheme(1,"WINTER");
      
      public static const DAY:MapTheme = new MapTheme(2,"DAY");
      
      public static const NIGHT:MapTheme = new MapTheme(3,"NIGHT");
      
      public static const SUMMER_DAY:MapTheme = new MapTheme(4,"SUMMER_DAY");
      
      public static const SUMMER_NIGHT:MapTheme = new MapTheme(5,"SUMMER_NIGHT");
      
      public static const WINTER_DAY:MapTheme = new MapTheme(6,"WINTER_DAY");
      
      public static const WINTER_NIGHT:MapTheme = new MapTheme(7,"WINTER_NIGHT");
      
      public static const SPACE:MapTheme = new MapTheme(8,"SPACE");
       
      
      private var _value:int;
      
      private var var_23:String;
      
      public function MapTheme(param1:int, param2:String)
      {
         super();
         this._value = param1;
         this.var_23 = param2;
      }
      
      public static function name_440(param1:String) : MapTheme
      {
         var _loc2_:MapTheme = null;
         switch(param1)
         {
            case "summer":
               _loc2_ = SUMMER;
               break;
            case "winter":
               _loc2_ = WINTER;
               break;
            case "day":
               _loc2_ = DAY;
               break;
            case "night":
               _loc2_ = NIGHT;
               break;
            case "summer_day":
               _loc2_ = SUMMER_DAY;
               break;
            case "summer_night":
               _loc2_ = SUMMER_NIGHT;
               break;
            case "winter_day":
               _loc2_ = WINTER_DAY;
               break;
            case "winter_night":
               _loc2_ = WINTER_NIGHT;
               break;
            case "space":
               _loc2_ = SPACE;
               break;
            default:
               _loc2_ = DAY;
         }
         return _loc2_;
      }
      
      public static function get method_393() : Vector.<MapTheme>
      {
         var _loc1_:Vector.<MapTheme> = new Vector.<MapTheme>();
         _loc1_.push(SUMMER);
         _loc1_.push(WINTER);
         _loc1_.push(DAY);
         _loc1_.push(NIGHT);
         _loc1_.push(SUMMER_DAY);
         _loc1_.push(SUMMER_NIGHT);
         _loc1_.push(WINTER_DAY);
         _loc1_.push(WINTER_NIGHT);
         _loc1_.push(SPACE);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return "MapTheme [" + this.var_23 + "]";
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
