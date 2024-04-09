package package_235
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_38.name_860;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class ClanFriendsModelBase extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2053;
      
      private var client:name_635;
      
      private var var_25:Long;
      
      private var var_1378:Long;
      
      private var var_1383:name_860;
      
      private var var_1380:Long;
      
      private var var_1382:name_860;
      
      private var var_1379:Long;
      
      private var var_1381:name_860;
      
      public function ClanFriendsModelBase()
      {
         this.var_531 = name_840(OSGi.getInstance().getService(name_840));
         this.client = name_635(this);
         this.var_25 = Long.getLong(1889621503,1893984398);
         this.var_1378 = Long.getLong(2135860306,-1585042188);
         this.var_1380 = Long.getLong(526095397,633372847);
         this.var_1379 = Long.getLong(489547868,-896284526);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2053(name_66(this));
      }
      
      protected function method_771() : name_2052
      {
         return name_2052(var_19[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         switch(param1)
         {
            case this.var_1378:
               this.client.method_1574(Long(this.var_1383.decode(param2)));
               break;
            case this.var_1380:
               this.client.method_1573(Long(this.var_1382.decode(param2)));
               break;
            case this.var_1379:
               this.client.method_1572(this.var_1381.decode(param2) as Vector.<Long>);
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
