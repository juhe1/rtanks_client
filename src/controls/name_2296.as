package controls
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="controls.name_2296")]
   public class name_2296 extends MovieClip
   {
      
      public static const REGISTER:int = 1;
      
      public static const const_2283:int = 2;
      
      public static const const_2278:int = 3;
      
      public static const const_2282:int = 4;
      
      public static const name_557:int = 5;
      
      public static const const_2275:int = 6;
      
      public static const const_2279:int = 7;
      
      public static const CREATE_BATTLE:int = 8;
      
      public static const const_2284:int = 9;
      
      public static const const_2280:int = 10;
      
      public static const name_2672:int = 11;
      
      public static const const_2274:int = 13;
      
      public static const const_2276:int = 14;
      
      public static const HELP:int = 15;
      
      public static const const_2273:int = 16;
      
      public static const const_2277:int = 17;
      
      public static const const_2281:int = 18;
      
      public static const ACCOUNT:int = 19;
      
      public static const SETTINGS:int = 20;
      
      public static const name_2299:int = 21;
      
      public static const CONGRATULATIONS:int = 22;
      
      public static const const_2285:int = 23;
      
      public static const SHOP:int = 24;
       
      
      public function name_2296(param1:int = 0, param2:String = "en")
      {
         super();
         var _loc3_:int = 0;
         if(param2 == "ru")
         {
            _loc3_ = 24;
         }
         else if(param2 == "cn")
         {
            _loc3_ = 48;
         }
         if(param1 > 0)
         {
            gotoAndStop(param1 + _loc3_);
         }
      }
   }
}
