package package_254
{
   import alternativa.osgi.OSGi;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_1008 extends class_162
   {
       
      
      public function name_1008(param1:Number, param2:Number, param3:Number)
      {
         super(param1,param2,param3);
         var _loc4_:name_102 = name_102(OSGi.getInstance().getService(name_102));
         text = _loc4_.getText(name_390.const_821);
         arrowLehgth = int(_loc4_.getText(name_390.const_655));
         arrowAlign = name_2221.TOP_LEFT;
      }
   }
}
