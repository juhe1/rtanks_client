package package_255
{
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import package_113.SocialNetworkPanelModelBase;
   import package_113.name_344;
   import package_113.name_362;
   import package_124.name_42;
   import package_137.name_358;
   import package_180.SocialNetworkServiceEvent;
   import package_180.name_544;
   import package_397.name_2102;
   import package_54.name_102;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class SocialNetworkPanelModel extends SocialNetworkPanelModelBase implements name_362, name_170, name_287
   {
      
      public static var socialNetworkService:name_544;
      
      public static var localeService:name_102;
      
      public static var alertService:name_42;
       
      
      public function SocialNetworkPanelModel()
      {
         super();
      }
      
      private static function method_1685(param1:String) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("newPopup",param1);
         }
         else
         {
            navigateToURL(new URLRequest(param1));
         }
      }
      
      public function objectLoaded() : void
      {
         this.method_1689();
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.CREATE_LINK,method_39(this.method_1686));
         socialNetworkService.addEventListener(SocialNetworkServiceEvent.UNLINK,method_39(this.method_1687));
      }
      
      private function method_1689() : void
      {
         var _loc1_:name_344 = null;
         socialNetworkService.passwordCreated = method_771().passwordCreated;
         for each(_loc1_ in method_771().socialNetworkParams)
         {
            socialNetworkService.method_1312(_loc1_.snId,_loc1_.enabled);
            socialNetworkService.method_1313(_loc1_.snId,_loc1_.linkExists);
         }
      }
      
      public function objectUnloaded() : void
      {
         socialNetworkService.removeEventListener(SocialNetworkServiceEvent.CREATE_LINK,method_39(this.method_1686));
         socialNetworkService.removeEventListener(SocialNetworkServiceEvent.UNLINK,method_39(this.method_1687));
      }
      
      private function method_1687(param1:SocialNetworkServiceEvent) : void
      {
         if(socialNetworkService.passwordCreated)
         {
            server.name_2105(param1.name_2104);
         }
         else
         {
            alertService.showAlert(localeService.getText(name_390.const_816,name_2102.name_2103(param1.name_2104)),Vector.<String>([localeService.getText(name_358.OK)]));
         }
      }
      
      private function method_1686(param1:SocialNetworkServiceEvent) : void
      {
         var _loc2_:String = this.method_1688(param1.name_2104);
         if(Boolean(_loc2_))
         {
            method_1685(_loc2_);
         }
      }
      
      private function method_1688(param1:String) : String
      {
         var _loc2_:name_344 = null;
         for each(_loc2_ in method_771().socialNetworkParams)
         {
            if(_loc2_.snId == param1)
            {
               return _loc2_.authorizationUrl;
            }
         }
         return null;
      }
      
      public function method_1112() : void
      {
         alertService.showAlert(localeService.getText(name_390.const_889),Vector.<String>([localeService.getText(name_358.OK)]));
      }
      
      public function method_1111(param1:String) : void
      {
         alertService.showAlert(localeService.getText(name_390.const_1419,name_2102.name_2103(param1)),Vector.<String>([localeService.getText(name_358.OK)]));
      }
      
      public function linkCreated(param1:String) : void
      {
         socialNetworkService.method_1309(param1);
         alertService.showAlert(localeService.getText(name_390.const_716),Vector.<String>([localeService.getText(name_358.OK)]));
      }
      
      public function unlinkSuccess(param1:String) : void
      {
         socialNetworkService.method_1315(param1);
         alertService.showAlert(localeService.getText(name_390.const_1303,name_2102.name_2103(param1)),Vector.<String>([localeService.getText(name_358.OK)]));
      }
   }
}
