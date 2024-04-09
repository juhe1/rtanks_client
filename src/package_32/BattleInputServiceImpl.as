package package_32
{
   import alternativa.engine3d.core.View;
   import alternativa.tanks.service.settings.IBattleSettings;
   import alternativa.tanks.utils.name_1398;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.FullScreenEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import package_18.name_34;
   import package_33.GameActionEnum;
   import package_33.name_276;
   
   public class BattleInputServiceImpl extends EventDispatcher implements name_245
   {
      
      public static var fullScreenService:name_34;
      
      public static var settingsService:IBattleSettings;
       
      
      private var stage:Stage;
      
      private var keysBindingService:name_276;
      
      private const const_447:name_1398 = new name_1398();
      
      private const const_451:name_1398 = new name_1398();
      
      private const const_446:Dictionary = new Dictionary();
      
      private var var_682:Dictionary;
      
      private const const_452:Vector.<class_2> = new Vector.<class_2>();
      
      private const const_450:Vector.<name_1092> = new Vector.<name_1092>();
      
      private const const_448:Vector.<name_1093> = new Vector.<name_1093>();
      
      private const const_449:Vector.<name_1090> = new Vector.<name_1090>();
      
      private var var_683:Boolean = false;
      
      private const const_453:name_1397 = new name_1397(GameActionEnum.SHOT);
      
      private const const_454:name_1397 = new name_1397(GameActionEnum.LOOK_AROUND);
      
      private var var_685:Boolean = false;
      
      private var var_684:Boolean = true;
      
      public function BattleInputServiceImpl(param1:Stage, param2:name_276)
      {
         this.var_682 = new Dictionary();
         super();
         this.stage = param1;
         this.keysBindingService = param2;
         this.lock(name_665.name_708);
         param1.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         param1.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         param1.addEventListener(Event.DEACTIVATE,this.method_952);
         param1.addEventListener(MouseEvent.MOUSE_DOWN,this.method_948);
         param1.addEventListener(MouseEvent.MOUSE_UP,this.method_953);
         param1.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this.method_950);
         param1.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this.method_949);
         param1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         param1.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
         param1.addEventListener(Event.MOUSE_LEAVE,this.method_951);
         param1.addEventListener(FullScreenEvent.FULL_SCREEN,this.method_947);
         //param1.addEventListener(FullScreenEvent.FULL_SCREEN_INTERACTIVE_ACCEPTED,this.method_947);
      }
      
      public function name_768() : void
      {
         this.var_684 = false;
      }
      
      public function name_743() : void
      {
         this.var_684 = true;
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:GameActionEnum = null;
         var _loc3_:Boolean = this.const_446[param1.keyCode] != true;
         if(_loc3_)
         {
            this.const_446[param1.keyCode] = true;
            if(this.method_940())
            {
               _loc2_ = this.keysBindingService.name_729(param1.keyCode);
               if(_loc2_ != null)
               {
                  this.method_944(_loc2_);
               }
            }
         }
      }
      
      private function method_944(param1:GameActionEnum) : void
      {
         var _loc2_:int = int(this.var_682[param1]) + 1;
         this.var_682[param1] = _loc2_;
         if(_loc2_ == 1)
         {
            this.method_943(param1,true);
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:GameActionEnum = null;
         var _loc3_:Boolean = this.const_446[param1.keyCode] == true;
         if(_loc3_)
         {
            delete this.const_446[param1.keyCode];
            if(this.method_940())
            {
               _loc2_ = this.keysBindingService.name_729(param1.keyCode);
               if(_loc2_ != null)
               {
                  this.method_946(_loc2_);
               }
            }
         }
      }
      
      private function method_946(param1:GameActionEnum) : void
      {
         var _loc2_:int = int(this.var_682[param1]);
         if(_loc2_ > 0)
         {
            if(_loc2_ == 1)
            {
               delete this.var_682[param1];
               this.method_943(param1,false);
            }
            else
            {
               this.var_682[param1] = _loc2_ - 1;
            }
         }
      }
      
      private function method_952(param1:Event) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Dictionary = null;
         var _loc4_:* = undefined;
         this.const_453.name_1399 = false;
         this.const_454.name_1399 = false;
         for(_loc2_ in this.const_446)
         {
            delete this.const_446[_loc2_];
         }
         _loc3_ = this.var_682;
         this.var_682 = new Dictionary();
         if(this.method_940())
         {
            for(_loc4_ in _loc3_)
            {
               this.method_943(GameActionEnum(_loc4_),false);
            }
         }
      }
      
      private function method_948(param1:MouseEvent) : void
      {
         if(this.isLocked())
         {
            return;
         }
         if(this.var_683)
         {
            if(this.stage.mouseLock)
            {
               this.method_945(this.const_453);
            }
            else if((param1.target == this.stage || param1.target is View) && this.method_939())
            {
               this.method_938(true);
            }
         }
         else if((param1.target == this.stage || param1.target is View) && this.method_939())
         {
            fullScreenService.method_288();
         }
      }
      
      private function method_953(param1:MouseEvent) : void
      {
         this.method_941(this.const_453);
      }
      
      private function method_950(param1:MouseEvent) : void
      {
         if(this.stage.mouseLock)
         {
            this.method_945(this.const_454);
         }
      }
      
      private function method_949(param1:MouseEvent) : void
      {
         this.method_941(this.const_454);
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.stage.mouseLock)
         {
            if(this.var_685)
            {
               this.var_685 = false;
            }
            else
            {
               _loc2_ = 0;
               while(_loc2_ < this.const_448.length)
               {
                  this.const_448[_loc2_].method_689(param1.movementX,param1.movementY);
                  _loc2_++;
               }
            }
         }
      }
      
      private function onMouseWheel(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.stage.mouseLock)
         {
            _loc2_ = 0;
            while(_loc2_ < this.const_449.length)
            {
               this.const_449[_loc2_].onMouseWheel(param1.delta);
               _loc2_++;
            }
         }
      }
      
      private function method_951(param1:Event) : void
      {
      }
      
      private function method_947(param1:FullScreenEvent) : void
      {
         this.var_683 = param1.fullScreen;
         if(this.isLocked())
         {
            return;
         }
         if(this.var_683)
         {
            if(this.method_939())
            {
               this.method_938(true);
            }
         }
         else
         {
            this.method_941(this.const_453);
            this.method_941(this.const_454);
            this.method_938(false);
         }
      }
      
      private function method_943(param1:GameActionEnum, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this.const_452.length)
         {
            this.const_452[_loc3_].method_28(param1,param2);
            _loc3_++;
         }
      }
      
      public function lock(param1:name_665) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Boolean = this.method_942();
         var _loc4_:Boolean = this.name_727();
         this.const_447.name_1404(param1.name_1402());
         if(!_loc3_ && this.method_942())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.CHAT_LOCKED));
         }
         if(!_loc4_ && this.name_727())
         {
            if(this.stage.mouseLock)
            {
               this.method_938(false);
            }
            for(_loc2_ in this.var_682)
            {
               this.method_943(GameActionEnum(_loc2_),false);
            }
            this.var_682 = new Dictionary();
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.INPUT_LOCKED));
         }
      }
      
      public function unlock(param1:name_665) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:GameActionEnum = null;
         var _loc4_:Boolean = this.method_942();
         var _loc5_:Boolean = this.isLocked();
         this.const_447.name_1406(param1.name_1402());
         if(_loc4_ && !this.method_942())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.CHAT_UNLOCKED));
         }
         if(_loc5_ && this.method_940())
         {
            for(_loc2_ in this.const_446)
            {
               _loc3_ = this.keysBindingService.name_729(_loc2_);
               if(_loc3_ != null)
               {
                  this.method_944(_loc3_);
               }
            }
            if(this.var_683 && !this.stage.mouseLock && this.method_939())
            {
               this.method_938(true);
            }
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.INPUT_UNLOCKED));
         }
      }
      
      public function method_596(param1:name_1091) : void
      {
         var _loc2_:Boolean = this.const_451.name_1400();
         this.const_451.name_1404(param1.name_1405);
         if(_loc2_ && this.const_451.name_1401())
         {
            if(this.stage.mouseLock)
            {
               this.method_938(false);
            }
         }
      }
      
      public function method_595(param1:name_1091) : void
      {
         var _loc2_:Boolean = this.const_451.name_1401();
         this.const_451.name_1406(param1.name_1405);
         if(_loc2_ && this.method_939())
         {
            if(this.method_940() && this.var_683 && !this.stage.mouseLock)
            {
               this.method_938(true);
            }
         }
      }
      
      public function name_727() : Boolean
      {
         return this.isLocked();
      }
      
      private function method_942() : Boolean
      {
         return this.const_447.name_1407(name_665.name_770.name_1402());
      }
      
      public function name_219(param1:class_2) : void
      {
         var _loc2_:* = undefined;
         if(this.const_452.indexOf(param1) < 0)
         {
            this.const_452.push(param1);
            if(this.const_447.name_1400())
            {
               for(_loc2_ in this.var_682)
               {
                  param1.method_28(GameActionEnum(_loc2_),true);
               }
            }
         }
      }
      
      public function name_150(param1:class_2) : void
      {
         var _loc2_:int = this.const_452.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.const_452.splice(_loc2_,1);
         }
      }
      
      public function method_598(param1:name_1092) : void
      {
         var _loc2_:int = this.const_450.indexOf(param1);
         if(_loc2_ < 0)
         {
            this.const_450.push(param1);
            if(this.stage.mouseLock)
            {
               param1.method_688(true);
            }
         }
      }
      
      public function method_597(param1:name_1092) : void
      {
         var _loc2_:int = this.const_450.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.const_450.splice(_loc2_,1);
         }
      }
      
      public function method_602(param1:name_1093) : void
      {
         var _loc2_:int = this.const_448.indexOf(param1);
         if(_loc2_ < 0)
         {
            this.const_448.push(param1);
         }
      }
      
      public function method_600(param1:name_1093) : void
      {
         var _loc2_:int = this.const_448.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.const_448.splice(_loc2_,1);
         }
      }
      
      public function method_601(param1:name_1090) : void
      {
         var _loc2_:int = this.const_449.indexOf(param1);
         if(_loc2_ < 0)
         {
            this.const_449.push(param1);
         }
      }
      
      public function method_599(param1:name_1090) : void
      {
         var _loc2_:int = this.const_449.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.const_449.splice(_loc2_,1);
         }
      }
      
      private function method_945(param1:name_1397) : void
      {
         if(!param1.name_1399)
         {
            param1.name_1399 = true;
            this.method_944(param1.name_1403);
         }
      }
      
      private function method_941(param1:name_1397) : void
      {
         if(param1.name_1399)
         {
            param1.name_1399 = false;
            this.method_946(param1.name_1403);
         }
      }
      
      private function method_938(param1:Boolean) : void
      {
         if(param1)
         {
            this.var_685 = true;
         }
         if(this.var_683)
         {
            this.stage.mouseLock = param1;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.const_450.length)
         {
            this.const_450[_loc2_].method_688(param1);
            _loc2_++;
         }
      }
      
      private function isLocked() : Boolean
      {
         return this.const_447.name_1401();
      }
      
      private function method_940() : Boolean
      {
         return this.const_447.name_1400();
      }
      
      private function method_939() : Boolean
      {
         return this.var_684 && this.const_451.name_1400() && Boolean(settingsService.mouseControl);
      }
      
      public function name_1089() : void
      {
         if(this.stage.mouseLock)
         {
            this.method_938(false);
         }
      }
   }
}
