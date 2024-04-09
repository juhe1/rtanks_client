package package_62
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import package_67.Vector3d;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class LaserPointerModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:LaserPointerModelServer;
      
      private var client:name_317;
      
      private var var_25:Long;
      
      private var var_695:Long;
      
      private var var_700:name_860;
      
      private var var_699:name_860;
      
      private var var_696:Long;
      
      private var var_697:Long;
      
      private var var_698:name_860;
      
      public function LaserPointerModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_317(this);
         this.var_25 = Long.getLong(1691794381,-1794202080);
         this.var_695 = Long.getLong(2087187664,-1594727181);
         this.var_696 = Long.getLong(1056602643,1332983261);
         this.var_697 = Long.getLong(1740337189,-128463099);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new LaserPointerModelServer(name_66(this));
      }
      
      protected function method_771() : name_137
      {
         return name_137(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_695:
               this.client.aimRemoteAtTank(name_70(this.var_700.decode(param2)),Vector3d(this.var_699.decode(param2)));
               break;
            case this.var_696:
               this.client.hideRemote();
               break;
            case this.var_697:
               this.client.updateRemoteDirection(Number(this.var_698.decode(param2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
