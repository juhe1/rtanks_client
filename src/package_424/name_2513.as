package package_424
{
   import flash.events.Event;
   import package_130.name_348;
   
   public class name_2513 extends Event
   {
      
      public static const NEWS_ITEM_INITED:String = "NewsTabNewsItemAddedEvent.NEWS_ITEM_INITED";
       
      
      public var news:Vector.<name_348>;
      
      public function name_2513(param1:Vector.<name_348>)
      {
         this.news = param1;
         super("NewsTabNewsItemAddedEvent.NEWS_ITEM_INITED",true);
      }
   }
}
