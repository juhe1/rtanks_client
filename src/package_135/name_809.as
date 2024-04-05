package package_135
{
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class name_809 implements name_793
   {
       
      
      private var object:name_70;
      
      private var impl:name_793;
      
      public function name_809(param1:name_70, param2:name_793)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function layoutSwitchPredicted() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.layoutSwitchPredicted();
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function isSwitchInProgress() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = Boolean(this.impl.isSwitchInProgress());
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
         try
         {
            Model.object = this.object;
            result = this.impl.getCurrentState();
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
         try
         {
            Model.object = this.object;
            result = Boolean(this.impl.inBattle());
         }
         finally
         {
            Model.method_38();
         }
         return result;
      }
   }
}
