package package_448
{
   import controls.base.name_1134;
   import controls.base.name_998;
   import controls.name_1891;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import package_1.Main;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class PaymentBugReportBlock extends Sprite
   {
      
      public static var localeService:name_102 = Main.osgi.name_6(name_102) as name_102;
      
      public static const const_1598:int = 11;
      
      public static const const_2245:int = 7;
      
      private static const const_2665:Class = name_3392;
      
      private static const const_2664:BitmapData = new const_2665().bitmapData;
       
      
      private var var_3428:name_1891;
      
      public var var_3426:name_998;
      
      private var var_3427:Bitmap;
      
      private var var_3425:name_1134;
      
      private var _height:Number;
      
      private var _width:Number;
      
      public function PaymentBugReportBlock()
      {
         super();
         this.var_3428 = new name_1891(0,0,name_1891.name_2114);
         addChild(this.var_3428);
         this.var_3427 = new Bitmap(const_2664);
         addChild(this.var_3427);
         this.var_3425 = new name_1134();
         addChild(this.var_3425);
         this.var_3425.multiline = true;
         this.var_3425.wordWrap = true;
         this.var_3425.text = localeService.getText(name_390.const_572);
         this.var_3426 = new name_998();
         this.var_3426.label = localeService.getText(name_390.const_1151);
         this.var_3426.addEventListener(MouseEvent.CLICK,this.method_3102);
         addChild(this.var_3426);
         this.var_3426.y = 7;
         this._height = 45;
         this.var_3428.height = this._height;
         this.var_3427.x = 11;
         this.var_3427.y = int((this._height - this.var_3427.height) * 0.5);
         this.var_3425.x = this.var_3427.x + this.var_3427.width + 11;
      }
      
      private function method_3102(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest("https://vk.com/restortanks"),"_blank");
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(param1:Number) : void
      {
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this.var_3428.width = this._width;
         this.var_3426.x = this._width - this.var_3426.width - 11;
         this.var_3425.width = this.var_3426.x - this.var_3425.x - 11;
         this.var_3425.y = int((this._height - this.var_3425.height) * 0.5);
      }
   }
}
