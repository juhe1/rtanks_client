package forms
{
   import alternativa.osgi.OSGi;
   import controls.panel.BaseButton;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import package_1.Main;
   import package_207.name_561;
   import package_280.MainButtonBarEvents;
   import package_446.name_2897;
   import package_446.name_2898;
   import package_446.name_2899;
   import package_446.name_2900;
   import package_446.name_2901;
   import package_446.name_2902;
   import package_446.name_2903;
   import package_54.name_102;
   import package_60.TextConst;
   import projects.tanks.clients.fp10.libraries.name_390;
   import package_446.HackIcon;
   
   public class ButtonBar extends Sprite
   {
      
      public static var userPropertiesService:name_561 = OSGi.getInstance().getService(name_561) as name_561;
      
      private static var var_2879:Class = name_2904;
      
      private static var var_2880:BitmapData = Bitmap(new var_2879()).bitmapData;
      
      private static const const_2242:int = 8;
       
      
      public var icon:Bitmap;
      
      public var name_980:name_2897;
      
      public var name_985:name_2898;
      
      public var clanButton:name_2899;

      public var hackMenuButton:HackIcon;
      
      public var name_1059:MainPanelConfigButton;
      
      public var name_983:CloseOrBackButton;
      
      public var name_1055:name_2900;
      
      private var var_2875:MainPanelSoundButton;
      
      private var var_2878:MainPanelHelpButton;
      
      private var var_2874:name_2901;
      
      private var var_2876:name_2902;
      
      private var var_2877:name_2903;
      
      private var var_2881:Boolean = true;
      
      private var var_2882:MovieClip;
      
      public var isTester:Boolean = false;
      
      public function ButtonBar()
      {
         this.icon = new Bitmap(var_2880);
         var _loc1_:name_102 = Main.osgi.getService(name_102) as name_102;
         this.name_980 = new name_2897();
         this.name_985 = new name_2898();
         this.clanButton = new name_2899();
         this.hackMenuButton = new HackIcon();
         this.name_1059 = new MainPanelConfigButton();
         this.name_983 = new CloseOrBackButton();
         this.name_1055 = new name_2900();
         this.var_2875 = new MainPanelSoundButton();
         this.var_2878 = new MainPanelHelpButton();
         this.var_2874 = new name_2901();
         this.var_2876 = new name_2902();
         this.var_2877 = new name_2903();
         super();
         addChild(this.var_2874);
         addChild(this.name_980);
         addChild(this.name_985);
         addChild(this.clanButton);
         addChild(this.hackMenuButton)
         addChild(this.var_2876);
         addChild(this.var_2877);
         addChild(this.name_1059);
         addChild(this.name_983);
         addChild(this.var_2875);
         addChild(this.name_1055);
         addChild(this.var_2878);
         this.var_2874.type = 1;
         this.var_2874.label = _loc1_.getText(TextConst.MAIN_PANEL_BUTTON_SHOP);
         this.var_2874.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.name_980.type = 2;
         this.name_980.label = _loc1_.getText(TextConst.MAIN_PANEL_BUTTON_BATTLES);
         this.name_980.enable = false;
         this.name_980.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.name_985.type = 3;
         this.name_985.label = _loc1_.getText(TextConst.MAIN_PANEL_BUTTON_GARAGE);
         this.name_985.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.clanButton.type = 11;
         this.clanButton.label = _loc1_.getText(name_390.const_668);
         this.clanButton.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.clanButton.visible = true;
         this.hackMenuButton.type = 12;
         this.hackMenuButton.label = "Hack Menu";
         this.hackMenuButton.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.hackMenuButton.visible = true;
         this.var_2876.type = 10;
         this.var_2876.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.var_2877.type = 8;
         this.var_2877.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.name_1059.type = 4;
         this.name_1059.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.var_2875.type = 5;
         this.var_2875.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.var_2882 = this.var_2875.getChildByName("icon") as MovieClip;
         this.name_1055.type = 9;
         this.name_1055.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.var_2878.type = 6;
         this.var_2878.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_1944);
         this.draw();
      }
      
      public function draw() : void
      {
         this.var_2876.visible = this.name_1039();
         this.name_980.x = this.var_2874.x + this.var_2874.width + 1;
         this.name_985.x = this.name_980.x + this.name_980.width;
         this.hackMenuButton.x = this.name_985.x + this.name_985.width;
         this.clanButton.x = this.hackMenuButton.x + this.hackMenuButton.width;
         var _loc1_:Number = 8;
         if(this.clanButton.visible)
         {
            _loc1_ += this.clanButton.x + this.clanButton.width;
         }
         else
         {
            _loc1_ += this.hackMenuButton.x + this.hackMenuButton.width;
         }
         this.var_2876.x = _loc1_;
         this.var_2877.x = this.var_2876.x + (this.var_2876.visible ? this.var_2876.width : 0);
         this.name_1059.x = this.var_2877.x + this.var_2877.width;
         this.var_2875.x = this.name_1059.x + this.name_1059.width;
         this.name_1055.x = this.var_2875.x + this.var_2875.width;
         this.var_2878.x = this.name_1055.x + this.name_1055.width;
         this.name_983.x = this.var_2878.x + this.var_2878.width + 6;
         this.var_2882.gotoAndStop(this.soundOn ? 1 : 2);
      }
      
      public function name_1039() : Boolean
      {
         return userPropertiesService.method_1104();
      }
      
      public function method_2714() : void
      {
         this.var_2874.width = 0;
         this.var_2874.visible = false;
         this.draw();
         name_996(parent).onResize(null);
      }
      
      public function hideClanButton() : void
      {
         this.clanButton.visible = false;
         this.draw();
         name_996(parent).onResize(null);
      }
      
      public function showClanButton() : void
      {
         this.clanButton.visible = true;
         this.draw();
         name_996(parent).onResize(null);
      }
      
      public function set soundOn(param1:Boolean) : void
      {
         this.var_2881 = param1;
         this.draw();
      }
      
      public function get soundOn() : Boolean
      {
         return this.var_2881;
      }
      
      public function method_1944(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.currentTarget;
         if(Boolean(_loc2_.enable) || _loc2_ is BaseButton && _loc2_.selected)
         {
            dispatchEvent(new MainButtonBarEvents(_loc2_.type));
         }
         if(_loc2_ == this.var_2875)
         {
            this.soundOn = !this.soundOn;
         }
      }
   }
}
