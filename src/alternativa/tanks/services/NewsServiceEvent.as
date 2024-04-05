package alternativa.tanks.services
{
   import flash.events.Event;
   import package_13.Long;
   import package_130.name_348;
   
   public class NewsServiceEvent extends Event
   {
      
      public static const NEWS_ITEM_IS_SENT:String = "NewsServiceEvent.NEWS_ITEM_IS_SENT";
      
      public static const NEWS_ITEM_IS_REMOVED:String = "NewsServiceEvent.NEWS_ITEM_IS_REMOVED";
       
      
      private var var_3278:name_348;
      
      private var var_3277:Long;
      
      public function NewsServiceEvent(param1:String)
      {
         super(param1,true,false);
      }
      
      public function name_3088() : name_348
      {
         return this.var_3278;
      }
      
      public function name_2660(param1:name_348) : void
      {
         this.var_3278 = param1;
      }
      
      public function name_3091() : Long
      {
         return this.var_3277;
      }
      
      public function name_2659(param1:Long) : void
      {
         this.var_3277 = param1;
      }
   }
}
