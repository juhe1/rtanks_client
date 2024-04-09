package package_93
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
   
   public class DiscreteWeaponCommunicationModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:DiscreteWeaponCommunicationModelServer;
      
      private var client:name_303;
      
      private var var_25:Long;
      
      private var var_645:Long;
      
      private var var_648:name_860;
      
      private var var_647:name_860;
      
      private var var_646:name_860;
      
      public function DiscreteWeaponCommunicationModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_303(this);
         this.var_25 = Long.getLong(486222912,-663069007);
         this.var_645 = Long.getLong(1666638426,-1858765435);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new DiscreteWeaponCommunicationModelServer(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_645:
               this.client.shoot(name_70(this.var_648.decode(param2)),Vector3d(this.var_647.decode(param2)),this.var_646.decode(param2) as Vector.<name_1243>);
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
