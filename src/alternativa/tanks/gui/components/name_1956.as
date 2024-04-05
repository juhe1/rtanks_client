package alternativa.tanks.gui.components
{
   import base.class_122;
   import controls.base.name_2536;
   import controls.name_1891;
   import controls.windowinner.WindowInner;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import utils.name_1915;
   import utils.name_1986;
   import var_5.name_269;
   
   public class name_1956 extends class_122
   {
      
      private static const const_1529:int = 7;
       
      
      private var var_2631:WindowInner;
      
      public var description:name_2536;
      
      private var var_2630:ScrollPane;
      
      private var var_2632:Sprite;
      
      private const format:TextFormat = name_269.method_775(12);
      
      private var _width:int;
      
      private var _height:int;
      
      public function name_1956(param1:String, param2:int)
      {
         this.description = new name_2536();
         this.var_2630 = new ScrollPane();
         this.var_2632 = new Sprite();
         super();
         this.var_2631 = new WindowInner(0,0,name_1891.name_1428);
         addChild(this.var_2631);
         this.format.color = 16777215;
         this.description.defaultTextFormat = this.format;
         this.description.antiAliasType = AntiAliasType.ADVANCED;
         this.description.gridFitType = GridFitType.PIXEL;
         this.description.embedFonts = name_269.method_774();
         this.description.sharpness = name_1986.name_2778;
         this.description.thickness = name_1986.name_2779;
         this.description.multiline = true;
         this.description.wordWrap = true;
         this.description.type = TextFieldType.INPUT;
         this.description.selectable = true;
         this.description.autoSize = TextFieldAutoSize.LEFT;
         this.description.text = param1;
         this.description.maxChars = param2;
         this.description.addEventListener(KeyboardEvent.KEY_DOWN,this.method_2582);
         this.var_2632.addChild(this.description);
         this.var_2631.addChild(this.var_2630);
         name_1915.name_1918(this.var_2630);
         this.var_2630.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.var_2630.verticalScrollPolicy = ScrollPolicy.ON;
         this.var_2630.source = this.var_2632;
         this.var_2630.update();
         this.var_2630.focusEnabled = false;
         this.onResize();
      }
      
      private function method_2582(param1:KeyboardEvent) : void
      {
         this.var_2630.update();
         if(this.description.textHeight > this.var_2631.height - 7)
         {
            this.description.autoSize = TextFieldAutoSize.LEFT;
         }
         else
         {
            this.description.autoSize = TextFieldAutoSize.NONE;
            this.description.height = this.var_2631.height - 7;
         }
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
         this.description.width = this.var_2631.width - 2 * 7 - 5;
         if(this.description.textHeight > this.var_2631.height - 7)
         {
            this.description.autoSize = TextFieldAutoSize.LEFT;
         }
         else
         {
            this.description.autoSize = TextFieldAutoSize.NONE;
            this.description.height = this.var_2631.height - 7;
         }
         this.var_2630.setSize(this.var_2631.width - 2,this.var_2631.height - 7);
         this.var_2630.update();
      }
      
      public function name_1928(param1:String) : void
      {
         this.description.text = param1;
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
      
      public function get text() : String
      {
         return this.description.text;
      }
   }
}
