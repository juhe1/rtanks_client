package package_209
{
   import alternativa.tanks.gui.notinclan.dialogs.name_573;
   import alternativa.tanks.models.user.name_65;
   import base.class_122;
   import controls.base.name_1134;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.name_1139;
   import package_13.Long;
   import package_190.ClanInfoDelayed;
   import package_190.name_571;
   import package_215.DeleteIndicator;
   import package_25.name_52;
   import package_390.name_1889;
   import package_393.name_2002;
   import platform.client.fp10.core.type.name_70;
   
   public class ClanInfoLabel extends class_122
   {
      
      public static var clanUserService:name_65;
      
      public static var clanUserInfoService:name_52;
       
      
      private var var_1325:name_1134;
      
      private var var_1316:name_1134;
      
      private var var_1191:name_1889;
      
      private var var_1326:name_1134;
      
      private var var_1189:name_1134;
      
      protected var var_1324:DeleteIndicator;
      
      public var clanId:Long;
      
      private var _width:Number = 0;
      
      public function ClanInfoLabel(param1:Long)
      {
         super();
         this.clanId = param1;
         var _loc2_:name_70 = clanUserService.method_355(param1);
         if(_loc2_ != null)
         {
            this.method_1549();
         }
         else
         {
            ClanInfoDelayed.getInstance().addEventListener(ClanInfoDelayed.name_2003 + param1.toString(),this.method_1549);
         }
      }
      
      protected function method_1549(param1:Event = null) : void
      {
         var _loc3_:name_571 = null;
         ClanInfoDelayed.getInstance().removeEventListener(ClanInfoDelayed.name_2003 + this.clanId.toString(),this.method_1549);
         var _loc2_:name_70 = clanUserService.method_355(this.clanId);
         _loc3_ = _loc2_.name_176(name_571) as name_571;
         this.var_1325 = this.method_582();
         this.var_1325.text = _loc3_.getClanName();
         addChild(this.var_1325);
         this.var_1316 = this.method_582();
         this.var_1316.text = _loc3_.name_1897();
         addChild(this.var_1316);
         this.var_1191 = new name_1889("RTanks",false);
         addChild(this.var_1191);
         this.var_1326 = this.method_582();
         this.var_1326.text = _loc3_.name_1896().toString();
         addChild(this.var_1326);
         this.var_1189 = this.method_582();
         this.var_1189.text = name_2002.name_2009(new Date(_loc3_.method_1451()));
         addChild(this.var_1189);
         this.var_1324 = new DeleteIndicator();
         addChild(this.var_1324);
         this.var_1324.visible = false;
         this.var_1324.addEventListener(MouseEvent.CLICK,this.method_1552,false,0,true);
         addEventListener(MouseEvent.ROLL_OVER,this.onRollOver,false,0,true);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut,false,0,true);
         this.resize();
         this.onRollOut();
      }
      
      private function method_582() : name_1134
      {
         var _loc1_:name_1134 = new name_1134();
         _loc1_.align = TextFormatAlign.LEFT;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.color = name_1139.name_1894;
         return _loc1_;
      }
      
      public function onRollOut(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            ClansListRenderer(parent).onRollOut();
            this.name_256();
         }
      }
      
      public function onRollOver(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            ClansListRenderer(parent).onRollOver();
            this.method_1551();
         }
      }
      
      public function method_1551() : void
      {
         this.var_1324.visible = true;
      }
      
      public function name_256() : void
      {
         this.var_1324.visible = false;
      }
      
      public function resize() : void
      {
         if(this.var_1325 == null)
         {
            return;
         }
         var _loc1_:Vector.<Number> = ClansListHeader.var_1207;
         var _loc2_:Number = this.width - 2 * name_573.const_422;
         this.var_1325.x = 0;
         this.var_1325.width = _loc2_ * _loc1_[0];
         this.var_1316.x = this.var_1325.x + _loc2_ * _loc1_[0] + 5;
         this.var_1316.width = _loc2_ * _loc1_[1];
         this.var_1191.x = this.var_1316.x + _loc2_ * _loc1_[1] + 5;
         this.var_1326.x = this.var_1191.x + _loc2_ * _loc1_[2] + 5;
         this.var_1326.width = _loc2_ * _loc1_[3];
         this.var_1189.x = this.var_1326.x + _loc2_ * _loc1_[3] + 3;
         this.var_1189.width = _loc2_ * _loc1_[4];
         this.method_1550();
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,_loc2_,20);
         graphics.endFill();
      }
      
      private function method_1550() : void
      {
         if(this.var_1324 != null)
         {
            this.var_1324.x = this.width - this.var_1324.width - 8;
            this.var_1324.y = 1;
         }
      }
      
      protected function method_1552(param1:MouseEvent) : void
      {
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.resize();
      }
   }
}
