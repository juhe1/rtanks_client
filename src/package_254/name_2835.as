package package_254
{
   import alternativa.osgi.OSGi;
   import package_393.name_2002;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2835
   {
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      private static const const_1581:int = 1000;
      
      private static const const_2616:int = 86400000;
       
      
      public function name_2835()
      {
         super();
      }
      
      public static function name_2837(param1:Date) : String
      {
         var _loc2_:Number = NaN;
         var _loc3_:String = " ";
         if(!isNaN(param1.date))
         {
            _loc2_ = param1.getTime() - new Date().getTime();
            if(_loc2_ < 86400000)
            {
               _loc3_ = localeService.getText(name_390.const_1413) + name_2002.method_2583(param1);
            }
            else
            {
               _loc3_ = localeService.getText(name_390.const_1431) + name_2002.name_2009(param1);
            }
         }
         return _loc3_;
      }
      
      public static function method_3045(param1:int) : Number
      {
         return Number(param1) * 1000;
      }
   }
}
