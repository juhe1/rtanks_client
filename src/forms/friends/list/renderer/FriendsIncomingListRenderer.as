package forms.friends.list.renderer
{
   import controls.base.LabelBase;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.friends.name_3475;
   import forms.name_1139;
   import package_1.Main;
   import package_390.name_1889;
   import package_481.name_3483;
   import package_54.name_102;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class FriendsIncomingListRenderer extends CellRenderer
   {
      
      public static var localeService:name_102;
       
      
      private var var_3543:DisplayObject;
      
      private var var_1367:name_1889;
      
      private var var_3546:name_3475;
      
      private var var_3545:name_3475;
      
      private var var_3544:LabelBase;
      
      public function FriendsIncomingListRenderer()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         mouseEnabled = true;
         mouseChildren = true;
         useHandCursor = false;
         buttonMode = false;
         var _loc2_:name_3483 = new name_3483(false);
         var _loc3_:name_3483 = new name_3483(true);
         setStyle("upSkin",_loc2_);
         setStyle("downSkin",_loc2_);
         setStyle("overSkin",_loc2_);
         setStyle("selectedUpSkin",_loc3_);
         setStyle("selectedOverSkin",_loc3_);
         setStyle("selectedDownSkin",_loc3_);
         this.var_3543 = this.method_2573(_data);
         if(this.var_3546 == null)
         {
            this.var_3546 = new name_3475(name_3475.name_990);
            addChild(this.var_3546);
         }
         this.var_3546.visible = false;
         if(this.var_3545 == null)
         {
            this.var_3545 = new name_3475(name_3475.name_1007);
            addChild(this.var_3545);
         }
         this.var_3545.visible = false;
         if(this.var_3544 == null)
         {
            this.var_3544 = new LabelBase();
            this.var_3544.text = "Новый";
            this.var_3544.height = 18;
            this.var_3544.y = -1;
            this.var_3544.color = name_1139.name_1894;
            addChild(this.var_3544);
            this.var_3544.mouseEnabled = false;
         }
         this.var_3544.visible = _data.isNew;
         this.addEventListener(Event.RESIZE,this.onResize,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut,false,0,true);
         this.resize();
         this.var_3546.addEventListener(MouseEvent.CLICK,this.method_3169,false,0,true);
         this.var_3545.addEventListener(MouseEvent.CLICK,this.method_3168,false,0,true);
      }
      
      private function onResize(param1:Event) : void
      {
         this.resize();
      }
      
      private function resize() : void
      {
         this.var_3545.x = _width - this.var_3545.width - 6;
         this.var_3546.x = this.var_3545.x - this.var_3546.width - 1;
         this.var_3544.x = _width - this.var_3544.width - 6;
      }
      
      private function method_2573(param1:Object) : Sprite
      {
         var _loc2_:Sprite = null;
         _loc2_ = null;
         _loc2_ = new Sprite();
         if(param1.id != null)
         {
            this.var_1367 = new name_1889(param1.uid);
            this.var_1367.x = -3;
            this.var_1367.y = -1;
            _loc2_.addChild(this.var_1367);
         }
         return _loc2_;
      }
      
      private function onRollOver(param1:MouseEvent) : void
      {
         this.var_3546.visible = true;
         this.var_3545.visible = true;
         if(Boolean(_data.isNew))
         {
            this.var_3544.visible = false;
         }
         super.selected = true;
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.var_3546.visible = false;
         this.var_3545.visible = false;
         if(Boolean(_data.isNew))
         {
            this.var_3544.visible = true;
         }
         super.selected = false;
      }
      
      private function method_3169(param1:MouseEvent) : void
      {
         Network(Main.osgi.getService(INetworker)).send("lobby;accept_friend;" + this.var_1367.uid);
         trace("Принимаем");
      }
      
      private function method_3168(param1:MouseEvent) : void
      {
         Network(Main.osgi.getService(INetworker)).send("lobby;deny_friend;" + this.var_1367.uid);
         trace("Оклоняем");
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = _listData.label;
         if(this.var_3543 != null)
         {
            setStyle("icon",this.var_3543);
         }
      }
      
      override protected function drawBackground() : void
      {
         var _loc1_:* = enabled ? mouseState : "disabled";
         if(selected)
         {
            _loc1_ = "selected" + _loc1_.substr(0,1).toUpperCase() + _loc1_.substr(1);
         }
         _loc1_ += "Skin";
         var _loc2_:DisplayObject = background;
         background = getDisplayObjectInstance(getStyleValue(_loc1_));
         addChildAt(background,0);
         if(_loc2_ != null && _loc2_ != background)
         {
            removeChild(_loc2_);
         }
      }
      
      override public function set selected(param1:Boolean) : void
      {
      }
   }
}
