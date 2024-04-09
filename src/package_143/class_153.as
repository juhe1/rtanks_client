package package_143
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class class_153 extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2106;
      
      private var client:name_396;
      
      private var var_25:Long;
      
      private var var_1491:Long;
      
      private var var_1492:name_860;
      
      private var var_1494:name_860;
      
      private var var_1493:name_860;
      
      public function class_153()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_396(this);
         this.var_25 = Long.getLong(1118509469,-35521391);
         this.var_1491 = Long.getLong(523922434,-1392224255);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2106(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1491:
               this.client.showInfoWindow(int(this.var_1492.decode(param2)),int(this.var_1494.decode(param2)),int(this.var_1493.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
