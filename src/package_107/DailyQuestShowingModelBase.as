package package_107
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class DailyQuestShowingModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2136;
      
      private var client:name_335;
      
      private var var_25:Long;
      
      private var var_1541:Long;
      
      private var var_1544:name_860;
      
      private var var_1543:Long;
      
      private var var_1547:name_860;
      
      private var var_1542:Long;
      
      private var var_1546:name_860;
      
      private var var_1545:name_860;
      
      public function DailyQuestShowingModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().name_6(name_840));
         this.client = name_335(this);
         this.var_25 = Long.getLong(1734194361,-1013591761);
         this.var_1541 = Long.getLong(27042981,-1604202185);
         this.var_1543 = Long.getLong(593457405,1956535921);
         this.var_1542 = Long.getLong(396498759,-254486753);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2136(name_66(this));
      }
      
      protected function method_771() : name_368
      {
         return name_368(var_19[Model.object]);
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
