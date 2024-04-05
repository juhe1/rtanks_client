package platform.client.core.general.spaces.loading.dispatcher
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class class_65 extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1687;
      
      private var client:class_64;
      
      private var var_25:Long;
      
      private var var_980:Long;
      
      private var var_981:name_860;
      
      private var var_978:Long;
      
      private var var_983:name_860;
      
      private var var_979:Long;
      
      private var var_982:name_860;
      
      public function class_65()
      {
         this.var_531 = name_840(OSGi.getInstance().name_6(name_840));
         this.client = class_64(this);
         this.var_25 = Long.getLong(191355032,163351191);
         this.var_980 = Long.getLong(748816660,1488436371);
         this.var_978 = Long.getLong(1779039460,1862164506);
         this.var_979 = Long.getLong(2104499555,54326167);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1687(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
