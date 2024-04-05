package alternativa.tanks.models.user
{
   import flash.events.IEventDispatcher;
   import package_13.Long;
   import platform.client.fp10.core.type.name_70;
   
   public interface name_65 extends IEventDispatcher
   {
       
      
      function get userObject() : name_70;
      
      function set userObject(param1:name_70) : void;
      
      function method_355(param1:Long) : name_70;
      
      function get hasClanLicense() : Boolean;
      
      function set hasClanLicense(param1:Boolean) : void;
      
      function set licenseGarageObject(param1:name_70) : void;
      
      function get licenseGarageObject() : name_70;
      
      function get otherClan() : Boolean;
      
      function set otherClan(param1:Boolean) : void;
      
      function get showBuyLicenseButton() : Boolean;
      
      function set showBuyLicenseButton(param1:Boolean) : void;
      
      function method_358(param1:String) : Boolean;
      
      function method_356(param1:String) : Boolean;
      
      function method_357() : void;
   }
}
