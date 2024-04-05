package package_87
{
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.class_7;
   import controls.Label;
   import controls.RedButton;
   import controls.resultassets.name_1426;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_1.Main;
   import package_291.name_1099;
   import package_293.name_1424;
   import package_294.name_1100;
   import package_32.name_1091;
   import package_32.name_245;
   import package_47.BattleTeamType;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class TableStatistics extends Sprite
   {
      
      public static var battleInputService:name_245;
      
      public static const const_125:String = "STAT";
      
      public static const const_124:String = "[TableStatistics]";
       
      
      private var var_703:ViewStatistics;
      
      private var var_702:ViewStatistics;
      
      private var var_704:ViewStatistics;
      
      private var var_705:Sprite;
      
      private var var_431:Boolean;
      
      private var var_706:name_1425;
      
      private var var_708:String;
      
      private var var_707:String;
      
      public function TableStatistics(param1:String, param2:Boolean)
      {
         super();
         this.var_431 = param2;
         visible = false;
         this.var_706 = new name_1425(param1,18);
         var _loc3_:name_102 = name_102(Main.osgi.name_6(name_102));
         this.var_708 = _loc3_.getText(TextConst.BATTLE_RESTART);
         this.var_707 = _loc3_.getText(TextConst.BATTLE_EXIT);
      }
      
      public function show(param1:String, param2:Vector.<name_1099>, param3:Boolean, param4:int) : void
      {
         if(visible)
         {
            return;
         }
         battleInputService.method_596(name_1091.name_1427);
         if(this.var_431)
         {
            this.var_703 = this.method_979(BattleTeamType.RED,param1,param2,param3);
            addChild(this.var_703);
            this.var_702 = this.method_979(BattleTeamType.BLUE,param1,param2,param3);
            addChild(this.var_702);
         }
         else
         {
            this.var_704 = this.method_979(BattleTeamType.NONE,param1,param2,param3);
            addChild(this.var_704);
         }
         this.method_980(param4);
         addChild(this.var_706);
         visible = true;
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      public function hide() : void
      {
         if(!visible)
         {
            return;
         }
         if(stage != null)
         {
            stage.removeEventListener(Event.RESIZE,this.onResize);
         }
         battleInputService.method_595(name_1091.name_1427);
         removeChild(this.var_706);
         if(Boolean(this.var_702) && contains(this.var_702))
         {
            removeChild(this.var_702);
            this.var_702 = null;
         }
         if(Boolean(this.var_703) && contains(this.var_703))
         {
            removeChild(this.var_703);
            this.var_703 = null;
         }
         if(Boolean(this.var_704) && contains(this.var_704))
         {
            removeChild(this.var_704);
            this.var_704 = null;
         }
         if(Boolean(this.var_705) && contains(this.var_705))
         {
            removeChild(this.var_705);
            this.var_705 = null;
         }
         visible = false;
      }
      
      public function name_1108(param1:String, param2:BattleTeamType) : void
      {
         if(!visible)
         {
            return;
         }
         if(this.var_431 && this.var_702 && Boolean(this.var_703))
         {
            if(param2 == BattleTeamType.BLUE)
            {
               this.var_702.name_1108(param1);
            }
            else
            {
               this.var_703.name_1108(param1);
            }
            this.method_978();
         }
         else if(Boolean(this.var_704))
         {
            this.var_704.name_1108(param1);
            this.method_977();
         }
      }
      
      public function name_1101(param1:name_1099) : void
      {
         if(!visible)
         {
            return;
         }
         if(this.var_431)
         {
            if(param1.teamType == BattleTeamType.BLUE)
            {
               this.var_702.name_1101(param1.userId,param1.name,param1.rank,param1.kills,param1.deaths,param1.score,param1.suspicious,-1,-1,-1,0);
            }
            else
            {
               this.var_703.name_1101(param1.userId,param1.name,param1.rank,param1.kills,param1.deaths,param1.score,param1.suspicious,-1,-1,-1,0);
            }
            this.method_978();
         }
         else
         {
            this.var_704.name_1101(param1.userId,param1.name,param1.rank,param1.kills,param1.deaths,-1,param1.suspicious,-1,-1,-1,0);
            this.method_977();
         }
         this.onResize(null);
      }
      
      public function onResize(param1:Event) : void
      {
         var _loc2_:int = Main.stage.stageWidth / 2;
         var _loc3_:int = Main.stage.stageHeight / 2;
         var _loc4_:ViewStatistics = null;
         var _loc5_:ViewStatistics = null;
         if(Boolean(this.var_704))
         {
            this.method_977();
            this.var_704.x = _loc2_ - (this.var_704.width >> 1);
            this.var_704.y = _loc3_ - (this.var_704.height >> 1);
            _loc4_ = _loc5_ = this.var_704;
         }
         else if(Boolean(this.var_702) && Boolean(this.var_703))
         {
            this.method_978();
            this.var_702.x = _loc2_ - (this.var_702.width >> 1);
            this.var_703.x = this.var_702.x;
            this.var_703.y = _loc3_ - (this.var_702.height + this.var_703.height + 5 >> 1);
            this.var_702.y = this.var_703.y + this.var_703.height + 5;
            _loc4_ = this.var_703;
            _loc5_ = this.var_702;
         }
         this.var_706.x = _loc4_.x;
         this.var_706.y = _loc4_.y - this.var_706.height - 5;
         this.var_706.width = _loc4_.width;
         if(Boolean(this.var_705))
         {
            this.var_705.x = _loc2_ - (this.var_705.width >> 1);
            this.var_705.y = _loc5_.y + _loc5_.height + 10;
         }
      }
      
      private function method_981(param1:MouseEvent) : void
      {
         dispatchEvent(new name_1100(name_1100.name_1109));
      }
      
      private function method_979(param1:BattleTeamType, param2:String, param3:Vector.<name_1099>, param4:Boolean) : ViewStatistics
      {
         var _loc10_:name_1099 = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc5_:int = param1 == BattleTeamType.NONE ? ViewStatistics.name_1428 : (param1 == BattleTeamType.RED ? ViewStatistics.RED : ViewStatistics.BLUE);
         var _loc6_:ViewStatistics = new ViewStatistics(_loc5_,param2,param4);
         var _loc7_:int = int(param3.length);
         var _loc8_:TankModel = TankModel(Main.osgi.name_6(class_7));
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_)
         {
            _loc10_ = param3[_loc9_];
            if(_loc10_.teamType == param1 && _loc8_.var_36[_loc10_.userId] != null)
            {
               _loc11_ = param4 ? _loc10_.reward : -1;
               _loc12_ = param1 == BattleTeamType.NONE ? -1 : _loc10_.score;
               _loc6_.name_1101(_loc10_.userId,_loc10_.name,_loc10_.rank,_loc10_.kills,_loc10_.deaths,_loc12_,_loc10_.suspicious,_loc11_,_loc10_.premiumBonusReward,_loc10_.newbiesAbonementBonusReward,_loc10_.stars);
            }
            else
            {
               trace("Found and removed wrong player: " + _loc10_.name);
               this.name_1108(_loc10_.userId,param1);
            }
            _loc9_++;
         }
         return _loc6_;
      }
      
      private function method_977() : void
      {
         var _loc1_:Number = Main.stage.stageHeight - 200;
         this.var_704.resize(_loc1_);
      }
      
      private function method_978() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Number = Main.stage.stageHeight - 200;
         this.var_702.resize(_loc1_);
         this.var_703.resize(_loc1_);
         if(this.var_702.height + this.var_703.height > _loc1_)
         {
            _loc2_ = 0.5 * _loc1_;
            if(this.var_702.height > _loc2_ && this.var_703.height > _loc2_)
            {
               this.var_702.resize(_loc2_);
               this.var_703.resize(_loc2_);
            }
            else if(this.var_702.height < _loc2_)
            {
               this.var_703.resize(_loc1_ - this.var_702.height);
            }
            else
            {
               this.var_702.resize(_loc1_ - this.var_703.height);
            }
         }
      }
      
      private function method_980(param1:int) : void
      {
         var _loc4_:Label = null;
         var _loc5_:name_1424 = null;
         this.var_705 = new Sprite();
         var _loc2_:name_1426 = new name_1426();
         _loc2_.width = width;
         this.var_705.addChild(_loc2_);
         var _loc3_:RedButton = new RedButton();
         _loc2_.height = _loc3_.height + 8;
         _loc3_.addEventListener(MouseEvent.CLICK,this.method_981);
         _loc3_.label = this.var_707;
         _loc3_.x = width - _loc3_.width - 4;
         _loc3_.y = 4;
         this.var_705.addChild(_loc3_);
         if(param1 > 0)
         {
            _loc4_ = new Label();
            _loc4_.text = this.var_708 + ": ";
            this.var_705.addChild(_loc4_);
            _loc4_.x = 4;
            _loc4_.y = 10;
            _loc5_ = new name_1424(-1,-1,null,true);
            _loc5_.name_1429(param1);
            this.var_705.addChild(_loc5_);
            _loc5_.x = _loc4_.x + _loc4_.width;
            _loc5_.y = 4;
            _loc5_.size = 22;
         }
         addChild(this.var_705);
      }
   }
}
