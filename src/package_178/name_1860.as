package package_178
{
   import flash.events.Event;
   import projects.tanks.client.panel.model.quest.QuestTypeEnum;
   
   public class name_1860 extends Event
   {
      
      public static const name_1859:String = "showNotification";
      
      public static const name_1847:String = "hideNotification";
       
      
      public var var_2565:QuestTypeEnum;
      
      public function name_1860(param1:String, param2:QuestTypeEnum = null)
      {
         super(param1,true);
         this.var_2565 = param2;
      }
   }
}
