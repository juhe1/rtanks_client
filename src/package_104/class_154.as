package package_104
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class class_154 extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2127;
      
      private var client:name_385;
      
      private var var_25:Long;
      
      private var var_1519:Long;
      
      private var var_1520:name_860;
      
      public function class_154()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_385(this);
         this.var_25 = Long.getLong(142490486,-1012948578);
         this.var_1519 = Long.getLong(1979487962,1574221041);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2127(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1519:
               this.client.rewardNotify(int(this.var_1520.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
