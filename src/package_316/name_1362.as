package package_316
{
   import alternativa.osgi.OSGi;
   import base.class_122;
   import controls.base.name_1890;
   import controls.labels.name_2551;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import package_259.name_807;
   import package_279.class_27;
   import package_279.name_979;
   import package_280.name_2554;
   import package_394.PremiumIcon;
   import package_428.name_2553;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_1362 extends name_1890 implements name_979
   {
      
      public static var localeService:name_102 = OSGi.getInstance().getService(name_102) as name_102;
      
      public static var var_644:class_27 = OSGi.getInstance().getService(class_27) as class_27;
      
      public static var var_2230:name_807 = OSGi.getInstance().getService(name_807) as name_807;
       
      
      private var var_2227:Sprite;
      
      private var var_2225:name_2553;
      
      private var var_1281:name_2551;
      
      private var const_126:SmallRankIcon;
      
      private var var_2226:Bitmap;
      
      private var var_2228:Sprite;
      
      private var var_2229:name_2553;
      
      private var var_2231:name_2551;
      
      private var price:int;
      
      public function name_1362(param1:int = 120)
      {
         this.var_2227 = new class_122();
         this.var_2225 = new name_2553();
         this.var_1281 = new name_2551();
         this.const_126 = new SmallRankIcon();
         this.var_2226 = PremiumIcon.name_2558();
         this.var_2228 = new class_122();
         this.var_2229 = new name_2553();
         this.var_2231 = new name_2551();
         super();
         this.width = param1;
         addEventListener(name_2554.name_2557,this.const_468);
         var_644.addListener(this);
         this.var_2229.name_2555(-100);
         this.var_2229.name_2556(100);
         this.var_2225.name_2555(-100);
         this.var_2225.name_2556(100);
         this.var_1281.color = 16731648;
         this.var_1281.sharpness = -100;
         this.var_1281.thickness = 100;
         this.var_2227.addChild(this.var_2225);
         this.var_2227.addChild(this.var_1281);
         this.const_126.y = 3;
         this.var_2227.addChild(this.const_126);
         this.var_2226.y = 4;
         this.var_2227.addChild(this.var_2226);
         this.var_1281.text = localeService.getText(name_390.const_1005);
         this.var_2228.addChild(this.var_2229);
         this.var_2228.addChild(this.var_2231);
         var_2224.addChild(this.var_2227);
         var_2224.addChild(this.var_2228);
         addChild(var_2224);
      }
      
      public function name_1375(param1:int, param2:int = 1, param3:int = 0, param4:Boolean = false) : void
      {
         param1 *= param2;
         this.price = param1;
         var _loc5_:int = param1;
         this.method_2301();
         this.var_2225.name_2559(_loc5_);
         this.label = "";
         var_2224.visible = true;
         var_2224.x = 0;
         var_2223.x = (_width - var_2223.width) * 0.5;
         if(param3 < 0)
         {
            param3 = -param3;
            this.const_126.init(param4 && !var_2230.var_445(),param3);
            this.var_2225.x = (_width - (this.var_2225.width + this.var_1281.width + this.const_126.width + 4 - 1)) * 0.5;
            this.var_1281.x = this.var_2225.x + this.var_2225.width + 5;
            this.const_126.x = this.var_1281.x + this.var_1281.width;
            this.const_126.visible = true;
            this.var_1281.visible = true;
            this.var_2226.visible = false;
            enabled = false;
         }
         else
         {
            this.var_1281.visible = false;
            this.const_126.visible = false;
            enabled = !param4 || Boolean(var_2230.var_445());
            this.var_2226.visible = !enabled;
            this.var_2225.x = (_width - this.var_2225.width - (this.var_2226.visible ? this.var_2226.width : 0)) * 0.5;
            this.var_2226.x = this.var_2225.x + this.var_2225.width + 5;
         }
         this.method_2302();
      }
      
      private function method_2301() : void
      {
         if(var_644.crystal < this.price)
         {
            this.var_2229.name_2552(16731648);
            this.var_2225.name_2552(16731648);
         }
         else if(this.price == 0)
         {
            this.var_2229.name_2552(11206400);
            this.var_2225.name_2552(11206400);
         }
         else
         {
            this.var_2225.name_2552(16777215);
            this.var_2229.name_2552(16777215);
         }
      }
      
      private function method_2302() : void
      {
         this.var_2228.visible = false;
         super.method_2300(var_2223,this.var_2227);
      }
      
      private function method_2303() : void
      {
         this.var_2228.visible = true;
         super.method_2299(var_2223,this.var_2227,this.var_2228);
      }
      
      public function name_1054(param1:int) : void
      {
         this.method_2301();
      }
      
      protected function const_468(param1:name_2554) : void
      {
         var_644.removeListener(this);
         removeEventListener(name_2554.name_2557,this.const_468);
      }
   }
}
