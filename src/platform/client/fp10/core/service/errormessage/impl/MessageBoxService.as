package platform.client.fp10.core.service.errormessage.impl
{
   import alternativa.osgi.OSGi;
   import package_12.name_24;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.errormessage.IMessageBox;
   import platform.client.fp10.core.service.errormessage.errors.ErrorType;
   
   public class MessageBoxService implements IErrorMessageService
   {
       
      
      private var osgi:OSGi;
      
      private var window:IMessageBox;
      
      public function MessageBoxService(param1:OSGi)
      {
         super();
         this.osgi = param1;
         this.window = new DefaultMessageWindow();
      }
      
      public function showMessage(param1:ErrorType) : void
      {
         var _loc2_:name_24 = name_24(this.osgi.getService(name_24));
         _loc2_.stage.addChild(this.window.getDisplayObject(param1));
      }
      
      public function hideMessage() : void
      {
         this.window.hide();
      }
      
      public function setMessageBox(param1:IMessageBox) : void
      {
         this.window = param1;
      }
   }
}
