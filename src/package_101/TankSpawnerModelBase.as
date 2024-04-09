package package_101
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class TankSpawnerModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1215;
      
      private var client:name_291;
      
      private var var_25:Long;
      
      private var var_530:Long;
      
      private var var_538:name_860;
      
      private var var_533:name_860;
      
      private var var_529:Long;
      
      private var var_537:name_860;
      
      private var var_535:name_860;
      
      private var var_536:name_860;
      
      private var var_534:name_860;
      
      private var var_532:name_860;
      
      public function TankSpawnerModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_291(this);
         this.var_25 = Long.getLong(490108405,-1605879749);
         this.var_530 = Long.getLong(1841708554,1107932617);
         this.var_529 = Long.getLong(937986364,-303760789);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1215(name_66(this));
      }
      
      protected function method_771() : name_1214
      {
         return name_1214(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         var _loc3_:* = param1;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
