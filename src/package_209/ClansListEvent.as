package package_209
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import package_13.Long;
   
   public class ClansListEvent extends Event
   {
      
      public static const REMOVE:String = "ClansListEvent.REMOVE";
      
      public static const ADD:String = "ClansListEvent.ADD";
      
      public static const INCOMING:String = "ClansListEvent.INCOMING";
      
      public static const OUTGOING:String = "ClansListEvent.OUTGOING";
      
      private static var dispatcher:EventDispatcher;
       
      
      public var clanId:Long;
      
      public function ClansListEvent(param1:String, param2:Long, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.clanId = param2;
      }
      
      public static function name_1886() : EventDispatcher
      {
         if(dispatcher == null)
         {
            dispatcher = new EventDispatcher();
         }
         return dispatcher;
      }
   }
}
