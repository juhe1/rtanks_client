package package_326
{
   import flash.display.DisplayObjectContainer;
   import flash.events.IEventDispatcher;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class ItemActionPanelEvents implements class_55
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<class_55>;
      
      public function ItemActionPanelEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<class_55>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function updateActionElements(param1:DisplayObjectContainer, param2:IEventDispatcher) : void
      {
         var i:int = 0;
         var m:class_55 = null;
         var actionContainer:DisplayObjectContainer = param1;
         var garageWindowDispatcher:IEventDispatcher = param2;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = class_55(this.impl[i]);
               m.updateActionElements(actionContainer,garageWindowDispatcher);
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function handleDoubleClickOnItemPreview() : void
      {
         var i:int = 0;
         var m:class_55 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = class_55(this.impl[i]);
               m.handleDoubleClickOnItemPreview();
               i++;
            }
            return;
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
