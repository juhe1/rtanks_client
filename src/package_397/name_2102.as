package package_397
{
   import alternativa.osgi.OSGi;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_2102
   {
       
      
      public function name_2102()
      {
         super();
      }
      
      public static function name_2103(param1:String) : String
      {
         var _loc2_:name_102 = OSGi.getInstance().getService(name_102) as name_102;
         switch(param1)
         {
            case "vkontakte":
               return _loc2_.getText(name_390.const_742);
            case "facebook":
               return _loc2_.getText(name_390.const_996);
            default:
               return param1.substr(0,1).toUpperCase() + param1.substr(1);
         }
      }
   }
}
