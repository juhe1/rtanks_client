package alternativa.tanks.gui.clanmanagement
{
   import base.class_122;
   import controls.TankWindowInner;
   import controls.windowinner.WindowInner;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import flash.text.AntiAliasType;
   import flash.text.TextFieldAutoSize;
   import utils.ScrollStyleUtils;
   
   public class name_1923 extends class_122
   {
      
      private static const const_1529:int = 7;
       
      
      private var var_2631:WindowInner;
      
      private var description:ClanDescriptionText;
      
      private var var_2630:ScrollPane;
      
      private var var_2632:Sprite;
      
      private var _width:int;
      
      private var _height:int;
      
      public function name_1923(param1:String)
      {
         this.description = new ClanDescriptionText();
         this.var_2630 = new ScrollPane();
         this.var_2632 = new Sprite();
         super();
         this.var_2631 = new WindowInner(0,0,TankWindowInner.GREEN);
         addChild(this.var_2631);
         this.description.autoSize = TextFieldAutoSize.LEFT;
         this.description.antiAliasType = AntiAliasType.ADVANCED;
         this.description.multiline = true;
         this.description.wordWrap = true;
         if(param1 != null)
         {
            this.description.text = param1;
         }
         this.var_2632.addChild(this.description);
         this.var_2631.addChild(this.var_2630);
         ScrollStyleUtils.setGreenStyle(this.var_2630);
         this.var_2630.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.var_2630.verticalScrollPolicy = ScrollPolicy.ON;
         this.var_2630.source = this.var_2632;
         this.var_2630.update();
         this.var_2630.focusEnabled = false;
         this.onResize();
      }
      
      public function onResize() : void
      {
         this.var_2631.x = 0;
         this.var_2631.y = 0;
         this.var_2631.width = this.width;
         this.var_2631.height = this.height;
         this.var_2630.x = 7;
         this.var_2630.y = 3;
         this.var_2632.x = 0;
         this.var_2632.y = 0;
         this.description.x = 0;
         this.description.y = 0;
         if(this.var_2632.height < this.height)
         {
            this.var_2630.verticalScrollPolicy = ScrollPolicy.OFF;
            this.description.width = this.var_2631.width - 2 * 7;
         }
         else
         {
            this.var_2630.verticalScrollPolicy = ScrollPolicy.ON;
            this.description.width = this.var_2631.width - 2 * 7 - 5;
         }
         this.var_2630.setSize(this.var_2631.width - 2,this.var_2631.height - 7);
         this.var_2630.update();
      }
      
      public function name_1928(param1:String) : void
      {
         if(param1 != null)
         {
            this.description.text = param1;
         }
         this.onResize();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.onResize();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         this.onResize();
      }
   }
}
