package package_434
{
   import flash.events.Event;
   import package_433.ItemViewCategoryEnum;
   
   public class name_2623 extends Event
   {
      
      public static const name_2632:String = "CategoryButtonsListEvent:CategorySelected";
       
      
      private var category:ItemViewCategoryEnum;
      
      public function name_2623(param1:String, param2:ItemViewCategoryEnum)
      {
         super(param1);
         this.category = param2;
      }
      
      public function getCategory() : ItemViewCategoryEnum
      {
         return this.category;
      }
   }
}
