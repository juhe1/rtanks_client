package package_380
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.quest.common.gui.window.*;
   import base.class_122;
   import controls.buttons.name_2717;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import package_17.name_44;
   import package_54.name_102;
   import projects.tanks.client.panel.model.quest.QuestTypeEnum;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class QuestTabButtonsList extends class_122
   {
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      public static var var_2541:name_44 = OSGi.getInstance().name_6(name_44) as name_44;
      
      public static var const_1530:int = 30;
      
      private static var const_423:int = 120;
       
      
      private var var_2540:Dictionary;
      
      private var var_2542:Vector.<name_2716>;
      
      private var var_2539:QuestTypeEnum;
      
      private var var_2538:int = 0;
      
      public function QuestTabButtonsList()
      {
         this.var_2540 = new Dictionary();
         this.var_2542 = new Vector.<name_2716>();
         super();
      }
      
      public function name_1839(param1:QuestTypeEnum) : void
      {
         var _loc2_:name_2716 = null;
         switch(param1)
         {
            case QuestTypeEnum.MAIN:
               _loc2_ = this.method_2512(QuestTypeEnum.MAIN,localeService.getText(name_390.const_1207));
               _loc2_.name_1146(name_2717.name_2718());
               _loc2_.enabled = false;
               this.method_2513(_loc2_);
               break;
            case QuestTypeEnum.DAILY:
               this.method_2513(this.method_2512(QuestTypeEnum.DAILY,localeService.getText(name_390.const_1010)));
               break;
            case QuestTypeEnum.WEEKLY:
               this.method_2513(this.method_2512(QuestTypeEnum.WEEKLY,localeService.getText(name_390.const_994)));
               break;
            case QuestTypeEnum.CHALLENGE:
               _loc2_ = this.method_2512(QuestTypeEnum.CHALLENGE,localeService.getText(name_390.const_1432));
               if(!var_2541.method_277())
               {
                  _loc2_.name_1146(name_2717.name_2718());
                  _loc2_.enabled = false;
               }
               this.method_2513(_loc2_);
         }
      }
      
      private function method_2513(param1:name_2716) : void
      {
         var _loc2_:int = this.var_2538 == 0 ? int(0) : int(QuestWindow.const_1516);
         param1.x = this.var_2538 + _loc2_;
         this.var_2538 += const_423 + _loc2_;
         addChild(param1);
      }
      
      private function method_2512(param1:QuestTypeEnum, param2:String) : name_2716
      {
         var _loc3_:name_2716 = new name_2716(param1,param2);
         this.var_2540[param1] = _loc3_;
         this.var_2542.push(_loc3_);
         _loc3_.addEventListener(MouseEvent.CLICK,this.method_1582);
         return _loc3_;
      }
      
      private function method_1582(param1:MouseEvent) : void
      {
         var _loc2_:QuestTypeEnum = param1.currentTarget.getQuestType();
         if(this.var_2539 != _loc2_)
         {
            this.name_1841(_loc2_);
         }
      }
      
      public function name_1841(param1:QuestTypeEnum) : void
      {
         if(Boolean(this.var_2539))
         {
            this.var_2540[this.var_2539].enabled = true;
         }
         this.var_2540[param1].enabled = false;
         this.var_2539 = param1;
         dispatchEvent(new SelectTabEvent(param1));
      }
      
      override public function get height() : Number
      {
         return const_1530;
      }
      
      override public function get width() : Number
      {
         return this.var_2538;
      }
      
      public function destroy() : void
      {
         var _loc1_:name_2716 = null;
         for each(_loc1_ in this.var_2542)
         {
            _loc1_.removeEventListener(MouseEvent.CLICK,this.method_1582);
         }
      }
   }
}
