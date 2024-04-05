package package_128
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class ClanNotifierModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1887;
      
      private var client:name_636;
      
      private var var_25:Long;
      
      private var var_1179:Long;
      
      private var var_1180:name_860;
      
      public function ClanNotifierModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().name_6(name_840));
         this.client = name_636(this);
         this.var_25 = Long.getLong(1850785827,-2022019480);
         this.var_1179 = Long.getLong(2052398186,-511753871);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1887(name_66(this));
      }
      
      protected function method_771() : name_354
      {
         return name_354(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1179:
               this.client.method_1430(this.var_1180.decode(param2) as Vector.<name_354>);
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
