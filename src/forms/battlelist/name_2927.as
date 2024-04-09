package forms.battlelist
{
   import alternativa.tanks.model.BattleSelectModel;
   import assets.icons.InputCheckIcon;
   import controls.base.LabelBase;
   import controls.base.name_2016;
   import controls.base.DefaultButtonBase;
   import controls.TankWindowInner;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.system.System;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import forms.RegisterForm;
   import forms.name_3402;
   import package_1.Main;
   import package_413.name_2265;
   import package_454.BattleInfoBaseParams;
   import package_457.BigWhiteTimeLeftIndicator;
   import package_457.name_2935;
   import package_475.name_3401;
   import package_54.name_102;
   import package_60.TextConst;
   import projects.tanks.client.battleselect.name_386;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeChildrenFrom;
   
   public class name_2927 extends Sprite
   {
      
      private static const const_1994:int = 500;
      
      private static const const_2672:int = 6;
      
      private static var var_3444:InputCheckIcon = new InputCheckIcon();
       
      
      private var _width:int;
      
      private var _height:int;
      
      public var var_463:int = 0;
      
      private var var_462:Timer;
      
      private var var_1909:int = 0;
      
      private var var_3454:Sprite;
      
      private var var_3465:Number;
      
      private var var_3446:Sprite;
      
      private var var_3445:Sprite;
      
      private var var_3466:Bitmap;
      
      private var var_3467:Bitmap;
      
      private var var_3451:Bitmap;
      
      private var var_3461:Bitmap;
      
      private var var_3462:Bitmap;
      
      private var var_3464:Bitmap;
      
      private var var_3463:Bitmap;
      
      private var var_3450:Bitmap;
      
      private var var_3455:Bitmap;
      
      private var var_3468:Bitmap;
      
      private var var_3460:Bitmap;
      
      private var bg:TankWindowInner;
      
      private var var_3456:LabelBase;
      
      private var var_1740:LabelBase;
      
      private var var_3452:LabelBase;
      
      private var var_3453:name_2935;
      
      private var var_1325:LabelBase;
      
      private var preview:Sprite;
      
      private var rect:Rectangle;
      
      private var var_3447:name_2016;
      
      private var var_3448:DefaultButtonBase;
      
      private var var_3458:Boolean = false;
      
      private var var_3459:String;
      
      private var var_3457:int;
      
      private var var_3449:DefaultButtonBase;
      
      public var var_3469:int = 0;
      
      private var var_3443:BattleInfoBaseParams;
      
      public function name_2927()
      {
         var localeService:name_102 = null;
         var filter:Array = null;
         this.preview = new Sprite();
         this.rect = new Rectangle(0,0,400,300);
         super();
         localeService = Main.osgi.getService(name_102) as name_102;
         filter = [new GlowFilter(0,1,6,6)];
         this.var_3446 = new Sprite();
         this.var_3445 = new Sprite();
         this.var_3466 = new Bitmap(name_3401.name_3415);
         this.var_3467 = new Bitmap(name_3401.name_3412);
         this.var_3451 = new Bitmap();
         this.var_3461 = new Bitmap(name_3401.name_3414);
         this.var_3462 = new Bitmap(name_3401.name_3416);
         this.var_3464 = new Bitmap(name_3401.name_3405);
         this.var_3463 = new Bitmap(name_3401.name_3411);
         this.var_3450 = new Bitmap(name_3401.name_3409);
         this.var_3455 = new Bitmap(name_3401.name_3413);
         this.var_3468 = new Bitmap(name_3401.name_3407);
         this.var_3460 = new Bitmap(name_3401.name_3408);
         this.var_3456 = new LabelBase();
         this.var_1740 = new LabelBase();
         this.var_3452 = new LabelBase();
         this.var_3453 = new BigWhiteTimeLeftIndicator();
         this.bg = new TankWindowInner(100,100,TankWindowInner.name_2114);
         this.var_1325 = new LabelBase();
         this.preview = new Sprite();
         this.rect = new Rectangle(0,0,400,300);
         this.var_3454 = new Sprite();
         this.var_3449 = new DefaultButtonBase();
         addChild(this.preview);
         addChild(this.bg);
         addChild(this.var_1325);
         addChild(this.var_3454);
         addChild(this.var_3446);
         addChild(this.var_3445);
         addChild(this.var_3449);
         addChild(this.var_3450);
         addChild(this.var_3455);
         this.var_3449.label = "Spectator";
         this.var_3449.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            var _loc2_:BattleSelectModel = Main.osgi.getService(name_386) as BattleSelectModel;
            if(_loc2_ == null)
            {
               return;
            }
            _loc2_.method_1999();
         });
         this.method_3111();
         this.var_1325.size = 18;
         this.var_1325.height = 25;
         this.var_1325.thickness = 0;
         this.var_1325.autoSize = TextFieldAutoSize.NONE;
         this.var_1325.filters = filter;
         this.var_3446.filters = filter;
         this.var_3445.filters = filter;
         this.var_3450.filters = filter;
         this.var_3455.filters = filter;
         this.var_3450.visible = false;
         this.var_3455.visible = false;
         this.preview.scrollRect = this.rect;
         this.var_3459 = localeService.getText(TextConst.BATTLEINFO_PANEL_COPY_LINK_TEXT);
      }
      
      public function name_1550(param1:BitmapData) : void
      {
         if(this.preview.numChildren > 0)
         {
            this.preview.removeChildAt(0);
         }
         if(param1 == null)
         {
            this.preview.addChild(var_3444);
            var_3444.gotoAndStop(RegisterForm.name_2297);
            var_3444.x = int(375 - var_3444.width / 2);
            var_3444.y = int(250 - var_3444.height / 2);
            this.preview.scrollRect = this.rect;
         }
         else
         {
            this.preview.addChild(new Bitmap(param1));
            this.preview.scrollRect = this.rect;
         }
         this.width = this._width;
         this.height = this._height;
      }
      
      public function update(param1:BattleInfoBaseParams) : void
      {
         if(param1 != null)
         {
            this.var_3443 = param1;
            this.method_3115();
            this.method_3113();
            this.method_3114();
            this.method_3118();
            this.name_2959();
            if(param1.name_2930.limits.timeLimitInSec > 0)
            {
               this.var_3457 = getTimer();
               this.var_463 = param1.var_211 > 0 ? param1.var_211 : param1.name_2930.limits.timeLimitInSec;
               this.var_3458 = param1.var_211 == 0;
               this.var_1909 = this.var_463;
               this.method_686();
            }
         }
         this.width = this._width;
         this.height = this._height;
      }
      
      private function method_686() : void
      {
         this.var_462 = new Timer(500);
         this.var_462.addEventListener(TimerEvent.TIMER,this.method_685);
         this.var_462.start();
         this.method_685();
      }
      
      public function name_2276() : void
      {
         this.var_463 = this.var_1909;
         this.var_3457 = getTimer();
         if(this.var_462 != null)
         {
            this.var_462.stop();
            this.var_462.removeEventListener(TimerEvent.TIMER,this.method_685);
         }
         this.method_686();
      }
      
      public function name_2282() : void
      {
         this.var_463 = 0;
         this.method_685();
         if(this.var_462 != null)
         {
            this.var_462.stop();
            this.var_462.removeEventListener(TimerEvent.TIMER,this.method_685);
         }
      }
      
      private function method_685(param1:TimerEvent = null) : void
      {
         var _loc2_:int = getTimer();
         this.method_3112(this.var_463);
         if((this.var_463 < 0 || this.var_3458) && this.var_462 != null)
         {
            this.var_462.removeEventListener(TimerEvent.TIMER,this.method_685);
            this.var_462.stop();
            this.var_3458 = false;
         }
         this.var_463 = this.var_1909 - (_loc2_ - this.var_3457) / 1000;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function name_2959() : void
      {
         removeChildrenFrom(this.var_3445);
         if(this.var_3443.name_2930.proBattle)
         {
            this.method_3109(this.var_3462,!this.var_3443.name_2930.withoutBonuses);
            if(!this.var_3443.name_2930.parkourMode)
            {
               this.method_3109(this.var_3464,this.var_3443.name_2930.goldBoxesEnabled);
            }
            this.method_3109(this.var_3468,this.var_3443.name_2930.reArmorEnabled);
            this.method_3109(this.var_3463,!this.var_3443.name_2930.withoutUpgrades);
            this.method_3109(this.var_3461,!this.var_3443.name_2930.withoutSupplies);
            if(this.var_3443.name_2930.battleMode != BattleMode.DM)
            {
               this.method_3109(this.var_3467,this.var_3443.name_2930.friendlyFire);
               this.method_3109(this.var_3466,this.var_3443.name_2930.autoBalance);
            }
            this.method_3109(this.var_3460,this.var_3443.name_2930.clanBattle);
         }
      }
      
      private function method_3118() : void
      {
         removeChildrenFrom(this.var_3446);
         if(this.var_3443.name_2930.limits.timeLimitInSec > 0)
         {
            this.var_1740.text = int(this.var_3443.name_2930.limits.timeLimitInSec / 60).toString();
            this.var_1740.size = 14;
            this.var_3446.addChild(this.var_1740);
            this.var_3446.addChild(this.var_3453);
            this.var_3453.x = this.var_1740.textWidth + 11;
            this.var_3453.y = 2;
            this.var_3446.addChild(this.var_3452);
            this.var_3452.x = this.var_3453.x + this.var_3453.width + 5;
            this.var_3452.autoSize = TextFieldAutoSize.NONE;
            this.var_3452.size = 14;
            this.var_3452.width = 50;
            this.var_3452.height = 20;
         }
         if(this.var_3443.name_2930.limits.scoreLimit > 0)
         {
            this.var_3451.x = this.var_3446.numChildren > 0 ? Number(this.var_3446.width + 6) : Number(0);
            this.var_3451.y = -4;
            this.var_3446.addChild(this.var_3451);
            switch(this.var_3443.name_2930.battleMode)
            {
               case BattleMode.CP:
                  this.var_3451.bitmapData = name_3401.name_3403;
                  break;
               case BattleMode.CTF:
                  this.var_3451.bitmapData = name_3401.name_3410;
                  break;
               default:
                  this.var_3451.bitmapData = name_3401.name_3406;
            }
            this.var_3446.addChild(this.var_3456);
            this.var_3456.size = 14;
            this.var_3456.text = String(this.var_3443.name_2930.limits.scoreLimit);
            this.var_3456.x = this.var_3451.x + 18;
         }
      }
      
      private function method_3114() : void
      {
         var _loc2_:Boolean = false;
         _loc2_ = false;
         this.var_1325.text = this.var_3443.mapName;
         if(_loc2_)
         {
            this.var_1325.text += " " + "";
         }
         this.var_3450.x = this.var_1325.x + this.var_1325.textWidth + 8;
         this.var_3450.y = this.var_1325.y - 1;
         this.var_3450.visible = this.var_3443.name_2930.proBattle && !_loc2_;
         this.var_3455.x = this.var_3450.x;
         this.var_3455.y = this.var_3450.y;
         this.var_3455.visible = this.var_3443.name_2930.proBattle && _loc2_;
      }
      
      private function method_3113() : void
      {
         if(this.var_3443.name_2929.length > 0 && this.var_3447 == null)
         {
            this.var_3447 = new name_2016();
            this.var_3448 = new DefaultButtonBase();
            addChild(this.var_3447);
            addChild(this.var_3448);
         }
         if(this.var_3443.name_2929.length > 0)
         {
            this.var_3447.value = this.var_3443.name_2929;
            this.var_3447.textField.type = TextFieldType.DYNAMIC;
            this.var_3448.width = this.var_3459.length * 7;
            this.var_3448.label = this.var_3459;
            this.var_3448.addEventListener(MouseEvent.CLICK,this.method_3117);
         }
      }
      
      private function method_3115() : void
      {
         var _loc1_:SmallRankIcon = null;
         var _loc2_:int = 0;
         var _loc3_:name_2265 = this.var_3443.name_2930.rankRange;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         removeChildrenFrom(this.var_3454);
         if(_loc3_.min != 0 && _loc3_.max != 0)
         {
            _loc2_ = _loc3_.max;
            while(_loc2_ >= _loc3_.min)
            {
               _loc1_ = new SmallRankIcon(_loc2_);
               _loc1_.x = _loc4_ * 15;
               _loc1_.y = _loc5_ * 16;
               this.var_3454.addChild(_loc1_);
               _loc4_--;
               if(_loc4_ < -15)
               {
                  _loc5_--;
                  _loc4_ = 0;
               }
               _loc2_--;
            }
         }
         this.var_3465 = _loc5_ * 16;
      }
      
      private function method_3109(param1:Bitmap, param2:Boolean) : void
      {
         var _loc3_:int = this.var_3445.numChildren;
         var _loc4_:int = Math.floor(this.width / (param1.width + 6));
         if(_loc3_ > 0)
         {
            param1.x = this.var_3445.width + 6;
         }
         else
         {
            param1.x = 0;
         }
         if(_loc3_ > _loc4_)
         {
            param1.y = param1.height + 6;
            param1.x = (param1.width + 6) * (_loc3_ - (_loc4_ - 1));
         }
         param1.alpha = param2 ? Number(1) : Number(0.5);
         this.var_3445.addChild(param1);
      }
      
      private function method_3117(param1:MouseEvent) : void
      {
         System.setClipboard(this.var_3447.value);
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.bg.width = this._width;
         this.preview.x = 1;
         this.rect.x = int(375 - this._width / 2);
         this.rect.width = this._width - 2;
         this.preview.scrollRect = this.rect;
         this.var_3454.x = this._width - 23;
         this.var_1325.x = 10;
         this.var_1325.width = this._width - 20;
         this.var_3446.x = 12;
         this.var_3445.x = 12;
         this.var_3449.x = this._width - this.var_3449.width - 9;
         if(this.var_3447 != null)
         {
            this.var_3447.width = this._width - this.var_3448.width - 3;
            this.var_3448.x = this._width - this.var_3448.width;
         }
         this.method_3116();
      }
      
      private function method_3116() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         if(this.var_3445.numChildren > 0)
         {
            _loc1_ = this.var_3445.numChildren;
            _loc2_ = this.width - 30;
            _loc3_ = Math.floor(_loc2_ / (this.var_3445.getChildAt(0).width + 6));
            if(_loc1_ <= _loc3_)
            {
               return;
            }
            _loc4_ = 0;
            while(_loc4_ < _loc1_)
            {
               _loc5_ = this.var_3445.getChildAt(_loc4_);
               if(_loc4_ > _loc3_)
               {
                  _loc5_.y = _loc5_.height + 6;
                  _loc5_.x = (_loc5_.width + 6) * (_loc4_ - (_loc3_ + 1));
               }
               else
               {
                  _loc5_.y = 0;
                  _loc5_.x = (_loc5_.width + 6) * _loc4_;
               }
               _loc4_++;
            }
         }
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = Math.min(param1,500);
         this.bg.height = this.var_3447 != null ? Number(this._height - this.var_3447.height - 3) : Number(this._height);
         this.preview.y = 1;
         this.rect.y = int(250 - this._height / 2);
         this.rect.height = this.bg.height - 2;
         this.preview.scrollRect = this.rect;
         this.var_3454.y = this.bg.height - 23;
         this.var_1325.y = 10;
         this.var_3446.y = 40;
         this.var_3445.y = 70;
         this.var_3449.y = this.var_3454.y + this.var_3465 - this.var_3449.height - 9;
         if(this.var_3447 != null)
         {
            this.var_3447.y = this._height - this.var_3448.height;
            this.var_3448.y = this._height - this.var_3448.height;
         }
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function name_2277() : void
      {
         this.var_3449.visible = true;
      }
      
      public function method_3111() : void
      {
         this.var_3449.visible = false;
      }
      
      public function method_3112(param1:int) : void
      {
         this.var_3452.text = name_3402.name_3404(param1);
         this.var_3453.method_1981(this.method_3110(param1));
      }
      
      private function method_3110(param1:int) : Number
      {
         if(param1 == 0)
         {
            return 1;
         }
         return param1 / this.var_3443.name_2930.limits.timeLimitInSec;
      }
   }
}
