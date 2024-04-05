package package_267
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class class_157 extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2157;
      
      private var client:name_803;
      
      private var var_25:Long;
      
      private var var_1594:Long;
      
      private var var_1595:name_860;
      
      private var var_1597:name_860;
      
      private var var_1593:Long;
      
      private var var_1598:name_860;
      
      private var var_1591:Long;
      
      private var var_1600:name_860;
      
      private var var_1596:name_860;
      
      private var var_1592:Long;
      
      private var var_1599:name_860;
      
      public function class_157()
      {
         this.var_531 = name_840(OSGi.getInstance().name_6(name_840));
         this.client = name_803(this);
         this.var_25 = Long.getLong(1726782619,1524609945);
         this.var_1594 = Long.getLong(205404481,2036669945);
         this.var_1593 = Long.getLong(1555095151,929348553);
         this.var_1591 = Long.getLong(1017385554,-1412933910);
         this.var_1592 = Long.getLong(1483129213,1398282388);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2157(name_66(this));
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
