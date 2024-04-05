package controls
{
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class Label extends TextField
   {
       
      
      private var format:TextFormat;
      
      public function Label()
      {
         super();
         this.format = new TextFormat("MyriadPro",12,false);
         this.format.color = 16777215;
         this.selectable = false;
         this.embedFonts = true;
         this.antiAliasType = AntiAliasType.ADVANCED;
         this.gridFitType = GridFitType.SUBPIXEL;
         this.width = 10;
         this.height = 12;
         this.autoSize = TextFieldAutoSize.LEFT;
         this.defaultTextFormat = this.format;
         this.size = 12;
      }
      
      private function method_1838() : void
      {
         this.defaultTextFormat = this.format;
         this.setTextFormat(this.format);
      }
      
      public function set size(param1:Number) : void
      {
         this.format.size = param1;
         this.method_1838();
      }
      
      public function set bold(param1:Boolean) : void
      {
         this.format.bold = param1;
         this.method_1838();
      }
      
      public function set color(param1:uint) : void
      {
         this.format.color = param1;
         this.method_1838();
      }
      
      public function set align(param1:String) : void
      {
         this.format.align = param1;
         this.method_1838();
      }
   }
}
