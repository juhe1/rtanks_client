package package_106
{
   import alternativa.tanks.gui.AchievementCongratulationsWindow;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import package_1.Main;
   import package_254.HelpService;
   import package_254.name_791;
   import package_280.MainButtonBarEvents;
   import package_31.name_115;
   import package_344.name_1655;
   import package_344.name_1656;
   import package_344.name_1657;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class AchievementModel
   {
       
      
      private const const_79:String = "GarageModel";
      
      private var var_924:name_1655;
      
      private var var_926:name_1657;
      
      private var var_925:name_1656;
      
      private var var_923:Vector.<Achievement>;
      
      private var var_815:HelpService;
      
      private var window:AchievementCongratulationsWindow;
      
      private var dialogsLayer:DisplayObjectContainer;
      
      private var panelModel:name_115;
      
      private var state:name_1652;
      
      public function AchievementModel()
      {
         super();
         this.var_924 = new name_1655();
         this.var_926 = new name_1657();
         this.var_925 = new name_1656();
         this.var_815 = Main.osgi.getService(name_791) as HelpService;
         this.var_815.name_981("GarageModel",800,this.var_924,false);
         this.var_815.name_981("GarageModel",802,this.var_925,false);
         this.var_923 = new Vector.<Achievement>();
         this.dialogsLayer = Main.dialogsLayer;
      }
      
      public function objectLoaded(param1:Vector.<Achievement>) : void
      {
         this.panelModel = Main.osgi.getService(name_115) as name_115;
         this.method_1150(param1);
      }
      
      private function method_1150(param1:Vector.<Achievement>) : void
      {
         var _loc2_:Achievement = null;
         for each(_loc2_ in param1)
         {
            this.var_923.push(_loc2_);
         }
         if(this.var_923.length != 0)
         {
            this.method_1146();
            this.method_1081();
            Main.stage.addEventListener(Event.RESIZE,this.method_1081);
         }
      }
      
      public function name_449(param1:Achievement) : void
      {
         this.method_1149(param1);
         this.method_1147();
         if(this.panelModel != null)
         {
            this.panelModel.blur();
         }
         var _loc2_:name_102 = name_102(Main.osgi.getService(name_102));
         var _loc3_:String = String(_loc2_.getText(param1 == Achievement.FIRST_PURCHASE ? TextConst.const_279 : TextConst.const_288));
         this.window = new AchievementCongratulationsWindow();
         this.window.init(_loc3_);
         this.dialogsLayer.addChild(this.window);
         this.window.name_1021.addEventListener(MouseEvent.CLICK,this.method_1145);
         this.method_1081();
      }
      
      public function name_477() : void
      {
         this.method_1147();
         if(this.panelModel != null)
         {
            this.panelModel.blur();
         }
         var _loc1_:name_102 = name_102(Main.osgi.getService(name_102));
         var _loc2_:String = String(_loc1_.getText(TextConst.const_244));
         this.window = new AchievementCongratulationsWindow();
         this.window.init(_loc2_);
         this.dialogsLayer.addChild(this.window);
         this.window.name_1021.addEventListener(MouseEvent.CLICK,this.method_1145);
         this.method_1081();
      }
      
      private function method_1145(param1:Event = null) : void
      {
         this.window.name_1021.removeEventListener(MouseEvent.CLICK,this.method_1145);
         this.dialogsLayer.removeChild(this.window);
         if(this.panelModel != null)
         {
            this.panelModel.unblur();
         }
         this.method_1146();
      }
      
      private function method_1147() : void
      {
         var _loc1_:int = 800;
         while(_loc1_ < 803)
         {
            this.var_815.name_1653("GarageModel",_loc1_);
            _loc1_++;
         }
         this.var_815.hideHelp();
      }
      
      private function method_1149(param1:Achievement) : void
      {
         if(this.var_923.indexOf(param1) != -1)
         {
            this.var_923.splice(this.var_923.indexOf(param1),1);
         }
      }
      
      private function method_1148() : Boolean
      {
         if(this.panelModel == null)
         {
            return false;
         }
         return this.panelModel.rank == 1;
      }
      
      private function method_1146() : void
      {
         var _loc2_:Achievement = null;
         var _loc1_:int = 800;
         while(_loc1_ < 803)
         {
            this.var_815.name_1653("GarageModel",_loc1_);
            _loc1_++;
         }
         var _loc3_:int = 0;
         var _loc4_:* = this.var_923;
         for each(_loc2_ in _loc4_)
         {
            if(_loc2_ == Achievement.FIRST_PURCHASE)
            {
               if(this.state != name_1652.GARAGE && this.state != name_1652.BATTLE)
               {
                  this.var_815.name_1654("GarageModel",800);
               }
            }
            else if(this.state != name_1652.BATTLE)
            {
               this.var_815.name_1654("GarageModel",801);
            }
         }
         if(this.method_1148() && this.state == name_1652.BATTLE)
         {
            this.var_815.name_1654("GarageModel",802);
         }
      }
      
      public function method_1151(param1:String) : void
      {
         switch(param1)
         {
            case MainButtonBarEvents.SETTINGS:
               if(this.method_1144(Achievement.SET_EMAIL))
               {
                  this.var_815.name_1653("GarageModel",801);
               }
               this.var_815.name_1653("GarageModel",802);
               break;
            case MainButtonBarEvents.GARAGE:
               if(this.method_1144(Achievement.FIRST_PURCHASE))
               {
                  this.var_815.name_1653("GarageModel",800);
               }
               if(this.method_1144(Achievement.SET_EMAIL))
               {
                  this.var_815.name_1653("GarageModel",801);
               }
               this.var_815.name_1653("GarageModel",802);
               break;
            case MainButtonBarEvents.BATTLE:
               if(this.method_1144(Achievement.FIRST_PURCHASE))
               {
                  this.var_815.name_1653("GarageModel",800);
               }
               if(this.method_1144(Achievement.SET_EMAIL))
               {
                  this.var_815.name_1653("GarageModel",801);
               }
               this.var_815.name_1653("GarageModel",802);
               break;
            case MainButtonBarEvents.HELP:
               if(this.state != name_1652.BATTLE)
               {
                  this.method_1147();
               }
               this.var_815.name_1653("GarageModel",802);
         }
      }
      
      public function name_992(param1:String) : void
      {
         switch(param1)
         {
            case MainButtonBarEvents.GARAGE:
               if(this.method_1144(Achievement.SET_EMAIL) && !this.method_1144(Achievement.FIRST_PURCHASE))
               {
                  this.var_815.name_1654("GarageModel",801);
               }
               this.state = name_1652.GARAGE;
               break;
            case MainButtonBarEvents.BATTLE:
               if(this.method_1144(Achievement.SET_EMAIL) && !this.method_1144(Achievement.FIRST_PURCHASE))
               {
                  this.var_815.name_1654("GarageModel",801);
               }
               if(this.method_1144(Achievement.FIRST_PURCHASE))
               {
                  this.var_815.name_1654("GarageModel",800);
               }
               this.state = name_1652.name_1658;
               break;
            case MainButtonBarEvents.HELP:
               if(this.state != name_1652.BATTLE)
               {
                  this.method_1146();
                  break;
               }
         }
      }
      
      public function name_1031() : void
      {
         if(this.method_1144(Achievement.FIRST_PURCHASE))
         {
            this.var_815.name_1653("GarageModel",800);
         }
         if(this.method_1144(Achievement.SET_EMAIL))
         {
            this.var_815.name_1653("GarageModel",801);
         }
         this.state = name_1652.BATTLE;
      }
      
      public function name_1042() : void
      {
         if(this.method_1148())
         {
            this.var_815.name_1654("GarageModel",802);
         }
      }
      
      private function method_1144(param1:Achievement) : Boolean
      {
         var _loc2_:int = this.var_923.indexOf(param1);
         return _loc2_ >= 0;
      }
      
      private function method_1081(param1:Event = null) : void
      {
         var _loc2_:int = Math.max(1000,Main.stage.stageWidth);
         var _loc3_:int = Math.max(580,Main.stage.stageHeight);
         this.var_924.targetPoint = new Point(_loc2_ - 330,30);
         this.var_925.targetPoint = new Point(270,30);
         if(this.window != null)
         {
            this.window.x = Main.stage.stageWidth - this.window.width >> 1;
            this.window.y = Main.stage.stageHeight - this.window.height >> 1;
         }
      }
   }
}
