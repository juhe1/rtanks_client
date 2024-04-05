package package_209
{
   import alternativa.tanks.gui.notinclan.dialogs.name_573;
   import alternativa.tanks.models.user.name_580;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import forms.name_1139;
   import package_13.Long;
   import package_395.name_2048;
   import package_54.name_102;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_641 extends ClanInfoLabel
   {
      
      public static var localeService:name_102;
       
      
      private var var_1377:name_2049;
      
      public var newIndicator:name_2048;
      
      private var restrictionTime:int;
      
      private var var_1268:uint = 0;
      
      public function name_641(param1:Long)
      {
         this.var_1377 = new name_2049();
         this.newIndicator = this.method_1599(param1);
         super(param1);
      }
      
      override protected function method_1549(param1:Event = null) : void
      {
         super.method_1549();
         this.var_1377.visible = false;
         this.var_1377.addEventListener(MouseEvent.CLICK,this.method_1603);
         addChild(this.var_1377);
         this.newIndicator.updateNotifications();
         if(param1 != null)
         {
            this.newIndicator.visible = true;
         }
         addChild(this.newIndicator);
         onRollOut();
         this.method_1507();
      }
      
      public function method_1507() : void
      {
         this.restrictionTime = clanUserInfoService.restrictionTime;
         if(this.restrictionTime > 0 && this.var_1268 == 0)
         {
            this.var_1268 = setInterval(this.method_1504,this.restrictionTime * 1000);
         }
      }
      
      private function method_1504() : void
      {
         clearInterval(this.var_1268);
         this.var_1268 = 0;
         this.restrictionTime = 0;
      }
      
      override public function resize() : void
      {
         super.resize();
         this.newIndicator.x = width - 3 * name_573.const_422 - this.newIndicator.width + 2;
         this.var_1377.x = var_1324.x - this.var_1377.width - 3;
         this.var_1377.y = var_1324.y;
      }
      
      private function method_1599(param1:Long) : name_2048
      {
         var _loc2_:name_2048 = null;
         _loc2_ = new name_2048(param1);
         _loc2_.autoSize = TextFieldAutoSize.LEFT;
         _loc2_.align = TextFormatAlign.LEFT;
         _loc2_.color = name_1139.name_1894;
         _loc2_.text = localeService.getText(name_390.const_1330);
         _loc2_.mouseEnabled = false;
         return _loc2_;
      }
      
      override public function method_1551() : void
      {
         super.method_1551();
         if(this.var_1377 != null && this.restrictionTime <= 0)
         {
            this.var_1377.visible = true;
         }
      }
      
      override public function name_256() : void
      {
         super.name_256();
         if(this.var_1377 != null)
         {
            this.var_1377.visible = false;
         }
      }
      
      private function method_1603(param1:MouseEvent) : void
      {
         this.var_1377.visible = false;
         var _loc2_:name_70 = clanUserService.method_355(clanId);
         (clanUserService.userObject.name_176(name_580) as name_580).method_346(_loc2_);
      }
      
      override protected function method_1552(param1:MouseEvent) : void
      {
         var_1324.visible = false;
         var _loc2_:name_70 = clanUserService.method_355(clanId);
         (clanUserService.userObject.name_176(name_580) as name_580).method_1410(_loc2_);
      }
   }
}
