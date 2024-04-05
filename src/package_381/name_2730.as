package package_381
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.quest.common.gui.window.buttons.name_3311;
   import alternativa.tanks.model.quest.common.gui.window.name_2726;
   import alternativa.tanks.model.quest.daily.name_2138;
   import controls.base.name_1890;
   import flash.events.MouseEvent;
   import package_107.name_326;
   import package_279.class_27;
   import projects.tanks.client.panel.model.quest.QuestTypeEnum;
   
   public class name_2730 extends name_2726
   {
      
      public static var var_644:class_27 = OSGi.getInstance().name_6(class_27) as class_27;
       
      
      public function name_2730(param1:name_326)
      {
         super(param1);
      }
      
      private function method_3040() : name_326
      {
         return name_326(var_3356);
      }
      
      override protected function method_3024() : name_1890
      {
         if(var_3356.progress >= var_3356.finishCriteria)
         {
            return method_3026();
         }
         return this.method_3042();
      }
      
      private function method_3042() : name_1890
      {
         var _loc1_:name_3311 = new name_3311();
         _loc1_.addEventListener(MouseEvent.CLICK,this.method_3041,false,0,true);
         if(this.method_3040().canSkipForFree)
         {
            _loc1_.name_3313();
         }
         else
         {
            _loc1_.showButtonWithCrystals(this.method_3040().skipCost);
         }
         return name_1890(_loc1_);
      }
      
      private function method_3041(param1:MouseEvent) : void
      {
         if(this.method_3040().canSkipForFree || Boolean(var_644.checkEnough(this.method_3040().skipCost)))
         {
            dispatchEvent(new name_2138(name_2138.DAILY_QUEST_CHANGE,this.method_3040()));
         }
      }
      
      public function name_2732(param1:name_326) : void
      {
         this.var_3356 = param1;
         questImage.bitmapData = param1.image.data;
         var_3357.name_3312(param1);
      }
      
      public function name_2733(param1:int) : void
      {
         this.method_3040().canSkipForFree = false;
         this.method_3040().skipCost = param1;
         name_3311(var_1384).showButtonWithCrystals(param1);
      }
      
      public function name_2731() : Boolean
      {
         return var_1384 is name_3311;
      }
      
      public function name_2735() : void
      {
         var_1384.enabled = false;
      }
      
      public function name_2734() : void
      {
         var_1384.enabled = true;
      }
      
      override public function destroy() : void
      {
         super.destroy();
         if(var_1384 is name_3311)
         {
            if(var_1384.hasEventListener(MouseEvent.CLICK))
            {
               var_1384.removeEventListener(MouseEvent.CLICK,this.method_3041);
            }
            (var_1384 as name_3311).method_91();
         }
      }
      
      override public function getQuestType() : QuestTypeEnum
      {
         return QuestTypeEnum.DAILY;
      }
   }
}
