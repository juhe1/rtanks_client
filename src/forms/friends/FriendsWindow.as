package forms.friends
{
   import alternativa.tanks.model.friends.FriendsService;
   import controls.base.name_1134;
   import controls.base.name_2016;
   import controls.name_1891;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.URLLoader;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import forms.friends.list.AcceptedList;
   import forms.friends.list.IncomingList;
   import forms.friends.list.OutcomingList;
   import forms.name_1838;
   import package_1.Main;
   import package_280.name_2014;
   import package_54.name_102;
   import package_60.TextConst;
   import scpacker.networking.Network;
   import scpacker.networking.name_2;
   
   public class FriendsWindow extends Sprite
   {
      
      public static var localeService:name_102 = Main.osgi.name_6(name_102) as name_102;
      
      public static const const_1598:int = 12;
      
      public static const const_1576:int = 100;
      
      private static const const_1518:int = 496;
      
      private static const const_1519:int = 485;
      
      private static const const_1550:int = 600;
      
      public static var bu:Network;
      
      public static var var_1863:Sprite = new Sprite();
       
      
      private var var_1864:URLLoader;
      
      private var var_1169:name_1838;
      
      private var var_1568:name_1891;
      
      public var var_1850:Point;
      
      private var var_1849:FriendsWindowStateBigButton;
      
      private var var_1853:FriendsWindowStateBigButton;
      
      private var var_1852:FriendsWindowStateBigButton;
      
      public var name_1019:name_2306;
      
      private var var_1848:name_2302;
      
      private var var_1854:name_2302;
      
      private var var_1856:AcceptedList;
      
      private var var_1859:OutcomingList;
      
      private var var_1858:IncomingList;
      
      private var var_1855:name_2309;
      
      private var var_1847:name_2016;
      
      private var var_1851:name_2016;
      
      private var var_1857:name_1134;
      
      private var var_1862:uint;
      
      private var var_1860:name_2305;
      
      private var var_1861:Boolean = false;
      
      public function FriendsWindow(param1:Network)
      {
         super();
         this.init();
         bu = param1;
      }
      
      private function init() : void
      {
         this.var_1169 = name_1838.name_1844(localeService.getText(TextConst.FRIENDS_WINDOW_TEXT).toLocaleUpperCase());
         addChild(this.var_1169);
         this.var_1850 = new Point(496,485);
         this.var_1568 = new name_1891(0,0,name_1891.name_1428);
         addChild(this.var_1568);
         this.var_1849 = new FriendsWindowStateBigButton(name_2301.name_1669);
         addChild(this.var_1849);
         this.var_1849.label = localeService.getText(TextConst.FRIENDS_WINDOW_TEXT);
         this.var_1849.addEventListener(MouseEvent.CLICK,this.method_2010);
         this.var_1853 = new FriendsWindowStateBigButton(name_2301.name_2303);
         addChild(this.var_1853);
         this.var_1853.label = localeService.getText(TextConst.FRIENDS_WINDOW_OUTCOMING_LIST);
         this.var_1853.addEventListener(MouseEvent.CLICK,this.method_2010);
         this.var_1852 = new FriendsWindowStateBigButton(name_2301.INCOMING);
         addChild(this.var_1852);
         this.var_1852.label = localeService.getText(TextConst.FRIENDS_WINDOW_INCOMING_LIST);
         this.var_1852.addEventListener(MouseEvent.CLICK,this.method_2010);
         this.var_1848 = new name_2302();
         addChild(this.var_1848);
         this.var_1848.label = localeService.getText(TextConst.FRIENDS_WINDOW_REJECT_ALL);
         this.var_1848.addEventListener(MouseEvent.CLICK,this.method_2013);
         this.var_1854 = new name_2302();
         addChild(this.var_1854);
         this.var_1854.label = localeService.getText(TextConst.FRIENDS_WINDOW_SEND_INVITE);
         this.var_1854.addEventListener(MouseEvent.CLICK,this.method_2016);
         this.var_1856 = new AcceptedList();
         this.var_1858 = new IncomingList(this.var_1848);
         this.var_1859 = new OutcomingList();
         this.name_1019 = new name_2306();
         addChild(this.name_1019);
         this.name_1019.label = localeService.getText(TextConst.FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         this.var_1847 = new name_2016();
         this.var_1847.maxChars = 20;
         this.var_1847.restrict = "0-9.a-zA-z_\\-*";
         addChild(this.var_1847);
         this.var_1851 = new name_2016();
         this.var_1851.maxChars = 20;
         this.var_1851.restrict = "0-9.a-zA-z_\\-*";
         addChild(this.var_1851);
         this.var_1847.addEventListener(FocusEvent.FOCUS_IN,this.method_2014);
         this.var_1847.addEventListener(FocusEvent.FOCUS_OUT,this.method_2012);
         this.var_1847.addEventListener(name_2014.name_2020,this.method_2015);
         this.var_1857 = new name_1134();
         addChild(this.var_1857);
         this.var_1857.mouseEnabled = false;
         this.var_1857.color = 10987948;
         this.var_1857.text = localeService.getText(TextConst.FRIENDS_WINDOW_SEARCH_IN_LIST);
         this.var_1860 = new name_2305(bu);
         addChild(this.var_1860);
         this.resize();
         this.show(name_2301.name_1669);
      }
      
      public function method_2022() : void
      {
         this.var_1856.name_2304();
      }
      
      public function name_1053() : void
      {
         this.var_1856.name_2304();
         this.var_1859.name_2304();
         this.var_1858.name_2304();
         this.var_1855.name_2307();
      }
      
      private function method_2013(param1:MouseEvent) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in JSON.parse(FriendsService.name_398).incoming)
         {
            Network(Main.osgi.name_6(name_2)).send("lobby;deny_friend;" + _loc2_.id);
         }
      }
      
      private function method_2016(param1:MouseEvent) : void
      {
         Network(Main.osgi.name_6(name_2)).send("lobby;make_friend;" + this.var_1851.value);
      }
      
      private function method_2023(param1:MouseEvent) : void
      {
      }
      
      private function method_2015(param1:name_2014) : void
      {
         if(this.var_1847.value.length > 0)
         {
            this.var_1857.visible = false;
         }
         clearTimeout(this.var_1862);
         this.var_1862 = setTimeout(this.var_1855.filter,600,"uid",this.var_1847.value);
         this.method_2011();
      }
      
      private function method_2014(param1:FocusEvent) : void
      {
         this.var_1857.visible = false;
      }
      
      private function method_2012(param1:FocusEvent) : void
      {
         this.method_2011();
      }
      
      private function method_2011() : void
      {
         if(this.var_1847.value.length == 0)
         {
            this.var_1857.visible = true;
         }
      }
      
      private function method_2024(param1:MouseEvent) : void
      {
         this.hide();
      }
      
      private function resize() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.var_1169.width = this.var_1850.x;
         this.var_1169.height = this.var_1850.y;
         this.var_1849.width = 100;
         this.var_1849.x = 12;
         this.var_1849.y = 12;
         this.var_1852.width = 100 + 50;
         this.var_1852.x = this.var_1850.x - this.var_1852.width - 12;
         this.var_1852.y = 12;
         this.var_1853.width = 100 + 50;
         this.var_1853.x = this.var_1852.x - this.var_1853.width - 6;
         this.var_1853.y = 12;
         this.name_1019.width = 100;
         this.name_1019.x = this.var_1850.x - this.name_1019.width - 12;
         this.name_1019.y = this.var_1850.y - this.name_1019.height - 12;
         this.var_1848.width = 100;
         this.var_1848.x = this.name_1019.x - this.var_1848.width - 6;
         this.var_1848.y = this.var_1850.y - this.var_1848.height - 12;
         this.var_1854.width = 100;
         this.var_1854.x = this.name_1019.x - this.var_1854.width - 6;
         this.var_1854.y = this.var_1850.y - this.var_1854.height - 12;
         this.var_1568.x = 12;
         this.var_1568.y = this.var_1849.y + this.var_1849.height + 1;
         this.var_1568.width = this.var_1850.x - 12 * 2;
         this.var_1568.height = this.var_1850.y - this.var_1568.y - this.name_1019.height - 18;
         var _loc1_:int = this.var_1568.x + 4;
         _loc2_ = this.var_1568.y + 4;
         _loc3_ = this.var_1568.width - 4 * 2 + 2;
         var _loc4_:int = this.var_1568.height - 4 * 2;
         this.var_1856.resize(_loc3_,_loc4_);
         this.var_1856.x = _loc1_;
         this.var_1856.y = _loc2_;
         this.var_1858.resize(_loc3_,_loc4_);
         this.var_1858.x = _loc1_;
         this.var_1858.y = _loc2_;
         this.var_1859.resize(_loc3_,_loc4_);
         this.var_1859.x = _loc1_;
         this.var_1859.y = _loc2_;
         this.var_1847.width = 235;
         this.var_1847.x = 12;
         this.var_1847.y = this.var_1850.y - this.var_1847.height - 12;
         this.var_1851.width = 235;
         this.var_1851.x = 12;
         this.var_1851.y = this.var_1850.y - this.var_1851.height - 12;
         this.var_1857.x = this.var_1847.x + 3;
         this.var_1857.y = this.var_1847.y + 7;
         this.var_1860.y = this.var_1850.y - this.var_1860.height - 12;
      }
      
      private function method_2010(param1:MouseEvent) : void
      {
         this.var_1861 = !this.var_1861;
         this.show(name_2308(param1.currentTarget).getType());
      }
      
      public function destroy() : void
      {
         this.var_1849.removeEventListener(MouseEvent.CLICK,this.method_2010);
         this.var_1853.removeEventListener(MouseEvent.CLICK,this.method_2010);
         this.var_1852.removeEventListener(MouseEvent.CLICK,this.method_2010);
         this.var_1847.removeEventListener(FocusEvent.FOCUS_IN,this.method_2014);
         this.var_1847.removeEventListener(FocusEvent.FOCUS_OUT,this.method_2012);
         this.var_1848.removeEventListener(MouseEvent.CLICK,this.method_2013);
         this.hide();
      }
      
      private function hide() : void
      {
         if(this.name_1019.hasEventListener(MouseEvent.CLICK))
         {
            this.name_1019.removeEventListener(MouseEvent.CLICK,this.method_1323);
         }
         if(this.var_1855 != null)
         {
            this.var_1855.hide();
            this.var_1855 = null;
         }
         clearTimeout(this.var_1862);
         this.var_1860.hide();
      }
      
      private function method_2020(param1:Event) : void
      {
         this.hide();
         if(this.var_1861)
         {
            name_2301.INCOMING = new name_2301(1);
            this.show(name_2301.INCOMING);
         }
         else
         {
            name_2301.name_1669 = new name_2301(0);
            this.show(name_2301.name_1669);
         }
      }
      
      private function method_2021(param1:name_2301) : name_2309
      {
         switch(param1)
         {
            case name_2301.name_1669:
               return this.var_1856;
            case name_2301.INCOMING:
               return this.var_1858;
            case name_2301.name_2303:
               return this.var_1859;
            default:
               return this.var_1856;
         }
      }
      
      public function show(param1:name_2301 = null) : void
      {
         switch(param1)
         {
            case name_2301.name_1669:
               this.method_2018();
               break;
            case name_2301.INCOMING:
               this.method_2017();
               break;
            case name_2301.name_2303:
               this.method_2019();
         }
         this.var_1847.value = "";
         this.var_1851.value = "";
         this.var_1855.method_1420();
      }
      
      private function method_2018() : void
      {
         this.method_1230(name_2301.name_1669);
         this.var_1856.name_2307();
         addChild(this.var_1856);
         this.var_1855 = this.var_1856;
      }
      
      private function method_2017() : void
      {
         this.method_1230(name_2301.INCOMING);
         this.var_1858.name_2307();
         addChild(this.var_1858);
         this.var_1855 = this.var_1858;
      }
      
      private function method_2019() : void
      {
         this.method_1230(name_2301.name_2303);
         this.var_1859.name_2307();
         addChild(this.var_1859);
         this.var_1855 = this.var_1859;
      }
      
      private function method_1230(param1:name_2301) : void
      {
         this.var_1784 = param1;
         if(this.var_1855 != null)
         {
            this.var_1855.hide();
            this.var_1855 = null;
         }
         if(!this.name_1019.hasEventListener(MouseEvent.CLICK))
         {
            this.name_1019.addEventListener(MouseEvent.CLICK,this.method_1323);
         }
      }
      
      private function method_1323(param1:MouseEvent = null) : void
      {
         this.method_1145();
      }
      
      private function method_1145() : void
      {
         this.var_1847.value = "";
         this.method_2011();
         this.hide();
      }
      
      public function set var_1784(param1:name_2301) : void
      {
         switch(param1)
         {
            case name_2301.name_1669:
               this.var_1849.enable = false;
               this.var_1853.enable = true;
               this.var_1852.enable = true;
               this.var_1848.visible = false;
               this.var_1847.visible = true;
               this.var_1854.visible = false;
               this.var_1851.visible = false;
               this.method_2011();
               this.var_1860.hide();
               break;
            case name_2301.INCOMING:
               this.var_1849.enable = true;
               this.var_1853.enable = true;
               this.var_1852.enable = false;
               this.var_1848.visible = true;
               this.var_1847.visible = true;
               this.var_1854.visible = false;
               this.var_1851.visible = false;
               this.method_2011();
               this.var_1860.hide();
               break;
            case name_2301.name_2303:
               this.var_1849.enable = true;
               this.var_1853.enable = false;
               this.var_1852.enable = true;
               this.var_1848.visible = false;
               this.var_1847.visible = false;
               this.var_1857.visible = false;
               this.var_1854.visible = true;
               this.var_1851.visible = true;
               this.var_1860.hide();
         }
      }
   }
}
