package forms.battlelist.battlecreate
{
   import assets.icons.BattleInfoIcons;
   import base.class_122;
   import controls.NumStepper;
   import controls.base.name_3461;
   import controls.checkbox.CheckBoxBase;
   import controls.checkbox.CheckBoxEvent;
   import controls.dropdownlist.ComboBoxRenderer;
   import controls.dropdownlist.DropDownList;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.battlelist.BattleMode;
   import forms.battlelist.MapTheme;
   import forms.battlelist.name_2927;
   import forms.TankWindowWithHeader;
   import package_1.Main;
   import package_12.name_24;
   import package_12.name_529;
   import package_475.name_3458;
   import package_479.name_3459;
   import package_479.name_3460;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class CreateBattleFormView extends class_122
   {
      
      public static var display:name_529 = Main.osgi.getService(name_24) as name_529;
      
      private static const const_2714:String = "lobby";
      
      private static const const_2717:String = "createBattle";
      
      private static const const_2718:int = 970;
      
      private static const const_2715:int = 530;
      
      private static const const_2719:int = 60;
      
      private static const const_2716:int = 11;
      
      private static const const_2713:Number = 11;
       
      
      private var var_3510:Boolean;
      
      private var var_2241:CreateBattleFormController;
      
      private var var_3513:uint;
      
      private var var_1169:TankWindowWithHeader;
      
      private var var_3491:DropDownList;
      
      private var var_3493:DropDownList;
      
      private var var_3496:DropDownList;
      
      public var name_2949:name_2927;
      
      private var var_3490:name_3460;
      
      private var var_3505:ChooseTypeBattleView;
      
      private var var_3492:NumStepper;
      
      private var var_3495:NumStepper;
      
      private var var_3494:NumStepper;
      
      private var var_3501:CheckBoxBase;
      
      private var var_3504:CheckBoxBase;
      
      private var var_3499:CheckBoxBase;
      
      private var var_3497:CheckBoxBase;
      
      private var var_3503:CheckBoxBase;
      
      private var var_3502:CheckBoxBase;
      
      private var var_3500:CheckBoxBase;
      
      private var var_3498:CheckBoxBase;
      
      private var var_3506:name_3461;
      
      private var var_3509:CheckBoxBase;
      
      private var var_3507:CheckBoxBase;
      
      private var var_3508:CheckBoxBase;
      
      private var var_3512:Dictionary;
      
      private var var_3514:int;
      
      private var var_3511:int;
      
      public function CreateBattleFormView(param1:CreateBattleFormController)
      {
         this.var_3512 = new Dictionary();
         super();
         this.var_2241 = param1;
         this.var_1169 = TankWindowWithHeader.createWindow(null);
         this.var_1169.method_2516(name_390.const_685);
         addChild(this.var_1169);
         this.name_2949 = new name_2927();
         addChild(this.name_2949);
         this.var_3490 = new name_3460();
         addChild(this.var_3490);
         this.var_3505 = new ChooseTypeBattleView(this);
         addChild(this.var_3505);
         this.var_3492 = new NumStepper();
         this.var_3492.label = name_1663.method_2427;
         this.var_3492.icon1 = CreateBattleFormController.method_2322(BattleInfoIcons.const_2309);
         this.var_3511 = this.var_3492.width;
         addChild(this.var_3492);
         this.var_3495 = new NumStepper();
         this.var_3495.label = name_1663.method_2446;
         this.var_3495.icon1 = CreateBattleFormController.method_2322(BattleInfoIcons.name_2345);
         addChild(this.var_3495);
         this.var_3494 = new NumStepper();
         this.var_3494.label = name_1663.method_2422;
         this.var_3494.icon1 = CreateBattleFormController.method_2322(BattleInfoIcons.CTF);
         this.var_3514 = this.var_3494.width;
         addChild(this.var_3494);
         this.var_3501 = new CheckBoxBase(name_3458.name_3415);
         this.var_3501.checked = true;
         this.var_3501.label = name_1663.method_2445;
         addChild(this.var_3501);
         this.var_3499 = new CheckBoxBase(name_3458.name_3414);
         this.var_3499.checked = true;
         this.var_3499.label = name_1663.method_2428;
         addChild(this.var_3499);
         this.var_3497 = new CheckBoxBase(name_3458.name_3416);
         this.var_3497.checked = true;
         this.var_3497.label = name_1663.method_2429;
         addChild(this.var_3497);
         this.var_3503 = new CheckBoxBase(name_3458.name_3405);
         this.var_3503.checked = true;
         this.var_3503.label = name_1663.method_2447;
         addChild(this.var_3503);
         this.var_3504 = new CheckBoxBase(name_3458.name_3412);
         this.var_3504.label = name_1663.method_2443;
         addChild(this.var_3504);
         this.var_3502 = new CheckBoxBase(name_3458.name_3411);
         this.var_3502.checked = true;
         this.var_3502.label = name_1663.method_2433;
         addChild(this.var_3502);
         this.var_3509 = new CheckBoxBase(name_3458.name_3463);
         this.var_3509.checked = true;
         this.var_3509.label = name_1663.method_2424;
         this.var_3500 = new CheckBoxBase(name_3458.name_3468);
         this.var_3500.label = name_1663.method_2449;
         addChild(this.var_3500);
         this.var_3498 = new CheckBoxBase(name_3458.name_3407);
         this.var_3498.checked = true;
         this.var_3498.label = name_1663.method_2441;
         addChild(this.var_3498);
         this.var_3507 = new CheckBoxBase(name_3458.name_3467);
         this.var_3507.checked = false;
         this.var_3507.label = name_1663.method_2432;
         addChild(this.var_3507);
         this.var_3508 = new CheckBoxBase(name_3458.name_3465);
         this.var_3508.checked = true;
         this.var_3508.label = name_1663.method_2444;
         this.method_3129();
         this.var_3496 = new DropDownList();
         this.var_3496.method_1578(ComboBoxRenderer);
         addChild(this.var_3496);
         this.var_3506 = new name_3461();
         this.var_3506.label = name_1663.method_2442;
         addChild(this.var_3506);
         this.var_3491 = new DropDownList();
         this.var_3491.label = name_1663.method_2435;
         addChild(this.var_3491);
         this.var_3493 = new DropDownList();
         this.var_3493.label = name_1663.method_2430;
         this.var_3493.method_1578(ComboBoxRenderer);
         addChild(this.var_3493);
      }
      
      public function method_1568() : void
      {
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.var_3491.addEventListener(Event.CHANGE,this.method_2769);
         this.var_3491.addEventListener(Event.OPEN,this.method_3145);
         this.var_3493.addEventListener(Event.OPEN,this.method_3139);
         this.var_3493.addEventListener(Event.CHANGE,this.method_2775);
         this.var_3492.addEventListener(Event.CHANGE,this.method_2776);
         this.var_3492.addEventListener(MouseEvent.CLICK,this.method_3132);
         this.var_3495.addEventListener(Event.CHANGE,this.method_2781);
         this.var_3495.addEventListener(MouseEvent.CLICK,this.method_3135);
         this.var_3494.addEventListener(Event.CHANGE,this.method_2773);
         this.var_3494.addEventListener(MouseEvent.CLICK,this.method_3144);
         this.var_3490.addEventListener(name_3459.name_3462,this.method_3142);
         this.var_3506.addEventListener(MouseEvent.CLICK,this.method_3133);
         this.var_3499.addEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3137);
         this.var_3500.addEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3143);
         this.var_3497.addEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3131);
         this.var_3503.addEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3134);
         this.var_3501.addEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3140);
         this.var_3498.addEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3138);
         this.var_3502.addEventListener(CheckBoxEvent.STATE_CHANGED,this.var_2241.method_2777);
         this.var_3509.addEventListener(CheckBoxEvent.STATE_CHANGED,this.var_2241.method_2777);
         this.var_3496.addEventListener(Event.CHANGE,this.var_2241.method_2774);
         this.var_3504.addEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3141);
         this.var_3507.addEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3147);
         this.var_3508.addEventListener(CheckBoxEvent.STATE_CHANGED,this.var_2241.method_2780);
      }
      
      public function method_1476() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.var_3491.removeEventListener(Event.CHANGE,this.method_2769);
         this.var_3491.removeEventListener(Event.OPEN,this.method_3145);
         this.var_3493.removeEventListener(Event.OPEN,this.method_3139);
         this.var_3493.removeEventListener(Event.CHANGE,this.method_2775);
         this.var_3492.removeEventListener(Event.CHANGE,this.method_2776);
         this.var_3492.removeEventListener(MouseEvent.CLICK,this.method_3132);
         this.var_3495.removeEventListener(Event.CHANGE,this.method_2781);
         this.var_3495.removeEventListener(MouseEvent.CLICK,this.method_3135);
         this.var_3494.removeEventListener(Event.CHANGE,this.method_2773);
         this.var_3494.removeEventListener(MouseEvent.CLICK,this.method_3144);
         this.var_3490.removeEventListener(name_3459.name_3462,this.method_3142);
         this.var_3506.removeEventListener(MouseEvent.CLICK,this.method_3133);
         this.var_3499.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3137);
         this.var_3500.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3143);
         this.var_3497.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3131);
         this.var_3503.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3134);
         this.var_3501.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3140);
         this.var_3498.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3138);
         this.var_3496.removeEventListener(Event.CHANGE,this.var_2241.method_2774);
         this.var_3504.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.method_3141);
         this.var_3502.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.var_2241.method_2777);
         this.var_3509.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.var_2241.method_2777);
         this.var_3508.removeEventListener(CheckBoxEvent.STATE_CHANGED,this.var_2241.method_2780);
      }
      
      public function method_2755(param1:BattleMode) : void
      {
         this.var_2241.method_2755(param1);
         this.method_3127("battleTypeChange_" + param1.name);
      }
      
      public function name_2977(param1:BattleMode) : void
      {
         this.var_3505.name_2977(param1);
         var _loc2_:Boolean = param1 != BattleMode.DM;
         this.var_3501.visible = _loc2_;
         this.var_3504.visible = _loc2_;
         this.var_3507.visible = false;
      }
      
      public function name_2992() : void
      {
         this.var_3506.enable = false;
      }
      
      public function name_2973() : void
      {
         this.var_3506.enable = true;
      }
      
      public function name_2993() : void
      {
         this.var_3500.checked = false;
      }
      
      public function get name_2979() : Boolean
      {
         return this.var_3500.checked;
      }
      
      public function get name_2968() : Boolean
      {
         return this.var_3501.checked;
      }
      
      public function get name_2967() : Boolean
      {
         return this.var_3504.checked;
      }
      
      public function get name_2966() : Boolean
      {
         return !this.var_3499.checked;
      }
      
      public function get name_2982() : Boolean
      {
         return !this.var_3497.checked;
      }
      
      public function get name_2961() : Boolean
      {
         return this.var_3503.checked;
      }
      
      public function get name_2958() : Boolean
      {
         return this.var_3498.checked;
      }
      
      public function get name_2955() : Boolean
      {
         return !this.var_3502.checked;
      }
      
      public function get name_2962() : Boolean
      {
         return !this.var_3509.checked;
      }
      
      public function get name_2981() : Boolean
      {
         return false;
      }
      
      public function get name_2963() : Boolean
      {
         return this.var_3507.checked;
      }
      
      public function name_2956(param1:int, param2:int, param3:int) : void
      {
         this.var_3490.minValue = param1;
         this.var_3490.maxValue = param2;
         this.var_3490.tickInterval = param3;
      }
      
      public function name_2972(param1:int) : void
      {
         this.var_3490.maxRangRange = param1;
      }
      
      public function name_2975(param1:int) : void
      {
         this.var_3490.maxRang = param1;
         this.var_3490.width = this.name_2949.width;
      }
      
      public function name_2997(param1:int) : void
      {
         this.var_3490.minRang = param1;
         this.var_3490.width = this.name_2949.width;
      }
      
      public function name_2986(param1:int) : void
      {
         this.var_3490.currentRang = param1;
      }
      
      public function name_2994() : int
      {
         return this.var_3490.maxRang;
      }
      
      public function name_2983() : int
      {
         return this.var_3490.minRang;
      }
      
      public function name_2964() : int
      {
         return this.var_3490.minValue;
      }
      
      public function name_2970() : int
      {
         return this.var_3490.maxValue;
      }
      
      public function show() : void
      {
         this.method_1568();
         this.onResize(null);
         if(!display.contentUILayer.contains(this))
         {
            display.contentUILayer.addChild(this);
         }
      }
      
      public function hide() : void
      {
         this.method_1476();
         if(display.contentUILayer.contains(this))
         {
            display.contentUILayer.removeChild(this);
         }
      }
      
      public function destroy() : void
      {
         this.method_1476();
         clearTimeout(this.var_3513);
         this.var_3505.destroy();
         this.var_3505 = null;
         this.var_1169 = null;
         this.name_2949 = null;
         this.var_3490 = null;
         this.var_3492 = null;
         this.var_3495 = null;
         this.var_3494 = null;
         this.var_3501 = null;
         this.var_3499 = null;
         this.var_3497 = null;
         this.var_3503 = null;
         this.var_3502 = null;
         this.var_3500 = null;
         this.var_3498 = null;
         this.var_3506 = null;
         this.var_3491 = null;
         this.var_3493 = null;
         this.var_2241 = null;
         this.var_3512 = null;
         this.var_3496 = null;
         this.var_3504 = null;
         this.var_3507 = null;
      }
      
      public function name_2965(param1:Vector.<BattleMode>) : void
      {
         this.var_3505.name_2965(param1);
      }
      
      private function resize(param1:Boolean = true) : void
      {
         var _loc2_:Number = this.method_3128();
         var _loc3_:Number = this.method_3136();
         this.var_1169.width = _loc2_;
         this.var_1169.height = _loc3_;
         this.x = _loc2_ * 2;
         this.y = 60;
         this.var_3491.x = 11 + this.var_3491.method_1584() + 5;
         this.var_3491.y = 11;
         this.var_3491.height = 274;
         this.method_3130();
         this.name_2949.width = _loc2_ - 22;
         this.name_2949.height = int(_loc3_ - 478);
         this.name_2949.x = 11;
         this.name_2949.y = 51;
         this.var_3490.x = 11;
         this.var_3490.y = this.name_2949.y + this.name_2949.height + 5;
         this.var_3490.width = this.name_2949.width;
         this.var_3505.resize(this.name_2949.width,this.var_3505.name_3466());
         this.var_3505.x = 11;
         this.var_3505.y = this.var_3490.y + this.var_3490.height + 5;
         var _loc4_:int = int((_loc2_ - this.var_3511 - this.var_3495.width - this.var_3514) / 4);
         this.var_3492.x = _loc4_;
         this.var_3495.x = this.var_3511 + _loc4_ * 2;
         this.var_3494.x = this.var_3511 + this.var_3495.width + _loc4_ * 3;
         this.var_3492.y = this.var_3495.y = this.var_3494.y = this.var_3505.y + 71;
         this.name_2959();
         if(param1)
         {
            this.method_3148();
         }
      }
      
      public function name_2959() : void
      {
         this.var_3500.x = 11;
         this.var_3500.y = this.var_3492.y + this.var_3492.height - 11;
         this.var_3497.x = 11;
         this.var_3497.y = this.var_3500.y + this.var_3500.height + 8;
         this.var_3503.x = 11;
         this.var_3503.y = this.var_3497.y + this.var_3497.height + 8;
         this.var_3503.visible = !this.name_2957().parkour;
         var _loc1_:DisplayObject = this.var_3503.visible ? this.var_3503 : this.var_3497;
         this.var_3499.x = 11;
         this.var_3499.y = _loc1_.y + _loc1_.height + 8;
         this.var_3504.x = 11;
         this.var_3504.y = this.var_3499.y + this.var_3499.height + 8;
         _loc1_ = this.var_3504.visible ? this.var_3504 : this.var_3499;
         this.var_3507.x = 11;
         this.var_3507.y = _loc1_.y + _loc1_.height + 8;
         var _loc2_:Number = this.method_3128();
         var _loc3_:int = _loc2_ / 2 + 5;
         this.var_3496.x = _loc3_;
         this.var_3496.y = this.var_3500.y;
         this.var_3496.width = _loc2_ - this.var_3496.x - 11;
         this.var_3502.x = _loc3_;
         this.var_3502.y = this.var_3497.y;
         this.var_3498.x = _loc3_;
         this.var_3498.y = this.var_3502.y + this.var_3502.height + 8;
         this.var_3501.x = _loc3_;
         this.var_3501.y = this.var_3498.y + this.var_3498.height + 8;
         _loc1_ = this.var_3501.visible ? this.var_3501 : this.var_3498;
         this.var_3506.x = _loc2_ - this.var_3506.width - 11;
         this.var_3506.y = this.method_3136() - 42;
      }
      
      public function method_3146(param1:int) : void
      {
         this.var_3496.height = 34 + param1 * this.var_3496.rowHeight;
      }
      
      private function method_3136() : Number
      {
         return Math.max(display.stage.stageHeight - 60,530);
      }
      
      private function method_3148(param1:int = 200) : void
      {
         clearTimeout(this.var_3513);
         this.var_3513 = setTimeout(this.method_3149,param1);
      }
      
      private function method_3149() : void
      {
         this.resize(false);
      }
      
      public function name_2976(param1:Array) : void
      {
         var _loc2_:name_2944 = null;
         this.var_3491.clear();
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_] as name_2944;
            this.var_3491.addItem({
               "index":_loc2_.index,
               "gameName":_loc2_.gameName,
               "id":_loc2_.id,
               "minRank":_loc2_.minRank,
               "maxRank":_loc2_.maxRank,
               "rang":_loc2_.currentRank,
               "maxPeople":_loc2_.maxPeople,
               "battleModes":_loc2_.battleModes
            });
            _loc4_++;
         }
      }
      
      public function name_2989(param1:Array) : void
      {
         var _loc2_:MapTheme = null;
         this.var_3493.clear();
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_].theme;
            this.var_3493.addItem({
               "gameName":name_1663.method_2437(_loc2_),
               "themeName":param1[_loc4_].gameName,
               "id":param1[_loc4_].id,
               "rang":param1[_loc4_].rang,
               "theme":_loc2_,
               "sortIndex":_loc2_.value
            });
            _loc4_++;
         }
         this.var_3493.sortOn("sortIndex",[Array.NUMERIC]);
         this.var_3493.height = 34 + _loc3_ * 20;
      }
      
      public function name_2998(param1:String, param2:String) : void
      {
         this.var_3491.name_1962(param1,param2);
      }
      
      public function name_2995(param1:String, param2:String) : void
      {
         this.var_3493.name_1962(param1,param2);
      }
      
      public function name_2946() : Object
      {
         return this.var_3491.selectedItem;
      }
      
      public function name_2948() : Object
      {
         return this.var_3493.selectedItem;
      }
      
      public function name_2974() : void
      {
         this.var_3510 = true;
         this.var_3493.visible = this.var_3510;
         this.method_3130();
      }
      
      public function name_2991() : void
      {
         this.var_3510 = false;
         this.var_3493.visible = this.var_3510;
         this.method_3130();
      }
      
      public function name_2985(param1:int, param2:int) : void
      {
         this.var_3492.minValue = param1;
         this.var_3492.maxValue = param2;
         this.var_3492.value = param2;
      }
      
      public function name_2987(param1:int, param2:int, param3:int) : void
      {
         this.var_3495.minValue = param1;
         this.var_3495.maxValue = param2;
         this.var_3495.value = param3;
      }
      
      public function name_2947(param1:int, param2:int, param3:int, param4:String, param5:DisplayObject) : void
      {
         this.var_3494.minValue = 0;
         this.var_3494.maxValue = param1;
         this.var_3494.value = param2;
         this.var_3494.name_3464 = param3;
         this.var_3494.label = param4;
         this.var_3494.icon1 = param5;
      }
      
      public function name_2969() : void
      {
         this.var_3492.label = name_1663.method_2427;
      }
      
      public function name_2951() : void
      {
         this.var_3492.label = name_1663.method_2438;
      }
      
      public function name_2952() : int
      {
         return this.var_3495.value;
      }
      
      public function name_2954() : int
      {
         return this.var_3494.value;
      }
      
      public function name_2980() : int
      {
         return this.var_3492.value;
      }
      
      private function method_3130() : void
      {
         var _loc1_:Number = this.method_3128();
         if(this.var_3510)
         {
            this.var_3491.width = int(_loc1_ / 2 - this.var_3491.x - 11);
            this.var_3493.width = int(_loc1_ / 2 - this.var_3491.x - 10);
            this.var_3493.x = int(_loc1_ / 2 + this.var_3491.x);
         }
         else
         {
            this.var_3491.width = _loc1_ - this.var_3491.x - 11;
         }
         this.var_3493.y = 11;
      }
      
      private function method_3128() : Number
      {
         return int(Math.max(970,display.stage.stageWidth)) / 3;
      }
      
      private function method_3143(param1:CheckBoxEvent) : void
      {
         this.method_3127("privateBattleChange");
      }
      
      private function method_3142(param1:name_3459) : void
      {
         this.method_3127("rankLimitChange");
      }
      
      private function method_3133(param1:MouseEvent) : void
      {
         this.var_2241.method_1977();
         this.method_3127("startBattle");
      }
      
      private function onResize(param1:Event) : void
      {
         this.resize();
      }
      
      private function method_2769(param1:Event) : void
      {
         this.var_2241.method_2769();
         this.method_3127("mapChange");
      }
      
      private function method_3145(param1:Event) : void
      {
         this.method_3127("mapComboBoxOpen");
      }
      
      private function method_3139(param1:Event) : void
      {
         this.method_3127("themeComboBoxOpen");
      }
      
      private function method_2775(param1:Event) : void
      {
         this.var_2241.method_2775();
         this.method_3127("themeChange");
      }
      
      private function method_2776(param1:Event) : void
      {
         this.var_2241.method_2776();
      }
      
      private function method_2781(param1:Event) : void
      {
         this.var_2241.method_2781();
      }
      
      private function method_2773(param1:Event) : void
      {
         this.var_2241.method_2773();
      }
      
      private function method_3137(param1:CheckBoxEvent) : void
      {
         this.method_3127("supplyChange");
         this.method_3129();
         this.name_2959();
      }
      
      private function method_3141(param1:CheckBoxEvent) : void
      {
         this.method_3127("friendlyFireChange");
      }
      
      private function method_3131(param1:CheckBoxEvent) : void
      {
         this.method_3127("bonusesChange");
         this.method_3129();
         this.name_2959();
      }
      
      private function method_3134(param1:CheckBoxEvent) : void
      {
         this.method_3127("goldBoxesChange");
      }
      
      private function method_3140(param1:CheckBoxEvent) : void
      {
         this.method_3127("autoBalanceChange");
      }
      
      private function method_3147(param1:CheckBoxEvent) : void
      {
         this.method_3127("clanChange");
      }
      
      private function method_3144(param1:MouseEvent) : void
      {
         this.method_3127("scoreLimitChange");
      }
      
      private function method_3132(param1:MouseEvent) : void
      {
         this.method_3127("playersNumberChange");
      }
      
      private function method_3135(param1:MouseEvent) : void
      {
         this.method_3127("timeLimitChange");
      }
      
      private function method_3138(param1:CheckBoxEvent) : void
      {
         this.var_2241.method_2779();
         this.method_3127("ReArmorChange");
      }
      
      private function method_3127(param1:String) : void
      {
         if(this.var_3512[param1] == null)
         {
            this.var_3512[param1] = true;
         }
      }
      
      public function name_2984(param1:Vector.<Object>) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.var_3496.addItem(param1[_loc2_]);
            _loc2_++;
         }
         this.method_3146(param1.length);
      }
      
      public function name_2957() : Object
      {
         return this.var_3496.selectedItem;
      }
      
      public function name_2971() : void
      {
         this.var_3498.method_2613(false);
      }
      
      public function name_2990() : void
      {
         this.var_3502.method_2613(false);
         this.var_3509.method_2613(false);
      }
      
      public function name_2960(param1:int) : void
      {
         this.var_3496.name_1962("index",param1);
      }
      
      public function name_2988() : void
      {
      }
      
      public function name_2978() : Boolean
      {
         return this.var_3508.checked;
      }
      
      public function name_2996() : void
      {
         this.var_3508.method_2613(false);
      }
      
      private function method_3129() : void
      {
         this.var_3508.visible = this.var_2241.name_2284.ultimatesEnabled && (this.var_3499.checked || this.var_3497.checked);
         if(!this.var_3508.visible)
         {
            this.var_3508.method_2613(false);
         }
      }
   }
}
