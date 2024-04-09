package package_121
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class WeeklyQuestRewardShowingModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2133;
      
      private var client:name_387;
      
      private var var_25:Long;
      
      private var var_1525:Long;
      
      private var var_1528:name_860;
      
      private var var_1526:Long;
      
      private var var_1527:name_860;
      
      public function WeeklyQuestRewardShowingModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_387(this);
         this.var_25 = Long.getLong(432617209,-1426923357);
         this.var_1525 = Long.getLong(1076222089,1622955023);
         this.var_1526 = Long.getLong(1918391432,-1307650308);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2133(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1525:
               this.client.method_1153(this.var_1528.decode(param2) as Vector.<name_343>);
               break;
            case this.var_1526:
               this.client.showWeeklyQuestRewardGiven(this.var_1527.decode(param2) as Vector.<name_343>);
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
