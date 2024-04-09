package projects.tanks.client.panel.model.donationalert
{
   import alternativa.osgi.OSGi;
   import package_117.name_404;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class class_152 extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2098;
      
      private var client:name_388;
      
      private var var_25:Long;
      
      private var var_1467:Long;
      
      private var var_1470:name_860;
      
      private var var_1469:Long;
      
      private var var_1474:name_860;
      
      private var var_1468:Long;
      
      private var var_1473:name_860;
      
      private var var_1466:Long;
      
      private var var_1471:name_860;
      
      private var var_1465:Long;
      
      private var var_1472:name_860;
      
      public function class_152()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_388(this);
         this.var_25 = Long.getLong(790638048,-212453148);
         this.var_1467 = Long.getLong(1759230741,1008086188);
         this.var_1469 = Long.getLong(268614093,535858133);
         this.var_1468 = Long.getLong(1383818686,-1315591703);
         this.var_1466 = Long.getLong(1589408480,-2143336969);
         this.var_1465 = Long.getLong(1383818686,-1315475876);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2098(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1467:
               this.client.showDonationAlert(name_404(this.var_1470.decode(param2)));
               break;
            case this.var_1469:
               this.client.method_1099(name_404(this.var_1474.decode(param2)));
               break;
            case this.var_1468:
               this.client.method_1102(String(this.var_1473.decode(param2)));
               break;
            case this.var_1466:
               this.client.method_1101(String(this.var_1471.decode(param2)));
               break;
            case this.var_1465:
               this.client.method_1100(String(this.var_1472.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
