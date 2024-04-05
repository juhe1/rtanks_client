package assets.icons
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="assets.icons.GarageItemBackground")]
   public class GarageItemBackground extends MovieClip
   {
      
      public static const OFF_NORMAL:int = 1;
      
      public static const OFF_NORMAL_SELECTED:int = 2;
      
      public static const SHIELD_NORMAL:int = 3;
      
      public static const SHIELD_NORMAL_SELECTED:int = 4;
      
      public static const SHIELD_INSTALLED:int = 5;
      
      public static const SHIELD_INSTALLED_SELECTED:int = 6;
      
      public static const GUN_NORMAL:int = 7;
      
      public static const GUN_NORMAL_SELECTED:int = 8;
      
      public static const GUN_INSTALLED:int = 9;
      
      public static const GUN_INSTALLED_SELECTED:int = 10;
      
      public static const ENGINE_NORMAL:int = 11;
      
      public static const ENGINE_NORMAL_SELECTED:int = 12;
      
      public static const ENGINE_INSTALLED:int = 13;
      
      public static const ENGINE_INSTALLED_SELECTED:int = 14;
      
      public static const COLOR_NORMAL:int = 15;
      
      public static const COLOR_NORMAL_SELECTED:int = 16;
      
      public static const COLOR_INSTALLED:int = 17;
      
      public static const COLOR_INSTALLED_SELECTED:int = 18;
      
      public static const PLUGIN_NORMAL:int = 19;
      
      public static const PLUGIN_NORMAL_SELECTED:int = 20;
      
      public static const PLUGIN_INSTALLED:int = 21;
      
      public static const PLUGIN_INSTALLED_SELECTED:int = 22;
       
      
      public function GarageItemBackground(param1:int = 1)
      {
         super();
         gotoAndStop(param1);
      }
      
      public static function method_3043(param1:String) : int
      {
         var _loc2_:int = 1;
         var _loc3_:Array = new Array();
         _loc3_["OFF_NORMAL"] = 1;
         _loc3_["OFF_NORMAL_SELECTED"] = 2;
         _loc3_["ENGINE_NORMAL"] = 11;
         _loc3_["ENGINE_NORMAL_SELECTED"] = 12;
         _loc3_["ENGINE_INSTALLED"] = 13;
         _loc3_["ENGINE_INSTALLED_SELECTED"] = 14;
         _loc3_["GUN_NORMAL"] = 7;
         _loc3_["GUN_NORMAL_SELECTED"] = 8;
         _loc3_["GUN_INSTALLED"] = 9;
         _loc3_["GUN_INSTALLED_SELECTED"] = 10;
         _loc3_["SHIELD_NORMAL"] = 3;
         _loc3_["SHIELD_NORMAL_SELECTED"] = 4;
         _loc3_["SHIELD_INSTALLED"] = 5;
         _loc3_["SHIELD_INSTALLED_SELECTED"] = 6;
         _loc3_["COLOR_NORMAL"] = 15;
         _loc3_["COLOR_NORMAL_SELECTED"] = 16;
         _loc3_["COLOR_INSTALLED"] = 17;
         _loc3_["COLOR_INSTALLED_SELECTED"] = 18;
         _loc3_["PLUGIN_NORMAL"] = 19;
         _loc3_["PLUGIN_NORMAL_SELECTED"] = 20;
         _loc3_["PLUGIN_INSTALLED"] = 19;
         _loc3_["PLUGIN_INSTALLED_SELECTED"] = 20;
         return int(_loc3_[param1]);
      }
   }
}
