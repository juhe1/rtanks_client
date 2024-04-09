package package_227
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class class_141 extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1950;
      
      private var client:name_606;
      
      private var var_25:Long;
      
      private var var_1261:Long;
      
      private var var_1262:name_860;
      
      public function class_141()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_606(this);
         this.var_25 = Long.getLong(525873271,1744909560);
         this.var_1261 = Long.getLong(123212251,-1982333947);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1950(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1261:
               this.client.method_1503(String(this.var_1262.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
