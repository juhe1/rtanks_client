package package_178
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import projects.tanks.client.panel.model.quest.QuestTypeEnum;
   
   public class QuestNotifierServiceImpl extends EventDispatcher implements name_542
   {
       
      
      private var var_1127:Dictionary;
      
      public function QuestNotifierServiceImpl()
      {
         var _loc1_:QuestTypeEnum = null;
         this.var_1127 = new Dictionary();
         super();
         for each(_loc1_ in QuestTypeEnum.method_393)
         {
            this.var_1127[_loc1_] = false;
         }
      }
      
      public function method_1364(param1:QuestTypeEnum) : Boolean
      {
         return this.var_1127[param1];
      }
      
      public function method_1361(param1:QuestTypeEnum) : void
      {
         this.var_1127[param1] = true;
         this.showNotification(param1);
      }
      
      public function method_1363(param1:QuestTypeEnum) : void
      {
         this.var_1127[param1] = false;
         this.hideNotification(param1);
      }
      
      public function method_1362() : Boolean
      {
         var _loc1_:Boolean = false;
         for each(_loc1_ in this.var_1127)
         {
            if(_loc1_)
            {
               return false;
            }
         }
         return true;
      }
      
      private function showNotification(param1:QuestTypeEnum) : void
      {
         dispatchEvent(new name_1860(name_1860.name_1859,param1));
      }
      
      private function hideNotification(param1:QuestTypeEnum = null) : void
      {
         dispatchEvent(new name_1860(name_1860.name_1847,param1));
      }
   }
}
