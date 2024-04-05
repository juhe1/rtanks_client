package package_254
{
   import alternativa.osgi.OSGi;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_1009 extends class_162
   {
       
      
      public function name_1009(param1:Number, param2:Number, param3:Number, param4:Boolean, param5:Boolean)
      {
         super(param1,param2,param3);
         var _loc6_:name_102 = name_102(OSGi.getInstance().name_6(name_102));
         var _loc7_:String = String(_loc6_.getText(param4 ? name_390.const_663 : name_390.const_1218));
         if(param5)
         {
            _loc7_ += _loc6_.getText(name_390.const_1001);
         }
         text = _loc7_;
         arrowLehgth = int(_loc6_.getText(name_390.const_831));
         arrowAlign = name_2221.TOP_RIGHT;
      }
   }
}
