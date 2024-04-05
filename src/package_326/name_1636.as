package package_326
{
   import flash.display.DisplayObjectContainer;
   import flash.events.IEventDispatcher;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1636 implements class_55
   {
       
      
      private var object:name_70;
      
      private var impl:class_55;
      
      public function name_1636(param1:name_70, param2:class_55)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function updateActionElements(param1:DisplayObjectContainer, param2:IEventDispatcher) : void
      {
         var actionContainer:DisplayObjectContainer = param1;
         var garageWindowDispatcher:IEventDispatcher = param2;
         try
         {
            Model.object = this.object;
            this.impl.updateActionElements(actionContainer,garageWindowDispatcher);
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function handleDoubleClickOnItemPreview() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.handleDoubleClickOnItemPreview();
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
