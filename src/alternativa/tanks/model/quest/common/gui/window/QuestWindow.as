package alternativa.tanks.model.quest.common.gui.window
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.quest.common.gui.CommonQuestTab;
   import alternativa.tanks.model.quest.common.name_551;
   import controls.base.name_998;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import forms.name_1838;
   import package_280.MainButtonBarEvents;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_379.class_123;
   import package_380.QuestTabButtonsList;
   import package_380.SelectTabEvent;
   import package_381.DailyQuestTab;
   import package_382.name_1836;
   import package_383.name_1837;
   import package_54.name_102;
   import projects.tanks.client.panel.model.quest.QuestTypeEnum;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class QuestWindow extends class_123 implements name_551
   {
      
      public static const const_1517:int = 12;
      
      public static const const_1516:int = 8;
      
      public static const const_1518:int = 876;
      
      public static const const_1519:int = 518;
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
       
      
      private var var_1120:Boolean;
      
      private var window:name_1838;
      
      private var var_1117:QuestTabButtonsList;
      
      private var name_983:name_998;
      
      private var var_1119:Dictionary;
      
      private var var_1118:name_1835 = null;
      
      private var var_1121:Boolean = false;
      
      public function QuestWindow()
      {
         this.var_1119 = new Dictionary();
         super();
         this.method_1329();
      }
      
      public function method_1317() : void
      {
         if(!this.var_1121)
         {
            PanelModel(OSGi.getInstance().name_6(name_115)).getPanel().buttonBar.addEventListener(MainButtonBarEvents.name_1024,this.method_515);
            this.method_1327();
            this.method_1325();
            this.method_1331();
            this.var_1121 = true;
         }
      }
      
      private function method_1329() : void
      {
         this.method_1324();
         this.method_1326();
      }
      
      private function method_515(param1:MainButtonBarEvents) : void
      {
         if(param1.name_982 == MainButtonBarEvents.name_1046)
         {
            this.method_1318(QuestTypeEnum.DAILY);
         }
      }
      
      private function method_1325() : void
      {
         var _loc1_:name_1835 = null;
         this.var_1117 = new QuestTabButtonsList();
         this.var_1117.name_1839(QuestTypeEnum.DAILY);
         this.var_1117.name_1839(QuestTypeEnum.CHALLENGE);
         this.var_1117.x = 12;
         this.var_1117.y = 12;
         addChild(this.var_1117);
         this.var_1117.name_1841(QuestTypeEnum.DAILY);
         for each(_loc1_ in this.var_1119)
         {
            this.method_1332(_loc1_);
         }
      }
      
      private function method_1327() : void
      {
         this.window = name_1838.name_1844(localeService.getText(name_390.const_1140),876,518);
         addChild(this.window);
      }
      
      private function method_1331() : void
      {
         this.name_983 = new name_998();
         this.name_983.label = localeService.getText(name_390.const_1168);
         this.name_983.x = 876 - this.name_983.width - 12;
         this.name_983.y = 518 - this.name_983.height - 12;
         this.window.addChild(this.name_983);
      }
      
      private function method_1324() : void
      {
         var _loc1_:DailyQuestTab = new DailyQuestTab();
         this.var_1119[QuestTypeEnum.DAILY] = _loc1_;
      }
      
      private function method_1335() : void
      {
      }
      
      private function method_1326() : void
      {
         var _loc1_:name_1836 = new name_1836();
         this.var_1119[QuestTypeEnum.CHALLENGE] = _loc1_;
      }
      
      private function method_1332(param1:name_1835) : void
      {
         param1.x = 12;
         param1.y = this.var_1117.y + this.var_1117.height + 8;
      }
      
      private function method_1321(param1:SelectTabEvent) : void
      {
         this.method_1322(param1.name_1842);
      }
      
      private function method_1322(param1:QuestTypeEnum) : void
      {
         if(this.var_1118 != null && this.window.contains(this.var_1118))
         {
            this.var_1118.hide();
            this.window.removeChild(this.var_1118);
         }
         var _loc2_:name_1835 = this.var_1119[param1];
         if(_loc2_ != null)
         {
            this.var_1118 = _loc2_;
            this.window.addChild(this.var_1118);
            this.var_1118.show();
         }
      }
      
      private function method_1323(param1:MouseEvent = null) : void
      {
         this.method_1145();
      }
      
      public function method_1145() : void
      {
         var _loc1_:name_1835 = null;
         if(!this.var_1120)
         {
            return;
         }
         this.method_91();
         dispatchEvent(new name_1837(name_1837.name_1843));
         this.method_1330();
         for each(_loc1_ in this.var_1119)
         {
            _loc1_.close();
         }
         var_864.name_1013(this);
         this.var_1120 = false;
      }
      
      private function method_1330() : void
      {
         if(this.var_1118 != null && this.window.contains(this.var_1118))
         {
            this.window.removeChild(this.var_1118);
         }
         this.var_1118 = null;
      }
      
      private function method_91() : void
      {
         this.var_1117.removeEventListener(SelectTabEvent.name_1840,this.method_1321);
         this.name_983.removeEventListener(MouseEvent.CLICK,this.method_1323);
      }
      
      override protected function method_1319() : void
      {
         this.method_1145();
      }
      
      override protected function method_1320() : void
      {
         this.method_1145();
      }
      
      override public function get width() : Number
      {
         return this.window.width;
      }
      
      public function method_1334(param1:QuestTypeEnum) : CommonQuestTab
      {
         return this.var_1119[param1];
      }
      
      public function name_552() : DailyQuestTab
      {
         return this.var_1119[QuestTypeEnum.DAILY];
      }
      
      public function method_1333() : *
      {
         return null;
      }
      
      public function name_553() : name_1836
      {
         return this.var_1119[QuestTypeEnum.CHALLENGE];
      }
      
      public function method_1318(param1:QuestTypeEnum) : void
      {
         if(this.var_1120)
         {
            return;
         }
         this.var_1120 = true;
         this.var_1117.name_1841(param1);
         this.method_1322(param1);
         this.method_1328();
         var_864.name_1585(this);
      }
      
      private function method_1328() : void
      {
         this.var_1117.addEventListener(SelectTabEvent.name_1840,this.method_1321);
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_1323);
      }
      
      public function isWindowOpen() : Boolean
      {
         return this.var_1120;
      }
   }
}
