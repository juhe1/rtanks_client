package alternativa.tanks.models.user
{
   import flash.events.EventDispatcher;
   import package_13.Long;
   import package_190.name_571;
   import package_192.name_574;
   import package_193.name_583;
   import platform.client.fp10.core.type.name_202;
   import platform.client.fp10.core.type.name_70;
   
   public class name_54 extends EventDispatcher implements name_65
   {
       
      
      private var var_255:name_70;
      
      private var var_256:Boolean;
      
      private var var_257:name_70;
      
      private var var_258:Boolean;
      
      private var var_259:Boolean;
      
      public function name_54()
      {
         super();
      }
      
      public function get userObject() : name_70
      {
         return this.var_255;
      }
      
      public function set userObject(param1:name_70) : void
      {
         this.var_255 = param1;
      }
      
      public function method_355(param1:Long) : name_70
      {
         return this.userObject.space.getObject(param1);
      }
      
      public function get hasClanLicense() : Boolean
      {
         return this.var_256;
      }
      
      public function set hasClanLicense(param1:Boolean) : void
      {
         this.var_256 = param1;
      }
      
      public function get licenseGarageObject() : name_70
      {
         return this.var_257;
      }
      
      public function set licenseGarageObject(param1:name_70) : void
      {
         this.var_257 = param1;
      }
      
      public function get otherClan() : Boolean
      {
         return this.var_258;
      }
      
      public function set otherClan(param1:Boolean) : void
      {
         this.var_258 = param1;
      }
      
      public function get showBuyLicenseButton() : Boolean
      {
         return this.var_259;
      }
      
      public function set showBuyLicenseButton(param1:Boolean) : void
      {
         this.var_259 = param1;
      }
      
      public function method_358(param1:String) : Boolean
      {
         var _loc2_:Vector.<Long> = name_583(this.var_255.name_176(name_583)).getOutgoingClans();
         return this.method_359(_loc2_,param1);
      }
      
      public function method_356(param1:String) : Boolean
      {
         var _loc2_:Vector.<Long> = name_574(this.var_255.name_176(name_574)).getIncomingClans();
         return this.method_359(_loc2_,param1);
      }
      
      private function method_359(param1:Vector.<Long>, param2:String) : Boolean
      {
         var _loc3_:Long = null;
         var _loc4_:String = null;
         var _loc5_:name_202 = this.var_255.space;
         for each(_loc3_ in param1)
         {
            _loc4_ = String(name_571(_loc5_.getObject(_loc3_).name_176(name_571)).getClanName());
            if(param2 == _loc4_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function method_357() : void
      {
         dispatchEvent(new ClanUserServiceEvent(ClanUserServiceEvent.HIDE_CLAN_WINDOW));
      }
   }
}
