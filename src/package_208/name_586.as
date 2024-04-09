package package_208
{
   import alternativa.tanks.models.user.name_580;
   import alternativa.tanks.models.user.name_65;
   import controls.base.LabelBase;
   import controls.base.name_2016;
   import controls.base.DefaultButtonBase;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.name_1139;
   import package_192.name_574;
   import package_209.ClansListEvent;
   import package_209.name_1916;
   import package_280.name_2014;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_586 extends name_576
   {
      
      public static var localeService:name_102;
      
      public static var clanUserService:name_65;
      
      private static const const_1550:int = 600;
       
      
      protected var var_1384:DefaultButtonBase;
      
      protected var var_1272:name_2016;
      
      protected var var_1385:LabelBase;
      
      private var var_1386:Number;
      
      private var var_1387:String;
      
      public function name_586(param1:int)
      {
         this.var_1384 = new DefaultButtonBase();
         this.var_1272 = new name_2016();
         this.var_1385 = new LabelBase();
         this.var_1387 = localeService.getText(name_390.const_902);
         this.var_1258 = param1;
         super();
         this.var_1384.addEventListener(MouseEvent.CLICK,this.method_1497);
         this.var_1272.addEventListener(FocusEvent.FOCUS_IN,this.method_1614);
         this.var_1272.addEventListener(FocusEvent.FOCUS_OUT,this.method_1615);
         this.var_1272.maxChars = 20;
         this.var_1385.mouseEnabled = false;
         this.var_1385.color = name_1139.name_2023;
         this.var_1384.label = localeService.getText(name_390.const_759);
         this.var_1384.enable = true;
         this.var_1384.width = 120;
         this.var_1385.text = this.var_1387;
         this.var_1272.addEventListener(name_2014.name_2020,this.method_1538);
         var _loc2_:name_574 = clanUserService.userObject.name_176(name_574) as name_574;
         var_1256.method_1463(_loc2_.getIncomingClans(),name_1916.INCOMING);
         ClansListEvent.name_1886().addEventListener(ClansListEvent.INCOMING + ClansListEvent.ADD,method_1498);
         ClansListEvent.name_1886().addEventListener(ClansListEvent.INCOMING + ClansListEvent.REMOVE,method_1499);
         this.var_1272.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
         addChild(this.var_1384);
         addChild(this.var_1272);
         addChild(this.var_1385);
      }
      
      override protected function onResize(param1:Event = null) : void
      {
         var_1257 = Math.max(this.var_1384.height,this.var_1272.height);
         super.onResize(param1);
         this.var_1384.x = width - this.var_1384.width - 2 * 11 - var_1258;
         this.var_1384.y = height - this.var_1384.height - 11;
         this.var_1272.x = 11;
         this.var_1272.y = height - 11 - this.var_1272.height;
         this.var_1272.width = width - this.var_1384.width - 4 * 11 - var_1258;
         this.var_1385.x = this.var_1272.x + 3;
         this.var_1385.y = this.var_1272.y + 7;
      }
      
      override protected function method_1497(param1:MouseEvent) : void
      {
         (clanUserService.userObject.name_176(name_580) as name_580).method_1411();
      }
      
      private function method_1538(param1:name_2014) : void
      {
         clearTimeout(this.var_1386);
         this.var_1386 = setTimeout(var_1256.method_1464,600,"name",this.var_1272.value);
      }
      
      override protected function method_1320() : void
      {
         super.method_1320();
      }
      
      override protected function method_1476() : void
      {
         super.method_1476();
         ClansListEvent.name_1886().removeEventListener(ClansListEvent.INCOMING + ClansListEvent.ADD,method_1498);
         ClansListEvent.name_1886().removeEventListener(ClansListEvent.INCOMING + ClansListEvent.REMOVE,method_1499);
         this.var_1272.removeEventListener(KeyboardEvent.KEY_UP,onKeyUp);
         this.var_1272.removeEventListener(name_2014.name_2020,this.method_1538);
      }
      
      override public function destroy() : void
      {
         var_1256.method_1465();
         super.destroy();
      }
      
      private function method_1614(param1:FocusEvent) : void
      {
         this.var_1385.visible = false;
      }
      
      private function method_1615(param1:FocusEvent) : void
      {
         if(this.var_1272.value.length == 0)
         {
            this.var_1385.visible = true;
         }
      }
   }
}
