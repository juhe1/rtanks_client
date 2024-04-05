package package_398
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.name_2107;
   import controls.base.name_1134;
   import controls.base.name_998;
   import controls.name_1891;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormatAlign;
   import forms.name_1838;
   import package_254.name_2835;
   import package_257.name_811;
   import package_379.class_123;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class NewbiesAbonementInfoWindow extends class_123 implements name_2107
   {
      
      private static const const_2155:Class = name_2836;
      
      private static const const_2156:BitmapData = new const_2155().bitmapData;
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      public static var var_2770:name_811 = OSGi.getInstance().name_6(name_811) as name_811;
       
      
      private var var_1575:Boolean;
      
      private var window:name_1838;
      
      private var var_1182:name_1891;
      
      private var var_2554:name_1134;
      
      private var var_2560:Bitmap;
      
      private var name_983:name_998;
      
      private var var_1739:int = 450;
      
      private const const_1598:int = 12;
      
      private const const_422:int = 9;
      
      private const const_2157:Point = new Point(104,33);
      
      private const const_2158:int = 300;
      
      private var var_2769:String;
      
      private var var_2771:RegExp;
      
      private var package_11:RegExp;
      
      public function NewbiesAbonementInfoWindow(param1:Date, param2:int, param3:int)
      {
         this.var_2560 = new Bitmap(const_2156);
         this.var_2771 = /CRYSTAL_BONUS/gi;
         this.package_11 = /EXPERIENCE_BONUS/gi;
         super();
         var _loc4_:String = name_2835.name_2837(param1);
         this.var_2769 = localeService.getText(name_390.const_561);
         this.var_2769 += "\r\n" + _loc4_;
         this.var_2769 = this.var_2769.replace(this.var_2771,param2).replace(this.package_11,param3);
         this.init();
      }
      
      private function init() : void
      {
         this.var_1575 = true;
         this.var_1739 = Math.max(this.var_2560.width + 12 * 2 + 9 * 2,300);
         this.window = name_1838.name_1844(localeService.getText(name_390.const_1415),this.var_1739,this.var_2560.height);
         addChild(this.window);
         this.var_1182 = new name_1891(0,0,name_1891.name_1428);
         addChild(this.var_1182);
         this.var_1182.x = 12;
         this.var_1182.y = 12;
         this.var_2560.x = this.var_1739 - this.var_2560.width >> 1;
         this.var_2560.y = 12 * 2;
         addChild(this.var_2560);
         this.var_2554 = new name_1134();
         this.var_2554.align = TextFormatAlign.LEFT;
         this.var_2554.wordWrap = true;
         this.var_2554.multiline = true;
         this.var_2554.size = 12;
         this.var_2554.color = 5898034;
         this.var_2554.htmlText = this.var_2769;
         this.var_2554.x = 12 * 2;
         this.var_2554.y = this.var_2560.y + this.var_2560.height + 9;
         this.var_2554.width = this.var_1739 - 12 * 4;
         addChild(this.var_2554);
         if(this.var_2554.numLines > 2)
         {
            this.var_2554.htmlText = this.var_2769;
            this.var_2554.width = this.var_1739 - 12 * 4;
         }
         this.name_983 = new name_998();
         addChild(this.name_983);
         this.name_983.label = localeService.getText(name_390.const_675);
         var _loc1_:int = this.var_2560.height + this.name_983.height + 9 * 2 + 12 * 3;
         if(this.var_2554 != null)
         {
            _loc1_ += this.var_2554.height + 9;
         }
         this.window.height = _loc1_;
         this.name_983.y = this.window.height - 9 - 35;
         this.name_983.x = this.window.width - this.name_983.width >> 1;
         this.var_1182.width = this.window.width - 12 * 2;
         this.var_1182.height = this.window.height - 12 - 9 * 2 - this.const_2157.y + 2;
         this.name_983.addEventListener(MouseEvent.CLICK,this.method_1145);
         var_864.name_1585(this);
      }
      
      private function method_1145(param1:MouseEvent = null) : void
      {
         if(var_2770.isNewbieUser)
         {
            var_2770.isNewbieUser = false;
         }
         this.destroy();
      }
      
      public function destroy() : void
      {
         if(this.var_1575)
         {
            this.var_1575 = false;
            this.name_983.removeEventListener(MouseEvent.CLICK,this.method_1145);
            var_864.name_1013(this);
         }
      }
      
      override protected function method_1319() : void
      {
         this.method_1145();
      }
      
      override protected function method_1320() : void
      {
         this.method_1145();
      }
   }
}
