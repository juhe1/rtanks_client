package package_116
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class EquipmentConstraintsNamingModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2673;
      
      private var client:name_1665;
      
      private var var_25:Long;
      
      public function EquipmentConstraintsNamingModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_1665(this);
         this.var_25 = Long.getLong(1124951823,1347902856);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2673(name_66(this));
      }
      
      protected function method_771() : name_365
      {
         return name_365(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         var _loc3_:* = param1;
         var _loc4_:int = 0;
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
