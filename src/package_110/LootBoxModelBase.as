package package_110
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class LootBoxModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1579;
      
      private var client:class_56;
      
      private var var_25:Long;
      
      private var var_861:Long;
      
      private var var_862:name_860;
      
      public function LootBoxModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = class_56(this);
         this.var_25 = Long.getLong(1543015131,1817260381);
         this.var_861 = Long.getLong(525232336,-1555877066);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1579(name_66(this));
      }
      
      protected function method_771() : name_382
      {
         return name_382(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_861:
               this.client.name_422(this.var_862.decode(param2) as Vector.<name_331>);
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
