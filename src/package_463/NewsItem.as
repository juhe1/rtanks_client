package package_463
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.GreenFrame;
   import alternativa.tanks.services.name_363;
   import controls.base.name_1134;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.globalization.DateTimeFormatter;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import forms.name_1139;
   import package_10.CacheLoader;
   import package_130.name_348;
   import package_207.name_561;
   import package_424.NewsTab;
   import package_433.ShopCategoryEnum;
   import package_54.name_102;
   
   public class NewsItem extends Sprite
   {
      
      public static var var_3125:name_363 = OSGi.getInstance().name_6(name_363) as name_363;
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      public static var userPropertiesService:name_561 = OSGi.getInstance().name_6(name_561) as name_561;
      
      private static const WIDTH:int = 280;
      
      private static const const_2748:int = 80;
      
      private static const const_1533:int = 5;
      
      private static const const_1891:int = 80;
      
      private static const const_2747:int = 27;
       
      
      private var var_3568:name_1134;
      
      private var var_3566:name_1134;
      
      private var var_3569:Dictionary;
      
      private var var_3567:GreenFrame;
      
      private var var_3278:name_348;
      
      private var timer:Timer;
      
      private var var_3570:NewsTab;
      
      public function NewsItem(param1:name_348, param2:NewsTab, param3:int)
      {
         this.var_3568 = new name_1134();
         this.var_3566 = new name_1134();
         this.var_3569 = new Dictionary();
         super();
         this.var_3278 = param1;
         this.var_3570 = param2;
         if(!var_3125.method_1161(param1) && param2 != null)
         {
            this.var_3567 = new GreenFrame(280,80);
            addChild(this.var_3567);
         }
         this.method_3025();
         this.method_3189();
         this.method_3190();
         if(param3 > 0 && param2 != null)
         {
            this.timer = new Timer(param3);
            this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
            this.timer.start();
         }
         this.method_3191();
      }
      
      private static function method_3192(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc3_:RegExp = null;
         var _loc4_:Dictionary = method_3187();
         for(_loc2_ in _loc4_)
         {
            _loc3_ = new RegExp(_loc2_,"g");
            param1 = param1.replace(_loc3_,_loc4_[_loc2_]);
         }
         return param1;
      }
      
      private static function method_3187() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         _loc1_["%USERNAME%"] = userPropertiesService.userName;
         _loc1_["%ID%"] = userPropertiesService.userId;
         _loc1_["%RANK%"] = userPropertiesService.rank;
         _loc1_["%RANK_NUM%"] = userPropertiesService.rank;
         _loc1_["%LOCALE%"] = localeService.language;
         _loc1_["%REG_DATETIME%"] = method_3188();
         return _loc1_;
      }
      
      private static function method_3188() : String
      {
         var _loc1_:Date = new Date(10000 * 1000);
         var _loc2_:DateTimeFormatter = new DateTimeFormatter("en-US");
         _loc2_.setDateTimePattern("yyyy-MM-dd\'T\'HH:mm:ss");
         return _loc2_.format(_loc1_);
      }
      
      public function name_3090() : void
      {
         if(!this.name_3089())
         {
            removeChild(this.var_3567);
            var_3125.method_1158(this.var_3278.id);
         }
      }
      
      public function name_3089() : Boolean
      {
         return this.var_3567 == null || !contains(this.var_3567);
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
         this.timer = null;
         this.var_3570.method_1164(this);
      }
      
      private function method_3025() : void
      {
         var _loc1_:CacheLoader = new CacheLoader();
         var _loc2_:URLRequest = new URLRequest(this.var_3278.imageUrl);
         _loc1_.load(_loc2_);
         addChild(_loc1_);
         _loc1_.x = 5;
         _loc1_.y = 5;
      }
      
      private function method_3189() : void
      {
         this.var_3568.x = 80;
         this.var_3568.y = 5;
         this.var_3568.htmlText = "<b>" + this.var_3278.header + "</b>";
         this.var_3568.width = 280 - 80 - 5;
         this.var_3568.color = name_1139.name_1894;
         addChild(this.var_3568);
      }
      
      private function method_3190() : void
      {
         this.var_3566.x = 80;
         this.var_3566.y = 23;
         this.var_3566.wordWrap = true;
         this.var_3566.multiline = true;
         this.var_3566.width = this.var_3568.width;
         this.var_3566.htmlText = this.var_3278.description;
         this.var_3566.color = name_1139.name_1894;
         addChild(this.var_3566);
      }
      
      private function method_3191() : void
      {
         var _loc1_:ShopCategoryEnum = null;
         this.var_3569["shop"] = ShopCategoryEnum.NO_CATEGORY;
         for each(_loc1_ in ShopCategoryEnum.method_393)
         {
            this.var_3569["shop/" + _loc1_.name.toLocaleLowerCase()] = _loc1_;
         }
      }
      
      public function destroy() : void
      {
         if(this.timer != null)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
         }
      }
      
      public function resize(param1:int) : void
      {
         this.var_3566.width = param1 - 80 - 5;
         if(this.var_3567 != null)
         {
            this.var_3567.name_1152(param1);
            this.var_3567.name_1142(this.method_165());
         }
      }
      
      public function method_165() : int
      {
         return Math.max(this.var_3566.textHeight + 27,80);
      }
   }
}
