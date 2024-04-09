package projects.tanks.client.clans.user
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class class_145 extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2033;
      
      private var client:name_650;
      
      private var var_25:Long;
      
      private var var_1346:Long;
      
      public function class_145()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_650(this);
         this.var_25 = Long.getLong(1420566941,-260091189);
         this.var_1346 = Long.getLong(511635594,2072865495);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2033(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1346:
               this.client.showWindow();
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
