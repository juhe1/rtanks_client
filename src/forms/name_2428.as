package forms
{
   import controls.DefaultButton;
   import controls.name_1922;
   import fl.controls.UIScrollBar;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   import var_5.name_269;
   
   public class name_2428 extends Sprite
   {
       
      
      private var var_633:TextField;
      
      private var format:TextFormat;
      
      private var var_3072:UIScrollBar;
      
      public var name_983:DefaultButton;
      
      public function name_2428()
      {
         this.var_633 = new TextField();
         this.format = name_269.method_775(13);
         this.var_3072 = new UIScrollBar();
         this.name_983 = new DefaultButton();
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.method_1940);
      }
      
      private function method_1940(param1:Event) : void
      {
         var _loc2_:name_102 = Main.osgi.name_6(name_102) as name_102;
         var _loc3_:name_1922 = new name_1922(400,500);
         _loc3_.x = -200;
         addChild(_loc3_);
         removeEventListener(Event.ADDED_TO_STAGE,this.method_1940);
         addChild(this.var_633);
         this.var_633.background = false;
         this.var_633.multiline = true;
         this.var_633.wordWrap = true;
         this.var_633.x = -165;
         this.var_633.y = 35;
         this.var_633.width = 315;
         this.var_633.height = 375;
         this.var_633.embedFonts = true;
         this.var_633.antiAliasType = AntiAliasType.ADVANCED;
         this.var_633.sharpness = -200;
         this.var_633.defaultTextFormat = this.format;
         addChild(this.var_3072);
         this.var_3072.move(this.var_633.x + this.var_633.width,this.var_633.y);
         this.var_3072.setSize(this.var_3072.width,this.var_633.height);
         this.var_3072.scrollTarget = this.var_633;
         addChild(this.name_983);
         this.name_983.x = -52;
         this.name_983.y = 435;
         this.name_983.label = _loc2_.getText(TextConst.ALERT_ANSWER_OK);
         this.name_983.addEventListener(MouseEvent.CLICK,this.hide);
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function onResize(param1:Event) : void
      {
         this.x = int(stage.stageWidth / 2);
         this.y = int(stage.stageHeight / 2 - this.height / 2);
      }
      
      private function hide(param1:MouseEvent) : void
      {
         this.name_983.removeEventListener(MouseEvent.CLICK,this.hide);
         stage.removeEventListener(Event.RESIZE,this.onResize);
         this.visible = false;
         parent.removeChild(this);
      }
      
      public function set text(param1:String) : void
      {
         this.var_633.text = param1;
         this.var_3072.update();
         if(this.var_3072.maxScrollPosition == 0)
         {
            this.var_3072.visible = false;
         }
      }
   }
}
