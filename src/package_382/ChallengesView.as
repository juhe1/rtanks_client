package package_382
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.quest.common.name_551;
   import controls.Label;
   import controls.buttons.h30px.H30ButtonSkin;
   import controls.buttons.h30px.name_3299;
   import controls.TankWindowInner;
   import controls.timer.CountDownTimer;
   import controls.timer.name_3298;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import package_104.name_327;
   import package_104.name_330;
   import package_120.name_408;
   import package_133.name_360;
   import package_134.name_357;
   import package_17.name_44;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_54.name_102;
   import platform.client.fp10.core.resource.BatchResourceLoader;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class ChallengesView extends Sprite
   {
      
      public static var var_3350:name_44 = OSGi.getInstance().getService(name_44) as name_44;
      
      public static var var_1580:name_360 = OSGi.getInstance().getService(name_360) as name_360;
      
      public static var var_1581:name_357 = OSGi.getInstance().getService(name_357) as name_357;
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
      
      public static var var_1579:name_551 = OSGi.getInstance().getService(name_551) as name_551;
      
      private static const const_2595:Class = name_3302;
      
      private static const const_2593:BitmapData = new const_2595().bitmapData;
      
      private static const const_2598:Class = name_3301;
      
      private static const const_2594:BitmapData = new const_2598().bitmapData;
      
      private static const const_2597:Class = name_3300;
      
      private static const const_2599:BitmapData = new const_2597().bitmapData;
      
      private static const const_2596:Class = name_3303;
      
      private static const const_2592:BitmapData = new const_2596().bitmapData;
      
      private static var const_1533:int = 3;
      
      private static var var_3354:int = 724;
      
      private static var var_3351:int = 335;
      
      private static var var_3353:int = 520;
      
      private static var var_3352:int = 180;
       
      
      private var var_3349:TierNumberView;
      
      private var package_452:ChallengesProgressView;
      
      private var var_3348:TierList;
      
      private var var_643:name_3299;
      
      private var timer:CountDownTimer;
      
      private var var_1278:Label;
      
      private var var_3347:Vector.<name_327>;
      
      private var var_3355:Boolean;
      
      public function ChallengesView()
      {
         this.var_3349 = new TierNumberView();
         this.package_452 = new ChallengesProgressView();
         this.var_3348 = new TierList();
         this.var_643 = new name_3299();
         this.timer = new CountDownTimer();
         this.var_1278 = new Label();
         super();
         this.method_3015();
         this.method_3014();
         this.method_3018();
         this.method_3020();
         this.method_3016();
         this.method_3021();
         this.method_3019();
         this.var_3355 = true;
         this.name_2725();
      }
      
      public function name_2724() : void
      {
         this.method_3017();
      }
      
      private function method_3017() : void
      {
         var tier:name_327 = null;
         var freeItem:name_330 = null;
         var battlePassItem:name_330 = null;
         var resources:Vector.<Resource> = new Vector.<Resource>();
         for each(tier in this.var_3347)
         {
            freeItem = tier.freeItem;
            if(freeItem != null)
            {
               this.method_3012(freeItem.preview,resources);
            }
            battlePassItem = tier.battlePassItem;
            if(battlePassItem != null)
            {
               this.method_3012(battlePassItem.preview,resources);
            }
         }
         if(resources.length > 0)
         {
            new BatchResourceLoader(function():void
            {
               refresh();
            }).load(resources);
         }
         else
         {
            this.refresh();
         }
      }
      
      public function name_2723(param1:Vector.<name_327>) : void
      {
         this.var_3347 = param1;
      }
      
      private function refresh() : void
      {
         var _loc1_:int = int(var_1580.method_1103());
         if(this.var_3347 == null || this.var_3347.length == 0)
         {
            return;
         }
         var _loc2_:int = this.method_3013(_loc1_);
         var _loc3_:int = this.var_3347[_loc2_].stars;
         var _loc4_:int = _loc2_ == 0 ? int(0) : int(this.var_3347[_loc2_ - 1].stars);
         var _loc5_:int = _loc1_ >= _loc3_ ? int(100) : int((_loc1_ - _loc4_) * 100 / (_loc3_ - _loc4_));
         this.var_3349.level = _loc2_ + 1;
         this.var_3348.name_3304(this.var_3347,_loc2_,_loc5_);
         this.package_452.method_284(_loc5_,_loc1_,_loc3_);
         if(this.var_3355)
         {
            this.method_901(_loc5_ == 100);
         }
      }
      
      public function name_2722(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.var_3347.length - 1)
         {
            if(this.var_3347[_loc2_].stars >= param1)
            {
               return _loc2_ + 1;
            }
            _loc2_++;
         }
         return this.var_3347.length;
      }
      
      private function method_3013(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.var_3347.length - 1)
         {
            if(this.var_3347[_loc2_].stars > param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return this.var_3347.length - 1;
      }
      
      private function method_3012(param1:ImageResource, param2:Vector.<Resource>) : void
      {
         if(param1.isLazy && !param1.isLoaded && param2.indexOf(param1) < 0)
         {
            param2.push(param1);
         }
      }
      
      private function method_3016() : void
      {
         this.var_3348.x = this.package_452.x;
         this.var_3348.y = this.package_452.y + this.package_452.height + 8;
         this.var_3348.width = var_3354;
         this.var_3348.height = var_3351;
         addChild(this.var_3348);
      }
      
      private function method_3021() : void
      {
         this.var_643.method_1961 = H30ButtonSkin.name_2261;
         this.var_643.method_1962 = H30ButtonSkin.name_2260;
         this.var_643.method_1963 = H30ButtonSkin.name_2262 - 2;
         this.var_643.width = var_3352;
         this.var_643.y = 378;
         this.var_643.visible = false;
         this.var_643.buttonMode = true;
         this.var_643.useHandCursor = true;
         addChild(this.var_643);
      }
      
      private function method_901(param1:Boolean) : void
      {
         var _loc2_:Boolean = Boolean(var_1581.method_1152());
         var _loc3_:Boolean = Boolean(name_408(OSGi.getInstance().getService(name_408)).localUserInfo.premium);
         if(!_loc2_)
         {
            this.var_643.label = localeService.getText(name_390.const_525);
            this.var_643.visible = true;
            this.var_1278.text = localeService.getText(name_390.const_741);
            this.method_3011();
            return;
         }
         if(param1)
         {
            this.var_643.visible = false;
            this.var_1278.text = localeService.getText(name_390.const_1160);
            this.method_3011();
            return;
         }
         if(!_loc3_)
         {
            this.var_643.label = localeService.getText(name_390.const_1380);
            this.var_643.visible = true;
            this.var_1278.text = localeService.getText(name_390.const_1027);
            this.method_3011();
            return;
         }
      }
      
      private function method_3011() : void
      {
         this.var_1278.x = this.var_643.visible ? Number(this.var_643.width + const_1533 * 2) : Number(this.var_643.x);
      }
      
      private function method_3019() : void
      {
         this.var_1278.width = var_3353;
         this.var_1278.y = this.var_643.y + const_1533;
         this.var_1278.visible = true;
         addChild(this.var_1278);
      }
      
      public function name_2725() : void
      {
         this.var_643.addEventListener(MouseEvent.CLICK,this.method_1553);
      }
      
      private function method_1553(param1:MouseEvent) : void
      {
         PanelModel(OSGi.getInstance().getService(name_115)).getShop();
      }
      
      private function method_3015() : void
      {
         addChild(this.var_3349);
      }
      
      private function method_3014() : void
      {
         var _loc2_:Bitmap = null;
         var _loc1_:Bitmap = new Bitmap(const_2592);
         _loc1_.y = this.var_3349.height + const_1533;
         _loc2_ = new Bitmap(const_2594);
         _loc2_.y = _loc1_.y + (_loc1_.height - _loc2_.height) / 2;
         _loc2_.x = (_loc1_.width - _loc2_.width) / 2;
         addChild(_loc1_);
         addChild(_loc2_);
         var _loc3_:Bitmap = new Bitmap(const_2599);
         _loc3_.y = _loc1_.y + _loc1_.height + const_1533;
         var _loc4_:Bitmap = new Bitmap(const_2593);
         _loc4_.y = _loc3_.y + (_loc3_.height - _loc4_.height) / 2;
         _loc4_.x = (_loc3_.width - _loc4_.width) / 2;
         addChild(_loc3_);
         addChild(_loc4_);
      }
      
      private function method_3018() : void
      {
         this.package_452.x = this.var_3349.width + 7;
         this.package_452.y = 1;
         addChild(this.package_452);
      }
      
      private function method_3020() : void
      {
         var _loc1_:TankWindowInner = new TankWindowInner(131,25);
         _loc1_.x = this.package_452.x + this.package_452.width + 8;
         var _loc2_:name_3298 = new name_3298(false);
         _loc2_.start(this.timer);
         _loc2_.x = 10;
         _loc2_.y = 5;
         _loc1_.addChild(_loc2_);
         addChild(_loc1_);
         this.timer.stop();
         this.timer.start(var_3350.method_278());
      }
      
      public function clear() : void
      {
         if(this.timer != null)
         {
            this.timer.destroy();
            this.timer = null;
         }
         this.var_3348.destroy();
         this.var_643.removeEventListener(MouseEvent.CLICK,this.method_1553);
      }
   }
}
