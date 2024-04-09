package alternativa.tanks.model.quest.common.gui
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.dailyquests.window.WeeklyQuestInfoPanel;
   import alternativa.tanks.model.quest.common.gui.window.QuestWindow;
   import alternativa.tanks.model.quest.common.gui.window.name_1835;
   import alternativa.tanks.model.quest.common.gui.window.name_2726;
   import alternativa.tanks.model.quest.common.gui.window.name_2727;
   import flash.display.Sprite;
   import package_115.class_60;
   import package_118.QuestLevel;
   import package_126.name_338;
   import package_54.name_102;
   
   public class CommonQuestTab extends name_1835
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
      
      public static const const_2043:int = 280;
      
      public static const const_2042:int = 300;
      
      public static const const_1530:int = 50;
       
      
      private var var_2546:WeeklyQuestInfoPanel;
      
      protected var var_2545:Vector.<name_2726>;
      
      private var var_2547:Vector.<name_2727>;
      
      protected var var_2548:int;
      
      public function CommonQuestTab()
      {
         super();
         this.var_2545 = new Vector.<name_2726>();
         this.var_2547 = new Vector.<name_2727>();
      }
      
      private function method_2526() : void
      {
         this.var_2546 = new WeeklyQuestInfoPanel();
         this.var_2546.x = 0;
         this.var_2546.y = 0;
         addChild(this.var_2546);
      }
      
      public function method_1336(param1:int) : void
      {
         this.var_2548 = param1;
      }
      
      public function method_2527(param1:Vector.<class_60>, param2:name_338) : void
      {
         var _loc3_:QuestLevel = null;
         var _loc4_:class_60 = null;
         this.method_2521();
         this.method_2526();
         for each(_loc3_ in QuestLevel.method_393)
         {
            _loc4_ = this.method_2525(_loc3_,param1);
            if(_loc4_ != null)
            {
               this.method_2522(_loc4_);
            }
            else
            {
               this.method_2518(_loc3_.value);
            }
         }
         this.var_2546.init(param2);
         this.var_2546.method_1791(280 * 3 + 11);
      }
      
      protected function method_2521() : void
      {
         var _loc1_:name_2726 = null;
         var _loc2_:name_2727 = null;
         for each(_loc1_ in this.var_2545)
         {
            this.method_2520(_loc1_);
         }
         this.var_2545.splice(0,this.var_2545.length);
         for each(_loc2_ in this.var_2547)
         {
            if(this.contains(_loc2_))
            {
               removeChild(_loc2_);
            }
            _loc2_.destroy();
         }
         this.var_2547.slice(0,this.var_2547.length);
      }
      
      protected function method_2520(param1:name_2726) : void
      {
         removeChild(param1);
         param1.destroy();
      }
      
      private function method_2525(param1:QuestLevel, param2:Vector.<class_60>) : class_60
      {
         var _loc3_:class_60 = null;
         for each(_loc3_ in param2)
         {
            if(_loc3_.level == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      protected function method_2522(param1:class_60) : void
      {
         var _loc2_:int = param1.level.value;
         var _loc3_:name_2726 = this.method_2524(param1);
         this.method_2519(_loc3_,_loc2_);
         this.var_2545.push(_loc3_);
         addChild(_loc3_);
      }
      
      protected function method_2524(param1:class_60) : name_2726
      {
         return null;
      }
      
      private function method_2519(param1:Sprite, param2:int) : void
      {
         param1.x = (280 + QuestWindow.const_1516 - 2) * param2;
         param1.y = 60;
      }
      
      protected function method_2518(param1:int) : void
      {
         var _loc2_:name_2727 = new name_2727(280,300 + QuestWindow.const_1516 + 50,this.method_2523(),this.var_2548);
         this.method_2519(_loc2_,param1);
         this.var_2547.push(_loc2_);
         addChild(_loc2_);
      }
      
      protected function method_2523() : String
      {
         return null;
      }
      
      public function takePrize(param1:String) : void
      {
         var _loc2_:name_2726 = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_2545.length)
         {
            _loc2_ = this.var_2545[_loc3_];
            if(_loc2_.name_2728() == param1)
            {
               this.var_2545.splice(_loc3_,1);
               this.method_2520(_loc2_);
               this.method_2518(_loc2_.name_2729().value);
               break;
            }
            _loc3_++;
         }
      }
      
      override public function close() : void
      {
         this.method_2521();
      }
   }
}
