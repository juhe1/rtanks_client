package package_48
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import package_47.BattleTeamType;
   
   public class name_1128
   {
      
      private static var var_1967:Class = name_2377;
      
      private static var var_1937:BitmapData = Bitmap(new var_1967()).bitmapData;
      
      private static var var_1949:Class = name_2371;
      
      private static var var_1958:BitmapData = Bitmap(new var_1949()).bitmapData;
      
      private static var var_1962:Class = name_2380;
      
      private static var var_1968:BitmapData = Bitmap(new var_1962()).bitmapData;
      
      private static var var_1965:Class = name_2374;
      
      private static var var_1959:BitmapData = Bitmap(new var_1965()).bitmapData;
      
      private static var var_1963:Class = name_2375;
      
      private static var var_1950:BitmapData = Bitmap(new var_1963()).bitmapData;
      
      private static var var_1940:Class = name_2372;
      
      private static var var_1938:BitmapData = Bitmap(new var_1940()).bitmapData;
      
      private static var var_1955:Class = name_2367;
      
      private static var var_1948:BitmapData = Bitmap(new var_1955()).bitmapData;
      
      private static var var_1954:Class = name_2382;
      
      private static var var_1956:BitmapData = Bitmap(new var_1954()).bitmapData;
      
      private static var var_1942:Class = name_2370;
      
      private static var var_1934:BitmapData = Bitmap(new var_1942()).bitmapData;
      
      private static var var_1936:Class = name_2366;
      
      private static var var_1944:BitmapData = Bitmap(new var_1936()).bitmapData;
      
      private static var var_1935:Class = name_2376;
      
      private static var var_1957:BitmapData = Bitmap(new var_1935()).bitmapData;
      
      private static var var_1941:Class = name_2365;
      
      private static var var_1945:BitmapData = Bitmap(new var_1941()).bitmapData;
      
      private static var var_1946:Class = name_2378;
      
      private static var var_1961:BitmapData = Bitmap(new var_1946()).bitmapData;
      
      private static var var_1951:Class = name_2383;
      
      private static var var_1964:BitmapData = Bitmap(new var_1951()).bitmapData;
      
      private static var var_1947:Class = name_2379;
      
      private static var var_1952:BitmapData = Bitmap(new var_1947()).bitmapData;
      
      private static var var_1953:Class = name_2373;
      
      private static var var_1966:BitmapData = Bitmap(new var_1953()).bitmapData;
      
      private static var var_1960:Class = name_2369;
      
      private static var var_1931:BitmapData = Bitmap(new var_1960()).bitmapData;
      
      private static var var_1939:Class = name_2381;
      
      private static var var_1933:BitmapData = Bitmap(new var_1939()).bitmapData;
      
      private static var var_1943:Class = name_2368;
      
      private static var var_1932:BitmapData = Bitmap(new var_1943()).bitmapData;
      
      private static const const_1731:uint = 4964125;
      
      private static const const_1736:uint = 2448911;
      
      private static const const_1735:uint = 4691967;
      
      private static const const_1732:uint = 2181375;
      
      private static const const_1734:uint = 15741974;
      
      private static const const_1730:uint = 10556937;
      
      private static const const_1737:uint = 14207247;
      
      private static const const_1733:uint = 7758340;
      
      public static const name_1143:name_1128 = new name_1128(4964125,2448911,var_1937,var_1968,var_1958,var_1959,var_1931,var_1933,var_1932);
      
      public static const const_1729:name_1128 = new name_1128(4691967,2181375,var_1950,var_1948,var_1938,var_1956,var_1931,var_1933,var_1932);
      
      public static const const_1728:name_1128 = new name_1128(15741974,10556937,var_1934,var_1957,var_1944,var_1945,var_1931,var_1933,var_1932);
      
      public static const name_1149:name_1128 = new name_1128(14207247,7758340,var_1961,var_1952,var_1964,var_1966,var_1931,var_1933,var_1932);
       
      
      public var color:uint;
      
      public var name_2357:uint;
      
      public var name_2354:BitmapData;
      
      public var name_2353:BitmapData;
      
      public var name_2359:BitmapData;
      
      public var name_2356:BitmapData;
      
      public var name_2355:BitmapData;
      
      public var name_2358:BitmapData;
      
      public var var_503:BitmapData;
      
      public function name_1128(param1:uint, param2:uint, param3:BitmapData, param4:BitmapData, param5:BitmapData, param6:BitmapData, param7:BitmapData, param8:BitmapData, param9:BitmapData)
      {
         super();
         this.color = param1;
         this.name_2357 = param2;
         this.name_2354 = param3;
         this.name_2353 = param4;
         this.name_2359 = param5;
         this.name_2356 = param6;
         this.var_503 = param7;
         this.name_2355 = param8;
         this.name_2358 = param9;
      }
      
      public static function name_1148(param1:BattleTeamType) : name_1128
      {
         switch(param1)
         {
            case BattleTeamType.BLUE:
               return const_1729;
            case BattleTeamType.RED:
               return const_1728;
            default:
               return name_1143;
         }
      }
   }
}
