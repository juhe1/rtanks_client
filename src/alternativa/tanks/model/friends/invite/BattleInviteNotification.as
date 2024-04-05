package alternativa.tanks.model.friends.invite
{
   import assets.cellrenderer.battlelist.PaydIcon;
   import controls.base.name_1134;
   import controls.base.name_998;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextLineMetrics;
   import forms.name_1139;
   import package_1.Main;
   import package_175.class_151;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_324.Signal;
   import package_390.name_1889;
   import package_54.LocaleService;
   import package_54.name_102;
   import package_60.TextConst;
   import package_95.name_298;
   import package_95.name_526;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class BattleInviteNotification extends class_151
   {
      
      public static var localeService:name_102 = LocaleService(Main.osgi.name_6(name_102));
      
      public static var storageService:name_298 = name_526(Main.osgi.name_6(name_298));
      
      private static const const_1576:int = 96;
      
      private static const SHOW_ALERT_ABOUT_INACCESSIBLE_IN_STANDALONE:String = "SHOW_ALERT_ABOUT_INACCESSIBLE_IN_STANDALONE";
       
      
      private var var_1367:name_1889;
      
      private var var_2889:String;
      
      private var var_2890:Boolean;
      
      private var var_1866:name_1134;
      
      private var var_2885:name_1134;
      
      private var var_1868:name_998;
      
      private var var_1867:name_998;
      
      private var var_2887:Boolean;
      
      private var var_953:Boolean;
      
      private var var_2888:String;
      
      private var var_2886:PaydIcon;
      
      public function BattleInviteNotification(param1:String, param2:String, param3:int, param4:String, param5:Boolean, param6:String, param7:Boolean)
      {
         this.var_2889 = param4;
         this.var_2890 = param5;
         this.var_953 = param7;
         this.var_2888 = param6;
         super(param1,param2);
      }
      
      private static function method_2721() : Boolean
      {
         var _loc1_:* = storageService.getStorage().data["SHOW_ALERT_ABOUT_INACCESSIBLE_IN_STANDALONE"];
         return _loc1_ != undefined;
      }
      
      private static function method_2720() : void
      {
         storageService.getStorage().data["SHOW_ALERT_ABOUT_INACCESSIBLE_IN_STANDALONE"] = true;
         storageService.getStorage().flush();
      }
      
      override protected function init() : void
      {
         super.init();
         this.var_2887 = this.var_2890 && !ExternalInterface.available;
         this.var_1367 = new name_1889(userId);
         addChild(this.var_1367);
         this.var_1866 = new name_1134();
         this.var_1866.color = name_1139.name_1894;
         this.var_1866.mouseEnabled = false;
         addChild(this.var_1866);
         this.var_1866.htmlText = message;
         this.var_2885 = new name_1134();
         this.var_2885.color = name_1139.name_1894;
         this.var_2885.mouseEnabled = false;
         addChild(this.var_2885);
         this.var_2885.htmlText = this.var_2888;
         if(this.var_953)
         {
            this.var_2886 = new PaydIcon();
            this.var_2886.gotoAndStop(1);
            addChild(this.var_2886);
         }
         this.var_1867 = new name_998();
         this.var_1867.width = 96;
         this.var_1867.label = localeService.getText(TextConst.const_346);
         addChild(this.var_1867);
         this.var_1868 = new name_998();
         this.var_1868.width = 96;
         this.var_1868.label = localeService.getText(TextConst.const_354);
         addChild(this.var_1868);
         this.var_1867.visible = !this.var_2887;
         this.var_1868.visible = !this.var_2887;
      }
      
      override protected function method_1568() : void
      {
         super.method_1568();
         this.var_1867.addEventListener(MouseEvent.CLICK,this.method_2027);
         this.var_1868.addEventListener(MouseEvent.CLICK,this.method_2028);
      }
      
      override protected function method_1476() : void
      {
         super.method_1476();
         this.var_1867.removeEventListener(MouseEvent.CLICK,this.method_2027);
         this.var_1868.removeEventListener(MouseEvent.CLICK,this.method_2028);
      }
      
      private function method_2027(param1:MouseEvent) : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;accept_invite;" + userId);
         PanelModel(Main.osgi.name_6(name_115)).goToBattle(this.var_2889);
         hide();
      }
      
      private function method_2028(param1:MouseEvent) : void
      {
         this.method_1655();
      }
      
      override protected function method_1655() : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;reject_invite;" + userId);
         if(this.var_2887 && !method_2721())
         {
            method_2720();
         }
         hide();
      }
      
      override public function show(param1:Signal) : void
      {
         super.show(param1);
      }
      
      override protected function resize() : void
      {
         var _loc1_:TextLineMetrics = null;
         var _loc2_:int = 0;
         this.var_1367.x = 11 + 7;
         this.var_1367.y = 11 + 5;
         this.var_1866.x = 11 + 9;
         this.var_1866.y = this.var_1367.y + this.var_1367.height - 1;
         this.var_2885.x = 11 + 9;
         _loc1_ = this.var_1866.getLineMetrics(0);
         if(this.var_953)
         {
            this.var_2886.x = 11 + 12;
            this.var_2886.y = this.var_1866.y + _loc1_.height + 3;
            this.var_2885.x = this.var_2886.x + this.var_2886.width + 2;
         }
         this.var_2885.y = this.var_1866.y + _loc1_.height;
         var_1450 = this.var_1866.y + this.var_1866.height - 3;
         var _loc3_:int = this.var_1866.x + this.var_1866.width + 11 * 2;
         if(_loc3_ > _width)
         {
            _width = _loc3_;
         }
         if(this.var_2887)
         {
            _height = var_1450 + 11 * 2 + 1;
         }
         else
         {
            _loc2_ = var_1450 + 16;
            this.var_1867.x = 11;
            this.var_1867.y = _loc2_;
            this.var_1868.x = _width - this.var_1868.width - 11;
            this.var_1868.y = _loc2_;
            _height = this.var_1867.y + this.var_1867.height + 11 + 1;
         }
         super.resize();
      }
   }
}
