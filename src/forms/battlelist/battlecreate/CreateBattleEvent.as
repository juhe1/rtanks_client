package forms.battlelist.battlecreate
{
   import flash.events.Event;
   import package_413.name_2283;
   
   public class CreateBattleEvent extends Event
   {
      
      public static const CREATE_BATTLE:String = "CreateBattleEvent.CREATE_BATTLE";
       
      
      public var name_2284:name_2283;
      
      public function CreateBattleEvent(param1:name_2283)
      {
         super("CreateBattleEvent.CREATE_BATTLE");
         this.name_2284 = param1;
      }
   }
}
