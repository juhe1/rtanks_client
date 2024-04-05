package package_407
{
   import alternativa.osgi.OSGi;
   import base.class_122;
   import controls.base.TankInput;
   import controls.base.name_1134;
   import controls.containers.HorizontalStackPanel;
   import flash.events.KeyboardEvent;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   import package_33.GameActionEnum;
   import package_33.KeysBindingServiceImpl;
   import package_33.name_2243;
   import package_33.name_276;
   
   public class KeyBinding extends class_122
   {
      
      public static const const_2826:int = 120;
      
      public static var keysBindingService:name_276 = name_276(OSGi.getInstance().name_6(name_276));
       
      
      private var var_3670:Vector.<TankInput>;
      
      private var action:GameActionEnum;
      
      public function KeyBinding(param1:GameActionEnum, param2:String, param3:int, param4:int)
      {
         var _loc8_:name_1134 = null;
         this.var_3670 = new Vector.<TankInput>(3,true);
         super();
         this.action = param1;
         var _loc5_:int = param4 - 6 * param3 - 120 * 3;
         var _loc6_:HorizontalStackPanel = new HorizontalStackPanel();
         _loc6_.name_2121(param3);
         _loc6_.x = _loc5_ + param3;
         var _loc7_:int = 0;
         while(_loc7_ < 3)
         {
            _loc6_.addItem(this.method_3273(_loc7_));
            _loc7_++;
         }
         _loc8_ = new name_1134();
         _loc8_.text = param2;
         _loc8_.x = 0;
         _loc8_.y = Math.round((this.var_3670[0].height - _loc8_.textHeight) * 0.5) - 2;
         addChild(_loc8_);
         addChild(_loc6_);
         keysBindingService.addEventListener(name_2243.name_2245 + param1.name,this.method_3272);
      }
      
      private function method_3272(param1:name_2243) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.var_3670.length)
         {
            this.var_3670[_loc2_].value = this.method_3271(_loc2_);
            _loc2_++;
         }
      }
      
      private function method_3271(param1:uint) : String
      {
         var _loc2_:uint = uint(keysBindingService.method_819(this.action,param1));
         return keysBindingService.method_818(_loc2_);
      }
      
      public function method_2718() : GameActionEnum
      {
         return this.action;
      }
      
      private function method_3273(param1:int) : TankInput
      {
         var _loc2_:TankInput = null;
         _loc2_ = new TankInput();
         _loc2_.addEventListener(KeyboardEvent.KEY_UP,this.onKeyDown);
         _loc2_.maxChars = 1;
         _loc2_.width = 120;
         _loc2_.align = TextFormatAlign.CENTER;
         _loc2_.value = this.method_3271(param1);
         this.var_3670[param1] = _loc2_;
         return _loc2_;
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:TankInput = TankInput(param1.currentTarget);
         if(param1.keyCode == Keyboard.BACKSPACE || param1.keyCode == Keyboard.DELETE)
         {
            if(keysBindingService.method_820(this.action,KeysBindingServiceImpl.const_1670,this.var_3670.indexOf(_loc3_)))
            {
               _loc3_.value = "";
            }
            else
            {
               _loc3_.value = this.method_3271(this.var_3670.indexOf(_loc3_));
            }
            return;
         }
         var _loc4_:String = String(keysBindingService.method_818(param1.keyCode));
         if(_loc4_ != "")
         {
            _loc2_ = Boolean(keysBindingService.method_820(this.action,param1.keyCode,this.var_3670.indexOf(_loc3_)));
            _loc3_.value = _loc2_ ? _loc4_ : "";
         }
         else
         {
            _loc3_.value = this.method_3271(this.var_3670.indexOf(_loc3_));
         }
      }
      
      public function name_3352() : void
      {
         var _loc1_:Vector.<uint> = keysBindingService.method_817(this.action);
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            this.var_3670[_loc2_].value = keysBindingService.method_818(_loc1_[_loc2_]);
            _loc2_++;
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:TankInput = null;
         for each(_loc1_ in this.var_3670)
         {
            _loc1_.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         }
         this.var_3670 = null;
         keysBindingService.removeEventListener(name_2243.name_2245 + this.action.name,this.method_3272);
      }
   }
}
