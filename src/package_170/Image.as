package package_170
{
   import flash.display.BitmapData;
   import package_54.name_102;
   import package_60.name_1822;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class Image
   {
      
      private static const const_1511:Class = name_1824;
      
      public static const const_1509:BitmapData = new const_1511().bitmapData;
      
      private static const const_1510:Class = name_1823;
      
      private static const const_1512:BitmapData = new const_1510().bitmapData;
      
      private static const controlsHelp:Class = name_1825;
      
      private static const FULL_BATTLE_HELP:BitmapData = new controlsHelp().bitmapData;
      
      private static const const_1514:Class = name_1827;
      
      private static const const_978:BitmapData = new const_1514().bitmapData;
      
      private static const const_1515:Class = name_1826;
      
      private static const const_718:BitmapData = new const_1515().bitmapData;
       
      
      public function Image()
      {
         super();
      }
      
      public static function init(param1:name_102) : void
      {
         param1.method_619(name_1822.const_1509,Image.const_1509);
         param1.method_619(name_1822.const_1512,Image.const_1512);
         param1.method_619(name_1822.const_1512,Image.const_1512);
         param1.method_619(name_1822.const_1512,Image.const_1512);
         param1.method_619(name_390.name_1306,Image.FULL_BATTLE_HELP);
         param1.method_619(name_390.const_718,Image.const_718);
         param1.method_619(name_390.const_978,Image.const_978);
      }
   }
}
