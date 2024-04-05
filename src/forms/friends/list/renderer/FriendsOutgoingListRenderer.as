package forms.friends.list.renderer
{
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.friends.name_3475;
   import package_1.Main;
   import package_390.name_1889;
   import package_481.name_3482;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class FriendsOutgoingListRenderer extends CellRenderer
   {
       
      
      private var var_3543:DisplayObject;
      
      private var var_1367:name_1889;
      
      private var var_3542:name_3475;
      
      public function FriendsOutgoingListRenderer()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         mouseEnabled = false;
         mouseChildren = true;
         useHandCursor = false;
         buttonMode = false;
         var _loc2_:name_3482 = new name_3482(false);
         var _loc3_:name_3482 = new name_3482(true);
         setStyle("upSkin",_loc2_);
         setStyle("downSkin",_loc2_);
         setStyle("overSkin",_loc2_);
         setStyle("selectedUpSkin",_loc3_);
         setStyle("selectedOverSkin",_loc3_);
         setStyle("selectedDownSkin",_loc3_);
         this.var_3543 = this.method_2573(_data);
         if(this.var_3542 == null)
         {
            this.var_3542 = new name_3475(name_3475.name_1007);
            addChild(this.var_3542);
         }
         this.var_3542.visible = false;
         this.addEventListener(Event.RESIZE,this.onResize,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut,false,0,true);
         this.resize();
         this.var_3542.addEventListener(MouseEvent.CLICK,this.method_3167,false,0,true);
      }
      
      private function onResize(param1:Event) : void
      {
         this.resize();
      }
      
      private function resize() : void
      {
         this.var_3542.x = _width - this.var_3542.width - 6;
      }
      
      private function method_2573(param1:Object) : Sprite
      {
         var _loc2_:Sprite = null;
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
         this.var_3542.visible = true;
         super.selected = true;
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.var_3542.visible = false;
         super.selected = false;
      }
      
      private function method_3167(param1:MouseEvent) : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;cancel_request;" + this.var_1367.uid);
      }
      
      override public function set selected(param1:Boolean) : void
      {
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
         var _loc1_:String = enabled ? mouseState : "disabled";
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
   }
}
