package package_281
{
   import assets.scroller.color.ScrollThumbSkinBlue;
   import assets.scroller.color.ScrollTrackBlue;
   import controls.DefaultButton;
   import controls.Label;
   import controls.TankWindowInner;
   import controls.name_1922;
   import fl.controls.UIScrollBar;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import package_1.Main;
   
   public class name_2403 extends Sprite
   {
       
      
      private var window:name_1922;
      
      private var var_1251:TankWindowInner;
      
      private var var_3073:DefaultButton;
      
      private var var_3072:UIScrollBar;
      
      private var errorText:Label;
      
      public function name_2403()
      {
         this.window = new name_1922();
         this.var_1251 = new TankWindowInner(-1,-1,TankWindowInner.GREEN);
         this.var_3073 = new DefaultButton();
         this.var_3072 = new UIScrollBar();
         this.errorText = new Label();
         super();
         addChild(this.window);
         this.window.addChild(this.var_1251);
         this.window.addChild(this.var_3073);
         this.window.addChild(this.errorText);
         this.window.addChild(this.var_3072);
         this.window.width = 450;
         this.window.height = 250;
         this.var_1251.width = 430;
         this.var_1251.height = 200;
         this.var_1251.x = 10;
         this.var_1251.y = 10;
         this.var_3073.x = this.window.width / 2 - this.var_3073.width / 2;
         this.var_3073.y = this.var_1251.height + 12;
         this.errorText.x = 20;
         this.errorText.y = 15;
         this.errorText.wordWrap = true;
         this.errorText.autoSize = TextFieldAutoSize.NONE;
         this.errorText.selectable = true;
         this.errorText.width = 410;
         this.errorText.height = 190;
         this.var_3072.setSize(this.errorText.width + 5,this.errorText.y + 5);
         this.var_3073.label = "OK";
         this.errorText.multiline = true;
         this.var_3072.scrollTarget = this.errorText;
         this.var_3072.move(this.errorText.x + this.errorText.width,this.errorText.y);
         this.var_3072.setSize(this.var_3072.width,this.errorText.height);
         this.var_3072.setStyle("downArrowUpSkin",name_2566);
         this.var_3072.setStyle("downArrowDownSkin",name_2566);
         this.var_3072.setStyle("downArrowOverSkin",name_2566);
         this.var_3072.setStyle("downArrowDisabledSkin",name_2566);
         this.var_3072.setStyle("upArrowUpSkin",name_2567);
         this.var_3072.setStyle("upArrowDownSkin",name_2567);
         this.var_3072.setStyle("upArrowOverSkin",name_2567);
         this.var_3072.setStyle("upArrowDisabledSkin",name_2567);
         this.var_3072.setStyle("trackUpSkin",new ScrollTrackBlue());
         this.var_3072.setStyle("trackDownSkin",ScrollTrackBlue);
         this.var_3072.setStyle("trackOverSkin",ScrollTrackBlue);
         this.var_3072.setStyle("trackDisabledSkin",ScrollTrackBlue);
         this.var_3072.setStyle("thumbUpSkin",ScrollThumbSkinBlue);
         this.var_3072.setStyle("thumbDownSkin",ScrollThumbSkinBlue);
         this.var_3072.setStyle("thumbOverSkin",ScrollThumbSkinBlue);
         this.var_3072.setStyle("thumbDisabledSkin",ScrollThumbSkinBlue);
         this.errorText.filters = [new GlowFilter(0)];
         this.errorText.textColor = 16777215;
         this.var_3073.addEventListener(MouseEvent.CLICK,this.remove);
         Main.stage.addEventListener(Event.RESIZE,this.resize);
         this.resize(null);
      }
      
      private function resize(param1:Event) : void
      {
         this.window.x = Main.stage.width / 2 - this.window.width / 2;
         this.window.y = Main.stage.height / 2 - this.window.height / 2;
      }
      
      private function remove(param1:MouseEvent) : void
      {
         parent.removeChild(this);
      }
      
      public function set text(param1:String) : void
      {
         this.errorText.text = param1;
         this.var_3072.update();
         this.var_3072.setSize(this.var_3072.width,this.errorText.height);
      }
   }
}
