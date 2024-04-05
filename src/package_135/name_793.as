package package_135
{
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public interface name_793
   {
       
      
      function layoutSwitchPredicted() : void;
      
      function isSwitchInProgress() : Boolean;
      
      function getCurrentState() : LayoutState;
      
      function inBattle() : Boolean;
   }
}
