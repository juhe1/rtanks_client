package package_135
{
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class ILobbyLayoutNotifyEvents implements name_793
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_793>;
      
      public function ILobbyLayoutNotifyEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_793>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function layoutSwitchPredicted() : void
      {
         var i:int = 0;
         var m:name_793 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.layoutSwitchPredicted();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function isSwitchInProgress() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:name_793 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = Boolean(m.isSwitchInProgress());
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function getCurrentState() : LayoutState
      {
         var result:LayoutState = null;
         var i:int = 0;
         var m:name_793 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getCurrentState();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
      
      public function inBattle() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:name_793 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = Boolean(m.inBattle());
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
