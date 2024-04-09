package package_91
{
   import alternativa.osgi.OSGi;
   import flash.utils.ByteArray;
   import package_38.OptionalMap;
   import package_38.name_69;
   import package_38.name_840;
   import platform.client.fp10.core.model.name_66;
   
   public class name_1245
   {
       
      
      private var var_235:name_840;
      
      private var var_2047:name_69;
      
      private var model:name_66;
      
      public function name_1245(param1:name_66)
      {
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.var_235 = name_840(OSGi.getInstance().getService(name_840));
         this.var_2047 = new name_69(_loc2_,_loc2_,new OptionalMap());
      }
   }
}
