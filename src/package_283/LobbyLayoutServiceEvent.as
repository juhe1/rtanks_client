package package_283
{
   import flash.events.Event;
   import package_53.name_2240;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class LobbyLayoutServiceEvent extends Event
   {
      
      public static const BEGIN_LAYOUT_SWITCH:String = name_2240.BEGIN_LAYOUT_SWITCH;
      
      public static const END_LAYOUT_SWITCH:String = name_2240.END_LAYOUT_SWITCH;
       
      
      public var state:LayoutState;
      
      public function LobbyLayoutServiceEvent(param1:String, param2:LayoutState)
      {
         super(param1);
         this.state = param2;
      }
   }
}
