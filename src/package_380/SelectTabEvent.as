package package_380
{
   import flash.events.Event;
   import projects.tanks.client.panel.model.quest.QuestTypeEnum;
   
   public class SelectTabEvent extends Event
   {
      
      public static var name_1840:String = "QUESTS_WINDOW_SELECT_TAB_EVENT";
       
      
      public var name_1842:QuestTypeEnum;
      
      public function SelectTabEvent(param1:QuestTypeEnum)
      {
         super(name_1840);
         this.name_1842 = param1;
      }
   }
}
