package package_229
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class ClanLoadingPanelModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1903;
      
      private var client:name_607;
      
      private var var_25:Long;
      
      public function ClanLoadingPanelModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_607(this);
         this.var_25 = Long.getLong(1454635600,1588551742);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1903(name_66(this));
      }
      
      protected function method_771() : name_1904
      {
         return name_1904(var_19[Model.object]);
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
