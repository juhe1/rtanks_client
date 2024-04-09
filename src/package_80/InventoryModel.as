package package_80
{
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.class_15;
   import alternativa.tanks.models.tank.ITankEventDispatcher;
   import alternativa.tanks.models.tank.name_77;
   import controls.InventoryIcon;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import package_1.Main;
   import package_31.class_1;
   import package_32.BattleInputLockEvent;
   import package_32.class_2;
   import package_32.name_245;
   import package_321.class_41;
   import package_321.class_42;
   import package_33.GameActionEnum;
   import package_4.ClientObject;
   import package_49.name_146;
   import package_49.name_163;
   import package_49.name_97;
   import package_7.name_32;
   import package_75.name_274;
   
   public class InventoryModel extends class_41 implements class_2, class_42, class_11, class_40, name_97, class_1, class_15
   {
      
      public static var battleInputService:name_245;
      
      public static var battleInfoService:name_274;
      
      private static const const_462:int = 50;
      
      public static const const_463:int = 10;
       
      
      private var var_721:int;
      
      private var var_170:DisplayObjectContainer;
      
      private var var_716:Vector.<name_1438>;
      
      private var var_718:DisplayObjectContainer;
      
      private var var_717:Dictionary;
      
      private var var_720:name_1440;
      
      private var var_719:int;
      
      public function InventoryModel()
      {
         this.var_717 = new Dictionary();
         super();
         _interfaces.push(IModel,class_42,class_11,class_40,name_97,class_1);
         this.var_718 = Main.contentUILayer;
      }
      
      public function method_998(param1:ClientObject) : void
      {
         this.method_626(name_146.const_96,true);
      }
      
      public function battleFinish(param1:ClientObject) : void
      {
         this.method_626(name_146.const_96,true);
      }
      
      public function battleRestart(param1:ClientObject) : void
      {
      }
      
      private function method_990(param1:BattleInputLockEvent) : void
      {
         this.method_626(name_146.const_95,true);
      }
      
      private function method_988(param1:BattleInputLockEvent) : void
      {
         this.method_626(name_146.const_95,false);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         this.var_170 = new Sprite();
         this.var_170.visible = false;
         this.var_718.addChild(this.var_170);
         this.method_992();
         this.method_993();
         battleInputService.addEventListener(BattleInputLockEvent.INPUT_LOCKED,this.method_990);
         battleInputService.addEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.method_988);
         var _loc2_:ITankEventDispatcher = ITankEventDispatcher(Main.osgi.getService(ITankEventDispatcher));
         _loc2_.name_718(name_77.name_253,this);
         Main.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         if(this.var_716 == null)
         {
            return;
         }
         battleInputService.removeEventListener(BattleInputLockEvent.INPUT_LOCKED,this.method_990);
         battleInputService.removeEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.method_988);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_716.length)
         {
            this.method_991(_loc2_);
            _loc2_++;
         }
         battleInputService.name_150(this);
         this.var_716 = null;
         this.var_718.removeChild(this.var_170);
         this.var_170 = null;
         var _loc3_:ITankEventDispatcher = ITankEventDispatcher(Main.osgi.getService(ITankEventDispatcher));
         _loc3_.name_717(name_77.name_253,this);
         this.var_718.stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      public function method_985(param1:name_1437, param2:int) : void
      {
         var _loc4_:name_32 = null;
         if(param1 == null)
         {
            return;
         }
         if(this.var_720 == null)
         {
            _loc4_ = name_32(Main.osgi.getService(name_32));
            this.var_720 = name_1440(_loc4_.getModelsByInterface(name_1440)[0]);
         }
         if(this.method_989() == 0)
         {
            battleInputService.name_219(this);
            this.var_718.stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         var _loc3_:name_1438 = this.var_716[param2];
         _loc3_.name_1442(param1);
         this.var_170.visible = true;
      }
      
      public function method_986(param1:name_1437) : void
      {
         var _loc2_:name_1438 = null;
         for each(_loc2_ in this.var_716)
         {
            if(_loc2_.name_1439() == param1)
            {
               _loc2_.name_1443();
            }
         }
      }
      
      public function method_997(param1:name_1437, param2:int) : void
      {
         var _loc3_:name_1438 = null;
         for each(_loc3_ in this.var_716)
         {
            if(_loc3_.name_1439() == param1)
            {
               _loc3_.method_997(param2,true);
            }
         }
      }
      
      public function method_994(param1:name_1437, param2:int) : void
      {
         var _loc3_:name_1438 = null;
         for each(_loc3_ in this.var_716)
         {
            if(_loc3_.name_1439() == param1)
            {
               _loc3_.method_994(param2);
            }
         }
      }
      
      public function itemUpdated(param1:name_1437) : void
      {
         var _loc2_:name_1438 = null;
         for each(_loc2_ in this.var_716)
         {
            if(_loc2_.name_1439() == param1)
            {
               _loc2_.name_1443();
            }
         }
      }
      
      public function name_179(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:name_1438 = null;
         var _loc5_:name_1437 = null;
         for each(_loc4_ in this.var_716)
         {
            _loc5_ = _loc4_.name_1439();
            if(_loc5_ != null && _loc5_.name_1444() == param1)
            {
               _loc4_.name_1441(param2,param3);
            }
         }
      }
      
      public function method_626(param1:int, param2:Boolean) : void
      {
         var _loc3_:name_1438 = null;
         for each(_loc3_ in this.var_716)
         {
            _loc3_.name_1441(param1,param2);
         }
      }
      
      public function method_22() : void
      {
         this.method_44(1);
      }
      
      public function method_25() : void
      {
         this.method_44(-1);
      }
      
      public function method_26() : void
      {
         this.method_44(1);
      }
      
      public function method_27() : void
      {
         this.method_44(-1);
      }
      
      public function method_20() : void
      {
         this.method_44(1);
      }
      
      public function method_21() : void
      {
      }
      
      public function method_24() : void
      {
         this.method_44(-1);
      }
      
      public function handleTankEvent(param1:int, param2:TankData) : void
      {
         var _loc3_:name_1438 = null;
         var _loc4_:name_1437 = null;
         if(param1 == name_77.name_253 && param2.local)
         {
            for each(_loc3_ in this.var_716)
            {
               _loc3_.name_1441(name_146.const_96,false);
               _loc4_ = _loc3_.name_1439();
               if(_loc4_ != null)
               {
                  _loc4_.name_1446();
               }
            }
         }
      }
      
      public function method_23(param1:Boolean) : void
      {
      }
      
      private function method_44(param1:int) : void
      {
         var _loc2_:name_1438 = null;
         this.var_719 += param1;
         if(this.var_719 < 0)
         {
            this.var_719 = 0;
         }
         if(this.var_716 != null)
         {
            for each(_loc2_ in this.var_716)
            {
               _loc2_.name_1441(name_146.const_95,this.var_719 > 0);
            }
         }
      }
      
      private function onResize(param1:Event) : void
      {
         var _loc2_:int = this.method_996();
         var _loc3_:int = Main.stage.stageWidth - _loc2_ >> 1;
         var _loc4_:int = _loc3_ + _loc2_ + 10;
         this.var_170.x = _loc3_;
         this.var_170.y = Main.stage.stageHeight - 50;
      }
      
      private function method_996() : int
      {
         var _loc1_:name_1438 = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.var_716)
         {
            _loc1_.getCanvas().x = _loc2_ * this.var_721;
            if(_loc1_.getCanvas().visible)
            {
               _loc2_++;
            }
         }
         return _loc2_ * this.var_721 - 10;
      }
      
      private function method_992() : void
      {
         if(this.method_995())
         {
            return;
         }
         this.var_716 = new Vector.<name_1438>(5);
         this.var_721 = 10 + new InventoryIcon(InventoryIcon.EMPTY).width;
         if(!battleInfoService.withoutSupplies || !battleInfoService.withoutBonuses)
         {
            this.method_987(name_163.name_196);
            this.method_987(name_163.ARMOR);
            this.method_987(name_163.name_474);
            this.method_987(name_163.NITRO);
            this.method_987(name_163.MINE);
         }
         this.onResize(null);
         this.var_170.visible = true;
      }
      
      private function method_995() : Boolean
      {
         return Boolean(battleInfoService.withoutSupplies) && Boolean(battleInfoService.withoutBonuses) || Boolean(battleInfoService.name_1016());
      }
      
      private function method_987(param1:int) : void
      {
         var _loc2_:* = new name_1438(param1);
         this.var_716[param1 - 1] = _loc2_;
         this.var_170.addChild(_loc2_.getCanvas());
      }
      
      public function method_28(param1:GameActionEnum, param2:Boolean) : void
      {
         if(!param2)
         {
            return;
         }
         var _loc3_:* = this.var_717[param1];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:name_1438 = this.var_716[int(_loc3_)];
         if(_loc4_.isLocked())
         {
            return;
         }
         var _loc5_:name_1437 = _loc4_.name_1439();
         if(_loc5_ != null)
         {
            this.var_720.name_1445(_loc5_);
         }
      }
      
      private function method_989() : int
      {
         var _loc1_:int = 0;
         var _loc2_:name_1438 = null;
         for each(_loc2_ in this.var_716)
         {
            if(_loc2_.name_1439() != null)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function method_991(param1:int) : void
      {
         var _loc2_:name_1438 = this.var_716[param1];
         _loc2_.name_1442(null);
         if(this.method_989() == 0)
         {
            this.var_718.stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc3_:name_1438 = null;
         var _loc2_:int = getTimer();
         for each(_loc3_ in this.var_716)
         {
            _loc3_.update(_loc2_);
         }
      }
      
      private function method_993() : void
      {
         this.var_717[GameActionEnum.USE_FIRS_AID] = 0;
         this.var_717[GameActionEnum.USE_DOUBLE_ARMOR] = 1;
         this.var_717[GameActionEnum.USE_DOUBLE_DAMAGE] = 2;
         this.var_717[GameActionEnum.USE_NITRO] = 3;
         this.var_717[GameActionEnum.USE_MINE] = 4;
      }
   }
}
