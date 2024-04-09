package package_264
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class class_61 extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_1672;
      
      private var client:name_814;
      
      private var var_25:Long;
      
      private var var_964:Long;
      
      private var var_967:name_860;
      
      private var var_965:Long;
      
      private var var_963:Long;
      
      private var var_966:name_860;
      
      private var var_968:name_860;
      
      public function class_61()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_814(this);
         this.var_25 = Long.getLong(1481647778,-291699533);
         this.var_964 = Long.getLong(1809738995,677658011);
         this.var_965 = Long.getLong(527428095,-1647091354);
         this.var_963 = Long.getLong(2122248367,-1459259159);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_1672(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_964:
               this.client.beginLayoutSwitch(LayoutState(this.var_967.decode(param2)));
               break;
            case this.var_965:
               this.client.name_1673();
               break;
            case this.var_963:
               this.client.endLayoutSwitch(LayoutState(this.var_966.decode(param2)),LayoutState(this.var_968.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
